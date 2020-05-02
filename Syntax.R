#### Crossing thresholds: The use of spatial analysis to identify
######### identification of the Colombian conflict
### January 15, 2019

#####     Agustin Palao
#####                    GLMM_ADBM model

#### GLMM_ADBM package installation #####

install.packages("R2admb")
install.packages("glmmADMB",
                 repos=c("http://glmmadmb.r-forge.r-project.org/repos",
                         getOption("repos")),
                 type="source")

library(glmmADMB)

#### Database ####

Master_AB<- readRDS("Data.rds")

#### Model #####
## Model 5 in Holmes et.al (2018)
fit_nb2Mod5<- glmmadmb(DV_VE_AB~SocServicespc_b08_MS+
                         pctj_hthcov+
                         CC_Hect_T2_MS+
                         GDP_Agr_T1_MS+
                         GDP_Min_T1_MS+
                         AE_Hect_MS+
                         Forest_pctg+
                         slope+
                         GDPpcConst_MS+
                         AB_pre_Viol_MS+
                         Pop+
                         HotSpot+
                         HotSpot_T1+
                        (1|ID_Mun)+(1|Department),
                       data=Master_AB,
                       zeroInflation=FALSE,
                       family="nbinom")

summary(fit_nb2Mod5)








