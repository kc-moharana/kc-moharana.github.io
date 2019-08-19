library(scholar)
library(ggplot2)

prof_id = 'KFmiTPEAAAAJ'  # google scholar profile id
cit <- get_citation_history(prof_id)
png('scholar_citations_Moharana_KC.png',width=800,height=500,res=300)
  ggplot(cit,aes(x=factor(year),y=cites))+
    geom_bar(stat='identity', fill='#253494')+
    theme_bw()+ theme(axis.text.x=element_text(angle=45, hjust=1))+
  xlab('Year of citation')+
  ylab('Google Scholar\n cites')+
  annotate('text',label=format(Sys.time(), "%Y-%m-%d %H:%M:%S %Z"),x=-Inf,y=Inf,vjust=1.5,hjust=-0.05,size=3,colour='gray')
dev.off()

coauthor_network <- get_coauthors(prof_id)
png('Co_authorNetwork_Moharana_KC.png',width=2000,height=1500, res=400)
plot_coauthors(coauthor_network, size_labels=2)
dev.off()
p <- plot_coauthors(coauthor_network, size_labels=10)
p <- p+annotate('text',label=format(Sys.time(), "%Y-%m-%d %H:%M:%S %Z"),x=-Inf,y=Inf,vjust=1.5,hjust=-0.05,size=3,colour='gray')
pdf('Co_authorNetwork_Moharana_KC.pdf',width=16,height=12)
print(p)
dev.off()
