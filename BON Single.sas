Libname JBlib '\\lansaspd1\Research\Jill Budden\JillB\NLC surveys';
data work.analyses;
	set JBlib.BONsingle;

/* Variables by survey number

b1_single, b2_single, b3_single, b4a_single, b4b_single, b5a_single, 
b5b_single_unions, b5b_single_nurseass, b5b_single_agency, b5b_single_official, b5b_single_bon, b5b_single_other, 
b6a_single, b6b_single_financial, b6b_single_cbc, b6b_single_invest, b6b_single_attor, b6b_single_staff, b6b_single_trust, b6b_single_other, 
b7a_single, b7b_single
b8a_single, b8b_single, b9a_single, b9b_single

b6b_single_other2	
b5b_single_other2

*/


/* 1Please indicate your state/jurisdiction:
response rate
AK AL AR AZ CA-RN CA-LVN CO CT DC DE FL GA HI IA ID IL IN KS KY LA-RN LA-PN MA MD ME MI MN MO MS MT NC ND NE	
NH NJ NM NV NY OH OK OR PA RI SC SD TN TX UT VA VT WA WI WV-RN WV-PN WY AS GU MP VI */

PROC SQL;
	CREATE VIEW WORK.SORT1 AS
	SELECT b1_single
	FROM WORK.analyses;
QUIT;

Title 'response rate';
PROC FREQ DATA = WORK.SORT1
	ORDER=INTERNAL;
	TABLES b1_single / SCORES=TABLE;
RUN;


/* 2How many years have you been an EO at your current Board of Nursing (BON)?
< 1, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, > 14 
Table: How Many Years as EO at Current BON */

PROC SQL;
	CREATE VIEW WORK.SORT2 AS
	SELECT b2_single
	FROM WORK.analyses;
QUIT;

Title 'how many years as EO at current BON';
PROC FREQ DATA = WORK.SORT2
	ORDER=INTERNAL;
	TABLES b2_single / SCORES=TABLE;
RUN;
	

/* 3How familiar are you with the Nurse Licensure Compact? Very familiar, Familiar, Somewhat familiar, Not familiar 
Table: How Familiar are you with the Nurse Licensure Compact */

PROC SQL;
	CREATE VIEW WORK.SORT3 AS
	SELECT b3_single
	FROM WORK.analyses;
QUIT;

Title 'how familiar are you with the nurse licensure compact';
PROC FREQ DATA = WORK.SORT3
	ORDER=INTERNAL;
	TABLES b3_single / SCORES=TABLE;
RUN;	


/* 4(a) Is your BON considering joining the Nurse Licensure Compact?
Yes, No(skip to 6), Under discussion (skip to 5), Unsure, at this time (skip to 6)
Table: Is Your BON Considering Joining the NLC */
	
PROC SQL;
	CREATE VIEW WORK.SORT4 AS
	SELECT b4a_single
	FROM WORK.analyses;
QUIT;

Title 'is your BON considering joining the NLC';
PROC FREQ DATA = WORK.SORT4
	ORDER=INTERNAL;
	TABLES b4a_single / SCORES=TABLE;
RUN;

	
/* 4(b) If yes, how soon? Within the year, 2015, 2016, 2017, 2018, 2019, 2020
Table: Of BONs Considering Joining the NLC, How Soon? */

PROC SQL;
	CREATE VIEW WORK.SORT5 AS
	SELECT b4b_single, b4a_single
	FROM WORK.analyses
	WHERE b4a_single NOT = 'No' AND b4a_single NOT = 'Under discussion' AND b4a_single NOT = 'Unsure, at this time';
QUIT;

Title 'of BONs considering joining the NLC, how soon?';
PROC FREQ DATA = WORK.SORT5
	ORDER=INTERNAL;
	TABLES b4b_single / SCORES=TABLE;
RUN;


/* 5(a) If your state/jurisdiction is considering joining the Nurse Licensure Compact, do you anticipate any opposition from stakeholders?
Yes, No(skip to 6), Don’t know(skip to 6)
Table: If BON Considering Joining the NLC (or it is Under Discussion), Is there Anticipated Opposition from Stakeholders? */

PROC SQL;
	CREATE VIEW WORK.SORT6 AS
	SELECT b5a_single, b4a_single
	FROM WORK.analyses
	WHERE b4a_single NOT = 'No' AND b4a_single NOT = 'Unsure, at this time';
QUIT;

Title 'if BON considering joining the NLC (or it is under discussion), is there anticipated opposition from stakeholders?';
PROC FREQ DATA = WORK.SORT6
	ORDER=INTERNAL;
	TABLES b5a_single / SCORES=TABLE;
RUN;


/* 5(b) If yes, please indicate any opposition in your state/jurisdiction. (select all that apply)
Unions, State/jurisdiction nurse association, Higher level agency in state/jurisdiction or umbrella agency,
State/jurisdiction official, Your BON, Other, please specify
Table: If BON Considering Joining the NLC (or it is Under Discussion) & there is Anticipated Opposition, the Specified Opposition */
	
PROC SQL;
	CREATE VIEW WORK.SORT7 AS
	SELECT b5b_single_unions, b5b_single_nurseass, b5b_single_agency, b5b_single_official, b5b_single_bon, b5b_single_other, b5b_single_other2, b4a_single, b5a_single
	FROM WORK.analyses
	WHERE b5a_single NOT = 'No' AND b5a_single NOT = "Don't know" AND b4a_single NOT = 'No' AND b4a_single NOT = 'Unsure, at this time';
QUIT;

Title 'if BON considering joining the NLC (or it is Under Discussion) & there is anticipated opposition, the specified opposition';
PROC FREQ DATA = WORK.SORT7
	ORDER=INTERNAL;
	TABLES b5b_single_unions / SCORES=TABLE;
	TABLES b5b_single_nurseass / SCORES=TABLE;
	TABLES b5b_single_agency / SCORES=TABLE;
	TABLES b5b_single_official / SCORES=TABLE;
	TABLES b5b_single_bon / SCORES=TABLE;
	TABLES b5b_single_other / SCORES=TABLE;
	TABLES b5b_single_other2 / SCORES=TABLE;
RUN;


/* 6(a) Are there any barriers for your state/jurisdiction joining the Nurse Licensure Compact?
Yes, No(skip to 7), Don’t know(skip to 7)
Table: Are there any Barriers for State/Jurisdiction Joining the NLC? */

PROC SQL;
	CREATE VIEW WORK.SORT8 AS
	SELECT b6a_single
	FROM WORK.analyses;
QUIT;

Title 'are there any barriers for state/jurisdiction joining the NLC?';
PROC FREQ DATA = WORK.SORT8
	ORDER=INTERNAL;
	TABLES b6a_single / SCORES=TABLE;
RUN;


/* 6(b) If yes, please indicate any barriers: (select all that apply)
Financial, Criminal Background Checks not conducted in all Compact states, Anticipated increased caseload for investigators,
Anticipated increased caseload for attorneys, Anticipated increased workload for licensure/operations staff,
Lack of trust in actions taken by other BONs, Other, please specify
Table: Of those with Barriers for State/Jurisdiction Joining the NLC, the Specified Barriers */

PROC SQL;
	CREATE VIEW WORK.SORT9 AS
	SELECT b6b_single_financial, b6b_single_cbc, b6b_single_invest, b6b_single_attor, b6b_single_staff, b6b_single_trust, b6b_single_other, b6b_single_other2, b6a_single
	FROM WORK.analyses
	WHERE b6a_single NOT = 'No' AND b6a_single NOT = "Don't know";
QUIT;

Title 'of those with barriers for state/jurisdiction joining the NLC, the specified barriers';
PROC FREQ DATA = WORK.SORT9
	ORDER=INTERNAL;
	TABLES b6b_single_financial / SCORES=TABLE;
	TABLES b6b_single_cbc / SCORES=TABLE;
	TABLES b6b_single_invest / SCORES=TABLE;
	TABLES b6b_single_attor / SCORES=TABLE;
	TABLES b6b_single_staff / SCORES=TABLE;
	TABLES b6b_single_trust / SCORES=TABLE;
	TABLES b6b_single_other / SCORES=TABLE;
	TABLES b6b_single_other2 / SCORES=TABLE;
RUN;


/* 7(a) Overall, are there advantages of joining the Nurse Licensure Compact?
Yes, No, Don’t know
Table: Advantages of joining the NLC? */

PROC SQL;
	CREATE VIEW WORK.SORT10 AS
	SELECT b7a_single
	FROM WORK.analyses;
QUIT;

Title 'advantages of joining the NLC';
PROC FREQ DATA = WORK.SORT10
	ORDER=INTERNAL;
	TABLES b7a_single / SCORES=TABLE;
RUN;


/* 7(b) If yes, please explain:
Table: Advantages of joining the NLC? COMMENTS */
	
PROC SQL;
	CREATE VIEW WORK.SORT11 AS
	SELECT b7b_single, b7a_single 
	FROM WORK.analyses
	WHERE b7a_single NOT = 'No' AND b7a_single NOT = "Don't know";
QUIT;

Title 'advantages of joining the NLC? COMMENTS';
PROC FREQ DATA = WORK.SORT11
	ORDER=INTERNAL;
	TABLES b7b_single / SCORES=TABLE;
RUN;


/* 8(a) Overall, are there disadvantages of joining the Nurse Licensure Compact? Yes, No, Don’t know
Table: Disadvantages of joining the NLC? */
	
PROC SQL;
	CREATE VIEW WORK.SORT12 AS
	SELECT b8a_single
	FROM WORK.analyses;
QUIT;

Title 'disadvantages of joining the NLC';
PROC FREQ DATA = WORK.SORT12
	ORDER=INTERNAL;
	TABLES b8a_single / SCORES=TABLE;
RUN;


/* 8(b) If yes, please explain:
Table: Disadvantages of joining the NLC? COMMENTS */
		
PROC SQL;
	CREATE VIEW WORK.SORT13 AS
	SELECT b8b_single, b8a_single
	FROM WORK.analyses
	WHERE b8a_single NOT = 'No' AND b8a_single NOT = "Don't know";
QUIT;

Title 'disadvantages of joining the NLC? COMMENTS';
PROC FREQ DATA = WORK.SORT13
	ORDER=INTERNAL;
	TABLES b8b_single / SCORES=TABLE;
RUN;


/* 9(a) Are there Nurse Licensure Compact provisions that should be amended or added? Yes, No
Table: Are there NLC Provisions that should be Amended or Added? */

PROC SQL;
	CREATE VIEW WORK.SORT14 AS
	SELECT b9a_single
	FROM WORK.analyses;
QUIT;

Title 'are there NLC provisions that should be amended or added?';
PROC FREQ DATA = WORK.SORT14
	ORDER=INTERNAL;
	TABLES b9a_single / SCORES=TABLE;
RUN;	


/* 9(b) If yes, please explain:
Table: Are there NLC Provisions that should be Amended or Added? COMMENTS */
	
PROC SQL;
	CREATE VIEW WORK.SORT15 AS
	SELECT b9b_single, b9a_single
	FROM WORK.analyses
	WHERE b9a_single NOT = 'No' AND b9a_single NOT = "Don't know";
QUIT;

Title 'are there NLC provisions that should be amdended or added? COMMENTS';
PROC FREQ DATA = WORK.SORT15
	ORDER=INTERNAL;
	TABLES b9b_single / SCORES=TABLE;
RUN;

GOPTIONS NOACCESSIBLE;
%LET _CLIENTTASKLABEL=;
%LET _CLIENTPROJECTPATH=;
%LET _CLIENTPROJECTNAME=;
%LET _SASPROGRAMFILE=;

;*';*";*/;quit;run;
ODS _ALL_ CLOSE;
