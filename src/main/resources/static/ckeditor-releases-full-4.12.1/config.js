/**
 * @license Copyright (c) 2003-2019, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function(config) {
  // Define changes to default configuration here. For example:
  config.language = 'zh-cn';
  // config.uiColor = '#AADC6E';

  // config.plugins = 'dialogui,dialog,about,a11yhelp,dialogadvtab,basicstyles,bidi,blockquote,notification,button,toolbar,clipboard,panelbutton,panel,floatpanel,colorbutton,colordialog,templates,menu,contextmenu,copyformatting,div,resize,elementspath,enterkey,entities,popup,filetools,filebrowser,find,fakeobjects,flash,floatingspace,listblock,richcombo,font,forms,format,horizontalrule,htmlwriter,iframe,wysiwygarea,image,indent,indentblock,indentlist,smiley,justify,menubutton,language,link,list,liststyle,magicline,maximize,newpage,pagebreak,pastetext,pastefromword,preview,print,removeformat,save,selectall,showblocks,showborders,sourcearea,specialchar,scayt,stylescombo,tab,table,tabletools,tableselection,undo,lineutils,widgetselection,widget,notificationaggregator,uploadwidget,uploadimage,wsc,autogrow,docprops,iframedialog,placeholder,stylesheetparser,mediaembed,codemirror,onchange,confighelper,htmlbuttons,wordcount,symbol,maxheight,sharedspace,sourcedialog,stat,youtube,strinsert,mrmonkey,eqneditor,toolbarswitch,ckeditor_wiris,mathjax,image2,qrc,textselection,tliyoutube,showprotected,inlinecancel,page2images,imageresize,removespan,letterspacing,codesnippet,xml,ajax,codesnippetgeshi,noabp,stylesheetparser-fixed,nbsp,osem_googlemaps,leaflet,glyphicons,ckeditor-gwf-plugin,lightbox,ckwebspeech,simple-image-browser,chart,tweetabletext,sketchfab,html5validation,extraformattributes,embedbase,embedsemantic,dropdownmenumanager,simplebutton,ccmssourcedialog,fixed,textmatch,autolink,videodetector,basewidget,layoutmanager,uploadfile,Audio,markdown,token,imageuploader,bt_table,brclear,prism,pastecode,loremipsum,niftyimages,balloonpanel,a11ychecker,cleanuploader,label,bgimage,placeholder_select,deselect,enhancedcolorbuttton,pastefromexcel,selectallcontextmenu,scribens,videoembed,pre,simple-ruler,SPImage,simpleImageUpload,pasteFromGoogleDoc,internallink,toc,contents,yaqr,imagebase,balloontoolbar,cloudservices,easyimage,tableresizerowandcolumn,imageresizerowandcolumn,savemarkdown,api,media,openlink,inserthtmlfile,textIdent,textindent,detail,computedstyles,googleDocPastePlugin,textwatcher,autocomplete,mentions,emoji,mediabrowser,tangy-input,computedfont,spacingsliders,hkurlsplit,quote,powrformbuilder,powrsocialfeed,powrcomments,powrmediagallery,powrpaypalbutton,powrmultislider';

  config.extraPlugins = 'simage';
  config.imageUploadURL = '/topic/upload';
  config.dataParser = function(data){
	return data.data.src;
  };

  config.removeButtons = 'About,Save,NewPage,Preview';

  config.smiley_columns = 16;
  //   config.smiley_descriptions = [];
  config.smiley_images = [
    '0.gif',
    '10.gif',
    '11.gif',
    '12.gif',
    '13.gif',
    '14.gif',
    '15.gif',
    '16.gif',
    '17.gif',
    '18.gif',
    '19.gif',
    '1.gif',
    '20.gif',
    '21.gif',
    '22.gif',
    '23.gif',
    '24.gif',
    '25.gif',
    '26.gif',
    '27.gif',
    '28.gif',
    '29.gif',
    '2.gif',
    '30.gif',
    '31.gif',
    '32.gif',
    '33.gif',
    '34.gif',
    '35.gif',
    '36.gif',
    '37.gif',
    '38.gif',
    '39.gif',
    '3.gif',
    '40.gif',
    '41.gif',
    '42.gif',
    '43.gif',
    '44.gif',
    '45.gif',
    '46.gif',
    '47.gif',
    '48.gif',
    '49.gif',
    '4.gif',
    '50.gif',
    '51.gif',
    '52.gif',
    '53.gif',
    '54.gif',
    '55.gif',
    '56.gif',
    '57.gif',
    '58.gif',
    '59.gif',
    '5.gif',
    '60.gif',
    '61.gif',
    '62.gif',
    '63.gif',
    '64.gif',
    '65.gif',
    '66.gif',
    '67.gif',
    '68.gif',
    '69.gif',
    '6.gif',
    '70.gif',
    '71.gif',
    '7.gif',
    '8.gif',
    '9.gif'
  ];
  config.smiley_path = '/images/face/';
};
CKEDITOR.config = {};
