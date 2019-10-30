addpath(genpath([root, 'cbrewer'])) % change to path of cbrewer

% load data
df=readtable('decoder_acc.csv');
mean_kfold_score=table2array(df);

data=mean(mean_kfold_score,1);
mask_name=strrep(mask_name,'_',' ');

% setup colors
colormap=cbrewer('qual', 'Set2', length(mask_name));

% draw barplot
figure('position',[0 0 900 600])
b=bar(data,.7);
b.FaceColor='flat';
b.CData=colormap;
ylim([.45, .65])
ylabel('Decoding Accuracy (%)','fontweight','bold','fontsize',12)

% fix xtick labels
xticklabels(mask_name);
xtickangle(45)
ax = ancestor(b, 'axes');
set(gca,'xticklabel',ax.XTickLabel,'fontweight','bold')
hold on

% add errorbar
for m=1:length(mask_filename)
    x=mean_kfold_score(:,m);
    sem(1,m) = std(x)/sqrt(length(x));
end
er = errorbar(1:length(mask_filename),data,sem,'linewidth',2);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
hold on

chance=yline(.5,'--k','linewidth',1);
box off