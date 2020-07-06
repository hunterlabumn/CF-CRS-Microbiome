#Clear existing data and graphics
rm(list=ls())
graphics.off()
#Load Hmisc library
library(Hmisc)
library(tidyverse)
#Read Data

# added data input using readr from tidyverse. Changed the csv file from the downloaded version in the following ways:
# 1. used excel to change data format of the culture_dates variable to date format.
# 2. added cf/crs status that was missing from subjects: 135, 138, 146, 147, 152, 153, 166, 170, 172, 178

#data=read.csv('./data/SAMPLE_DATA/MicrobialEcologyFESS_DATA_2019-10-29_1438.csv')
data <- read_csv("data/SAMPLE_DATA/MicrobialEcologyFESS_DATA_2019-10-29_1438.csv",
                   col_types = cols(
                     culture_date = col_date(format = "%Y-%m-%d"))
)
#Setting Labels

label(data$subject_id)="Subject ID"
label(data$redcap_repeat_instrument)="Repeat Instrument"
label(data$redcap_repeat_instance)="Repeat Instance"
label(data$date_enrolled)="Date subject signed consent"
label(data$number_samples)="Number of samples if greater than 1"
label(data$age)="Age (years)"
label(data$sex)="Gender"
label(data$height)="Height (cm)"
label(data$cf_crs_status)="CF/CRS Status"
label(data$quality_sequence)="Quality sequences "
label(data$comments)="Comments"
label(data$demographics_complete)="Complete?"
label(data$cf_mutation_type_1___1)="Mutation 1: (choice=?F508)"
label(data$cf_mutation_type_1___2)="Mutation 1: (choice=G551D)"
label(data$cf_mutation_type_1___3)="Mutation 1: (choice=G542X)"
label(data$cf_mutation_type_1___4)="Mutation 1: (choice=W1282X)"
label(data$cf_mutation_type_1___5)="Mutation 1: (choice=N1303K)"
label(data$cf_mutation_type_1___6)="Mutation 1: (choice=R553X)"
label(data$cf_mutation_type_1___7)="Mutation 1: (choice=R117H)"
label(data$cf_mutation_type_1___8)="Mutation 1: (choice=Other)"
label(data$other_mutation_1)="Other mutation 1: "
label(data$cf_mutation_type_2___1)="Mutation 2:  (choice=?F508)"
label(data$cf_mutation_type_2___2)="Mutation 2:  (choice=G551D)"
label(data$cf_mutation_type_2___3)="Mutation 2:  (choice=G542X)"
label(data$cf_mutation_type_2___4)="Mutation 2:  (choice=W1282X)"
label(data$cf_mutation_type_2___5)="Mutation 2:  (choice=N1303K)"
label(data$cf_mutation_type_2___6)="Mutation 2:  (choice=R553X)"
label(data$cf_mutation_type_2___7)="Mutation 2:  (choice=R117H)"
label(data$cf_mutation_type_2___8)="Mutation 2:  (choice=Other)"
label(data$other_mutation_2)="Other mutation 2: "
label(data$cf_mutation_complete)="Complete?"
label(data$snot20_collection_date)="Date collected"
label(data$blow_nose)="1. Need to blow nose"
label(data$sneezing)="2. Sneezing"
label(data$runny_nose)="3. Runny nose"
label(data$cough)="4. Cough"
label(data$post_nasal_discharge)="5. Post-nasal discharge "
label(data$thick_nasal_discharge)="6. Thick nasal discharge "
label(data$ear_fullness)="7. Ear fullness"
label(data$dizziness)="8. Dizziness"
label(data$ear_pain)="9. Ear pain "
label(data$facial_pain_pressure)="10. Facial pain/pressure"
label(data$difficulty_falling_asleep)="11. Difficulty falling asleep"
label(data$wake_up_at_night)="12. Wake up at night"
label(data$lack_sleep)="13. Lack of a good nights sleep"
label(data$wake_tired)="14. Wake up tired"
label(data$fatigue)="15. Fatigue"
label(data$reduced_productivity)="16. Reduced productivity"
label(data$reduced_concentration)="17. Reduced concentration"
label(data$frustrated_restless_irritable)="18. Frustrated/restless/irritable"
label(data$sad)="19. Sad"
label(data$embarrassed)="20. Embarrassed "
label(data$total)="SNOT - 20 Total Score"
label(data$five_most_important___1)="Five most important items (choice=Need to blow nose)"
label(data$five_most_important___2)="Five most important items (choice=Sneezing)"
label(data$five_most_important___3)="Five most important items (choice=Runny nose)"
label(data$five_most_important___4)="Five most important items (choice=Cough)"
label(data$five_most_important___5)="Five most important items (choice=Post-nasal discharge)"
label(data$five_most_important___6)="Five most important items (choice=Thick nasal discharge)"
label(data$five_most_important___7)="Five most important items (choice=Ear fullness)"
label(data$five_most_important___8)="Five most important items (choice=Dizziness)"
label(data$five_most_important___9)="Five most important items (choice=Ear pain)"
label(data$five_most_important___10)="Five most important items (choice=Facial pain/pressure)"
label(data$five_most_important___11)="Five most important items (choice=Difficulty falling asleep)"
label(data$five_most_important___12)="Five most important items (choice=Wake up at night)"
label(data$five_most_important___13)="Five most important items (choice=Lack of a good nights sleep)"
label(data$five_most_important___14)="Five most important items (choice=Wake up tired)"
label(data$five_most_important___15)="Five most important items (choice=Fatigue)"
label(data$five_most_important___16)="Five most important items (choice=Reduced productivity)"
label(data$five_most_important___17)="Five most important items (choice=Reduced concentration)"
label(data$five_most_important___18)="Five most important items (choice=Frustrated/restless/irritable)"
label(data$five_most_important___19)="Five most important items (choice=Sad)"
label(data$five_most_important___20)="Five most important items (choice=Embarrassed)"
label(data$snot20_complete)="Complete?"
label(data$sinus_related_factors___1)="Sinus related factors (choice=Asthma)"
label(data$sinus_related_factors___2)="Sinus related factors (choice=Allergies)"
label(data$sinus_related_factors___3)="Sinus related factors (choice=GERD)"
label(data$sinus_related_factors___4)="Sinus related factors (choice=Prior FESS)"
label(data$sinus_related_factors___5)="Sinus related factors (choice=Subsequent FESS)"
label(data$sinus_related_factors___6)="Sinus related factors (choice=Polyps)"
label(data$sinus_related_factors___7)="Sinus related factors (choice=Polypoid change)"
label(data$sinus_related_factors___8)="Sinus related factors (choice=Current smoker)"
label(data$sinus_related_factors___9)="Sinus related factors (choice=Other)"
label(data$other_sinus_related)="Other "
label(data$number_previous_fess)="Number of previous FESS: "
label(data$number_sub_fess)="Number of subsequent FESS: "
label(data$date_previous_fess_1of1)="Date of previous FESS-1/1"
label(data$date_previous_fess_1of2)="Date of previous FESS-1/2"
label(data$date_previous_fess_2of2)="Date of previous FESS-2/2"
label(data$date_previous_fess_1of3)="Date of previous FESS-1/3"
label(data$date_previous_fess_2of3)="Date of previous FESS-2/3"
label(data$date_previous_fess_3of3)="Date of previous FESS-3/3"
label(data$date_previous_fess_1of4)="Date of previous FESS-1/4"
label(data$date_previous_fess_2of4)="Date of previous FESS-2/4"
label(data$date_previous_fess_3of4)="Date of previous FESS-3/4"
label(data$date_previous_fess_4of4)="Date of previous FESS-4/4"
label(data$previous_fess_comments)="Comments"
label(data$sinus_related_factors_complete)="Complete?"
label(data$culture_date)="Date of Culture"
label(data$specimen_type_description)="Specimen Type/Description"
label(data$other_specimen_type)="Other Specimen Type"
label(data$purulence_of_sample)="Was the sample purulent?"
label(data$pseudomonas_aeruginosa_muc)="Pseudomonas Aeruginosa Mucoid Strain"
label(data$grow_pseudomonas_aeruginosa_muc)="Growth Pseudomonas Aeruginosa Mucoid Strain"
label(data$resistance)="Resistance"
label(data$type_of_resistance)="Type of Resistance"
label(data$culture)="Pseudomonas aeruginosa"
label(data$pseudomonas_growth)="Growth Pseudomonas aeruginosa "
label(data$resistance_2)="Resistance"
label(data$type_of_resistance_2)="Type of Resistance"
label(data$staph_aureus)="Staphylococcus aureus"
label(data$staph_aureus_growth)="Growth Staphylococcus aureus "
label(data$resistance_3)="Resistance"
label(data$type_of_resistance_3)="Type of Resistance"
label(data$coag_negative_staph)="Coagulase negative Staphylococcus "
label(data$growth_coag_neg_staph)="Growth Coagulase negative Staphylococcus"
label(data$resistance_4)="Resistance"
label(data$type_of_resistance_4)="Type of Resistance"
label(data$strep_pneumo)="Streptococcus pneumoniae "
label(data$strep_pneumo_growth)="Growth Streptococcus pneumoniae"
label(data$strep_pneumo_res)="Resistance"
label(data$type_of_resistance_7)="Type of Resistance"
label(data$other_culture_1)="Other culture-1"
label(data$growth_other_culture_1)="Growth other culture-1"
label(data$resistance_5)="Resistance"
label(data$type_of_resistance_5)="Type of Resistance"
label(data$other_culture_2)="Other culture-2"
label(data$growth_other_culture_2)="Growth other culture-2"
label(data$resistance_6)="Resistance"
label(data$t_res_6)="Type of Resistance"
label(data$other_culture_3)="Other culture-3"
label(data$growth_other_culture_3)="Growth other culture-3"
label(data$resistance_7)="Resistance"
label(data$t_res_7)="Type of Resistance"
label(data$culture_comments)="Comments "
label(data$clinical_lab_cultures_complete)="Complete?"
label(data$medication_type)="Medication Type"
label(data$med_date_surg)="Date in relation to surgery"
#label(data$antibiotic___1)="Antibiotics (choice=Azithromycin)"
#label(data$antibiotic___2)="Antibiotics (choice=Cayston)"
#label(data$antibiotic___3)="Antibiotics (choice=Colistin)"
#label(data$antibiotic___4)="Antibiotics (choice=Tobramycin)"
#label(data$antibiotic___6)="Antibiotics (choice=Doxycycline)"
#label(data$antibiotic___7)="Antibiotics (choice=Gentamicin)"
#label(data$antibiotic___8)="Antibiotics (choice=Levofloxacin)"
#label(data$antibiotic___9)="Antibiotics (choice=Clarithromycin)"
#label(data$antibiotic___10)="Antibiotics (choice=Ciprofloxacin)"
#label(data$antibiotic___11)="Antibiotics (choice=Meropenem)"
#label(data$antibiotic___12)="Antibiotics (choice=Zosyn)"
#label(data$antibiotic___13)="Antibiotics (choice=Bactrim)"
#label(data$antibiotic___14)="Antibiotics (choice=Augmentin)"
#label(data$antibiotic___15)="Antibiotics (choice=Bacitracin)"
#label(data$antibiotic___16)="Antibiotics (choice=Cefdinir)"
#abel(data$antibiotic___17)="Antibiotics (choice=Dicloxacillin)"
#label(data$antibiotic___19)="Antibiotics (choice=Clindamycin)"
#label(data$antibiotic___20)="Antibiotics (choice=Colymycin)"
#label(data$antibiotic___18)="Antibiotics (choice=Other)"
label(data$azithromycin_route)="Azithromycin Route"
label(data$cayston_route)="Cayston Route"
label(data$colistin_route)="Colistin Route"
#label(data$tobramycin_route___1)="Tobramycin Route (choice=Oral)"
#label(data$tobramycin_route___2)="Tobramycin Route (choice=Irrigation)"
#label(data$tobramycin_route___3)="Tobramycin Route (choice=Inhalation (TOBI))"
#label(data$tobramycin_route___4)="Tobramycin Route (choice=Intravenous)"
#label(data$tobramycin_route___5)="Tobramycin Route (choice=Topical)"
label(data$doxycycline_route)="Doxycycline Route"
label(data$gentamicin_route)="Gentamicin Route"
label(data$levofloxacin_route)="Levofloxacin Route"
label(data$clarithromycin_route)="Clarithromycin Route"
label(data$ciprofloxacin_route)="Ciprofloxacin Route"
#label(data$meropenem_route___1)="Meropenem Route (choice=Oral)"
#label(data$meropenem_route___2)="Meropenem Route (choice=Irrigation)"
#label(data$meropenem_route___3)="Meropenem Route (choice=Inhalation)"
#label(data$meropenem_route___4)="Meropenem Route (choice=Intravenous)"
#label(data$meropenem_route___5)="Meropenem Route (choice=Topical)"
label(data$zosyn_route)="Zosyn Route"
label(data$bactrim_route)="Bactrim Route"
label(data$augmentin_route)="Augmentin Route"
label(data$bacitracin_route)="Bacitracin Route"
label(data$cefdinir_route)="Cefdinir Route"
label(data$dicloxacillin_route)="Dicloxacillin Route"
label(data$clindamycin_route)="Clindamycin Route"
label(data$colymycin_route)="Colymycin Route"
label(data$antibiotic_other)="Antibiotics - Other"
label(data$antibiotic_other_route)="Antibiotics Route - Other"
label(data$oral_steroid___1)="Oral steroids (choice=Prednisone)"
label(data$oral_steroid___2)="Oral steroids (choice=Methylprednisolone)"
label(data$oral_steroid___3)="Oral steroids (choice=Other oral steroid)"
label(data$other_oral_steroid)="Other oral steroid"
label(data$steroid_nasal_spray___1)="Steroid nasal spray (choice=Fluticasone)"
label(data$steroid_nasal_spray___2)="Steroid nasal spray (choice=Other steroid nasal spray)"
label(data$other_steroid_nasal_spray)="Other steroid nasal spray"
label(data$other_medications___1)="Other medications: (choice=Hypertonic saline)"
label(data$other_medications___2)="Other medications: (choice=Steroid irrigation)"
label(data$other_medications___3)="Other medications: (choice=Inhaled steroid)"
label(data$notes)="Notes"
label(data$antibiotic_treatments_complete)="Complete?"
label(data$pft_date)="Date of PFTs"
label(data$fvc)="FVC (predicted): "
label(data$fvc_measured)="FVC (measured):"
label(data$fvc_percent)="FVC%"
label(data$fev1)="FEV1 (predicted):"
label(data$fev1_predicted)="FEV1 (measured): "
label(data$fev1_percent)="FEV1%:"
label(data$fev1_fvc)="FEV1/FVC% (predicted):"
label(data$fev1_fvc_measured)="FEV1/FVC% (measured):"
label(data$fev1_fe6)="FEV1/FEV6% (predicted):"
label(data$fev1_fev6_predicted)="FEV1/FEV6% (measured): "
label(data$fef_max_predicted)="FEF Max (L/sec) (predicted):"
label(data$fef_max_l_sec_measured)="FEF Max (L/sec) (measured):"
label(data$fef_max_percent)="FEF Max (L/sec) (% predicted):"
label(data$fef_25_75_predicted)="FEF 25-75% (L/sec) (predicted):"
label(data$fef_25_75_l_sec_measured)="FEF 25-75% (L/sec) (measured):"
label(data$fef_25_75_percent)="FEF 25-75% (L/sec) (%predicted):"
label(data$fif_max_predicted)="FIF Max (L/sec) (predicted):"
label(data$fif_max_l_sec_measured_act)="FIF Max (L/sec) (measured):"
label(data$fif_max_l_sec_predicted)="FIF Max% (L/sec):"
label(data$expiratory_time_sec)="Expiratory Time (sec): (If available)"
label(data$pulmonary_function_tests_complete)="Complete?"
label(data$left_frontal_sinus)="Left Frontal Sinus"
label(data$right_frontal_sinus)="Right Frontal Sinus"
label(data$left_maxillary_sinus)="Left Maxillary Sinus"
label(data$right_maxillary_sinus)="Right Maxillary Sinus"
label(data$left_anteriorethmoid_sinus)="Left Anterior Ethmoid Sinus"
label(data$right_anteriorethmoid_sinus)="Right Anterior Ethmoid Sinus"
label(data$left_posteriorethmoid_sinus)="Left Posterior Ethmoid Sinus"
label(data$right_posteriorethmoid_sinus)="Right Posterior Ethmoid Sinus"
label(data$left_sphenoid_sinus)="Left Sphenoid Sinus"
label(data$right_sphenoid_sinus)="Right Sphenoid Sinus"
label(data$total_goss)="Total - GOSS"
label(data$ct_goss_complete)="Complete?"
label(data$left_frontal_sinuslm)="Left Frontal Sinus"
label(data$right_frontal_sinuslm)="Right Frontal Sinus"
label(data$left_maxillary_sinuslm)="Left Maxillary Sinus"
label(data$right_maxillary_sinuslm)="Right Maxillary Sinus"
label(data$left_anteriorethmoid_sinuslm)="Left Anterior Ethmoid Sinus"
label(data$right_anteriorethmoid_sinuslm)="Right Anterior Ethmoid Sinus"
label(data$left_posteriorethmoid_sinuslm)="Left Posterior Ethmoid Sinus"
label(data$right_posteriorethmoid_sinuslm)="Right Posterior Ethmoid Sinus"
label(data$left_sphenoid_sinuslm)="Left Sphenoid Sinus"
label(data$right_sphenoid_sinuslm)="Right Sphenoid Sinus"
label(data$left_ostiomeatal_complex)="Left Ostiomeatal Complex"
label(data$right_ostiomeatal_complex)="Right Ostiomeatal Complex"
label(data$total_lms)="Total - LMS"
label(data$ct_lundmckay_score_complete)="Complete?"
label(data$left_frontal_sinus_hb)="Left Frontal Sinus"
label(data$right_frontal_sinus_hb)="Right Frontal Sinus"
label(data$left_maxillary_sinus_hb)="Left Maxillary Sinus"
label(data$right_maxillary_sinus_hb)="Right Maxillary Sinus"
label(data$left_anteriorethmoid_sinus_hb)="Left Anterior Ethmoid Sinus"
label(data$right_anteriorethmoid_sinus_hb)="Right Anterior Ethmoid Sinus"
label(data$left_posteriorethmoid_sinus_hb)="Left Posterior Ethmoid Sinus"
label(data$right_posteriorethmoid_sinus_hb)="Right Posterior Ethmoid Sinus"
label(data$left_sphenoid_sinus_hb)="Left Sphenoid Sinus"
label(data$right_sphenoid_sinus_hb)="Right Sphenoid Sinus"
label(data$total_goss_hb)="Total - GOSS"
label(data$ct_goss_boyer_complete)="Complete?"
label(data$left_frontal_sinuslm_hb)="Left Frontal Sinus"
label(data$right_frontal_sinuslm_hb)="Right Frontal Sinus"
label(data$left_maxillary_sinuslm_hb)="Left Maxillary Sinus"
label(data$right_maxillary_sinuslm_hb)="Right Maxillary Sinus"
label(data$left_anteriorethmoid_sinuslm_hb)="Left Anterior Ethmoid Sinus"
label(data$right_anteriorethmoid_sinuslm_hb)="Right Anterior Ethmoid Sinus"
label(data$left_posteriorethmoid_sinuslm_hb)="Left Posterior Ethmoid Sinus"
label(data$right_posteriorethmoid_sinuslm_hb)="Right Posterior Ethmoid Sinus"
label(data$left_sphenoid_sinuslm_hb)="Left Sphenoid Sinus"
label(data$right_sphenoid_sinuslm_hb)="Right Sphenoid Sinus"
label(data$left_ostiomeatal_complex_hb)="Left Ostiomeatal Complex"
label(data$right_ostiomeatal_complex_hb)="Right Ostiomeatal Complex"
label(data$total_lms_hb)="Total - LMS"
label(data$ct_lundmckay_score_boyer_complete)="Complete?"
label(data$complete_study)="Has patient completed study?"
label(data$withdraw_date)="Put a date if patient withdrew study"
label(data$withdraw_reason)="Reason patient withdrew from study"
label(data$complete_study_date)="Date of study completion"
label(data$study_comments)="Comments"
label(data$completion_data_complete)="Complete?"
#Setting Units

units(data$height)="cm"

#Setting Factors(will create new variable for factors)
data$redcap_repeat_instrument.factor = factor(data$redcap_repeat_instrument,levels=c("snot20","clinical_lab_cultures","antibiotic_treatments","pulmonary_function_tests"))
data$sex.factor = factor(data$sex,levels=c("0","1"))
data$cf_crs_status.factor = factor(data$cf_crs_status,levels=c("1","2","3"))
data$quality_sequence.factor = factor(data$quality_sequence,levels=c("1","2"))
data$demographics_complete.factor = factor(data$demographics_complete,levels=c("0","1","2"))
data$cf_mutation_type_1___1.factor = factor(data$cf_mutation_type_1___1,levels=c("0","1"))
data$cf_mutation_type_1___2.factor = factor(data$cf_mutation_type_1___2,levels=c("0","1"))
data$cf_mutation_type_1___3.factor = factor(data$cf_mutation_type_1___3,levels=c("0","1"))
data$cf_mutation_type_1___4.factor = factor(data$cf_mutation_type_1___4,levels=c("0","1"))
data$cf_mutation_type_1___5.factor = factor(data$cf_mutation_type_1___5,levels=c("0","1"))
data$cf_mutation_type_1___6.factor = factor(data$cf_mutation_type_1___6,levels=c("0","1"))
data$cf_mutation_type_1___7.factor = factor(data$cf_mutation_type_1___7,levels=c("0","1"))
data$cf_mutation_type_1___8.factor = factor(data$cf_mutation_type_1___8,levels=c("0","1"))
data$cf_mutation_type_2___1.factor = factor(data$cf_mutation_type_2___1,levels=c("0","1"))
data$cf_mutation_type_2___2.factor = factor(data$cf_mutation_type_2___2,levels=c("0","1"))
data$cf_mutation_type_2___3.factor = factor(data$cf_mutation_type_2___3,levels=c("0","1"))
data$cf_mutation_type_2___4.factor = factor(data$cf_mutation_type_2___4,levels=c("0","1"))
data$cf_mutation_type_2___5.factor = factor(data$cf_mutation_type_2___5,levels=c("0","1"))
data$cf_mutation_type_2___6.factor = factor(data$cf_mutation_type_2___6,levels=c("0","1"))
data$cf_mutation_type_2___7.factor = factor(data$cf_mutation_type_2___7,levels=c("0","1"))
data$cf_mutation_type_2___8.factor = factor(data$cf_mutation_type_2___8,levels=c("0","1"))
data$cf_mutation_complete.factor = factor(data$cf_mutation_complete,levels=c("0","1","2"))
data$blow_nose.factor = factor(data$blow_nose,levels=c("0","1","2","3","4","5"))
data$sneezing.factor = factor(data$sneezing,levels=c("0","1","2","3","4","5"))
data$runny_nose.factor = factor(data$runny_nose,levels=c("0","1","2","3","4","5"))
data$cough.factor = factor(data$cough,levels=c("0","1","2","3","4","5"))
data$post_nasal_discharge.factor = factor(data$post_nasal_discharge,levels=c("0","1","2","3","4","5"))
data$thick_nasal_discharge.factor = factor(data$thick_nasal_discharge,levels=c("0","1","2","3","4","5"))
data$ear_fullness.factor = factor(data$ear_fullness,levels=c("0","1","2","3","4","5"))
data$dizziness.factor = factor(data$dizziness,levels=c("0","1","2","3","4","5"))
data$ear_pain.factor = factor(data$ear_pain,levels=c("0","1","2","3","4","5"))
data$facial_pain_pressure.factor = factor(data$facial_pain_pressure,levels=c("0","1","2","3","4","5"))
data$difficulty_falling_asleep.factor = factor(data$difficulty_falling_asleep,levels=c("0","1","2","3","4","5"))
data$wake_up_at_night.factor = factor(data$wake_up_at_night,levels=c("0","1","2","3","4","5"))
data$lack_sleep.factor = factor(data$lack_sleep,levels=c("0","1","2","3","4","5"))
data$wake_tired.factor = factor(data$wake_tired,levels=c("0","1","2","3","4","5"))
data$fatigue.factor = factor(data$fatigue,levels=c("0","1","2","3","4","5"))
data$reduced_productivity.factor = factor(data$reduced_productivity,levels=c("0","1","2","3","4","5"))
data$reduced_concentration.factor = factor(data$reduced_concentration,levels=c("0","1","2","3","4","5"))
data$frustrated_restless_irritable.factor = factor(data$frustrated_restless_irritable,levels=c("0","1","2","3","4","5"))
data$sad.factor = factor(data$sad,levels=c("0","1","2","3","4","5"))
data$embarrassed.factor = factor(data$embarrassed,levels=c("0","1","2","3","4","5"))
data$five_most_important___1.factor = factor(data$five_most_important___1,levels=c("0","1"))
data$five_most_important___2.factor = factor(data$five_most_important___2,levels=c("0","1"))
data$five_most_important___3.factor = factor(data$five_most_important___3,levels=c("0","1"))
data$five_most_important___4.factor = factor(data$five_most_important___4,levels=c("0","1"))
data$five_most_important___5.factor = factor(data$five_most_important___5,levels=c("0","1"))
data$five_most_important___6.factor = factor(data$five_most_important___6,levels=c("0","1"))
data$five_most_important___7.factor = factor(data$five_most_important___7,levels=c("0","1"))
data$five_most_important___8.factor = factor(data$five_most_important___8,levels=c("0","1"))
data$five_most_important___9.factor = factor(data$five_most_important___9,levels=c("0","1"))
data$five_most_important___10.factor = factor(data$five_most_important___10,levels=c("0","1"))
data$five_most_important___11.factor = factor(data$five_most_important___11,levels=c("0","1"))
data$five_most_important___12.factor = factor(data$five_most_important___12,levels=c("0","1"))
data$five_most_important___13.factor = factor(data$five_most_important___13,levels=c("0","1"))
data$five_most_important___14.factor = factor(data$five_most_important___14,levels=c("0","1"))
data$five_most_important___15.factor = factor(data$five_most_important___15,levels=c("0","1"))
data$five_most_important___16.factor = factor(data$five_most_important___16,levels=c("0","1"))
data$five_most_important___17.factor = factor(data$five_most_important___17,levels=c("0","1"))
data$five_most_important___18.factor = factor(data$five_most_important___18,levels=c("0","1"))
data$five_most_important___19.factor = factor(data$five_most_important___19,levels=c("0","1"))
data$five_most_important___20.factor = factor(data$five_most_important___20,levels=c("0","1"))
data$snot20_complete.factor = factor(data$snot20_complete,levels=c("0","1","2"))
data$sinus_related_factors___1.factor = factor(data$sinus_related_factors___1,levels=c("0","1"))
data$sinus_related_factors___2.factor = factor(data$sinus_related_factors___2,levels=c("0","1"))
data$sinus_related_factors___3.factor = factor(data$sinus_related_factors___3,levels=c("0","1"))
data$sinus_related_factors___4.factor = factor(data$sinus_related_factors___4,levels=c("0","1"))
data$sinus_related_factors___5.factor = factor(data$sinus_related_factors___5,levels=c("0","1"))
data$sinus_related_factors___6.factor = factor(data$sinus_related_factors___6,levels=c("0","1"))
data$sinus_related_factors___7.factor = factor(data$sinus_related_factors___7,levels=c("0","1"))
data$sinus_related_factors___8.factor = factor(data$sinus_related_factors___8,levels=c("0","1"))
data$sinus_related_factors___9.factor = factor(data$sinus_related_factors___9,levels=c("0","1"))
data$number_previous_fess.factor = factor(data$number_previous_fess,levels=c("1","2","3","4"))
data$number_sub_fess.factor = factor(data$number_sub_fess,levels=c("1","2","3","4"))
data$sinus_related_factors_complete.factor = factor(data$sinus_related_factors_complete,levels=c("0","1","2"))
data$specimen_type_description.factor = factor(data$specimen_type_description,levels=c("1","2","3"))
data$purulence_of_sample.factor = factor(data$purulence_of_sample,levels=c("1","2"))
data$pseudomonas_aeruginosa_muc.factor = factor(data$pseudomonas_aeruginosa_muc,levels=c("1","2"))
data$grow_pseudomonas_aeruginosa_muc.factor = factor(data$grow_pseudomonas_aeruginosa_muc,levels=c("0","1","2","3"))
data$resistance.factor = factor(data$resistance,levels=c("1","2"))
data$culture.factor = factor(data$culture,levels=c("1","2"))
data$pseudomonas_growth.factor = factor(data$pseudomonas_growth,levels=c("0","1","2","3"))
data$resistance_2.factor = factor(data$resistance_2,levels=c("1","2"))
data$staph_aureus.factor = factor(data$staph_aureus,levels=c("1","2"))
data$staph_aureus_growth.factor = factor(data$staph_aureus_growth,levels=c("0","1","2","3"))
data$resistance_3.factor = factor(data$resistance_3,levels=c("1","2"))
data$coag_negative_staph.factor = factor(data$coag_negative_staph,levels=c("1","2"))
data$growth_coag_neg_staph.factor = factor(data$growth_coag_neg_staph,levels=c("0","1","2","3"))
data$resistance_4.factor = factor(data$resistance_4,levels=c("1","2"))
data$strep_pneumo.factor = factor(data$strep_pneumo,levels=c("1","2"))
data$strep_pneumo_growth.factor = factor(data$strep_pneumo_growth,levels=c("0","1","2","3"))
data$strep_pneumo_res.factor = factor(data$strep_pneumo_res,levels=c("1","0"))
data$growth_other_culture_1.factor = factor(data$growth_other_culture_1,levels=c("0","1","2","3"))
data$resistance_5.factor = factor(data$resistance_5,levels=c("1","2"))
data$growth_other_culture_2.factor = factor(data$growth_other_culture_2,levels=c("0","1","2","3"))
data$resistance_6.factor = factor(data$resistance_6,levels=c("1","2"))
data$growth_other_culture_3.factor = factor(data$growth_other_culture_3,levels=c("0","1","2","3"))
data$resistance_7.factor = factor(data$resistance_7,levels=c("1","2"))
data$clinical_lab_cultures_complete.factor = factor(data$clinical_lab_cultures_complete,levels=c("0","1","2"))
data$medication_type.factor = factor(data$medication_type,levels=c("1","2","3"))
data$med_date_surg.factor = factor(data$med_date_surg,levels=c("1","2"))
data$antibiotic___1.factor = factor(data$antibiotic___1,levels=c("0","1"))
data$antibiotic___2.factor = factor(data$antibiotic___2,levels=c("0","1"))
data$antibiotic___3.factor = factor(data$antibiotic___3,levels=c("0","1"))
data$antibiotic___4.factor = factor(data$antibiotic___4,levels=c("0","1"))
data$antibiotic___6.factor = factor(data$antibiotic___6,levels=c("0","1"))
data$antibiotic___7.factor = factor(data$antibiotic___7,levels=c("0","1"))
data$antibiotic___8.factor = factor(data$antibiotic___8,levels=c("0","1"))
data$antibiotic___9.factor = factor(data$antibiotic___9,levels=c("0","1"))
data$antibiotic___10.factor = factor(data$antibiotic___10,levels=c("0","1"))
data$antibiotic___11.factor = factor(data$antibiotic___11,levels=c("0","1"))
data$antibiotic___12.factor = factor(data$antibiotic___12,levels=c("0","1"))
data$antibiotic___13.factor = factor(data$antibiotic___13,levels=c("0","1"))
data$antibiotic___14.factor = factor(data$antibiotic___14,levels=c("0","1"))
data$antibiotic___15.factor = factor(data$antibiotic___15,levels=c("0","1"))
data$antibiotic___16.factor = factor(data$antibiotic___16,levels=c("0","1"))
data$antibiotic___17.factor = factor(data$antibiotic___17,levels=c("0","1"))
data$antibiotic___19.factor = factor(data$antibiotic___19,levels=c("0","1"))
data$antibiotic___20.factor = factor(data$antibiotic___20,levels=c("0","1"))
data$antibiotic___18.factor = factor(data$antibiotic___18,levels=c("0","1"))
data$azithromycin_route.factor = factor(data$azithromycin_route,levels=c("1","2","3","4","5"))
data$cayston_route.factor = factor(data$cayston_route,levels=c("1","2","3","4","5"))
data$colistin_route.factor = factor(data$colistin_route,levels=c("1","2","3","4","5"))
data$tobramycin_route___1.factor = factor(data$tobramycin_route___1,levels=c("0","1"))
data$tobramycin_route___2.factor = factor(data$tobramycin_route___2,levels=c("0","1"))
data$tobramycin_route___3.factor = factor(data$tobramycin_route___3,levels=c("0","1"))
data$tobramycin_route___4.factor = factor(data$tobramycin_route___4,levels=c("0","1"))
data$tobramycin_route___5.factor = factor(data$tobramycin_route___5,levels=c("0","1"))
data$doxycycline_route.factor = factor(data$doxycycline_route,levels=c("1","2","3","4","5"))
data$gentamicin_route.factor = factor(data$gentamicin_route,levels=c("1","2","3","4","5"))
data$levofloxacin_route.factor = factor(data$levofloxacin_route,levels=c("1","2","3","4","5"))
data$clarithromycin_route.factor = factor(data$clarithromycin_route,levels=c("1","2","3","4","5"))
data$ciprofloxacin_route.factor = factor(data$ciprofloxacin_route,levels=c("1","2","3","4","5"))
data$meropenem_route___1.factor = factor(data$meropenem_route___1,levels=c("0","1"))
data$meropenem_route___2.factor = factor(data$meropenem_route___2,levels=c("0","1"))
data$meropenem_route___3.factor = factor(data$meropenem_route___3,levels=c("0","1"))
data$meropenem_route___4.factor = factor(data$meropenem_route___4,levels=c("0","1"))
data$meropenem_route___5.factor = factor(data$meropenem_route___5,levels=c("0","1"))
data$zosyn_route.factor = factor(data$zosyn_route,levels=c("1","2","3","4","5"))
data$bactrim_route.factor = factor(data$bactrim_route,levels=c("1","2","3","4","5"))
data$augmentin_route.factor = factor(data$augmentin_route,levels=c("1","2","3","4","5"))
data$bacitracin_route.factor = factor(data$bacitracin_route,levels=c("1","2","3","4","5"))
data$cefdinir_route.factor = factor(data$cefdinir_route,levels=c("1","2","3","4","5"))
data$dicloxacillin_route.factor = factor(data$dicloxacillin_route,levels=c("1","2","3","4","5"))
data$clindamycin_route.factor = factor(data$clindamycin_route,levels=c("1","2","3","4","5"))
data$colymycin_route.factor = factor(data$colymycin_route,levels=c("1","2","3","4","5"))
data$antibiotic_other_route.factor = factor(data$antibiotic_other_route,levels=c("1","2","3","4","5"))
data$oral_steroid___1.factor = factor(data$oral_steroid___1,levels=c("0","1"))
data$oral_steroid___2.factor = factor(data$oral_steroid___2,levels=c("0","1"))
data$oral_steroid___3.factor = factor(data$oral_steroid___3,levels=c("0","1"))
data$steroid_nasal_spray___1.factor = factor(data$steroid_nasal_spray___1,levels=c("0","1"))
data$steroid_nasal_spray___2.factor = factor(data$steroid_nasal_spray___2,levels=c("0","1"))
data$other_medications___1.factor = factor(data$other_medications___1,levels=c("0","1"))
data$other_medications___2.factor = factor(data$other_medications___2,levels=c("0","1"))
data$other_medications___3.factor = factor(data$other_medications___3,levels=c("0","1"))
data$antibiotic_treatments_complete.factor = factor(data$antibiotic_treatments_complete,levels=c("0","1","2"))
data$pulmonary_function_tests_complete.factor = factor(data$pulmonary_function_tests_complete,levels=c("0","1","2"))
data$left_frontal_sinus.factor = factor(data$left_frontal_sinus,levels=c("0","1","2","3","4","5"))
data$right_frontal_sinus.factor = factor(data$right_frontal_sinus,levels=c("0","1","2","3","4","5"))
data$left_maxillary_sinus.factor = factor(data$left_maxillary_sinus,levels=c("0","1","2","3","4","5"))
data$right_maxillary_sinus.factor = factor(data$right_maxillary_sinus,levels=c("0","1","2","3","4","5"))
data$left_anteriorethmoid_sinus.factor = factor(data$left_anteriorethmoid_sinus,levels=c("0","1","2","3","4","5"))
data$right_anteriorethmoid_sinus.factor = factor(data$right_anteriorethmoid_sinus,levels=c("0","1","2","3","4","5"))
data$left_posteriorethmoid_sinus.factor = factor(data$left_posteriorethmoid_sinus,levels=c("0","1","2","3","4","5"))
data$right_posteriorethmoid_sinus.factor = factor(data$right_posteriorethmoid_sinus,levels=c("0","1","2","3","4","5"))
data$left_sphenoid_sinus.factor = factor(data$left_sphenoid_sinus,levels=c("0","1","2","3","4","5"))
data$right_sphenoid_sinus.factor = factor(data$right_sphenoid_sinus,levels=c("0","1","2","3","4","5"))
data$ct_goss_complete.factor = factor(data$ct_goss_complete,levels=c("0","1","2"))
data$left_frontal_sinuslm.factor = factor(data$left_frontal_sinuslm,levels=c("0","1","2"))
data$right_frontal_sinuslm.factor = factor(data$right_frontal_sinuslm,levels=c("0","1","2"))
data$left_maxillary_sinuslm.factor = factor(data$left_maxillary_sinuslm,levels=c("0","1","2"))
data$right_maxillary_sinuslm.factor = factor(data$right_maxillary_sinuslm,levels=c("0","1","2"))
data$left_anteriorethmoid_sinuslm.factor = factor(data$left_anteriorethmoid_sinuslm,levels=c("0","1","2"))
data$right_anteriorethmoid_sinuslm.factor = factor(data$right_anteriorethmoid_sinuslm,levels=c("0","1","2"))
data$left_posteriorethmoid_sinuslm.factor = factor(data$left_posteriorethmoid_sinuslm,levels=c("0","1","2"))
data$right_posteriorethmoid_sinuslm.factor = factor(data$right_posteriorethmoid_sinuslm,levels=c("0","1","2"))
data$left_sphenoid_sinuslm.factor = factor(data$left_sphenoid_sinuslm,levels=c("0","1","2"))
data$right_sphenoid_sinuslm.factor = factor(data$right_sphenoid_sinuslm,levels=c("0","1","2"))
data$left_ostiomeatal_complex.factor = factor(data$left_ostiomeatal_complex,levels=c("0","2"))
data$right_ostiomeatal_complex.factor = factor(data$right_ostiomeatal_complex,levels=c("0","2"))
data$ct_lundmckay_score_complete.factor = factor(data$ct_lundmckay_score_complete,levels=c("0","1","2"))
data$left_frontal_sinus_hb.factor = factor(data$left_frontal_sinus_hb,levels=c("0","1","2","3","4","5"))
data$right_frontal_sinus_hb.factor = factor(data$right_frontal_sinus_hb,levels=c("0","1","2","3","4","5"))
data$left_maxillary_sinus_hb.factor = factor(data$left_maxillary_sinus_hb,levels=c("0","1","2","3","4","5"))
data$right_maxillary_sinus_hb.factor = factor(data$right_maxillary_sinus_hb,levels=c("0","1","2","3","4","5"))
data$left_anteriorethmoid_sinus_hb.factor = factor(data$left_anteriorethmoid_sinus_hb,levels=c("0","1","2","3","4","5"))
data$right_anteriorethmoid_sinus_hb.factor = factor(data$right_anteriorethmoid_sinus_hb,levels=c("0","1","2","3","4","5"))
data$left_posteriorethmoid_sinus_hb.factor = factor(data$left_posteriorethmoid_sinus_hb,levels=c("0","1","2","3","4","5"))
data$right_posteriorethmoid_sinus_hb.factor = factor(data$right_posteriorethmoid_sinus_hb,levels=c("0","1","2","3","4","5"))
data$left_sphenoid_sinus_hb.factor = factor(data$left_sphenoid_sinus_hb,levels=c("0","1","2","3","4","5"))
data$right_sphenoid_sinus_hb.factor = factor(data$right_sphenoid_sinus_hb,levels=c("0","1","2","3","4","5"))
data$ct_goss_boyer_complete.factor = factor(data$ct_goss_boyer_complete,levels=c("0","1","2"))
data$left_frontal_sinuslm_hb.factor = factor(data$left_frontal_sinuslm_hb,levels=c("0","1","2"))
data$right_frontal_sinuslm_hb.factor = factor(data$right_frontal_sinuslm_hb,levels=c("0","1","2"))
data$left_maxillary_sinuslm_hb.factor = factor(data$left_maxillary_sinuslm_hb,levels=c("0","1","2"))
data$right_maxillary_sinuslm_hb.factor = factor(data$right_maxillary_sinuslm_hb,levels=c("0","1","2"))
data$left_anteriorethmoid_sinuslm_hb.factor = factor(data$left_anteriorethmoid_sinuslm_hb,levels=c("0","1","2"))
data$right_anteriorethmoid_sinuslm_hb.factor = factor(data$right_anteriorethmoid_sinuslm_hb,levels=c("0","1","2"))
data$left_posteriorethmoid_sinuslm_hb.factor = factor(data$left_posteriorethmoid_sinuslm_hb,levels=c("0","1","2"))
data$right_posteriorethmoid_sinuslm_hb.factor = factor(data$right_posteriorethmoid_sinuslm_hb,levels=c("0","1","2"))
data$left_sphenoid_sinuslm_hb.factor = factor(data$left_sphenoid_sinuslm_hb,levels=c("0","1","2"))
data$right_sphenoid_sinuslm_hb.factor = factor(data$right_sphenoid_sinuslm_hb,levels=c("0","1","2"))
data$left_ostiomeatal_complex_hb.factor = factor(data$left_ostiomeatal_complex_hb,levels=c("0","2"))
data$right_ostiomeatal_complex_hb.factor = factor(data$right_ostiomeatal_complex_hb,levels=c("0","2"))
data$ct_lundmckay_score_boyer_complete.factor = factor(data$ct_lundmckay_score_boyer_complete,levels=c("0","1","2"))
data$complete_study.factor = factor(data$complete_study,levels=c("0","1"))
data$withdraw_reason.factor = factor(data$withdraw_reason,levels=c("0","1","2","3","4"))
data$completion_data_complete.factor = factor(data$completion_data_complete,levels=c("0","1","2"))

levels(data$redcap_repeat_instrument.factor)=c("SNOT-20","Clinical Lab Cultures","Medications Prior to Surgery","Pulmonary Function Tests")
levels(data$sex.factor)=c("Female","Male")
levels(data$cf_crs_status.factor)=c("CF+, CRS+","CF-, CRS+","CF-, CRS-")
levels(data$quality_sequence.factor)=c("Yes","No")
levels(data$demographics_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$cf_mutation_type_1___1.factor)=c("Unchecked","Checked")
levels(data$cf_mutation_type_1___2.factor)=c("Unchecked","Checked")
levels(data$cf_mutation_type_1___3.factor)=c("Unchecked","Checked")
levels(data$cf_mutation_type_1___4.factor)=c("Unchecked","Checked")
levels(data$cf_mutation_type_1___5.factor)=c("Unchecked","Checked")
levels(data$cf_mutation_type_1___6.factor)=c("Unchecked","Checked")
levels(data$cf_mutation_type_1___7.factor)=c("Unchecked","Checked")
levels(data$cf_mutation_type_1___8.factor)=c("Unchecked","Checked")
levels(data$cf_mutation_type_2___1.factor)=c("Unchecked","Checked")
levels(data$cf_mutation_type_2___2.factor)=c("Unchecked","Checked")
levels(data$cf_mutation_type_2___3.factor)=c("Unchecked","Checked")
levels(data$cf_mutation_type_2___4.factor)=c("Unchecked","Checked")
levels(data$cf_mutation_type_2___5.factor)=c("Unchecked","Checked")
levels(data$cf_mutation_type_2___6.factor)=c("Unchecked","Checked")
levels(data$cf_mutation_type_2___7.factor)=c("Unchecked","Checked")
levels(data$cf_mutation_type_2___8.factor)=c("Unchecked","Checked")
levels(data$cf_mutation_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$blow_nose.factor)=c("0","1","2","3","4","5")
levels(data$sneezing.factor)=c("0","1","2","3","4","5")
levels(data$runny_nose.factor)=c("0","1","2","3","4","5")
levels(data$cough.factor)=c("0","1","2","3","4","5")
levels(data$post_nasal_discharge.factor)=c("0","1","2","3","4","5")
levels(data$thick_nasal_discharge.factor)=c("0","1","2","3","4","5")
levels(data$ear_fullness.factor)=c("0","1","2","3","4","5")
levels(data$dizziness.factor)=c("0","1","2","3","4","5")
levels(data$ear_pain.factor)=c("0","1","2","3","4","5")
levels(data$facial_pain_pressure.factor)=c("0","1","2","3","4","5")
levels(data$difficulty_falling_asleep.factor)=c("0","1","2","3","4","5")
levels(data$wake_up_at_night.factor)=c("0","1","2","3","4","5")
levels(data$lack_sleep.factor)=c("0","1","2","3","4","5")
levels(data$wake_tired.factor)=c("0","1","2","3","4","5")
levels(data$fatigue.factor)=c("0","1","2","3","4","5")
levels(data$reduced_productivity.factor)=c("0","1","2","3","4","5")
levels(data$reduced_concentration.factor)=c("0","1","2","3","4","5")
levels(data$frustrated_restless_irritable.factor)=c("0","1","2","3","4","5")
levels(data$sad.factor)=c("0","1","2","3","4","5")
levels(data$embarrassed.factor)=c("0","1","2","3","4","5")
levels(data$five_most_important___1.factor)=c("Unchecked","Checked")
levels(data$five_most_important___2.factor)=c("Unchecked","Checked")
levels(data$five_most_important___3.factor)=c("Unchecked","Checked")
levels(data$five_most_important___4.factor)=c("Unchecked","Checked")
levels(data$five_most_important___5.factor)=c("Unchecked","Checked")
levels(data$five_most_important___6.factor)=c("Unchecked","Checked")
levels(data$five_most_important___7.factor)=c("Unchecked","Checked")
levels(data$five_most_important___8.factor)=c("Unchecked","Checked")
levels(data$five_most_important___9.factor)=c("Unchecked","Checked")
levels(data$five_most_important___10.factor)=c("Unchecked","Checked")
levels(data$five_most_important___11.factor)=c("Unchecked","Checked")
levels(data$five_most_important___12.factor)=c("Unchecked","Checked")
levels(data$five_most_important___13.factor)=c("Unchecked","Checked")
levels(data$five_most_important___14.factor)=c("Unchecked","Checked")
levels(data$five_most_important___15.factor)=c("Unchecked","Checked")
levels(data$five_most_important___16.factor)=c("Unchecked","Checked")
levels(data$five_most_important___17.factor)=c("Unchecked","Checked")
levels(data$five_most_important___18.factor)=c("Unchecked","Checked")
levels(data$five_most_important___19.factor)=c("Unchecked","Checked")
levels(data$five_most_important___20.factor)=c("Unchecked","Checked")
levels(data$snot20_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$sinus_related_factors___1.factor)=c("Unchecked","Checked")
levels(data$sinus_related_factors___2.factor)=c("Unchecked","Checked")
levels(data$sinus_related_factors___3.factor)=c("Unchecked","Checked")
levels(data$sinus_related_factors___4.factor)=c("Unchecked","Checked")
levels(data$sinus_related_factors___5.factor)=c("Unchecked","Checked")
levels(data$sinus_related_factors___6.factor)=c("Unchecked","Checked")
levels(data$sinus_related_factors___7.factor)=c("Unchecked","Checked")
levels(data$sinus_related_factors___8.factor)=c("Unchecked","Checked")
levels(data$sinus_related_factors___9.factor)=c("Unchecked","Checked")
levels(data$number_previous_fess.factor)=c("1","2","3",">/= 4")
levels(data$number_sub_fess.factor)=c("1","2","3",">/= 4")
levels(data$sinus_related_factors_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$specimen_type_description.factor)=c("Sinus","Sputum","Other")
levels(data$purulence_of_sample.factor)=c("Yes","No")
levels(data$pseudomonas_aeruginosa_muc.factor)=c("Positive","Negative")
levels(data$grow_pseudomonas_aeruginosa_muc.factor)=c("Single colony","Light","Moderate","Heavy")
levels(data$resistance.factor)=c("Yes","No")
levels(data$culture.factor)=c("Positive","Negative")
levels(data$pseudomonas_growth.factor)=c("Single colony","Light","Moderate","Heavy")
levels(data$resistance_2.factor)=c("Yes","No")
levels(data$staph_aureus.factor)=c("Positive","Negative")
levels(data$staph_aureus_growth.factor)=c("Single colony","Light","Moderate","Heavy")
levels(data$resistance_3.factor)=c("Yes","No")
levels(data$coag_negative_staph.factor)=c("Positive","Negative")
levels(data$growth_coag_neg_staph.factor)=c("Single colony","Light","Moderate","Heavy")
levels(data$resistance_4.factor)=c("Yes","No")
levels(data$strep_pneumo.factor)=c("Positive","Negative")
levels(data$strep_pneumo_growth.factor)=c("Single colony","Light","Moderate","Heavy")
levels(data$strep_pneumo_res.factor)=c("Yes","No")
levels(data$growth_other_culture_1.factor)=c("Single Colony","Light","Moderate","Heavy")
levels(data$resistance_5.factor)=c("Yes","No")
levels(data$growth_other_culture_2.factor)=c("Single Colony","Light","Moderate","Heavy")
levels(data$resistance_6.factor)=c("Yes","No")
levels(data$growth_other_culture_3.factor)=c("Single Colony","Light","Moderate","Heavy")
levels(data$resistance_7.factor)=c("Yes","No")
levels(data$clinical_lab_cultures_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$medication_type.factor)=c("Antibiotic","Other Medication","Antibiotic & Other Medication")
levels(data$med_date_surg.factor)=c("Within 3 Days (Prior to Surgery)","Within 3 MONTHS (Prior to Surgery)")
levels(data$antibiotic___1.factor)=c("Unchecked","Checked")
levels(data$antibiotic___2.factor)=c("Unchecked","Checked")
levels(data$antibiotic___3.factor)=c("Unchecked","Checked")
levels(data$antibiotic___4.factor)=c("Unchecked","Checked")
levels(data$antibiotic___6.factor)=c("Unchecked","Checked")
levels(data$antibiotic___7.factor)=c("Unchecked","Checked")
levels(data$antibiotic___8.factor)=c("Unchecked","Checked")
levels(data$antibiotic___9.factor)=c("Unchecked","Checked")
levels(data$antibiotic___10.factor)=c("Unchecked","Checked")
levels(data$antibiotic___11.factor)=c("Unchecked","Checked")
levels(data$antibiotic___12.factor)=c("Unchecked","Checked")
levels(data$antibiotic___13.factor)=c("Unchecked","Checked")
levels(data$antibiotic___14.factor)=c("Unchecked","Checked")
levels(data$antibiotic___15.factor)=c("Unchecked","Checked")
levels(data$antibiotic___16.factor)=c("Unchecked","Checked")
levels(data$antibiotic___17.factor)=c("Unchecked","Checked")
levels(data$antibiotic___19.factor)=c("Unchecked","Checked")
levels(data$antibiotic___20.factor)=c("Unchecked","Checked")
levels(data$antibiotic___18.factor)=c("Unchecked","Checked")
levels(data$azithromycin_route.factor)=c("Oral","Irrigation","Inhalation","Intravenous","Topical")
levels(data$cayston_route.factor)=c("Oral","Irrigation","Inhalation","Intravenous","Topical")
levels(data$colistin_route.factor)=c("Oral","Irrigation","Inhalation","Intravenous","Topical")
levels(data$tobramycin_route___1.factor)=c("Unchecked","Checked")
levels(data$tobramycin_route___2.factor)=c("Unchecked","Checked")
levels(data$tobramycin_route___3.factor)=c("Unchecked","Checked")
levels(data$tobramycin_route___4.factor)=c("Unchecked","Checked")
levels(data$tobramycin_route___5.factor)=c("Unchecked","Checked")
levels(data$doxycycline_route.factor)=c("Oral","Irrigation","Inhalation","Intravenous","Topical")
levels(data$gentamicin_route.factor)=c("Oral","Irrigation","Inhalation","Intravenous","Topical")
levels(data$levofloxacin_route.factor)=c("Oral","Irrigation","Inhalation","Intravenous","Topical")
levels(data$clarithromycin_route.factor)=c("Oral","Irrigation","Inhalation","Intravenous","Topical")
levels(data$ciprofloxacin_route.factor)=c("Oral","Irrigation","Inhalation","Intravenous","Topical")
levels(data$meropenem_route___1.factor)=c("Unchecked","Checked")
levels(data$meropenem_route___2.factor)=c("Unchecked","Checked")
levels(data$meropenem_route___3.factor)=c("Unchecked","Checked")
levels(data$meropenem_route___4.factor)=c("Unchecked","Checked")
levels(data$meropenem_route___5.factor)=c("Unchecked","Checked")
levels(data$zosyn_route.factor)=c("Oral","Irrigation","Inhalation","Intravenous","Topical")
levels(data$bactrim_route.factor)=c("Oral","Irrigation","Inhalation","Intravenous","Topical")
levels(data$augmentin_route.factor)=c("Oral","Irrigation","Inhalation","Intravenous","Topical")
levels(data$bacitracin_route.factor)=c("Oral","Irrigation","Inhalation","Intravenous","Topical")
levels(data$cefdinir_route.factor)=c("Oral","Irrigation","Inhalation","Intravenous","Topical")
levels(data$dicloxacillin_route.factor)=c("Oral","Irrigation","Inhalation","Intravenous","Topical")
levels(data$clindamycin_route.factor)=c("Oral","Irrigation","Inhalation","Intravenous","Topical")
levels(data$colymycin_route.factor)=c("Oral","Irrigation","Inhalation","Intravenous","Topical")
levels(data$antibiotic_other_route.factor)=c("Oral","Irrigation","Inhalation","Intravenous","Topical")
levels(data$oral_steroid___1.factor)=c("Unchecked","Checked")
levels(data$oral_steroid___2.factor)=c("Unchecked","Checked")
levels(data$oral_steroid___3.factor)=c("Unchecked","Checked")
levels(data$steroid_nasal_spray___1.factor)=c("Unchecked","Checked")
levels(data$steroid_nasal_spray___2.factor)=c("Unchecked","Checked")
levels(data$other_medications___1.factor)=c("Unchecked","Checked")
levels(data$other_medications___2.factor)=c("Unchecked","Checked")
levels(data$other_medications___3.factor)=c("Unchecked","Checked")
levels(data$antibiotic_treatments_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$pulmonary_function_tests_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$left_frontal_sinus.factor)=c("0","1","2","3","4","5")
levels(data$right_frontal_sinus.factor)=c("0","1","2","3","4","5")
levels(data$left_maxillary_sinus.factor)=c("0","1","2","3","4","5")
levels(data$right_maxillary_sinus.factor)=c("0","1","2","3","4","5")
levels(data$left_anteriorethmoid_sinus.factor)=c("0","1","2","3","4","5")
levels(data$right_anteriorethmoid_sinus.factor)=c("0","1","2","3","4","5")
levels(data$left_posteriorethmoid_sinus.factor)=c("0","1","2","3","4","5")
levels(data$right_posteriorethmoid_sinus.factor)=c("0","1","2","3","4","5")
levels(data$left_sphenoid_sinus.factor)=c("0","1","2","3","4","5")
levels(data$right_sphenoid_sinus.factor)=c("0","1","2","3","4","5")
levels(data$ct_goss_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$left_frontal_sinuslm.factor)=c("0","1","2")
levels(data$right_frontal_sinuslm.factor)=c("0","1","2")
levels(data$left_maxillary_sinuslm.factor)=c("0","1","2")
levels(data$right_maxillary_sinuslm.factor)=c("0","1","2")
levels(data$left_anteriorethmoid_sinuslm.factor)=c("0","1","2")
levels(data$right_anteriorethmoid_sinuslm.factor)=c("0","1","2")
levels(data$left_posteriorethmoid_sinuslm.factor)=c("0","1","2")
levels(data$right_posteriorethmoid_sinuslm.factor)=c("0","1","2")
levels(data$left_sphenoid_sinuslm.factor)=c("0","1","2")
levels(data$right_sphenoid_sinuslm.factor)=c("0","1","2")
levels(data$left_ostiomeatal_complex.factor)=c("0","2")
levels(data$right_ostiomeatal_complex.factor)=c("0","2")
levels(data$ct_lundmckay_score_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$left_frontal_sinus_hb.factor)=c("0","1","2","3","4","5")
levels(data$right_frontal_sinus_hb.factor)=c("0","1","2","3","4","5")
levels(data$left_maxillary_sinus_hb.factor)=c("0","1","2","3","4","5")
levels(data$right_maxillary_sinus_hb.factor)=c("0","1","2","3","4","5")
levels(data$left_anteriorethmoid_sinus_hb.factor)=c("0","1","2","3","4","5")
levels(data$right_anteriorethmoid_sinus_hb.factor)=c("0","1","2","3","4","5")
levels(data$left_posteriorethmoid_sinus_hb.factor)=c("0","1","2","3","4","5")
levels(data$right_posteriorethmoid_sinus_hb.factor)=c("0","1","2","3","4","5")
levels(data$left_sphenoid_sinus_hb.factor)=c("0","1","2","3","4","5")
levels(data$right_sphenoid_sinus_hb.factor)=c("0","1","2","3","4","5")
levels(data$ct_goss_boyer_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$left_frontal_sinuslm_hb.factor)=c("0","1","2")
levels(data$right_frontal_sinuslm_hb.factor)=c("0","1","2")
levels(data$left_maxillary_sinuslm_hb.factor)=c("0","1","2")
levels(data$right_maxillary_sinuslm_hb.factor)=c("0","1","2")
levels(data$left_anteriorethmoid_sinuslm_hb.factor)=c("0","1","2")
levels(data$right_anteriorethmoid_sinuslm_hb.factor)=c("0","1","2")
levels(data$left_posteriorethmoid_sinuslm_hb.factor)=c("0","1","2")
levels(data$right_posteriorethmoid_sinuslm_hb.factor)=c("0","1","2")
levels(data$left_sphenoid_sinuslm_hb.factor)=c("0","1","2")
levels(data$right_sphenoid_sinuslm_hb.factor)=c("0","1","2")
levels(data$left_ostiomeatal_complex_hb.factor)=c("0","2")
levels(data$right_ostiomeatal_complex_hb.factor)=c("0","2")
levels(data$ct_lundmckay_score_boyer_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$complete_study.factor)=c("No","Yes")
levels(data$withdraw_reason.factor)=c("Non-compliance","Did not wish to continue in study","Could not tolerate the supplement","Hospitalization","Other")
levels(data$completion_data_complete.factor)=c("Incomplete","Unverified","Complete")
