#--create map of EBS shelf survey grid
require(magrittr);
require(ggplot2);
# require(tcsamSurveyData);
# require(wtsGIS);

#--get basemap layers
bmls = wtsGIS::gg_CreateBasemapLayers();
#--get survey grid
grid = tcsamSurveyData::gisGetSurveyGridLayers();

p = ggplot(grid$grid) +
      bmls$bathym +
      bmls$land +
      geom_sf(colour="grey",fill=NA) +
      bmls$map_scale +
      bmls$theme +
      theme(panel.background=element_rect(colour="black",fill="white"),
            panel.border=element_rect(colour="black",fill=NA));
dims = wtsUtilities::gg_FixOnePlotDim(p,fxdDim=6,fitWidth=TRUE,units="in")     
ggsave(plot=p,filename="SurveyGrid_EBS_ShelfSurvey_BW.png",width=dims$width,height=dims$height,dpi=200)
ggsave(plot=p,filename="SurveyGrid_EBS_ShelfSurvey_BW.pdf",width=dims$width,height=dims$height)

