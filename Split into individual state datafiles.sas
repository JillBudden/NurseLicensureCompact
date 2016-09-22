Libname JBlib '\\lansaspd1\Research\Jill Budden\JillB\NLC surveys';
data work.analyses;
	set JBlib.nursesurvey;

run; 


/* Break up Data */

PROC SORT
	DATA=WORK.ANALYSES(DROP=full_name address_1 address_2 city state zip_code batch_no tiff_name)
	OUT=WORK.nursesurvey_All;
	by originating_state;
RUN;


/* ALASKA */

PROC SQL;
	CREATE VIEW WORK.Alaska_nursesurvey AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'AK';
QUIT;


PROC FREQ DATA = WORK.Alaska_nursesurvey
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN; 


/* AMERICAN SAMOA */

PROC SQL;
	CREATE VIEW WORK.AMERICANSAMOA_nursesurvey AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'AS';
QUIT;


PROC FREQ DATA = WORK.AMERICANSAMOA_nursesurvey
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN; 


/* ARIZONA */

PROC SQL;
	CREATE VIEW WORK.ARIZONA_nursesurvey AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'AZ';
QUIT;


PROC FREQ DATA = WORK.ARIZONA_nursesurvey
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN; 


/* ARKANSAS */

PROC SQL;
	CREATE VIEW WORK.ARKANSAS_nursesurvey AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'AR';
QUIT;


PROC FREQ DATA = WORK.ARKANSAS_nursesurvey
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN; 
 

/* Alabama */

PROC SQL;
	CREATE VIEW WORK.Alabama_nursesurvey AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'AL';
QUIT;


PROC FREQ DATA = WORK.Alabama_nursesurvey
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN; 


/* CALIFORNIA-RN */

PROC SQL;
	CREATE VIEW WORK.CALIFORNIA_nursesurvey AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'CA';
QUIT;


PROC FREQ DATA = WORK.CALIFORNIA_nursesurvey
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN;


/* COLORADO */

PROC SQL;
	CREATE VIEW WORK.COLORADO_nursesurvey AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'CO';
QUIT;


PROC FREQ DATA = WORK.COLORADO_nursesurvey
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN;
 
 
/* Connecticut */

PROC SQL;
	CREATE VIEW WORK.Connecticut_nursesurvey AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'CT';
QUIT;


PROC FREQ DATA = WORK.Connecticut_nursesurvey
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN;
 

/* DELAWARE  */

PROC SQL;
	CREATE VIEW WORK.DELAWARE_nursesurvey  AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'DE';
QUIT;


PROC FREQ DATA = WORK.DELAWARE_nursesurvey
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN;

 
/* DISTRICT OF COLUMBIA */

PROC SQL;
	CREATE VIEW WORK.DISTRICTOFCOLUMBIA_nursesurvey  AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'DC';
QUIT;


PROC FREQ DATA = WORK.DISTRICTOFCOLUMBIA_nursesurvey
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN;


/* FLORIDA */

PROC SQL;
	CREATE VIEW WORK.FLORIDA_nursesurvey AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'FL';
QUIT;


PROC FREQ DATA = WORK.FLORIDA_nursesurvey  
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN;



/* GUAM */

PROC SQL;
	CREATE VIEW WORK.GUAM_nursesurvey AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'GU';
QUIT;


PROC FREQ DATA = WORK.GUAM_nursesurvey   
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN;



/* Georgia */

PROC SQL;
	CREATE VIEW WORK.Georgia_nursesurvey AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'GA';
QUIT;


PROC FREQ DATA = WORK.Georgia_nursesurvey   
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN;


/* Hawaii */

PROC SQL;
	CREATE VIEW WORK.Hawaii_nursesurvey AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'HI';
QUIT;


PROC FREQ DATA = WORK.Hawaii_nursesurvey    
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN;


/* IDAHO */

PROC SQL;
	CREATE VIEW WORK.IDAHO_nursesurvey AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'ID';
QUIT;


PROC FREQ DATA = WORK.IDAHO_nursesurvey    
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN;


/* ILLINOIS */

PROC SQL;
	CREATE VIEW WORK.ILLINOIS_nursesurvey AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'IL';
QUIT;


PROC FREQ DATA = WORK.ILLINOIS_nursesurvey   
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN;


/* INDIANA */

PROC SQL;
	CREATE VIEW WORK.INDIANA_nursesurvey AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'IN';
QUIT;


PROC FREQ DATA = WORK.INDIANA_nursesurvey    
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN;


/* IOWA */

PROC SQL;
	CREATE VIEW WORK.IOWA_nursesurvey AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'IA';
QUIT;


PROC FREQ DATA = WORK.IOWA_nursesurvey 
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN;


/* KANSAS */

PROC SQL;
	CREATE VIEW WORK.KANSAS_nursesurvey AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'KS';
QUIT;


PROC FREQ DATA = WORK.KANSAS_nursesurvey
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN;


/* KENTUCKY */

PROC SQL;
	CREATE VIEW WORK.KENTUCKY_nursesurvey AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'KY';
QUIT;


PROC FREQ DATA = WORK.KENTUCKY_nursesurvey
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN;


/* LOUISIANA-RN */

PROC SQL;
	CREATE VIEW WORK.LOUISIANA_nursesurvey AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'LA';
QUIT;


PROC FREQ DATA = WORK.LOUISIANA_nursesurvey  
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN;


/* MAINE */

PROC SQL;
	CREATE VIEW WORK.MAINE_nursesurvey AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'ME';
QUIT;


PROC FREQ DATA = WORK.MAINE_nursesurvey  
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN;



/* MARYLAND */

PROC SQL;
	CREATE VIEW WORK.MARYLAND_nursesurvey AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'MD';
QUIT;


PROC FREQ DATA = WORK.MARYLAND_nursesurvey  
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN;



/* MASSACHUSETTS */

PROC SQL;
	CREATE VIEW WORK.MASSACHUSETTS_nursesurvey AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'MA';
QUIT;


PROC FREQ DATA = WORK.MASSACHUSETTS_nursesurvey   
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN;
 


/* MICHIGAN */

PROC SQL;
	CREATE VIEW WORK.MICHIGAN_nursesurvey AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'MI';
QUIT;


PROC FREQ DATA = WORK.MICHIGAN_nursesurvey   
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN;
 

/* MINNESOTA */

PROC SQL;
	CREATE VIEW WORK.MINNESOTA_nursesurvey AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'MN';
QUIT;


PROC FREQ DATA = WORK.MINNESOTA_nursesurvey     
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN;



/* MISSISSIPPI */

PROC SQL;
	CREATE VIEW WORK.MISSISSIPPI_nursesurvey AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'MS';
QUIT;


PROC FREQ DATA = WORK.MISSISSIPPI_nursesurvey    
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN;



/* MISSOURI */

PROC SQL;
	CREATE VIEW WORK.MISSOURI_nursesurvey AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'MO';
QUIT;


PROC FREQ DATA = WORK.MISSOURI_nursesurvey    
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN;



/* MONTANA */

PROC SQL;
	CREATE VIEW WORK.MONTANA_nursesurvey AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'MT';
QUIT;


PROC FREQ DATA = WORK.MONTANA_nursesurvey    
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN;
 

/* NEBRASKA */

PROC SQL;
	CREATE VIEW WORK.NEBRASKA_nursesurvey AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'NE';
QUIT;


PROC FREQ DATA = WORK.NEBRASKA_nursesurvey    
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN;
 


/* NEVADA */

PROC SQL;
	CREATE VIEW WORK.NEVADA_nursesurvey AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'NV';
QUIT;


PROC FREQ DATA = WORK.NEVADA_nursesurvey     
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN;


/* NEW HAMPSHIRE */

PROC SQL;
	CREATE VIEW WORK.NEWHAMPSHIRE_nursesurvey AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'NH';
QUIT;


PROC FREQ DATA = WORK.NEWHAMPSHIRE_nursesurvey  
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN;


/* NEW JERSEY */

PROC SQL;
	CREATE VIEW WORK.NEWJERSEY_nursesurvey AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'NJ';
QUIT;


PROC FREQ DATA = WORK.NEWJERSEY_nursesurvey   
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN;


/* NEW MEXICO */

PROC SQL;
	CREATE VIEW WORK.NEWMEXICO_nursesurvey AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'NM';
QUIT;


PROC FREQ DATA = WORK.NEWMEXICO_nursesurvey  
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN;


/* NEW YORK */

PROC SQL;
	CREATE VIEW WORK.NEWYORK_nursesurvey AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'NY';
QUIT;


PROC FREQ DATA = WORK.NEWYORK_nursesurvey    
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN;


/* NORTH CAROLINA */

PROC SQL;
	CREATE VIEW WORK.NORTHCAROLINA_nursesurvey AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'NC';
QUIT;


PROC FREQ DATA = WORK.NORTHCAROLINA_nursesurvey    
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN;


/* NORTH DAKOTA */

PROC SQL;
	CREATE VIEW WORK.NORTHDAKOTA_nursesurvey AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'ND';
QUIT;


PROC FREQ DATA = WORK.NORTHDAKOTA_nursesurvey   
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN;

 

/* NORTHERN MARIANA ISLANDS */

PROC SQL;
	CREATE VIEW WORK.NMARIANAISLANDS_nursesurvey AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'MP';
QUIT;


PROC FREQ DATA = WORK.NMARIANAISLANDS_nursesurvey 
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN;
 

/* OHIO */

PROC SQL;
	CREATE VIEW WORK.OHIO_nursesurvey AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'OH';
QUIT;


PROC FREQ DATA = WORK.OHIO_nursesurvey  
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN;

 


/* OREGON */

PROC SQL;
	CREATE VIEW WORK.OREGON_nursesurvey AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'OR';
QUIT;


PROC FREQ DATA = WORK.OREGON_nursesurvey  
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN;
 

/* Oklahoma */

PROC SQL;
	CREATE VIEW WORK.Oklahoma_nursesurvey AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'OK';
QUIT;


PROC FREQ DATA = WORK.Oklahoma_nursesurvey   
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN;
 


/* Pennslyvania */

PROC SQL;
	CREATE VIEW WORK.Pennslyvania_nursesurvey AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'PA';
QUIT;


PROC FREQ DATA = WORK.Pennslyvania_nursesurvey   
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN;


/* RHODE ISLAND */

PROC SQL;
	CREATE VIEW WORK.RHODEISLAND_nursesurvey AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'RI';
QUIT;


PROC FREQ DATA = WORK.RHODEISLAND_nursesurvey   
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN;


/* SOUTH CAROLINA */

PROC SQL;
	CREATE VIEW WORK.SOUTHCAROLINA_nursesurvey AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'SC';
QUIT;


PROC FREQ DATA = WORK.SOUTHCAROLINA_nursesurvey   
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN;


/* SOUTH DAKOTA */

PROC SQL;
	CREATE VIEW WORK.SOUTHDAKOTA_nursesurvey AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'SD';
QUIT;


PROC FREQ DATA = WORK.SOUTHDAKOTA_nursesurvey     
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN;


/* TENNESSEE */

PROC SQL;
	CREATE VIEW WORK.TENNESSEE_nursesurvey AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'TN';
QUIT;


PROC FREQ DATA = WORK.TENNESSEE_nursesurvey     
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN;


/* TEXAS */

PROC SQL;
	CREATE VIEW WORK.TEXAS_nursesurvey AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'TX';
QUIT;


PROC FREQ DATA = WORK.TEXAS_nursesurvey      
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN;



/* UTAH */

PROC SQL;
	CREATE VIEW WORK.UTAH_nursesurvey AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'UT';
QUIT;


PROC FREQ DATA = WORK.UTAH_nursesurvey    
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN;


/* VERMONT */

PROC SQL;
	CREATE VIEW WORK.VERMONT_nursesurvey AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'VT';
QUIT;


PROC FREQ DATA = WORK.VERMONT_nursesurvey      
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN;

 
/* VIRGIN ISLANDS */

PROC SQL;
	CREATE VIEW WORK.VIRGINISLANDS_nursesurvey AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'VI';
QUIT;


PROC FREQ DATA = WORK.VIRGINISLANDS_nursesurvey     
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN;


/* VIRGINIA */

PROC SQL;
	CREATE VIEW WORK.VIRGINIA_nursesurvey AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'VA';
QUIT;


PROC FREQ DATA = WORK.VIRGINIA_nursesurvey     
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN;

 
/* WEST VIRGINIA-RN */

PROC SQL;
	CREATE VIEW WORK.WESTVIRGINIA_nursesurvey  AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'WV';
QUIT;


PROC FREQ DATA = WORK.WESTVIRGINIA_nursesurvey      
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN;


/* WISCONSIN */

PROC SQL;
	CREATE VIEW WORK.WISCONSIN_nursesurvey AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'WI';
QUIT;


PROC FREQ DATA = WORK.WISCONSIN_nursesurvey      
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN;


/* WYOMING */

PROC SQL;
	CREATE VIEW WORK.WYOMING_nursesurvey AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'WY';
QUIT;


PROC FREQ DATA = WORK.WYOMING_nursesurvey       
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN;


/* Washington */

PROC SQL;
	CREATE VIEW WORK.Washington_nursesurvey AS
	SELECT *
	FROM WORK.nursesurvey_All
	WHERE originating_state = 'WA';
QUIT;


PROC FREQ DATA = WORK.Washington_nursesurvey      
	ORDER=INTERNAL;
	TABLES originating_state / NOROW NOCOL NOCUM SCORES=TABLE;
RUN;



GOPTIONS NOACCESSIBLE;
%LET _CLIENTTASKLABEL=;
%LET _CLIENTPROJECTPATH=;
%LET _CLIENTPROJECTNAME=;
%LET _SASPROGRAMFILE=;

;*';*";*/;quit;run;
ODS _ALL_ CLOSE;
