Libname JBlib '\\lansaspd1\Research\Jill Budden\JillB\NLC surveys';
data work.analyses;
	set JBlib.EmployerCompact;


/* removed the following duplicates by hand: 
000213361
000212541
000214075
000210272 */


/* variables by order in survey

e1_compact, 
e2a_compact, e2b_compact, 
e3a_compact, e3b_compact_travel, e3b_compact_border, e3b_compact_relocated, e3b_compact_telehealth, Q3a,
e3b_compact_casemanagement, e3b_compact_transport, e3b_compact_homehealth, e3b_compact_dontknow, e3b_compact_na, e3b_compact_other,Q3b_text,
e4a_compact	e4b_compact_telehealth, e4b_compact_casemanagement, e4b_compact_followup, e4b_compact_transport, e4b_compact_homehealth, e4b_compact_other, Q4b_text,
e5a_compact, e5b_compact, 
e6a_compact, e6b_compact, 
e7a_compact, e7b_compact, 
e8_compact, 
e9_compact,
e10_compact, 
e11_compact, 
e12_compact,
e13_compact,
e14_compact,
e15_compact_na, e15_compact_lpn, e15_compact_rn, e15_compact_aprn

*/



/* 8Please indicate the state/jurisdiction where your organization is located. (select one)
FILTER VARIABLE
AK AL AR AZ CA CO CT DC DE FL GA HI IA ID IL IN KS KY LA MA MD
ME MI MN MO MS MT NC ND NE NH NJ NM NV NY OH OK OR PA RI SC SD
TN TX UT VA VT WA WI WV WY AS GU MP VI */
 
if e8_compact = 'AR' then filter = 'Compact';
if e8_compact = 'AZ' then filter = 'Compact';
if e8_compact = 'CO' then filter = 'Compact';
if e8_compact = 'DE' then filter = 'Compact';
if e8_compact = 'IA' then filter = 'Compact';
if e8_compact = 'ID' then filter = 'Compact';
if e8_compact = 'KY' then filter = 'Compact';
if e8_compact = 'MD' then filter = 'Compact';
if e8_compact = 'ME' then filter = 'Compact';
if e8_compact = 'MO' then filter = 'Compact';
if e8_compact = 'MS' then filter = 'Compact';
if e8_compact = 'NC' then filter = 'Compact';
if e8_compact = 'ND' then filter = 'Compact';
if e8_compact = 'NE' then filter = 'Compact';
if e8_compact = 'NH' then filter = 'Compact';
if e8_compact = 'NM' then filter = 'Compact';
if e8_compact = 'RI' then filter = 'Compact';
if e8_compact = 'SC' then filter = 'Compact';
if e8_compact = 'SD' then filter = 'Compact';
if e8_compact = 'TN' then filter = 'Compact';
if e8_compact = 'TX' then filter = 'Compact';
if e8_compact = 'UT' then filter = 'Compact';
if e8_compact = 'VA' then filter = 'Compact';
if e8_compact = 'WI' then filter = 'Compact';

if e8_compact = 'AK' then filter = 'SingleS';
if e8_compact = 'AL' then filter = 'SingleS';
if e8_compact = 'CA' then filter = 'SingleS';
if e8_compact = 'CT' then filter = 'SingleS';
if e8_compact = 'DC' then filter = 'SingleS';
if e8_compact = 'FL' then filter = 'SingleS';
if e8_compact = 'GA' then filter = 'SingleS';
if e8_compact = 'HI' then filter = 'SingleS';
if e8_compact = 'IL' then filter = 'SingleS';
if e8_compact = 'IN' then filter = 'SingleS';
if e8_compact = 'KS' then filter = 'SingleS';
if e8_compact = 'LA' then filter = 'SingleS';
if e8_compact = 'MA' then filter = 'SingleS';
if e8_compact = 'MI' then filter = 'SingleS';
if e8_compact = 'MN' then filter = 'SingleS';
if e8_compact = 'MT' then filter = 'SingleS';
if e8_compact = 'NJ' then filter = 'SingleS';
if e8_compact = 'NV' then filter = 'SingleS';
if e8_compact = 'NY' then filter = 'SingleS';
if e8_compact = 'OH' then filter = 'SingleS';
if e8_compact = 'OK' then filter = 'SingleS';
if e8_compact = 'OR' then filter = 'SingleS';
if e8_compact = 'PA' then filter = 'SingleS';
if e8_compact = 'VT' then filter = 'SingleS';
if e8_compact = 'WA' then filter = 'SingleS';
if e8_compact = 'WV' then filter = 'SingleS';
if e8_compact = 'WY' then filter = 'SingleS';
if e8_compact = 'AS' then filter = 'SingleS';
if e8_compact = 'GU' then filter = 'SingleS';
if e8_compact = 'MP' then filter = 'SingleS';
if e8_compact = 'VI' then filter = 'SingleS';


/* edit e3a_compact to include "none" */
if Q3A = 1 then e3a_compact = 0;


/* calculate the average percentage of nurses practicing on a Compact license */
percent_lic = (e3a_compact / e11_compact);
/* remove variables that don't make sense (ex: percent_lic = 1.75) */
if percent_lic >= 1 then percent_lic = .;
run;

/* 10Which of the following best describes the location of your organization: (select one)
Urban-type area, Rural-type area
Table: Location of Organization */

proc format;
	value e10_compact
    1 = 'Urban-type area'
    2 = 'Rural-type area';
run;

PROC SQL;
	CREATE VIEW WORK.SORT1 AS
	SELECT e10_compact, filter
	FROM WORK.analyses
	WHERE filter NOT = 'SingleS';
QUIT;

Title 'location of organization';
PROC FREQ DATA = WORK.SORT1
	ORDER=INTERNAL;
	TABLES e10_compact / SCORES=TABLE;
	FORMAT e10_compact e10_compact.;
RUN;


/* 11Approximately how many full-time equivalent (FTE) nurses are currently employed by your organization?  ___________
Table: Average Number of Full-time Equivalent (FTE) Nurses Employed */
			
PROC SQL;
	CREATE VIEW WORK.SORT2 AS
	SELECT e11_compact, filter
	FROM WORK.analyses
	WHERE filter NOT = 'SingleS';
QUIT;

Title 'average number of full-time equivalent (FTE) nurses employed';
PROC MEANS DATA=WORK.SORT2 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR e11_compact;
RUN;


/* 12Approximately what percentage of your organization’s nurses are members of a collective bargaining union?
None, 25%, 50%, 75%, All, Don’t know
Tabl: Percentage of Organization’s Nurses Members of a Collective Bargaining Union */

proc format;
	value e12_compact
    1 = 'None'
    2 = '25%'
	3 = '50%'
	4 = '75%'
	5 = 'All'
	6 = "Don't know";
run;

PROC SQL;
	CREATE VIEW WORK.SORT3 AS
	SELECT e12_compact, filter
	FROM WORK.analyses
	WHERE filter NOT = 'SingleS';
QUIT;

Title "percentage of organization's members of a collective bargaining union";
PROC FREQ DATA = WORK.SORT3
	ORDER=INTERNAL;
	TABLES e12_compact / SCORES=TABLE;
	FORMAT e12_compact e12_compact.;
RUN;


/* 13Which of the following best describes your organization:
Medical practice, Retail clinic/urgent care, Community health center, Federal facility (Military or VA),
Health Maintenance Organization, managed care, insurance company, Hospital, Ambulatory surgery center, not hospital owned,
Nursing home/Long-term care, Other, please specify
Table: Type of Organization */

proc format;
	value e13_compact
    1 = 'Medical practice'
    2 = 'Hospital'
	3 = 'Federal facility (Miliarty or VA)'
	4 = 'Retail clinic/urgent care'
	5 = 'Community health center'
	6 = 'Nursing hone/Long-term care'
	7 = 'Ambulatory surgery center, not hospital owned'
	8 = 'Health maintenance organization, managed care, insurance company'
	9 = 'Other, please specify';
run;
	
PROC SQL;
	CREATE VIEW WORK.SORT4 AS
	SELECT e13_compact, filter
	FROM WORK.analyses
	WHERE filter NOT = 'SingleS';
QUIT;

Title 'type of organization';
PROC FREQ DATA = WORK.SORT4
	ORDER=INTERNAL;
	TABLES e13_compact / SCORES=TABLE;
	FORMAT e13_compact e13_compact.;
RUN;


/* 14What best describes your title at your organization? (select one)
Nurse executive, HR executive, Other, please specify
Table: Respondent’s Job Title */

proc format;
	value e14_compact
    1 = 'Nurse executive'
    2 = 'HR executive'
	3 = 'Other, please specify';
run;

PROC SQL;
	CREATE VIEW WORK.SORT5 AS
	SELECT e14_compact, filter
	FROM WORK.analyses
	WHERE filter NOT = 'SingleS';
QUIT;

Title "respondent's job title";
PROC FREQ DATA = WORK.SORT5
	ORDER=INTERNAL;
	TABLES e14_compact / SCORES=TABLE;
	FORMAT e14_compact e14_compact.;
RUN;


/* 15What type of license do you currently hold? (select all that apply) Not applicable, LPN/VN, RN, APRN
Table: Respondent’s License */

PROC SQL;
	CREATE VIEW WORK.SORT6 AS
	SELECT e15_compact_na, e15_compact_lpn, e15_compact_rn, e15_compact_aprn, filter
	FROM WORK.analyses
	WHERE filter NOT = 'SingleS';
QUIT;

Title "respondent's license";
PROC FREQ DATA = WORK.SORT6
	ORDER=INTERNAL;
	TABLES e15_compact_na / SCORES=TABLE;
	TABLES e15_compact_lpn / SCORES=TABLE;
	TABLES e15_compact_rn / SCORES=TABLE;
	TABLES e15_compact_aprn / SCORES=TABLE;
RUN;


/* 1How familiar are you with the Nurse Licensure Compact?
Very familiar, Familiar, Somewhat familiar, Not familiar(skip to 8)
Table: Familiarity with the NLC */

proc format;
	value e1_compact
    1 = 'Very familiar'
    2 = 'Familiar'
	3 = 'Somewhat familiar'
	4 = 'Not familiar';
run;

PROC SQL;
	CREATE VIEW WORK.SORT7 AS
	SELECT e1_compact, filter
	FROM WORK.analyses
	WHERE filter NOT = 'SingleS';
QUIT;

Title 'familiarity with the NLC';
PROC FREQ DATA = WORK.SORT7
	ORDER=INTERNAL;
	TABLES e1_compact / SCORES=TABLE;
	FORMAT e1_compact e1_compact.;
RUN;


/* 2(a) Does the Nurse Licensure Compact help expedite nurse hiring at your organization?
Yes, Somewhat, No, Don’t know
Table: Of Employers Familiar with the NLC, Does the NLC Help Expedite Nurse Hiring at their Organization? */

proc format;
	value e2a_compact
    1 = 'Yes'
    2 = 'Somewhat'
	3 = 'No'
	4 = "Don't know";
run;

PROC SQL;
	CREATE VIEW WORK.SORT8 AS
	SELECT e2a_compact, e1_compact, filter
	FROM WORK.analyses
	WHERE filter NOT = 'SingleS' AND e1_compact NOT = 4;
QUIT;

Title 'of employers familiar with the NLC, does the NLC help expedite nurse hiring at their organization';
PROC FREQ DATA = WORK.SORT8
	ORDER=INTERNAL;
	TABLES e2a_compact / SCORES=TABLE;
	FORMAT e2a_compact e2a_compact.;
RUN;


/* 2(b) Please explain:
Table: Of Employers Familiar with the NLC, Does the NLC Help Expedite Nurse Hiring at their Organization? COMMENTS */

PROC SQL;
	CREATE VIEW WORK.SORT9 AS
	SELECT e2b_compact, e1_compact, filter
	FROM WORK.analyses
	WHERE filter NOT = 'SingleS' AND e1_compact NOT = 4;
QUIT;

Title 'of employers familiar with the NLC, does the NLC help expedite nurse hiring at their organizatoin? COMMENTS';
PROC FREQ DATA = WORK.SORT9
	ORDER=INTERNAL;
	TABLES e2b_compact / SCORES=TABLE;
RUN;


/* 3(a) Approximately, how many nurses in your organization are practicing on a Compact license issued by another state/jurisdiction? 
___________, None(skip to 4), Don’t know(skip to 4)
Table: Of Employers Familiar with the NLC, The Average Number of Nurses Practicing on a Compact License Issued by 
Another State/Jurisdiction in their Organization		
Table: Of Employers Familiar with the NLC, The Average Percentage of Nurses Practicing on a Compact License Issued 
by Another State/Jurisdiction in their Organization */
	
PROC SQL;
	CREATE VIEW WORK.SORT10 AS
	SELECT e3a_compact, percent_lic, e1_compact, filter
	FROM WORK.analyses
	WHERE filter NOT = 'SingleS' AND e1_compact NOT = 4;
QUIT;
	
Title 'of employers familiar with the NLC, the average number of nurses practicing on a compact license issued by another state/jurisdiction in their organization';
PROC MEANS DATA=WORK.SORT10 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR e3a_compact;
RUN;

Title 'of employers familiar with the NLC, the average percentage of nurses practicing on a compact license issued by another state/jurisdiction in their organization';
PROC MEANS DATA=WORK.SORT10 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR percent_lic;
RUN;


PROC SQL;
	CREATE VIEW WORK.SORT100 AS
	SELECT Q3a, e1_compact, filter
	FROM WORK.analyses
	WHERE filter NOT = 'SingleS' AND e1_compact NOT = 4;
QUIT;

Title 'of employers familiar with the NLC, the average percentage of nurses practicing on a compact license issued by another state/jurisdiction in their organization';
PROC FREQ DATA = WORK.SORT100
	ORDER=INTERNAL;
	TABLES Q3a / SCORES=TABLE;
RUN;



/* 3(b) Please indicate which of the following categories apply to the nurses practicing on a Compact license, 
issued by another state, within your organization: (select all that apply)
Travel nurse(s), Live across state/jurisdiction border, Newly relocated, Telehealth, Case management by phone or electronically,
Transport, Home health/hospice, Don’t know, Not Applicable, Other, please specify 
Table: Of Employers Familiar with the NLC with Nurses Practicing on a Compact License Issued by Another State/Jurisdiction 
in their Organization, Characteristics of these Nurses */

PROC SQL;
	CREATE VIEW WORK.SORT11 AS
	SELECT e3b_compact_travel, e3b_compact_border, e3b_compact_relocated, e3b_compact_telehealth, 
		   e3b_compact_casemanagement, e3b_compact_transport, e3b_compact_homehealth, e3b_compact_dontknow, 
		   e3b_compact_na, e3b_compact_other, Q3a, Q3b_text, e1_compact, filter
	FROM WORK.analyses
	WHERE filter NOT = 'SingleS' AND e1_compact NOT = 4 AND Q3a NOT = 1 AND Q3a NOT = 2;
QUIT;

Title 'of employers familiar with the NLC with nurses practicing on a compact license issued by another state/jurisdiction in their organization, characterisitcs of these nurses';
PROC FREQ DATA = WORK.SORT11
	ORDER=INTERNAL;
	TABLES e3b_compact_travel / SCORES=TABLE;
	TABLES e3b_compact_border / SCORES=TABLE;
	TABLES e3b_compact_relocated / SCORES=TABLE;
	TABLES e3b_compact_telehealth / SCORES=TABLE;
	TABLES e3b_compact_casemanagement / SCORES=TABLE;
	TABLES e3b_compact_transport / SCORES=TABLE;
	TABLES e3b_compact_homehealth / SCORES=TABLE;
	TABLES e3b_compact_dontknow / SCORES=TABLE;
	TABLES e3b_compact_na / SCORES=TABLE;
	TABLES e3b_compact_other / SCORES=TABLE;
	TABLES Q3b_text / SCORES=TABLE;
RUN;
	

/* 4(a) Do any nurses working in your organization require multiple nursing licenses from other state/jurisdiction(s) to perform their job?
Yes, No(skip to 5), Don’t know(skip to 5)
Table: Of Employers Familiar with the NLC, Do Nurses in their Organization Require Multiple Nursing Licenses from other 
State/Jurisdictions to Perform their Job? */

proc format;
	value e4a_compact
    1 = 'Yes'
    2 = 'No'
	3 = "Don't know";
run;

PROC SQL;
	CREATE VIEW WORK.SORT12 AS
	SELECT e4a_compact, e1_compact, filter
	FROM WORK.analyses
	WHERE filter NOT = 'SingleS' AND e1_compact NOT = 4;
QUIT;

Title 'of employers familiar withe the NLC, do nurses in their organization require multiple nursing licenses from other state/jurisdictions to perform their job';
PROC FREQ DATA = WORK.SORT12
	ORDER=INTERNAL;
	TABLES e4a_compact / SCORES=TABLE;
	FORMAT e4a_compact e4a_compact.;
RUN;


/* 4(b) If yes, please indicate which of the following categories apply to the nurses that require 
multiple licenses: (select all that apply)
Telehealth, Case management, Post discharge follow-up, Transport, Home health/hospice, Other, please specify
Table: Of Employers Familiar with the NLC that have Nurses in their Organization that Require Multiple Nursing 
Licenses from other State/Jurisdictions to Perform their Job, Characteristics of these Nurses */
	
PROC SQL;
	CREATE VIEW WORK.SORT13 AS
	SELECT e4b_compact_telehealth, e4b_compact_casemanagement, e4b_compact_followup, e4b_compact_transport, 
           e4b_compact_homehealth, e4b_compact_other, e4a_compact, Q4b_text, e1_compact, filter
	FROM WORK.analyses
	WHERE filter NOT = 'SingleS' AND e1_compact NOT = 4 AND e4a_compact NOT = 2 AND e4a_compact NOT = 3;
QUIT;

Title 'of employers familiar with the NLC that have nurses in their organization that require multiple nursing licenses from 
other state/jursidictions to perform their job, characteristics of these nurses';
PROC FREQ DATA = WORK.SORT13
	ORDER=INTERNAL;
	TABLES e4b_compact_telehealth / SCORES=TABLE;
	TABLES e4b_compact_casemanagement / SCORES=TABLE;
	TABLES e4b_compact_followup / SCORES=TABLE;
	TABLES e4b_compact_transport / SCORES=TABLE;
	TABLES e4b_compact_homehealth / SCORES=TABLE;
	TABLES e4b_compact_other / SCORES=TABLE;
	TABLES Q4b_text / SCORES=TABLE;
RUN;


/* 5(a) Have there been advantages of the Nurse Licensure Compact for your organization? Yes, No, Don’t know
Table: Of Employers Familiar with the NLC, Have there Been Advantages of the Nurse Licensure Compact for your Organization? */

proc format;
	value e5a_compact
    1 = 'Yes'
    2 = 'No'
	3 = "Don't know";
run;
	
PROC SQL;
	CREATE VIEW WORK.SORT14 AS
	SELECT e5a_compact, e1_compact, filter
	FROM WORK.analyses
	WHERE filter NOT = 'SingleS' AND e1_compact NOT = 4;
QUIT;

Title 'of employers familiar with the NLC, have there been advantages of the nurse licensure compact for your organization?';
PROC FREQ DATA = WORK.SORT14
	ORDER=INTERNAL;
	TABLES e5a_compact / SCORES=TABLE;
	FORMAT e5a_compact e5a_compact.;
RUN;


/* 5(b) If yes, please explain:
Table: Of Employers Familiar with the NLC, Have there Been Advantages of the Nurse Licensure Compact for your Organization? COMMENTS */
			
PROC SQL;
	CREATE VIEW WORK.SORT15 AS
	SELECT e5b_compact, e5a_compact, e1_compact, filter
	FROM WORK.analyses
	WHERE filter NOT = 'SingleS' AND e1_compact NOT = 4 AND e5a_compact NOT = 2 AND e5a_compact NOT = 3;
QUIT;

Title 'of employers familiar with the NLC, have there been advantages of the nurse licensure compact for your organization? COMMENTS';
PROC FREQ DATA = WORK.SORT15
	ORDER=INTERNAL;
	TABLES e5b_compact / SCORES=TABLE;
RUN;


/* 6(a) Have there been disadvantages of the Nurse Licensure Compact for your organization? Yes, No, Don’t know
Table: Of Employers Familiar with the NLC, Have there Been Disadvantages of the Nurse Licensure Compact for your Organization? */

proc format;
	value e6a_compact
    1 = 'Yes'
    2 = 'No'
	3 = "Don't know";
run;

PROC SQL;
	CREATE VIEW WORK.SORT16 AS
	SELECT e6a_compact, e1_compact, filter
	FROM WORK.analyses
	WHERE filter NOT = 'SingleS' AND e1_compact NOT = 4;
QUIT;

Title 'of employers familiar with the NLC, have there been disadvantages of the nurse licensure compact for your organization';
PROC FREQ DATA = WORK.SORT16
	ORDER=INTERNAL;
	TABLES e6a_compact / SCORES=TABLE;
	FORMAT e6a_compact e6a_compact.;
RUN;


/* 6(b) If yes, please explain:
Table: Of Employers Familiar with the NLC, Have there Been Disadvantages of the Nurse Licensure Compact for your Organization? COMMENTS */
	
PROC SQL;
	CREATE VIEW WORK.SORT17 AS
	SELECT e6b_compact, e6a_compact, e1_compact, filter
	FROM WORK.analyses
	WHERE filter NOT = 'SingleS' AND e1_compact NOT = 4 AND e6a_compact NOT = 2 AND e6a_compact NOT = 3;
QUIT;

Title 'of employers familiar with the NLC, have there been disadvantages of the nurse licensure compact for your organization? COMMENTS';
PROC FREQ DATA = WORK.SORT17
	ORDER=INTERNAL;
	TABLES e6b_compact / SCORES=TABLE;
RUN;


/* 7(a) Do you have recommendations on how to improve the Nurse Licensure Compact? Yes, No
Table: Of Employers Familiar with the NLC, Do you have Recommendations on how to Improve the Nurse Licensure Compact? */

proc format;
	value e7a_compact
    1 = 'Yes'
    2 = 'No';
run;

PROC SQL;
	CREATE VIEW WORK.SORT18 AS
	SELECT e7a_compact, filter
	FROM WORK.analyses
	WHERE filter NOT = 'SingleS';
QUIT;

Title 'of employers familiar with the NLC, do you have recommendations on how to improve the nurse licensure compact';
PROC FREQ DATA = WORK.SORT18
	ORDER=INTERNAL;
	TABLES e7a_compact / SCORES=TABLE;
	FORMAT e7a_compact e7a_compact.;
RUN;


/* 7(b) If yes, please explain:
Table: Of Employers Familiar with the NLC, Do you have Recommendations on how to Improve the Nurse Licensure Compact? COMMENTS */

PROC SQL;
	CREATE VIEW WORK.SORT18 AS
	SELECT e7b_compact, e7a_compact, filter
	FROM WORK.analyses
	WHERE filter NOT = 'SingleS' AND e7a_compact NOT = 2;
QUIT;

Title 'of employers familiar with the NLC, do you have recommendations on how to improve the nurse licensure compact? COMMENTS';
PROC FREQ DATA = WORK.SORT18
	ORDER=INTERNAL;
	TABLES e7b_compact / SCORES=TABLE;
RUN;	







GOPTIONS NOACCESSIBLE;
%LET _CLIENTTASKLABEL=;
%LET _CLIENTPROJECTPATH=;
%LET _CLIENTPROJECTNAME=;
%LET _SASPROGRAMFILE=;

;*';*";*/;quit;run;
ODS _ALL_ CLOSE;
