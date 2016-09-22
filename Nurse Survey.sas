Libname JBlib '\\lansaspd1\Research\Jill Budden\JillB\NLC surveys';
data work.analyses;
	set JBlib.NurseSurvey;

/* variables by survey number 
n1, 
n2, 
n3ak, n3al, n3ar, n3az, n3ca, n3co, n3ct, n3dc, n3de, n3fl, n3ga, n3hi, n3ia, n3id, n3il,
n3in, n3ks, n3ky, n3la, n3ma, n3md, n3me, n3mi, n3mn, n3mo, n3ms, n3mt, n3nc, n3nd, n3ne, n3nh, n3nj, n3nm, 
n3nv, n3ny, n3oh, n3ok, n3or, n3pa, n3ri, n3sc, n3sd, n3tn, n3tx, n3ut, n3va, n3vt, n3wa, n3wi, n3wv, n3wy,
n3as, n3gu, n3mp, n3vi, n3_none
n4a, n4b, n4c, n4d, 
n5, 
n6ak, n6al, n6ar, n6az, n6ca, n6co, n6ct, n6dc, n6de, n6fl, n6ga,n6hi, n6ia, n6id, n6il, n6in, n6ks, n6ky, n6la, 
n6ma, n6md, n6me, n6mi, n6mn, n6mo, n6ms, n6mt, n6nc, n6nd, n6ne, n6nh, n6nj, n6nm, n6nv, n6ny, n6oh, n6ok, n6or, 
n6pa, n6ri, n6sc, n6sd, n6tn, n6tx, n6ut, n6va, n6vt, n6wa, n6wi, n6wv, n6wy, n6as, n6gu, n6mp, n6vi, 
n7a
n7b_ak_phone, n7b_ak_electronic, 
n7b_al_phone, n7b_al_electronic,	
n7b_ar_phone, n7b_ar_electronic,	
n7b_az_phone, n7b_az_electronic,
n7b_ca_phone, n7b_ca_electronic,	
n7b_co_phone, n7b_co_electronic,	
n7b_ct_phone, n7b_ct_electronic,	
n7b_dc_phone, n7b_dc_electronic,	
n7b_de_phone, n7b_de_electronic,	
n7b_fl_phone, n7b_fl_electronic,	
n7b_ga_phone, n7b_ga_electronic,	
n7b_hi_phone, n7b_hi_electronic,	
n7b_ia_phone, n7b_ia_electronic,	
n7b_id_phone, n7b_id_electronic,	
n7b_il_phone, n7b_il_electronic,	
n7b_in_phone, n7b_in_electronic,	
n7b_ks_phone, n7b_ks_electronic,	
n7b_ky_phone, n7b_ky_electronic,	
n7b_la_phone, n7b_la_electronic,	
n7b_ma_phone, n7b_ma_electronic,	
n7b_md_phone, n7b_md_electronic,	
n7b_me_phone, n7b_me_electronic,	
n7b_mi_phone, n7b_mi_electronic,	
n7b_mn_phone, n7b_mn_electronic,	
n7b_mo_phone, n7b_mo_electronic,	
n7b_ms_phone, n7b_ms_electronic,	
n7b_mt_phone, n7b_mt_electronic,	
n7b_nc_phone, n7b_nc_electronic,	
n7b_nd_phone, n7b_nd_electronic,	
n7b_ne_phone, n7b_ne_electronic,	
n7b_nh_phone, n7b_nh_electronic,	
n7b_nj_phone, n7b_nj_electronic,	
n7b_nm_phone, n7b_nm_electronic,	
n7b_nv_phone, n7b_nv_electronic,	
n7b_ny_phone, n7b_ny_electronic,	
n7b_oh_phone, n7b_oh_electronic,	
n7b_ok_phone, n7b_ok_electronic,	
n7b_or_phone, n7b_or_electronic,	
n7b_pa_phone, n7b_pa_electronic,	
n7b_ri_phone, n7b_ri_electronic,	
**n7b_sd_phone, n7b_sd_electronic,
**n7b_sc_phone, n7b_sc_electronic,	
n7b_tn_phone, n7b_tn_electronic,	
n7b_tx_phone, n7b_tx_electronic,	
n7b_ut_phone, n7b_ut_electronic,	
n7b_va_phone, n7b_va_electronic,	
n7b_vt_phone, n7b_vt_electronic,	
n7b_wa_phone, n7b_wa_electronic,	
n7b_wi_phone, n7b_wi_electronic,	
n7b_wv_phone, n7b_wv_electronic,	
n7b_wy_phone, n7b_wy_electronic,	
n7b_as_phone, n7b_as_electronic,	
n7b_gu_phone, n7b_gu_electronic,	
n7b_mp_phone, n7b_mp_electronic,	
n7b_vi_phone, n7b_vi_electronic,	
n7b_NoLocation_phone, n7b_NoLocation_electronic,
n8a, n8b, 
n9, 
n10a, n10b,
n11, 
n12, 
n13a, n13b, n13c, n13d, 
n13e_camp, n13e_school, n13e_casemanager, n13e_homehealth, n13e_travel, n13e_transport, n13e_educator	
n13e_telehealth, n13e_triage, n13e_stateborder, n13e_other, n13e_text 
n14a, n14b, 
n15, 
n16, 
n17Lpn, n17rn, n17aprn 
*/

/* recode n1 variable into text */
if n1 = 1 then n1 = 'AK';
if n1 = 2 then n1 = 'AL';
if n1 = 3 then n1 = 'AR';
if n1 = 4 then n1 = 'AZ';
if n1 = 5 then n1 = 'CA';
if n1 = 6 then n1 = 'CO';
if n1 = 7 then n1 = 'CT';
if n1 = 8 then n1 = 'DC';
if n1 = 9 then n1 = 'DE';
if n1 = 10 then n1 = 'FL';
if n1 = 11 then n1 = 'GA';
if n1 = 12 then n1 = 'HI';
if n1 = 13 then n1 = 'IA';
if n1 = 14 then n1 = 'ID';
if n1 = 15 then n1 = 'IL';
if n1 = 16 then n1 = 'IN';
if n1 = 17 then n1 = 'KS';
if n1 = 18 then n1 = 'KY';
if n1 = 19 then n1 = 'LA';
if n1 = 20 then n1 = 'MA';
if n1 = 21 then n1 = 'MD';
if n1 = 22 then n1 = 'ME';
if n1 = 23 then n1 = 'MI';
if n1 = 24 then n1 = 'MN';
if n1 = 25 then n1 = 'MO';
if n1 = 26 then n1 = 'MS';
if n1 = 27 then n1 = 'MT';
if n1 = 28 then n1 = 'NC';
if n1 = 29 then n1 = 'ND';
if n1 = 30 then n1 = 'NE';
if n1 = 31 then n1 = 'NH';
if n1 = 32 then n1 = 'NJ';
if n1 = 33 then n1 = 'NM';
if n1 = 34 then n1 = 'NV';
if n1 = 35 then n1 = 'NY';
if n1 = 36 then n1 = 'OH';
if n1 = 37 then n1 = 'OK';
if n1 = 38 then n1 = 'OR';
if n1 = 39 then n1 = 'PA';
if n1 = 40 then n1 = 'RI';
if n1 = 41 then n1 = 'SC';
if n1 = 42 then n1 = 'SD';
if n1 = 43 then n1 = 'TN';
if n1 = 44 then n1 = 'TX';
if n1 = 45 then n1 = 'UT';
if n1 = 46 then n1 = 'VA';
if n1 = 47 then n1 = 'VT';
if n1 = 48 then n1 = 'WA';
if n1 = 49 then n1 = 'WI';
if n1 = 50 then n1 = 'WV';
if n1 = 51 then n1 = 'WY';
if n1 = 52 then n1 = 'AS';
if n1 = 53 then n1 = 'GU';
if n1 = 54 then n1 = 'MP';
if n1 = 55 then n1 = 'VI';


/* grouping variable: compact vs single state */

if n1 = 'AR' then grouping = 'Compact';
if n1 = 'AZ' then grouping = 'Compact';
if n1 = 'CO' then grouping = 'Compact';
if n1 = 'DE' then grouping = 'Compact';
if n1 = 'IA' then grouping = 'Compact';
if n1 = 'ID' then grouping = 'Compact';
if n1 = 'KY' then grouping = 'Compact';
if n1 = 'MD' then grouping = 'Compact';
if n1 = 'ME' then grouping = 'Compact';
if n1 = 'MO' then grouping = 'Compact';
if n1 = 'MS' then grouping = 'Compact';
if n1 = 'NC' then grouping = 'Compact';
if n1 = 'ND' then grouping = 'Compact';
if n1 = 'NE' then grouping = 'Compact';
if n1 = 'NH' then grouping = 'Compact';
if n1 = 'NM' then grouping = 'Compact';
if n1 = 'RI' then grouping = 'Compact';
if n1 = 'SC' then grouping = 'Compact';
if n1 = 'SD' then grouping = 'Compact';
if n1 = 'TN' then grouping = 'Compact';
if n1 = 'TX' then grouping = 'Compact';
if n1 = 'UT' then grouping = 'Compact';
if n1 = 'VA' then grouping = 'Compact';
if n1 = 'WI' then grouping = 'Compact';

if n1 = 'AK' then grouping = 'SingleS';
if n1 = 'AL' then grouping = 'SingleS';
if n1 = 'CA' then grouping = 'SingleS';
if n1 = 'CT' then grouping = 'SingleS';
if n1 = 'DC' then grouping = 'SingleS';
if n1 = 'FL' then grouping = 'SingleS';
if n1 = 'GA' then grouping = 'SingleS';
if n1 = 'HI' then grouping = 'SingleS';
if n1 = 'IL' then grouping = 'SingleS';
if n1 = 'IN' then grouping = 'SingleS';
if n1 = 'KS' then grouping = 'SingleS';
if n1 = 'LA' then grouping = 'SingleS';
if n1 = 'MA' then grouping = 'SingleS';
if n1 = 'MI' then grouping = 'SingleS';
if n1 = 'MN' then grouping = 'SingleS';
if n1 = 'MT' then grouping = 'SingleS';
if n1 = 'NJ' then grouping = 'SingleS';
if n1 = 'NV' then grouping = 'SingleS';
if n1 = 'NY' then grouping = 'SingleS';
if n1 = 'OH' then grouping = 'SingleS';
if n1 = 'OK' then grouping = 'SingleS';
if n1 = 'OR' then grouping = 'SingleS';
if n1 = 'PA' then grouping = 'SingleS';
if n1 = 'VT' then grouping = 'SingleS';
if n1 = 'WA' then grouping = 'SingleS';
if n1 = 'WV' then grouping = 'SingleS';
if n1 = 'WY' then grouping = 'SingleS';
if n1 = 'AS' then grouping = 'SingleS';
if n1 = 'GU' then grouping = 'SingleS';
if n1 = 'MP' then grouping = 'SingleS';
if n1 = 'VI' then grouping = 'SingleS';


/* creating age variable */

age = (2013 - n15);
if age > 100 then age = .;
if age < 18 then age = .;
                                                                                                                                                                

/* creating n3 combined variable */

n3CountMissing = cmiss(n3ak, n3al, n3ar, n3az, n3ca, n3co, n3ct, n3dc, n3de, n3fl, n3ga, n3hi, n3ia, n3id, n3il,
n3in, n3ks, n3ky, n3la, n3ma, n3md, n3me, n3mi, n3mn, n3mo, n3ms, n3mt, n3nc, n3nd, n3ne, n3nh, n3nj, n3nm, 
n3nv, n3ny, n3oh, n3ok, n3or, n3pa, n3ri, n3sc, n3sd, n3tn, n3tx, n3ut, n3va, n3vt, n3wa, n3wi, n3wv, n3wy,
n3as, n3gu, n3mp, n3vi);

n3CountNumStates = (55 - n3CountMissing);

	/* or use this */
n3_total = (n3ak + n3al + n3ar + n3az + n3ca + n3co + n3ct + n3dc + n3de + n3fl + n3ga + n3hi + n3ia + n3id + n3il +
n3in + n3ks + n3ky + n3la + n3ma + n3md + n3me + n3mi + n3mn + n3mo + n3ms + n3mt + n3nc + n3nd + n3ne + n3nh + n3nj + n3nm + 
n3nv + n3ny + n3oh + n3ok + n3or + n3pa + n3ri + n3sc + n3sd + n3tn + n3tx + n3ut + n3va + n3vt + n3wa + n3wi + n3wv + n3wy +
n3as + n3gu + n3mp + n3vi);


/* creating n1 n2 combined variable -- ****use SUM because of missing values**** */

n2_forcalc = n2;
if n2_forcalc = 2 then n2_forcalc = 0;
NumberLicensesHeld = sum(n3_total, n2_forcalc);

/* remove out of range amount spent on licensure fees */
if n10a >= 20000 then n10a = .;

/* creating n6 variable */

n6CountMissing = cmiss(n6ak, n6al, n6ar, n6az, n6ca, n6co, n6ct, n6dc, n6de, n6fl, n6ga, n6hi, n6ia, n6id, n6il, n6in, n6ks, n6ky, n6la, 
n6ma, n6md, n6me, n6mi, n6mn, n6mo, n6ms, n6mt, n6nc, n6nd, n6ne, n6nh, n6nj, n6nm, n6nv, n6ny, n6oh, n6ok, n6or, 
n6pa, n6ri, n6sc, n6sd, n6tn, n6tx, n6ut, n6va, n6vt, n6wa, n6wi, n6wv, n6wy, n6as, n6gu, n6mp, n6vi);

n6CountNumStates = (55 - n6CountMissing);

	/* or use this */
n6_total = (n6ak + n6al + n6ar + n6az + n6ca + n6co + n6ct + n6dc + n6de + n6fl + n6ga + n6hi + n6ia + n6id + n6il + n6in + n6ks + n6ky + n6la + 
n6ma + n6md + n6me + n6mi + n6mn + n6mo + n6ms + n6mt + n6nc + n6nd + n6ne + n6nh + n6nj + n6nm + n6nv + n6ny + n6oh + n6ok + n6or + 
n6pa + n6ri + n6sc + n6sd + n6tn + n6tx + n6ut + n6va + n6vt + n6wa + n6wi + n6wv + n6wy + n6as + n6gu + n6mp + n6vi);


/* combining phone and electronic communication into 1 variable)
use *sum* (instead of "+" in case of missing values */

n7b_ak_total = sum(n7b_ak_phone, n7b_ak_electronic);
n7b_al_total = sum(n7b_al_phone, n7b_al_electronic);	
n7b_ar_total = sum(n7b_ar_phone, n7b_ar_electronic);
n7b_az_total = sum(n7b_az_phone, n7b_az_electronic);
n7b_ca_total = sum(n7b_ca_phone, n7b_ca_electronic);
n7b_co_total = sum(n7b_co_phone, n7b_co_electronic);	
n7b_ct_total = sum(n7b_ct_phone, n7b_ct_electronic);	
n7b_dc_total = sum(n7b_dc_phone, n7b_dc_electronic);	
n7b_de_total = sum(n7b_de_phone, n7b_de_electronic);	
n7b_fl_total = sum(n7b_fl_phone, n7b_fl_electronic);	
n7b_ga_total = sum(n7b_ga_phone, n7b_ga_electronic);
n7b_hi_total = sum(n7b_hi_phone, n7b_hi_electronic);	
n7b_ia_total = sum(n7b_ia_phone, n7b_ia_electronic);
n7b_id_total = sum(n7b_id_phone, n7b_id_electronic);
n7b_il_total = sum(n7b_il_phone, n7b_il_electronic);	
n7b_in_total = sum(n7b_in_phone, n7b_in_electronic);	
n7b_ks_total = sum(n7b_ks_phone, n7b_ks_electronic);	
n7b_ky_total = sum(n7b_ky_phone, n7b_ky_electronic);
n7b_la_total = sum(n7b_la_phone, n7b_la_electronic);	
n7b_ma_total = sum(n7b_ma_phone, n7b_ma_electronic);
n7b_md_total = sum(n7b_md_phone, n7b_md_electronic);
n7b_me_total = sum(n7b_me_phone, n7b_me_electronic);
n7b_mi_total = sum(n7b_mi_phone, n7b_mi_electronic);	
n7b_mn_total = sum(n7b_mn_phone, n7b_mn_electronic);
n7b_mo_total = sum(n7b_mo_phone, n7b_mo_electronic);	
n7b_ms_total = sum(n7b_ms_phone, n7b_ms_electronic);	
n7b_mt_total = sum(n7b_mt_phone, n7b_mt_electronic);	
n7b_nc_total = sum(n7b_nc_phone, n7b_nc_electronic);	
n7b_nd_total = sum(n7b_nd_phone, n7b_nd_electronic);	
n7b_ne_total = sum(n7b_ne_phone, n7b_ne_electronic);	
n7b_nh_total = sum(n7b_nh_phone, n7b_nh_electronic);
n7b_nj_total = sum(n7b_nj_phone, n7b_nj_electronic);
n7b_nm_total = sum(n7b_nm_phone, n7b_nm_electronic);
n7b_nv_total = sum(n7b_nv_phone, n7b_nv_electronic);	
n7b_ny_total = sum(n7b_ny_phone, n7b_ny_electronic);	
n7b_oh_total = sum(n7b_oh_phone, n7b_oh_electronic);	
n7b_ok_total = sum(n7b_ok_phone, n7b_ok_electronic);
n7b_or_total = sum(n7b_or_phone, n7b_or_electronic);	
n7b_pa_total = sum(n7b_pa_phone, n7b_pa_electronic);	
n7b_ri_total = sum(n7b_ri_phone, n7b_ri_electronic);
n7b_sc_total = sum(n7b_sc_phone, n7b_sc_electronic);	
n7b_sd_total = sum(n7b_sd_phone, n7b_sd_electronic);	
n7b_tn_total = sum(n7b_tn_phone, n7b_tn_electronic);
n7b_tx_total = sum(n7b_tx_phone, n7b_tx_electronic);
n7b_ut_total = sum(n7b_ut_phone, n7b_ut_electronic);	
n7b_va_total = sum(n7b_va_phone, n7b_va_electronic);	
n7b_vt_total = sum(n7b_vt_phone, n7b_vt_electronic);	
n7b_wa_total = sum(n7b_wa_phone, n7b_wa_electronic);	
n7b_wi_total = sum(n7b_wi_phone, n7b_wi_electronic);	
n7b_wv_total = sum(n7b_wv_phone, n7b_wv_electronic);
n7b_wy_total = sum(n7b_wy_phone, n7b_wy_electronic);	
n7b_as_total = sum(n7b_as_phone, n7b_as_electronic);	
n7b_gu_total = sum(n7b_gu_phone, n7b_gu_electronic);	
n7b_mp_total = sum(n7b_mp_phone, n7b_mp_electronic);	
n7b_vi_total = sum(n7b_vi_phone, n7b_vi_electronic);	
n7b_NoLocation_total = sum(n7b_NoLocation_phone, n7b_NoLocation_electronic);

/* Create n7b total variable */ 

n7b_total = sum(n7b_ak_total, n7b_al_total, n7b_ar_total, n7b_az_total, n7b_ca_total, n7b_co_total, n7b_ct_total,	
n7b_dc_total, n7b_de_total, n7b_fl_total, n7b_ga_total, n7b_hi_total, n7b_ia_total, n7b_id_total, n7b_il_total,	
n7b_in_total, n7b_ks_total, n7b_ky_total, n7b_la_total, n7b_ma_total, n7b_md_total, n7b_me_total, n7b_mi_total,
n7b_mn_total, n7b_mo_total, n7b_ms_total, n7b_mt_total, n7b_nc_total, n7b_nd_total, n7b_ne_total, n7b_nh_total,
n7b_nj_total, n7b_nm_total, n7b_nv_total, n7b_ny_total, n7b_oh_total, n7b_ok_total, n7b_or_total, n7b_pa_total,
n7b_ri_total, n7b_sc_total, n7b_sd_total, n7b_tn_total, n7b_tx_total, n7b_ut_total, n7b_va_total, n7b_vt_total,	
n7b_wa_total, n7b_wi_total, n7b_wv_total, n7b_wy_total, n7b_as_total, n7b_gu_total, n7b_mp_total, n7b_vi_total,	
n7b_NoLocation_total);



/* Main analyses code */


PROC SORT
	DATA=WORK.ANALYSES(KEEP=age grouping)
	OUT=WORK.SORTTempTable;
	BY grouping;
RUN;


Title 'age';
PROC MEANS DATA=WORK.SORTTempTable FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR age;
		BY grouping;
RUN;



/* 16What is your gender? Male Female
table: gender */

proc format;
	value n16_
    1 = 'Male'
    2 = 'Female';
run;

PROC SQL;
	CREATE VIEW WORK.SORT1 AS
	SELECT n16, grouping
	FROM WORK.analyses;
QUIT;

Title 'gender';
PROC FREQ DATA = WORK.SORT1
	ORDER=INTERNAL;
	TABLES n16 * grouping / SCORES=TABLE;
	FORMAT n16 n16_.;
RUN;



/* 17What type of license do you currently hold? (select all that apply) LPN/VN RN APRN
table: type of license held */

PROC SQL;
	CREATE VIEW WORK.SORT2 AS
	SELECT n17Lpn, n17rn, n17aprin, grouping
	FROM WORK.analyses;
QUIT;

Title 'type of license held';
PROC FREQ DATA = WORK.SORT2
	ORDER=INTERNAL;
	TABLES n17Lpn * grouping / SCORES=TABLE;
	TABLES n17rn * grouping / SCORES=TABLE;
	TABLES n17aprin * grouping / SCORES=TABLE;
RUN;


/* Number of active nursing licenses (primary state + other states)

1.Which state/jurisdiction is your primary residence? (select one)
 
AK AL AR AZ CA CO CT DC DE FL GA HI IA ID IL IN KS KY LA MA MD
ME MI MN MO MS MT NC ND NE NH NJ NM NV NY OH OK OR PA RI SC SD
TN TX UT VA VT WA WI WV WY AS GU MP VI 

2.Do you hold an active nursing license in the state/jurisdiction you selected above?
Yes
No

3.What other state/jurisdiction(s) do you hold an active nursing license? (select all that apply)
AK AL AR AZ CA CO CT DC DE FL GA HI IA ID IL IN KS KY LA MA MD
ME MI MN MO MS MT NC ND NE NH NJ NM NV NY OH OK OR PA RI SC SD
TN TX UT VA VT WA WI WV WY AS GU MP VI None

table: average number of nursing licenses held */

	/* look at n2 */

proc format;
	value n2_
    1 = 'Yes'
    2 = 'No';
run;

PROC SQL;
	CREATE VIEW WORK.SORT3 AS
	SELECT n2, grouping
	FROM WORK.analyses;
QUIT;

Title 'have license in primary state of residence?';
PROC FREQ DATA = WORK.SORT3
	ORDER=INTERNAL;
	TABLES n2 * grouping / SCORES=TABLE;
	FORMAT n2 n2_.;
RUN;


	/* creating n1 n2 combined variable 

if n2 = "no" then n2 = .;
NumberLicensesHeld = (n3CountNumStates + n2); */

PROC SORT
	DATA=WORK.ANALYSES(KEEP=NumberLicensesHeld grouping)
	OUT=WORK.SORTTempTable1;
	BY grouping;
RUN;


Title 'average number of nursing licenses held';
PROC MEANS DATA=WORK.SORTTempTable1 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR NumberLicensesHeld;
		BY grouping;
RUN;


/* 4(a) In the past 24 months, have you been employed in a position that requires a nursing license? Yes No (skip to 8)
table: percentage of licensees employed in a position that requires a nursing license in the past 24 months */

proc format;
	value n4a
    1 = 'Yes'
    2 = 'No';
run;

PROC SQL;
	CREATE VIEW WORK.SORT4 AS
	SELECT n4a, grouping
	FROM WORK.analyses;
QUIT;

Title 'percentage of licensees employed in a position that requires a nursing license in the past 24 months';
PROC FREQ DATA = WORK.SORT4
	ORDER=INTERNAL;
	TABLES n4a * grouping / SCORES=TABLE;
	FORMAT n4a n4a.;
RUN;


/* 4(c) Which of the following best describes the location of your primary employer: Urban-type area Rural-type area
Table: Of Nurses Employed in the Past 24 Months, Location of Primary Employer */

proc format;
	value n4c
    1 = 'Urban'
    2 = 'Rural';
run;

PROC SQL;
	CREATE VIEW WORK.SORT5 AS
	SELECT n4c, grouping, n4a
	FROM WORK.analyses
	Where n4a NOT = 2;
QUIT;

Title 'Of Nurses employed in the past 24 months, location of primary employer';
PROC FREQ DATA = WORK.SORT5
	ORDER=INTERNAL;
	TABLES n4c * grouping / SCORES=TABLE;
	FORMAT n4c n4c.;
RUN;


/* 4(d) Are you a member of a collective bargaining unit? Yes No
Table: Of Nurses Employed in the Past 24 Months, Membership in a Collective Bargaining Unit */ 

proc format;
	value n4d
    1 = 'Yes'
    2 = 'No';
run;

PROC SQL;
	CREATE VIEW WORK.SORT6 AS
	SELECT n4d, grouping, n4a
	FROM WORK.analyses
	Where n4a NOT = 2;
QUIT;

Title 'Of Nurses employed in the past 24 months, membership in a collective bargaining unit';
PROC FREQ DATA = WORK.SORT6
	ORDER=INTERNAL;
	TABLES n4d * grouping / SCORES=TABLE;
	FORMAT n4d n4d.;
RUN;


/* 5What percentage of your time over the past 24 months would you estimate you have provided nursing services or communicated 
with a patient or client located outside of your primary state/jurisdiction residence?
Never 1 – 25% 26 – 50% 51 – 75% 76 – 100%
Table: Of Nurses Employed in the Past 24 Months, Percentage of Time Providing Nursing Services or Communicating with a Patient 
or Client Outside of Primary State of Residence */

proc format;
	value n5_
    1 = 'Never'
    2 = '1-25%'
	3 = '26-50%'
	4 = '51-75%'
	5 = '76-100%';
run;

PROC SQL;
	CREATE VIEW WORK.SORT7 AS
	SELECT n5, grouping, n4a
	FROM WORK.analyses
	Where n4a NOT = 2;
QUIT;

Title 'Of Nurses employed in the past 24 months, percentage of time providing nursing services or communicating with a patient or client outside of primary state of residence';
PROC FREQ DATA = WORK.SORT7
	ORDER=INTERNAL;
	TABLES n5 * grouping / SCORES=TABLE;
	FORMAT n5 n5_.;
RUN;
	

/* 6Please indicate the state/jurisdiction(s) you were located in when providing nursing care and/or utilizing nursing knowledge 
in the past 24 months: (select all that apply)
AK AL AR AZ CA CO CT DC DE FL GA HI IA ID IL IN KS KY LA MA MD
ME MI MN MO MS MT NC ND NE NH NJ NM NV NY OH OK OR PA RI SC SD
TN TX UT VA VT WA WI WV WY AS GU MP VI None
Table: Of Nurses Employed in the Past 24 Months, the Average Number of States Nurses were Located in when Providing Nursing Care 
and/or Utilizing Nursing Knowledge in the Past 24 Months */

PROC SQL;
	CREATE VIEW WORK.SORT8 AS
	SELECT n6_total, grouping, n4a
	FROM WORK.analyses
	Where n4a NOT = 2;
QUIT;

PROC SORT
	DATA=WORK.SORT8(KEEP=n6_total grouping n4a)
	OUT=WORK.SORTTempTable2;
	BY grouping;
RUN;

Title 'Of nurses employed in the past 24 months, the average number of states nurses were located';
PROC MEANS DATA=WORK.SORTTempTable2 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR n6_total;
		BY grouping;
RUN;


/* 7(a) In the past 24 months, have you provided nursing services or communicated with a patient or client that was located in a 
state/jurisdiction different from where you were located? Yes No (skip to 8)
Table: Of Nurses Employed in the Past 24 Months, Had the Nurse Provided Nursing Services or Communicated with a Patient or Client 
that was Located in a State/Jurisdiction Different from where the Nurse was Located (i.e., telehealth)? */

proc format;
	value n7a
    1 = 'Yes'
    2 = 'No';
run;

PROC SQL;
	CREATE VIEW WORK.SORT9 AS
	SELECT n7a, grouping, n4a
	FROM WORK.analyses
	Where n4a NOT = 2;
QUIT;

Title 'of nurses employed in the past 24 months, had the nurse provided nursing services or communicated with a patient or client that was located in a state/jurisdiction different from where the nurse was located';
PROC FREQ DATA = WORK.SORT9
	ORDER=INTERNAL;
	TABLES n7a * grouping / SCORES=TABLE;
	FORMAT n7a n7a.;
RUN;

/* Exploratory 7(a) by number of licences held	*/


proc format;
	value n7a
    1 = 'Yes'
    2 = 'No';
run;

PROC SQL;
	CREATE VIEW WORK.SORT99 AS
	SELECT n7a, grouping, n4a, NumberLicensesHeld
	FROM WORK.analyses
	Where n4a NOT = 2;
QUIT;

Title 'of nurses employed in the past 24 months, had the nurse provided nursing services or communicated with a patient or client that was located in a state/jurisdiction different from where the nurse was located by number of licenses held';
PROC FREQ DATA = WORK.SORT99
	ORDER=INTERNAL;
	TABLES n7a * grouping * NumberLicensesHeld / SCORES=TABLE;
	FORMAT n7a n7a.;
RUN;


/* 7(b) If yes, please indicate the state/jurisdiction(s) where the patients or clients were located, and the mode of communication. (select all that apply)
By phone, by electronically:
AK AL AR AZ CA CO CT DC DE FL GA HI IA ID IL IN KS KY LA MA MD
ME MI MN MO MS MT NC ND NE NH NJ NM NV NY OH OK OR PA RI SC SD
TN TX UT VA VT WA WI WV WY AS GU MP VI None
Table: Of Nurses Employed in the Past 24 Months that Had Provided Nursing Services or Communicated with a Patient or Client that was Located in a 
State/Jurisdiction Different from where they were  Located (i.e., Telehealth), the Average Number of States Practiced in Via Telehealth */

PROC SQL;
	CREATE VIEW WORK.SORT10 AS
	SELECT n7b_total, grouping, n4a
	FROM WORK.analyses
	Where n4a NOT = 2;
QUIT;

PROC SORT
	DATA=WORK.SORT10(KEEP=n7b_total grouping n4a)
	OUT=WORK.SORTTempTable3;
	BY grouping;
RUN;

Title 'Of Nurses Employed in the Past 24 Months that Had Provided Nursing Services or Communicated with a Patient or Client that was Located in a 
State/Jurisdiction Different from where they were  Located (i.e., Telehealth), the Average Number of States Practiced in Via Telehealth';
PROC MEANS DATA=WORK.SORTTempTable3 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR n7b_total;
		BY grouping;
RUN;


/*	8(a) Has anything ever prevented you from applying for a nursing license in any state/jurisdiction? Yes No
Table: Nurses that Indicated Something had Prevented them from Applying for a Nursing License in any State/Jurisdiction */

proc format;
	value n8a
    1 = 'Yes'
    2 = 'No';
run;

PROC SQL;
	CREATE VIEW WORK.SORT11 AS
	SELECT n8a, grouping
	FROM WORK.analyses;
QUIT;

Title 'nurses that indicated something had prevented them from applying for a nursing license in any state/jurisdiction';
PROC FREQ DATA = WORK.SORT11
	ORDER=INTERNAL;
	TABLES n8a * grouping / SCORES=TABLE;
	FORMAT n8a n8a.;
RUN;


/*8(b) Please explain: 
Table:Nurses that Indicated Something had Prevented them from Applying for a Nursing License in any State/Jurisdiction: COMMENTS */
	
PROC SQL;
	CREATE VIEW WORK.SORT12 AS
	SELECT n8b, grouping
	FROM WORK.analyses;
QUIT;

Title 'nurses that indicated something had prevented them from applying for a nursing license in any state/jurisdiction: COMMENTS';
PROC FREQ DATA = WORK.SORT12
	ORDER=INTERNAL;
	TABLES n8b * grouping / SCORES=TABLE;
RUN;


/* 9Who pays your licensure fees? Self Employer Both 
Table: Who Pays Licensure Fees */

proc format;
	value n9_
    1 = 'Self'
    2 = 'Employer'
	3 = 'Both';
run;
	
PROC SQL;
	CREATE VIEW WORK.SORT13 AS
	SELECT n9, grouping
	FROM WORK.analyses;
QUIT;

Title 'who pays licensure fees';
PROC FREQ DATA = WORK.SORT13
	ORDER=INTERNAL;
	TABLES n9 * grouping / SCORES=TABLE;
	FORMAT n9 n9_.;
RUN;


/* 10How much have you or your employer spent on your licensure fees in the past 24 months? $ _____________		Don’t know
Table: Average Amount Spent on Licensure Fees in the Past 24 Months */

PROC SQL;
	CREATE VIEW WORK.SORT14 AS
	SELECT n10a, n10b, grouping
	FROM WORK.analyses;
QUIT;


PROC SORT
	DATA=WORK.SORT14(KEEP=n10a n10b grouping)
	OUT=WORK.SORTTempTable33;
	BY grouping;
RUN;

Title 'average amount spent on licensure fees in the past 24 months';
PROC MEANS DATA=WORK.SORTTempTable33 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR n10a;
		BY grouping;
RUN;


Title 'average amount spent on licensure fees in the past 24 months - dont know';
PROC FREQ DATA = WORK.SORT14
	ORDER=INTERNAL;
	TABLES n10b * grouping / SCORES=TABLE;
RUN;



/* 11The Nurse Licensure Compact allows a nurse to have one multistate license in the nurse’s primary state/jurisdiction of residence 
to practice in other Compact states/jurisdictions. Prior to now, were you aware of the Nurse Licensure Compact? 
Yes, fully aware, Somewhat aware, Not at all aware(skip to 15)
Table: Nurse Awareness of the Nurse Licensure Compact */

proc format;
	value n11_
    1 = 'Yes, fully aware'
    2 = 'Somewhat aware'
	3 = 'Not at all aware';
run;

PROC SQL;
	CREATE VIEW WORK.SORT15 AS
	SELECT n11, grouping
	FROM WORK.analyses;
QUIT;

Title 'nurse awareness of the nurse licensure compact';
PROC FREQ DATA = WORK.SORT15
	ORDER=INTERNAL;
	TABLES n11 * grouping / SCORES=TABLE;
	FORMAT n11 n11_.;
RUN;
		

/* 12Does the state/jurisdiction of your primary residence belong to the Nurse Licensure Compact? Yes, No(skip to 14), Don’t know
Table: Of Nurses Aware of the NLC, Percent Indicating their State/Jurisdiction of Primary Residence Belongs to the Nurse Licensure Compact */

proc format;
	value n12_
    1 = 'Yes'
    2 = 'No'
	3 = "Don't know";
run;

PROC SQL;
	CREATE VIEW WORK.SORT16 AS
	SELECT n12, grouping, n11
	FROM WORK.analyses
	Where n11 NOT = 3;
QUIT;

Title 'nurse awareness of the nurse licensure compact';
PROC FREQ DATA = WORK.SORT16
	ORDER=INTERNAL;
	TABLES n12 * grouping / SCORES=TABLE;
	FORMAT n12 n12_.;
RUN;



/* check 12 against 1
Table: Of Nurses Aware of the NLC, Percent Correctly Indicating their State/Jurisdiction of Primary Residence Belongs to the Nurse Licensure Compact */

	/* correctly identified primary residence is compact states */

proc format;
	value n12_
    1 = 'Yes'
    2 = 'No'
	3 = "Don't know";
run;

PROC SQL;
	CREATE VIEW WORK.SORT17 AS
	SELECT n12, n1, grouping, n11
	FROM WORK.analyses
	Where n11 NOT = 3 AND grouping = 'Compact'; 
QUIT;

Title 'correctly identified primary residence is compact states';
PROC FREQ DATA = WORK.SORT17
	ORDER=INTERNAL;
	TABLES n12 * grouping / SCORES=TABLE;
	FORMAT n12 n12_.;
RUN;


	/* correctly identified primary residence is not compact states */

PROC SQL;
	CREATE VIEW WORK.SORT18 AS
	SELECT n12, n1, grouping, n11
	FROM WORK.analyses
	Where n11 NOT = 3 AND grouping = 'SingleS';  
QUIT;


Title 'correctly identified primary residence is not compact states';
PROC FREQ DATA = WORK.SORT18
	ORDER=INTERNAL;
	TABLES n12 * grouping / SCORES=TABLE;
	FORMAT n12 n12.;
RUN;


/* 13(a) Do you hold an active compact license? Yes, No(skip to 14), Don’t know(skip to 14)
Table: Of Nurses Aware of the NLC & Primary State of Residence is a Member of the NLC, Percent Indicating they Hold an Active Compact License */

proc format;
	value n13a
    1 = 'Yes'
    2 = 'No'
	3 = "Don't know";
run;

PROC SQL;
	CREATE VIEW WORK.SORT19 AS
	SELECT n13a, grouping, n11, n12
	FROM WORK.analyses
	Where n11 NOT = 3 AND n12 NOT = 2; 
QUIT;

Title 'of nurses aware of the nlc & primary state of residence is a member of the NLC, percent indicating they hold an active compact license';
PROC FREQ DATA = WORK.SORT19
	ORDER=INTERNAL;
	TABLES n13a * grouping / SCORES=TABLE;
	FORMAT n13a n13a.;
RUN;


/* 13(b) Has the Nurse Licensure Compact been beneficial for you? Yes, Somewhat, No, No opinion
Table: Of Nurses Aware of the NLC& Primary State of Residence is a Member of the NLC & Hold a Compact License, Percent Indicating the Nurse
Licensure Compact has been Beneficial */

proc format;
	value n13b
    1 = 'Yes'
    2 = 'Somewhat'
	3 = 'No'
	4 = 'No opinion';
run;

PROC SQL;
	CREATE VIEW WORK.SORT20 AS
	SELECT n13a, n13b, grouping, n11, n12
	FROM WORK.analyses
	Where n11 NOT = 3 AND n12 NOT = 2 AND n13a = 1;
QUIT;

Title 'of nurses aware of the NLC & primary state of residence is a member of the NLC & hold a compact license, percent indicating the nurse licensure compact has been beneficial';
PROC FREQ DATA = WORK.SORT20
	ORDER=INTERNAL;
	TABLES n13b * grouping / SCORES=TABLE;
	FORMAT n13b n13b.;
RUN;


/* 	13(c) Please explain: 
Table: Of Nurses Aware of the NLC& Primary State of Residence is a Member of the NLC & Hold a Compact License, Percent Indicating the Nurse 
Licensure Compact has been Beneficial: COMMENTS */

PROC SQL;
	CREATE VIEW WORK.SORT21 AS
	SELECT n13a, n13b, n13c, grouping, n11, n12
	FROM WORK.analyses
	Where n11 NOT = 3 AND n12 NOT = 2 AND n13a = 1 AND grouping = 'Compact';
QUIT;

Title 'of nurses aware of the NLC & primary state of residence is a member of the NLC & hold a compact license, percent indicating the nurse licensure compact has been beneficial';
PROC FREQ DATA = WORK.SORT21
	ORDER=INTERNAL;
	TABLES n13c / SCORES=TABLE;
RUN;


/* 13(d) Have you practiced in another state/jurisdiction under your Compact license in the past 24 months?  Yes, No
Table: Of Nurses Aware of the NLC& Primary State of Residence is a Member of the NLC & Hold a Compact License, Percent that Practiced 
in Another State/Jurisdiction under their Compact License */

proc format;
	value n13d
    1 = 'Yes'
    2 = 'No';
run;

PROC SQL;
	CREATE VIEW WORK.SORT22 AS
	SELECT n13a, n13b, n13c, n13d, grouping, n11, n12
	FROM WORK.analyses
	Where n11 NOT = 3 AND n12 NOT = 2 AND n13a = 1;
QUIT;

Title 'of nurses aware of the NLC & primary state of residence is a member of the NLC & hold a Compact license, percent that practiced in another sate/jurisidction under their compact license';
PROC FREQ DATA = WORK.SORT22
	ORDER=INTERNAL;
	TABLES n13d * grouping / SCORES=TABLE;
	FORMAT n13d n13d.;
RUN;


/* 13(e) If yes, please indicate the type of position you were employed in. (select all that apply) 
Camp nurse, School nurse, Case manager by phone or electronically, Home health/hospice, Nurse educator, Transport nurse across state borders,
Travel nurse, Telehealth, Triage by phone across state borders, Work for employer/facility across state border, Other, please specify 
Table: Of Nurses Aware of the NLC & Primary State of Residence is a Member of the NLC & Hold a Compact License, & Practiced in Another 
State/Jurisdiction under their Compact License, the Type of Position Held */


PROC SQL;
	CREATE VIEW WORK.SORT23 AS
	SELECT n13e_camp, n13e_school, n13e_casemanager, n13e_homehealth, n13e_travel, n13e_transport, 
	n13e_educator, n13e_telehealth, n13e_triage, n13e_stateborder, n13e_other, n13e_text, grouping, n11, n12, 
	n13a, n13d
	FROM WORK.analyses
	Where n11 NOT = 3 AND n12 NOT = 2 AND n13a = 1 AND grouping = 'Compact' AND n13d = 1;
QUIT;

Title 'Of Nurses Aware of the NLC & Primary State of Residence is a Member of the NLC & Hold a Compact License, & Practiced in Another 
State/Jurisdiction under their Compact License, the Type of Position Held';
PROC FREQ DATA = WORK.SORT23
	ORDER=INTERNAL;
	TABLES n13e_camp / SCORES=TABLE;
	TABLES n13e_school / SCORES=TABLE;
	TABLES n13e_casemanager / SCORES=TABLE;
	TABLES n13e_homehealth / SCORES=TABLE;
	TABLES n13e_travel / SCORES=TABLE;
	TABLES n13e_transport / SCORES=TABLE;
	TABLES n13e_educator / SCORES=TABLE;
	TABLES n13e_telehealth / SCORES=TABLE;
	TABLES n13e_triage / SCORES=TABLE;
	TABLES n13e_stateborder / SCORES=TABLE;
	TABLES n13e_other / SCORES=TABLE;
	TABLES n13e_text / SCORES=TABLE;
RUN;




/* 14If the state/jurisdiction of your primary residence does not belong to the Nurse Licensure Compact, please answer this next question.
What is your opinion of your primary state/jurisdiction residence joining the Nurse Licensure Compact?  (filter for correctness)
In favor, Neutral, Opposed, No opinion(skip to 15), Don’t know(skip to 15, Primary state/residence belongs to the Nurse Licensure Compact(skip to 15)
Table: Of Nurses Aware of the NLC & Primary State/Jurisdiction Residence is Not a Member of the NLC, Opinion of their Primary State/Jurisdiction 
Residence Joining the NLC */

proc format;
	value n14a
    1 = 'In favor'
    2 = 'Neutral'
	3 = 'Opposed'
	4 = 'No opinion'
	5 = "Don't know"
	6 = "Primary state/residence belongs to the NLC";
run; 

PROC SQL;
	CREATE VIEW WORK.SORT24 AS
	SELECT n14a, grouping, n11
	FROM WORK.analyses
	Where n11 NOT = 3; 
QUIT;

Title 'Of nurses aware of the NLC & primary state/jurisdiction residence is not a member of the NLC, opinion of their primary state/jurisdiction residence joining the NLC';
PROC FREQ DATA = WORK.SORT24
	ORDER=INTERNAL;
	TABLES n14a * grouping / SCORES=TABLE;
	FORMAT n14a n14a.;
RUN;


/* 14(b) Please explain: 
Table: Of Nurses Aware of the NLC & Primary State/Jurisdiction Residence is Not a Member of the NLC, Opinion of their Primary 
State/Jurisdiction Residence Joining the NLC: COMMENTS */

PROC SQL;
	CREATE VIEW WORK.SORT25 AS
	SELECT n14b, grouping, n11
	FROM WORK.analyses
	Where n11 NOT = 3; 
QUIT;


Title 'Of nurses aware of the NLC & primary state/jurisdiction residence is not a member of the NLC, opinion of their primary state/jurisdiction residence joining the NLC';
PROC FREQ DATA = WORK.SORT25
	ORDER=INTERNAL;
	TABLES n14b * grouping / SCORES=TABLE;
RUN;


/* EXPLORATORY QUESTION
/* 4(d) Are you a member of a collective bargaining unit? Yes No
Table: Of Nurses Employed in the Past 24 Months, Membership in a Collective Bargaining Unit */ 
/* 14If the state/jurisdiction of your primary residence does not belong to the Nurse Licensure Compact, please answer this next question.
What is your opinion of your primary state/jurisdiction residence joining the Nurse Licensure Compact?  (filter for correctness)
In favor, Neutral, Opposed, No opinion(skip to 15), Don’t know(skip to 15, Primary state/residence belongs to the Nurse Licensure Compact(skip to 15)
Table: Of Nurses Aware of the NLC & Primary State/Jurisdiction Residence is Not a Member of the NLC, Opinion of their Primary State/Jurisdiction 
Residence Joining the NLC */

proc format;
	value n4d
    1 = 'Yes'
    2 = 'No';
run;

proc format;
	value n14a
    1 = 'In favor'
    2 = 'Neutral'
	3 = 'Opposed'
	4 = 'No opinion'
	5 = "Don't know"
	6 = "Primary state/residence belongs to the NLC";
run; 

PROC SQL;
	CREATE VIEW WORK.SORT106 AS
	SELECT n4d, grouping, n4a, n11, n14a
	FROM WORK.analyses
	Where n4a NOT = 2 AND n11 NOT = 3;
QUIT;

Title 'Of Nurses employed in the past 24 months, membership in a collective bargaining unit, favor or oppose NLC';
PROC FREQ DATA = WORK.SORT106
	ORDER=INTERNAL;
	TABLES n4d * n14a * grouping / SCORES=TABLE;
	FORMAT n4d n4d. n14a n14a.;
RUN;




GOPTIONS NOACCESSIBLE;
%LET _CLIENTTASKLABEL=;
%LET _CLIENTPROJECTPATH=;
%LET _CLIENTPROJECTNAME=;
%LET _SASPROGRAMFILE=;

;*';*";*/;quit;run;
ODS _ALL_ CLOSE;
