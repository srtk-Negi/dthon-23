SELECT enrollment.lea_state, enrollment.leaid, enrollment.lea_name, enrollment.sch_name, status.title_i_status,
       int8_sum(tot_enr_f, tot_enr_m) as enrolled_students,
       int8_sum(sch_enr_hi_m, sch_enr_hi_f) as enrolled_hispanics,
       ROUND((int8_sum(sch_enr_hi_m, sch_enr_hi_f) / int8_sum(tot_enr_f, tot_enr_m)), 6) as percentage_hispanic,
       int8_sum(sch_enr_am_f, sch_enr_am_m) as enrolled_alaska_indian,
       ROUND((int8_sum(sch_enr_am_m, sch_enr_am_f) / int8_sum(tot_enr_f, tot_enr_m)), 6) as percentage_al_in,
       int8_sum(sch_enr_bl_f, sch_enr_bl_m) as enrolled_black,
       ROUND((int8_sum(sch_enr_bl_m, sch_enr_bl_f) / int8_sum(tot_enr_f, tot_enr_m)), 6) as percentage_enrolled_black,
       int8_sum(sch_enr_wh_f, sch_enr_wh_m) as enrolled_white,
       ROUND((int8_sum(sch_enr_wh_m, sch_enr_wh_f) / int8_sum(tot_enr_f, tot_enr_m)), 6) as percentage_enrolled_white,
       int8_sum(sch_enr_as_f, sch_enr_as_m) as enrolled_asian,
       ROUND((int8_sum(sch_enr_wh_m, sch_enr_wh_f) / int8_sum(tot_enr_f, tot_enr_m)), 6) as percentage_enrolled_asian,
       int8_sum(sch_enr_hp_f, sch_enr_hp_m) as enrolled_pacific,
       ROUND((int8_sum(sch_enr_hp_m, sch_enr_hp_f) / int8_sum(tot_enr_f, tot_enr_m)), 6) as percentage_pacific,
       int8_sum(sch_enr_tr_f, sch_enr_tr_m) as enrolled_two_races,
       ROUND((int8_sum(sch_enr_tr_m, sch_enr_tr_f) / int8_sum(tot_enr_f, tot_enr_m)), 6) as percentage_two_races
from "Enrollment" as enrollment
         JOIN title_i_status as status ON combokey = status.ncessch
where int8_sum(tot_enr_f, tot_enr_m) > 0
order by enrolled_students desc;




select sch_name, int8_sum(tot_psenr_f, tot_psenr_m), int8_sum(tot_enr_m, tot_enr_f) from "Enrollment";

SELECT enrollment.leaid, enrollment.lea_name, sum(tot_enr_f + tot_enr_m) as total_students, count(leaid), status.title_i_status
FROM "Enrollment" as enrollment JOIN title_i_status as status on combokey = status.ncessch
group by enrollment.leaid, enrollment.lea_name, status.title_i_status;

select count(*)
FROM "Enrollment" as enrollment
where enrollment.leaid = '0634320';

SELECT enrollment.leaid, enrollment.lea_name, sum(adv_place.tot_apenr_f + adv_place.tot_apenr_m) as total_ap_students, status.title_i_status
FROM "Enrollment" as enrollment
         JOIN "Advanced_Placement" as adv_place on adv_place.combokey = enrollment.combokey
         JOIN title_i_status as status on enrollment.combokey = status.ncessch
where int8_sum(tot_apenr_f, tot_apenr_m) > 0
group by enrollment.leaid, enrollment.lea_name, status.title_i_status;

SELECT enrollment.leaid,enrollment.lea_name,sum(class.tot_mathenr_advm_f + class.tot_mathenr_advm_m) as advanced_math,status.title_i_status
FROM "Enrollment" as enrollment
         JOIN "Advanced_Mathematics" as class on class.combokey = enrollment.combokey
         JOIN title_i_status as status on enrollment.combokey = status.ncessch
where int8_sum(tot_mathenr_advm_f, tot_mathenr_advm_m) > 0
group by enrollment.leaid, enrollment.lea_name, status.title_i_status;

SELECT enrollment.leaid,enrollment.lea_name,sum(class.tot_discwdis_iss_idea_f + class.tot_discwdis_iss_idea_m) as days_missed,status.title_i_status
FROM "Enrollment" as enrollment
         JOIN "Suspensions" as class on class.combokey = enrollment.combokey
         JOIN title_i_status as status on enrollment.combokey = status.ncessch
where int8_sum(tot_discwdis_iss_idea_f, tot_discwdis_iss_idea_m) > 0
group by enrollment.leaid, enrollment.lea_name, status.title_i_status;





