import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt


data = pd.read_csv('hddm_tbl.csv')


f, axes = plt.subplots(1, 2, figsize=(12,6), sharex=True)
sns.distplot(data['rt'][data.cond=='easy'], color="blue", kde_kws=dict(linewidth=2.5), label="easy", ax=axes[0], axlabel="RT")
axes[0].set_title('Easy Trials',fontsize=14)
axes[0].set_ylabel('Density', fontsize=10)
sns.distplot(data['rt'][data.cond=='ambig'], color="red", kde_kws=dict(linewidth=2.5), label="ambiguous", ax=axes[1], axlabel="RT")
axes[1].set_title('Ambiguous Trials',fontsize=14)
plt.xlim(0, 7)
sns.despine()
