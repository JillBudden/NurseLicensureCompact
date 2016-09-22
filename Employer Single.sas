/* ----------------------------------------
Code exported from SAS Enterprise Guide
DATE: Thursday, September 22, 2016     TIME: 2:56:57 PM
PROJECT: Project
PROJECT PATH: \\lansaspd2\research\Jill Budden\JillB\NLC surveys\Project.egp
---------------------------------------- */

/* ---------------------------------- */
/* MACRO: enterpriseguide             */
/* PURPOSE: define a macro variable   */
/*   that contains the file system    */
/*   path of the WORK library on the  */
/*   server.  Note that different     */
/*   logic is needed depending on the */
/*   server type.                     */
/* ---------------------------------- */
%macro enterpriseguide;
%global sasworklocation;
%local tempdsn unique_dsn path;

%if &sysscp=OS %then %do; /* MVS Server */
	%if %sysfunc(getoption(filesystem))=MVS %then %do;
        /* By default, physical file name will be considered a classic MVS data set. */
	    /* Construct dsn that will be unique for each concurrent session under a particular account: */
		filename egtemp '&egtemp' disp=(new,delete); /* create a temporary data set */
 		%let tempdsn=%sysfunc(pathname(egtemp)); /* get dsn */
		filename egtemp clear; /* get rid of data set - we only wanted its name */
		%let unique_dsn=".EGTEMP.%substr(&tempdsn, 1, 16).PDSE"; 
		filename egtmpdir &unique_dsn
			disp=(new,delete,delete) space=(cyl,(5,5,50))
			dsorg=po dsntype=library recfm=vb
			lrecl=8000 blksize=8004 ;
		options fileext=ignore ;
	%end; 
 	%else %do; 
        /* 
		By default, physical file name will be considered an HFS 
		(hierarchical file system) file. 
		*/
		%if "%sysfunc(getoption(filetempdir))"="" %then %do;
			filename egtmpdir '/tmp';
		%end;
		%else %do;
			filename egtmpdir "%sysfunc(getoption(filetempdir))";
		%end;
	%end; 
	%let path=%sysfunc(pathname(egtmpdir));
    %let sasworklocation=%sysfunc(quote(&path));  
%end; /* MVS Server */
%else %do;
	%let sasworklocation = "%sysfunc(getoption(work))/";
%end;
%if &sysscp=VMS_AXP %then %do; /* Alpha VMS server */
	%let sasworklocation = "%sysfunc(getoption(work))";                         
%end;
%if &sysscp=CMS %then %do; 
	%let path = %sysfunc(getoption(work));                         
	%let sasworklocation = "%substr(&path, %index(&path,%str( )))";
%end;
%mend enterpriseguide;

%enterpriseguide


/* Conditionally delete set of tables or views, if they exists          */
/* If the member does not exist, then no action is performed   */
%macro _eg_conditional_dropds /parmbuff;
	
   	%local num;
   	%local stepneeded;
   	%local stepstarted;
   	%local dsname;
	%local name;

   	%let num=1;
	/* flags to determine whether a PROC SQL step is needed */
	/* or even started yet                                  */
	%let stepneeded=0;
	%let stepstarted=0;
   	%let dsname= %qscan(&syspbuff,&num,',()');
	%do %while(&dsname ne);	
		%let name = %sysfunc(left(&dsname));
		%if %qsysfunc(exist(&name)) %then %do;
			%let stepneeded=1;
			%if (&stepstarted eq 0) %then %do;
				proc sql;
				%let stepstarted=1;

			%end;
				drop table &name;
		%end;

		%if %sysfunc(exist(&name,view)) %then %do;
			%let stepneeded=1;
			%if (&stepstarted eq 0) %then %do;
				proc sql;
				%let stepstarted=1;
			%end;
				drop view &name;
		%end;
		%let num=%eval(&num+1);
      	%let dsname=%qscan(&syspbuff,&num,',()');
	%end;
	%if &stepstarted %then %do;
		quit;
	%end;
%mend _eg_conditional_dropds;

/* save the current settings of XPIXELS and YPIXELS */
/* so that they can be restored later               */
%macro _sas_pushchartsize(new_xsize, new_ysize);
	%global _savedxpixels _savedypixels;
	options nonotes;
	proc sql noprint;
	select setting into :_savedxpixels
	from sashelp.vgopt
	where optname eq "XPIXELS";
	select setting into :_savedypixels
	from sashelp.vgopt
	where optname eq "YPIXELS";
	quit;
	options notes;
	GOPTIONS XPIXELS=&new_xsize YPIXELS=&new_ysize;
%mend;

/* restore the previous values for XPIXELS and YPIXELS */
%macro _sas_popchartsize;
	%if %symexist(_savedxpixels) %then %do;
		GOPTIONS XPIXELS=&_savedxpixels YPIXELS=&_savedypixels;
		%symdel _savedxpixels / nowarn;
		%symdel _savedypixels / nowarn;
	%end;
%mend;

ODS PROCTITLE;
OPTIONS DEV=ACTIVEX;
GOPTIONS XPIXELS=0 YPIXELS=0;
FILENAME EGRTFX TEMP;
ODS RTF(ID=EGRTFX) FILE=EGRTFX
    ENCODING='utf-8'
    STYLE=Rtf
    NOGTITLE
    NOGFOOTNOTE
;
FILENAME EGSRX TEMP;
ODS tagsets.sasreport13(ID=EGSRX) FILE=EGSRX
    STYLE=HtmlBlue
    STYLESHEET=(URL="file:///C:/Program%20Files/SASHome/SASEnterpriseGuide/6.1/Styles/HtmlBlue.css")
    NOGTITLE
    NOGFOOTNOTE
    GPATH=&sasworklocation
    ENCODING=UTF8
    options(rolap="on")
;

/*   START OF NODE: Employer Single   */
%LET _CLIENTTASKLABEL='Employer Single';
%LET _CLIENTPROJECTPATH='\\lansaspd2\research\Jill Budden\JillB\NLC surveys\Project.egp';
%LET _CLIENTPROJECTNAME='Project.egp';
%LET _SASPROGRAMFILE=;

GOPTIONS ACCESSIBLE;
Libname JBlib '\\lansaspd1\Research\Jill Budden\JillB\NLC surveys';
data work.analyses;
	set JBlib.EmployerSingle;

/* Removed the following duplicates by hand: 
000209325
000208608
000211542 */



/* variables by survey number

e1_single, 
e2a_single, e2b_single, 
e3a_single, e3b_single, 
e4a_single, e4b_single, 
e5_single, 
e6_single, Q6
e7a_single, 
e7b_single_telehealth, e7b_single_casemanagement, e7b_single_followup, e7b_single_transport, e7b_single_homehealth, e7b_single_other, Q7b_text
e8_single, 
e9_single, 
e10_single, 
e11_single, 
e12_single,
e13_single, 
e14_single, 
e15_single_na, e15_single_lpn, e15_single_rn, e15_single_aprn

*/


/* 8Please indicate the state/jurisdiction where your organization is located. (select one)
FILTER VARIABLE
AK AL AR AZ CA CO CT DC DE FL GA HI IA ID IL IN KS KY LA MA MD
ME MI MN MO MS MT NC ND NE NH NJ NM NV NY OH OK OR PA RI SC SD
TN TX UT VA VT WA WI WV WY AS GU MP VI */
 
if e8_single = 'AR' then filter = 'Compact';
if e8_single = 'AZ' then filter = 'Compact';
if e8_single = 'CO' then filter = 'Compact';
if e8_single = 'DE' then filter = 'Compact';
if e8_single = 'IA' then filter = 'Compact';
if e8_single = 'ID' then filter = 'Compact';
if e8_single = 'KY' then filter = 'Compact';
if e8_single = 'MD' then filter = 'Compact';
if e8_single = 'ME' then filter = 'Compact';
if e8_single = 'MO' then filter = 'Compact';
if e8_single = 'MS' then filter = 'Compact';
if e8_single = 'NC' then filter = 'Compact';
if e8_single = 'ND' then filter = 'Compact';
if e8_single = 'NE' then filter = 'Compact';
if e8_single = 'NH' then filter = 'Compact';
if e8_single = 'NM' then filter = 'Compact';
if e8_single = 'RI' then filter = 'Compact';
if e8_single = 'SC' then filter = 'Compact';
if e8_single = 'SD' then filter = 'Compact';
if e8_single = 'TN' then filter = 'Compact';
if e8_single = 'TX' then filter = 'Compact';
if e8_single = 'UT' then filter = 'Compact';
if e8_single = 'VA' then filter = 'Compact';
if e8_single = 'WI' then filter = 'Compact';

if e8_single = 'AK' then filter = 'SingleS';
if e8_single = 'AL' then filter = 'SingleS';
if e8_single = 'CA' then filter = 'SingleS';
if e8_single = 'CT' then filter = 'SingleS';
if e8_single = 'DC' then filter = 'SingleS';
if e8_single = 'FL' then filter = 'SingleS';
if e8_single = 'GA' then filter = 'SingleS';
if e8_single = 'HI' then filter = 'SingleS';
if e8_single = 'IL' then filter = 'SingleS';
if e8_single = 'IN' then filter = 'SingleS';
if e8_single = 'KS' then filter = 'SingleS';
if e8_single = 'LA' then filter = 'SingleS';
if e8_single = 'MA' then filter = 'SingleS';
if e8_single = 'MI' then filter = 'SingleS';
if e8_single = 'MN' then filter = 'SingleS';
if e8_single = 'MT' then filter = 'SingleS';
if e8_single = 'NJ' then filter = 'SingleS';
if e8_single = 'NV' then filter = 'SingleS';
if e8_single = 'NY' then filter = 'SingleS';
if e8_single = 'OH' then filter = 'SingleS';
if e8_single = 'OK' then filter = 'SingleS';
if e8_single = 'OR' then filter = 'SingleS';
if e8_single = 'PA' then filter = 'SingleS';
if e8_single = 'VT' then filter = 'SingleS';
if e8_single = 'WA' then filter = 'SingleS';
if e8_single = 'WV' then filter = 'SingleS';
if e8_single = 'WY' then filter = 'SingleS';
if e8_single = 'AS' then filter = 'SingleS';
if e8_single = 'GU' then filter = 'SingleS';
if e8_single = 'MP' then filter = 'SingleS';
if e8_single = 'VI' then filter = 'SingleS';
run;




/* 10Which of the following best describes the location of your organization: (select one)
Urban-type area, Rural-type area
Table: Location of Organization */

proc format;
	value e10_Single
    1 = 'Urban-type area'
    2 = 'Rural-type area';
run;

PROC SQL;
	CREATE VIEW WORK.SORT1 AS
	SELECT e10_Single, filter
	FROM WORK.analyses
	WHERE filter NOT = 'Compact';
QUIT;

Title 'location of organization';
PROC FREQ DATA = WORK.SORT1
	ORDER=INTERNAL;
	TABLES e10_Single / SCORES=TABLE;
	FORMAT e10_Single e10_Single.;
RUN;
	

/* 11Approximately how many full-time equivalent (FTE) nurses are currently employed by your organization?  ___________
Table: Average Number of Full-time Equivalent (FTE) Nurses Employed */

PROC SQL;
	CREATE VIEW WORK.SORT2 AS
	SELECT e11_Single, filter
	FROM WORK.analyses
	WHERE filter NOT = 'Compact';
QUIT;

Title 'average number of full-time equivalent (FTE) nurses employed';
PROC MEANS DATA=WORK.SORT2 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR e11_Single;
RUN;


/* 12Approximately what percentage of your organization’s nurses are members of a collective bargaining union?
None, 25%, 50%, 75%, All, Don’t know
Table: Percentage of Organization’s Nurses Members of a Collective Bargaining Union */

proc format;
	value e12_Single
    1 = 'None'
    2 = '25%'
	3 = '50%'
	4 = '75%'
	5 = 'All'
	6 = "Don't know";
run;

PROC SQL;
	CREATE VIEW WORK.SORT3 AS
	SELECT e12_Single, filter
	FROM WORK.analyses
	WHERE filter NOT = 'Compact';
QUIT;

Title "percentage of organization's nurses members of a collective bargaining union";
PROC FREQ DATA = WORK.SORT3
	ORDER=INTERNAL;
	TABLES e12_Single / SCORES=TABLE;
	FORMAT e12_Single e12_Single.;
RUN;


/* 13Which of the following best describes your organization:
Medical practice; Retail clinic/urgent care; Community health center; Federal facility (Military or VA,
Health Maintenance Organization, managed care, insurance company; Hospital;
Ambulatory surgery center, not hospital owned; Nursing home/Long-term care; Other, please specify
Table: Type of Organization */

proc format;
	value e13_Single
    1 = 'Medical practice'
    2 = 'Hospital'
	3 = 'Federal facility (Military or VA)'
	4 = 'Retail clinic/urgent care'
	5 = 'Community health center'
	6 = 'Nursing home/Long-term care'
	7 = 'Ambulatory surgery center, not hospital owned'
	8 = 'Health Maintenance Organization, managed care, insurance company'
	9 = 'Other, please specify';
run;

PROC SQL;
	CREATE VIEW WORK.SORT4 AS
	SELECT e13_Single, filter
	FROM WORK.analyses
	WHERE filter NOT = 'Compact';
QUIT;

Title 'type of organization';
PROC FREQ DATA = WORK.SORT4
	ORDER=INTERNAL;
	TABLES e13_Single / SCORES=TABLE;
	FORMAT e13_Single e13_Single.;
RUN;


/* 14What best describes your title at your organization? (select one) Nurse executive, HR executive, Other, please specify
Table: Respondent’s Job Title */

proc format;
	value e14_Single
    1 = 'Nurse executive'
    2 = 'HR executive'
	3 = 'Other, please specify';
run;

PROC SQL;
	CREATE VIEW WORK.SORT5 AS
	SELECT e14_Single, filter
	FROM WORK.analyses
	WHERE filter NOT = 'Compact';
QUIT;

Title "respondent's job title";
PROC FREQ DATA = WORK.SORT5
	ORDER=INTERNAL;
	TABLES e14_Single / SCORES=TABLE;
	FORMAT e14_Single e14_Single.;
RUN;


/* 15What type of license do you currently hold? (select all that apply) Not applicable, LPN/VN, RN, APRN
Table: Respondent’s License */
	
PROC SQL;
	CREATE VIEW WORK.SORT6 AS
	SELECT e15_single_na, e15_single_lpn, e15_single_rn, e15_single_aprn, filter
	FROM WORK.analyses
	WHERE filter NOT = 'Compact';
QUIT;

Title "respondent's license";
PROC FREQ DATA = WORK.SORT6
	ORDER=INTERNAL;
	TABLES e15_Single_na / SCORES=TABLE;
	TABLES e15_Single_lpn / SCORES=TABLE;
	TABLES e15_Single_rn / SCORES=TABLE;
	TABLES e15_Single_aprn / SCORES=TABLE;
RUN;


/* 1How familiar are you with the Nurse Licensure Compact? Very familiar, Familiar, Somewhat familiar, Not familiar(skip to 7)
Table: familiarity with the NLC */

proc format;
	value e1_Single
    1 = 'Very familiar'
    2 = 'Familiar'
	3 = 'Somewhat familiar'
	4 = 'Not familiar';
run;

PROC SQL;
	CREATE VIEW WORK.SORT7 AS
	SELECT e1_Single, filter
	FROM WORK.analyses
	WHERE filter NOT = 'Compact';
QUIT;

Title 'familiarity with the NLC';
PROC FREQ DATA = WORK.SORT7
	ORDER=INTERNAL;
	TABLES e1_Single / SCORES=TABLE;
	FORMAT e1_Single e1_Single.;
RUN;


/* 2(a) Would there be advantages for your organization if your state/jurisdiction joined the Nurse Licensure Compact?
Yes, No, Don’t know
Table: Of Employers Familiar with the NLC, Would there be Advantages for your Organization if your State/Jurisdiction Joined the NLC? */

proc format;
	value e2a_Single
    1 = 'Yes'
    2 = 'No'
	3 = "Don't know";
run;

PROC SQL;
	CREATE VIEW WORK.SORT8 AS
	SELECT e2a_Single, e1_Single, filter
	FROM WORK.analyses
	WHERE filter NOT = 'Compact' AND e1_Single NOT = 4;
QUIT;

Title 'of employers familiar with the NLC, would there be advantages for your organization if your state/jurisdiction joined the NLC?';
PROC FREQ DATA = WORK.SORT8
	ORDER=INTERNAL;
	TABLES e2a_Single / SCORES=TABLE;
	FORMAT e2a_Single e2a_Single.;
RUN;


/* 2(b) Please explain:
Table: Of Employers Familiar with the NLC, Would there be Advantages for your Organization if your State/Jurisdiction Joined the NLC? COMMENTS */

PROC SQL;
	CREATE VIEW WORK.SORT9 AS
	SELECT e2b_Single, e1_Single, filter
	FROM WORK.analyses
	WHERE filter NOT = 'Compact' AND e1_Single NOT = 4;
QUIT;

Title 'of employers familiar with the NLC, would there be advantages for your organizaiton if your state/jursidiction joined the NLC? COMMENTS';
PROC FREQ DATA = WORK.SORT9
	ORDER=INTERNAL;
	TABLES e2b_Single / SCORES=TABLE;
RUN;


/* 3(a) Would there be disadvantages for your organization if your state/jurisdiction joined the Nurse Licensure Compact?
Yes, No, Don’t know
Table: Of Employers Familiar with the NLC, Would there be Disadvantages for your Organization if your State/Jurisdiction Joined the NLC? */

proc format;
	value e3a_Single
    1 = 'Yes'
    2 = 'No'
	3 = "Don't know";
run;
	
PROC SQL;
	CREATE VIEW WORK.SORT10 AS
	SELECT e3a_Single, e1_Single, filter
	FROM WORK.analyses
	WHERE filter NOT = 'Compact' AND e1_Single NOT = 4;
QUIT;

Title 'of employers familiar with the NLC, would there be disadvantages for your organization if your state/jurisdiction joined the NLC?';
PROC FREQ DATA = WORK.SORT10
	ORDER=INTERNAL;
	TABLES e3a_Single / SCORES=TABLE;
	FORMAT e3a_Single e3a_Single.;
RUN;


/* 3(b) Please explain:
Table: Of Employers Familiar with the NLC, Would there be Disadvantages for your Organization if your State/Jurisdiction Joined the NLC? COMMENTS */
	
PROC SQL;
	CREATE VIEW WORK.SORT11 AS
	SELECT e3b_Single, e1_Single, filter
	FROM WORK.analyses
	WHERE filter NOT = 'Compact' AND e1_Single NOT = 4;
QUIT;

Title 'of employers familiar with the NLC, would there be disadvantages for your organization if your state/jurisdiction joined the NLC? COMMENTS';
PROC FREQ DATA = WORK.SORT11
	ORDER=INTERNAL;
	TABLES e3b_Single / SCORES=TABLE;
RUN;


/* 4(a) Do you have recommendations on how to improve the Nurse Licensure Compact? Yes, No
Table: Of Employers Familiar with the NLC, Do you have Recommendations on how to Improve the NLC? */ 

proc format;
	value e4a_Single
    1 = 'Yes'
    2 = 'No';
run;

PROC SQL;
	CREATE VIEW WORK.SORT12 AS
	SELECT e4a_Single, e1_Single, filter
	FROM WORK.analyses
	WHERE filter NOT = 'Compact' AND e1_Single NOT = 4;
QUIT;

Title 'of employers familiar with the NLC, do you have recommendations on how to improve the NLC?';
PROC FREQ DATA = WORK.SORT12
	ORDER=INTERNAL;
	TABLES e4a_Single / SCORES=TABLE;
	FORMAT e4a_Single e4a_Single.;
RUN;


/* 4(b) If yes, please explain:
Table: Of Employers Familiar with the NLC, Do you have Recommendations on how to Improve the NLC? COMMENTS */
		
PROC SQL;
	CREATE VIEW WORK.SORT13 AS
	SELECT e4b_Single, e1_Single, e4a_Single, filter
	FROM WORK.analyses
	WHERE filter NOT = 'Compact' AND e1_Single NOT = 4 AND e4a_Single NOT = 2;
QUIT;

Title 'of employers familiar with the NLC, do you have recommendations on how to improve the NLC? COMMENTS';
PROC FREQ DATA = WORK.SORT13
	ORDER=INTERNAL;
	TABLES e4b_Single / SCORES=TABLE;
RUN;


/* 5Do you favor or oppose your state/jurisdiction joining the Nurse Licensure Compact?
In favor, Neutral, Opposed, No opinion, Don’t know
Table: Of Employers Familiar with the NLC, Do you Favor or Oppose your State/Jurisdiction Joining the NLC? */

proc format;
	value e5_Single
    1 = 'In favor'
    2 = 'Neutral'
	3 = 'Opposed'
	4 = 'No opinion'
	5 = "Don't know";
run;
	
PROC SQL;
	CREATE VIEW WORK.SORT14 AS
	SELECT e5_Single, e1_Single, filter
	FROM WORK.analyses
	WHERE filter NOT = 'Compact' AND e1_Single NOT = 4;
QUIT;

Title 'of employers familiar with the NLC, do you favor or oppose your state/jurisdiction joining the NLC?';
PROC FREQ DATA = WORK.SORT14
	ORDER=INTERNAL;
	TABLES e5_Single / SCORES=TABLE;
	FORMAT e5_Single e5_Single.;
RUN;


/* 6Please indicate any suggestions or comments you have regarding the Nurse Licensure Compact: 
None, Don’t know
Table: Of Employers Familiar with the NLC, Suggestions or Comments Regarding the NLC */

PROC SQL;
	CREATE VIEW WORK.SORT15 AS
	SELECT e6_Single, e1_Single, filter
	FROM WORK.analyses
	WHERE filter NOT = 'Compact' AND e1_Single NOT = 4;
QUIT;

Title 'of employers familiar with the NLC, suggestions or comments regarding the NLC';
PROC FREQ DATA = WORK.SORT15
	ORDER=INTERNAL;
	TABLES e6_Single / SCORES=TABLE;
RUN;	


PROC SQL;
	CREATE VIEW WORK.SORT155 AS
	SELECT Q6, e1_Single, filter
	FROM WORK.analyses
	WHERE filter NOT = 'Compact' AND e1_Single NOT = 4;
QUIT;

Title 'of employers familiar with the NLC, suggestions or comments regarding the NLC';
PROC FREQ DATA = WORK.SORT155
	ORDER=INTERNAL;
	TABLES Q6 / SCORES=TABLE;
RUN;

/* 7(a) Do any nurses working in your organization require multiple nursing licenses from other state/jurisdiction(s) to perform their job?
Yes, No(skip to 8), Don’t know(skip to 8)
Table: Of Employers Familiar with the NLC, Do any Nurses Working in your Organization Require Multiple 
Nursing Licenses from other State/Jurisdictions to Perform their Job? */

proc format;
	value e7a_Single
    1 = 'Yes'
    2 = 'No'
	3 = "Don't know";
run;

PROC SQL;
	CREATE VIEW WORK.SORT16 AS
	SELECT e7a_Single, filter
	FROM WORK.analyses
	WHERE filter NOT = 'Compact' AND e1_Single NOT = 4;
QUIT;

Title 'of employers familiar with the NLC, do any nurses working in your organization require multiple nursing
licenses from other state/jurisdictions to perform their job?';
PROC FREQ DATA = WORK.SORT16
	ORDER=INTERNAL;
	TABLES e7a_Single / SCORES=TABLE;
	FORMAT e7a_Single e7a_Single.;
RUN;	


/* 7(b) If yes, please indicate which of the following categories apply to the nurses that require multiple licenses: (select all that apply)
Telehealth, Case management, Post discharge follow-up, Transport, Home health/hospice, Other, please specify
Table: Of Employers Familiar with the NLC, with Nurses that Require Multiple Nursing Licenses from other 
State/Jurisdictions to Perform their Job, Characteristics of these Nurses */
	
PROC SQL;
	CREATE VIEW WORK.SORT17 AS
	SELECT e7b_Single_telehealth, e7b_Single_casemanagement, e7b_Single_followup, e7b_Single_transport, 
           e7b_Single_homehealth, e7b_Single_other, e7a_Single, e1_Single, Q7b_text, filter
	FROM WORK.analyses
	WHERE filter NOT = 'Compact' AND e1_Single NOT = 4 AND e7a_Single NOT = 2 AND e7a_Single NOT = 3;
QUIT;

Title 'of employers familiar with the NLC, with nurses that require multiple nursing licenses from other state/jurisdictions to perform 
their job, characterisitcs of these nurses';
PROC FREQ DATA = WORK.SORT17
	ORDER=INTERNAL;
	TABLES e7b_Single_telehealth / SCORES=TABLE;
	TABLES e7b_Single_casemanagement / SCORES=TABLE;
	TABLES e7b_Single_followup / SCORES=TABLE;
	TABLES e7b_Single_transport / SCORES=TABLE;
	TABLES e7b_Single_homehealth / SCORES=TABLE;
	TABLES e7b_Single_other / SCORES=TABLE;
	TABLES Q7b_text / SCORES=TABLE;
RUN;	

GOPTIONS NOACCESSIBLE;
%LET _CLIENTTASKLABEL=;
%LET _CLIENTPROJECTPATH=;
%LET _CLIENTPROJECTNAME=;
%LET _SASPROGRAMFILE=;

;*';*";*/;quit;run;
ODS _ALL_ CLOSE;
