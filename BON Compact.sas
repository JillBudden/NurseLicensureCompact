Libname JBlib '\\lansaspd1\Research\Jill Budden\JillB\NLC surveys';
data work.analyses;
	set JBlib.BONCompact;


/* Variables by survey number 

b1_compact, b2_compact, b3_compact, b4_compact, b5a_compact, b5b_compact, b6a_compact, b6b_compact, b7a_compact, b7b_compact, 
b8a_compact, b8b_compact, b8c_compact, b8d_compact, b9a_compact, b9b_compact, b10a_compact, b10b_compact, b11a_compact, 
b11b_compact, b12a_compact, b12b_compact, b13_compact */



/* 1Please indicate your state/jurisdiction:
response rate
AK AL AR AZ CA-RN CA-LVN CO CT DC DE FL GA HI IA ID IL IN KS KY LA-RN LA-PN MA MD ME MI MN MO MS MT NC ND NE	
NH NJ NM NV NY OH OK OR PA RI SC SD TN TX UT VA VT WA WI WV-RN WV-PN WY AS GU MP VI */

PROC SQL;
	CREATE VIEW WORK.SORT1 AS
	SELECT b1_compact
	FROM WORK.analyses;
QUIT;

Title 'response rate';
PROC FREQ DATA = WORK.SORT1
	ORDER=INTERNAL;
	TABLES b1_compact / SCORES=TABLE;
RUN;


/* 2How many years have you been a Nurse Licensure Compact Administrator?
< 1, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14 
Table: How Many Years have you been a Nurse Licensure Compact Administrator */

PROC SQL;
	CREATE VIEW WORK.SORT2 AS
	SELECT b2_compact
	FROM WORK.analyses;
QUIT;

Title 'how many years have you been a nurse licensure compact administrator';
PROC FREQ DATA = WORK.SORT2
	ORDER=INTERNAL;
	TABLES b2_compact / SCORES=TABLE;
RUN;


/* 3How long has your state/jurisdiction been a member of the Nurse Licensure Compact?
< 1, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, Don’t know 
Table: How Many Years has Your State/Jurisdiction been a Member of the Nurse Licensure Compact */
              
PROC SQL; 
	CREATE VIEW WORK.SORT3 AS
	SELECT b3_compact                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
	FROM WORK.analyses;
QUIT;           

Title 'how many years has your state/jurisdiction been a member of the nurse licensure compact';
PROC FREQ DATA = WORK.SORT3
	ORDER=INTERNAL;
	TABLES b3_compact / SCORES=TABLE;
RUN;


/* 4Does your Board of Nursing (BON) maintain monthly or yearly statistics or performance measures 
specifically related to Nurse Licensure Compact cases/complaints? Yes, No 
Table: Does BON Maintain Monthly or Yearly Statistics or Performance Measures Related to the Nurse Licensure Compact Cases/Complaints? */

PROC SQL;
	CREATE VIEW WORK.SORT4 AS
	SELECT b4_compact
	FROM WORK.analyses;
QUIT;

Title 'does BON maintain monthly or yearly statistics or performance measures related to the nurse licensure compact cases/complaints';
PROC FREQ DATA = WORK.SORT4
	ORDER=INTERNAL;
	TABLES b4_compact / SCORES=TABLE;
RUN;


/* 5(a) What is the overall impact the Nurse Licensure Compact has on your BON licensure/operations staff workload? 
Increased workload, Little or no impact on workload, Decreased workload, Don’t know
Table: Impact the Nurse Licensure Compact has on your BON Licensure/Operations Staff Workload */

PROC SQL;
	CREATE VIEW WORK.SORT5 AS
	SELECT b5a_compact
	FROM WORK.analyses;
QUIT;

Title 'impact the nurse licensure compact has on your BON licensure/operations staff workload';
PROC FREQ DATA = WORK.SORT5
	ORDER=INTERNAL;
	TABLES b5a_compact / SCORES=TABLE;
RUN;


/* 5(b) Please explain:
Table: Impact the Nurse Licensure Compact has on your BON Licensure/Operations Staff Workload: COMMENTS */

PROC SQL;
	CREATE VIEW WORK.SORT6 AS
	SELECT b5b_compact
	FROM WORK.analyses;
QUIT;

Title 'impact the nurse licensure compact has on your BON licensure/operations staff workload';
PROC FREQ DATA = WORK.SORT6
	ORDER=INTERNAL;
	TABLES b5b_compact / SCORES=TABLE;
RUN;


/* 6(a) What is the overall impact the Nurse Licensure Compact has on your BON investigator caseload?
Increased caseload, Little or no impact on caseload, Decreased caseload, Don’t know
Table: Impact the Nurse Licensure Compact has on your BON Investigator Caseload */

PROC SQL;
	CREATE VIEW WORK.SORT7 AS
	SELECT b6a_compact
	FROM WORK.analyses;
QUIT;

Title 'impact the nurse licensure compact has on your BON investigator caseload';
PROC FREQ DATA = WORK.SORT7
	ORDER=INTERNAL;
	TABLES b6a_compact / SCORES=TABLE;
RUN;


/* 6(b) Please explain:
Table: Impact the Nurse Licensure Compact has on your BON Investigator Caseload: COMMENTS */

PROC SQL;
	CREATE VIEW WORK.SORT8 AS
	SELECT b6b_compact
	FROM WORK.analyses;
QUIT;

Title 'impact the nurse licensure compact has on your BON investigator caseload';
PROC FREQ DATA = WORK.SORT8
	ORDER=INTERNAL;
	TABLES b6b_compact / SCORES=TABLE;
RUN;	


/* 7(a) What is the overall impact the Nurse Licensure Compact has on your BON attorney caseload?
Increased caseload, Little or no impact on caseload, Decreased caseload, Don’t know
Table: Impact the Nurse Licensure Compact has on your BON Attorney Caseload */

PROC SQL;
	CREATE VIEW WORK.SORT9 AS
	SELECT b7a_compact
	FROM WORK.analyses;
QUIT;

Title 'impact the nurse licensure compact has on your BON attorney caseload';
PROC FREQ DATA = WORK.SORT9
	ORDER=INTERNAL;
	TABLES b7a_compact / SCORES=TABLE;
RUN;	


/* 7(b) Please explain:
Table: Impact the Nurse Licensure Compact has on your BON Attorney Caseload: COMMENTS */

PROC SQL;
	CREATE VIEW WORK.SORT10 AS
	SELECT b7b_compact
	FROM WORK.analyses;
QUIT;

Title 'impact the nurse licensure compact has on your BON attorney caseload';
PROC FREQ DATA = WORK.SORT10
	ORDER=INTERNAL;
	TABLES b7b_compact / SCORES=TABLE;
RUN;	


/* 8(a) Have you ever had to work with another Compact state/jurisdiction regarding a discipline case?
Yes, No (skip to 9)
Table: Has the BON Ever had to Work with Another Compact State/Jurisdiction Regarding a Discipline Case? */

PROC SQL;
	CREATE VIEW WORK.SORT11 AS
	SELECT b8a_compact
	FROM WORK.analyses;
QUIT;

Title 'has the BON ever had to work with another compact state/jurisdiction regarding a discipline case';
PROC FREQ DATA = WORK.SORT11
	ORDER=INTERNAL;
	TABLES b8a_compact / SCORES=TABLE;
RUN;


/* 8(b) How does the Nurse Licensure Compact impact length of time to resolve a discipline case involving another Compact BON from complaint to board action?
Increased length of time, Little or no impact on length of time, Decreased length of time, Don’t know
Table: Of Compact BONs that have had to Work with Another Compact State/Jurisdiction Regarding a Discipline Case, 
How the NLC Impacts Length of Time to Resolve a Discipline Case Involving Another Compact BON from Complaint to Board Action */

PROC SQL;
	CREATE VIEW WORK.SORT12 AS
	SELECT b8b_compact, b8a_compact
	FROM WORK.analyses
	WHERE b8a_compact NOT = 'No';
QUIT;

Title 'of compact BONs that have had to work with another compact state/jurisdiction regarding a discipline case, how the NLC impacts length of time to resolve a discipline case involving another compact BON complaint to board action';
PROC FREQ DATA = WORK.SORT12
	ORDER=INTERNAL;
	TABLES b8b_compact / SCORES=TABLE;
RUN;


/* 8(c) How would you describe the overall level of cooperation among Compact states/jurisdictions in the exchange of information?
Very cooperative, Cooperative, Somewhat cooperative, Not cooperative
Table: Of Compact BONs that have had to Work with Another Compact State/Jurisdiction Regarding a Discipline Case, 
Level of Cooperation Among Compact States/Jurisdictions in the Exchange of Information */
		
PROC SQL;
	CREATE VIEW WORK.SORT13 AS
	SELECT b8c_compact, b8a_compact
	FROM WORK.analyses
	WHERE b8a_compact NOT = 'No';
QUIT;

Title 'of compact BONs that have had to work with another compact state/jurisdiction regarding a discipline case, level of cooperation
among compact states/jurisdictions in the exchange of information';
PROC FREQ DATA = WORK.SORT13
	ORDER=INTERNAL;
	TABLES b8c_compact / SCORES=TABLE;
RUN;


/* 8(d) Please explain:
Table: Of Compact BONs that have had to Work with Another Compact State/Jurisdiction Regarding a Discipline Case, 
Level of Cooperation Among Compact States/Jurisdictions in the Exchange of Information: COMMENTS */

PROC SQL;
	CREATE VIEW WORK.SORT14 AS
	SELECT b8d_compact, b8a_compact
	FROM WORK.analyses
	WHERE b8a_compact NOT = 'No';
QUIT;

Title 'of compact BONs that have had to work with another compact state/jurisdiction regarding a discipline case, level of 
cooperation among compact states/jurisdictions in the exchange of information: COMMENTS';
PROC FREQ DATA = WORK.SORT14
	ORDER=INTERNAL;
	TABLES b8d_compact / SCORES=TABLE;
RUN;


/* 9(a) Does the Nurse Licensure Compact have any financial impact on your BON?
Yes, No, Don’t know
Table: Does the NLC have any Financial Impact on the BON? */

PROC SQL;
	CREATE VIEW WORK.SORT15 AS
	SELECT b9a_compact
	FROM WORK.analyses;
QUIT;

Title 'Does the NLC have any financial impact on the BON';
PROC FREQ DATA = WORK.SORT15
	ORDER=INTERNAL;
	TABLES b9a_compact / SCORES=TABLE;
RUN;


/* 9(b) Please explain:
Table: Does the NLC have any Financial Impact on the BON? COMMENTS */

PROC SQL;
	CREATE VIEW WORK.SORT16 AS
	SELECT b9b_compact
	FROM WORK.analyses;
QUIT;

Title 'Does the NLC have any financial impact on the BON? COMMENTS';
PROC FREQ DATA = WORK.SORT16
	ORDER=INTERNAL;
	TABLES b9b_compact / SCORES=TABLE;
RUN;


/* 10(a) Overall, are there advantages of being a member of the Nurse Licensure Compact?
Yes, No, Don’t know
Table: Are there Advantages of Being a Member of the Nurse Licensure Compact? */
	
PROC SQL;
	CREATE VIEW WORK.SORT17 AS
	SELECT b10a_compact
	FROM WORK.analyses;
QUIT;

Title 'are there advantages of being a member of the nurse licensure compact?';
PROC FREQ DATA = WORK.SORT17
	ORDER=INTERNAL;
	TABLES b10a_compact / SCORES=TABLE;
RUN;

	
/* 10(b) If yes, please explain:
Table: Are there Advantages of Being a Member of the Nurse Licensure Compact? COMMENTS */
			
PROC SQL;
	CREATE VIEW WORK.SORT18 AS
	SELECT b10b_compact, b10a_compact
	FROM WORK.analyses
	WHERE b10a_compact NOT = 'No' AND b10a_compact NOT = "Don't know";
QUIT;

Title 'are there advantages of being a member of the nurse licensure compact?';
PROC FREQ DATA = WORK.SORT18
	ORDER=INTERNAL;
	TABLES b10b_compact / SCORES=TABLE;
RUN;


/* 11(a) Overall, are there disadvantages of being a member of the Nurse Licensure Compact?
Yes, No, Don’t know
Table: Are there Disadvantages of Being a Member of the Nurse Licensure Compact? */
		
PROC SQL;
	CREATE VIEW WORK.SORT19 AS
	SELECT b11a_compact
	FROM WORK.analyses;
QUIT;

Title 'are there disadvantages of being a member of the nurse licensure compact';
PROC FREQ DATA = WORK.SORT19
	ORDER=INTERNAL;
	TABLES b11a_compact / SCORES=TABLE;
RUN;


/* 11(b) If yes, please explain:
Table: Are there Disadvantages of Being a Member of the Nurse Licensure Compact? COMMENTS */

PROC SQL;
	CREATE VIEW WORK.SORT20 AS
	SELECT b11b_compact, b11a_compact
	FROM WORK.analyses
	WHERE b11a_compact NOT = 'No' AND b11a_compact NOT = "Don't know";
QUIT;

Title 'are there disadvantages of being a member of the nurse licensure compact? COMMENTS';
PROC FREQ DATA = WORK.SORT20
	ORDER=INTERNAL;
	TABLES b11b_compact / SCORES=TABLE;
RUN;	


/* 12(a) Are there Nurse Licensure Compact provisions that should be amended or added? Yes, No
Table: Are there NLC Provisions that Should be Amended or Added? */
		
PROC SQL;
	CREATE VIEW WORK.SORT21 AS
	SELECT b12a_compact
	FROM WORK.analyses;
QUIT;

Title 'are there disadvantages of being a member of the nurse licensure compact? COMMENTS';
PROC FREQ DATA = WORK.SORT21
	ORDER=INTERNAL;
	TABLES b12a_compact / SCORES=TABLE;
RUN;


/* 12(b) If yes, please explain:
Table: Are there NLC Provisions that Should be Amended or Added? COMMENTS */

PROC SQL;
	CREATE VIEW WORK.SORT22 AS
	SELECT b12b_compact, b12a_compact
	FROM WORK.analyses
	WHERE b12a_compact NOT = 'No';
QUIT;

Title 'are there nlc provisions that should be amended or added? COMMENTS';
PROC FREQ DATA = WORK.SORT22
	ORDER=INTERNAL;
	TABLES b12b_compact / SCORES=TABLE;
RUN;


/* 13What advice would you give a new state/jurisdiction joining the NLC?
Table: Advice for a State/Jurisdiction Joining the NLC */
			
PROC SQL;
	CREATE VIEW WORK.SORT23 AS
	SELECT b13_compact
	FROM WORK.analyses;
QUIT;

Title 'advice for a state/jurisdiction joining the nlc';
PROC FREQ DATA = WORK.SORT23
	ORDER=INTERNAL;
	TABLES b13_compact / SCORES=TABLE;
RUN;

GOPTIONS NOACCESSIBLE;
%LET _CLIENTTASKLABEL=;
%LET _CLIENTPROJECTPATH=;
%LET _CLIENTPROJECTNAME=;
%LET _SASPROGRAMFILE=;

;*';*";*/;quit;run;
ODS _ALL_ CLOSE;
