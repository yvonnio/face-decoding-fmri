data<-read.csv("ugm_tbl.csv",header = TRUE)

df_remove_outlier=data[-nrow(data),]

library("ggpubr")
plt<-ggscatter(df_remove_outlier, x="ugm_m", y="caudate", 
          add = "reg.line", conf.int = TRUE, add.params = list(color = "black",fill = "gray"),
          cor.coef.args = list(method = "spearman", label.x = 6, label.sep = "\n"),
          color ="#56B4E9",
          ylim=c(-5,5),
          xlab = "Urgency Parameter (m)", ylab = "Mean Beta Caudate BOLD Signal")
