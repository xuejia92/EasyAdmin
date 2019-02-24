function ExoWidget(){}ExoWidget.prototype={wdgtPadding:44,wdgtWindow:{},wdgtOuter:{},wdgtInner:{},wdgtCss:!1,wdgtClose:{},windowWidth:0,cssNode:!1,htmlNode:!1,fonts:[],cookieExp:30,cookiePrefix:"",frequencyCount:0,showOnDelay:!1,zoneId:0,triggerType:0,triggerSelector:"body",displayAllowed:!0,layout:{},url:null,redirectUrl:null,destUrl:null,init:function(e){this.windowWidth=Math.max(document.documentElement.clientWidth,window.innerWidth||0),void 0!==e&&this.setOptions(e),0<this.fonts.length&&this.addFonts();var t=this;this.domReady(function(){t.checkShownCookie()?void 0!==t.destUrl&&null!==t.destUrl&&window.location.replace(t.destUrl):(t.add(),t.addCss(),t.loadEvents(),setTimeout(function(){t.showOnDelay&&t.show()},1e3*t.delay))})},cookieManager:{create:function(e,t,i,n){var o="";if(n)o="; expires=0";else if(i){var d=new Date;d.setTime(d.getTime()+60*i*1e3),o="; expires="+d.toGMTString()}document.cookie=e+"="+t+o+"; path=/"},get:function(e){for(var t=e+"=",i=document.cookie.split(";"),n=0;n<i.length;n++){for(var o=i[n];" "===o.charAt(0);)o=o.substring(1,o.length);if(0===o.indexOf(t))return o.substring(t.length,o.length)}return null},erase:function(e){this.create(e,"",-1)}},getShownCookieValue:function(){var e={count:0,expires:null},t=this.cookieManager.get(this.cookiePrefix+"_shown_"+this.zoneId);if("string"!=typeof t)return e;var i=t.split("|"),n=parseInt(i[0]),o=new Date(i[1]);return isNaN(n)||isNaN(o.getDate())||(e.count=n,e.expires=o),e},checkShownCookie:function(){if(this.cookieExp<=0)return this.cookieManager.erase(this.cookiePrefix+"_shown_"+this.zoneId),!1;var e=this.getShownCookieValue();return 0<this.frequencyCount&&e.count>=this.frequencyCount},addFonts:function(){for(var e=0;e<this.fonts.length;e++){var t=document.createElement("link");t.href=this.fonts[e],t.type="text/css",t.rel="stylesheet",document.head.appendChild(t)}},add:function(){},addEvent:function(e,t,i){e.addEventListener?e.addEventListener(t,i,!1):e.attachEvent&&e.attachEvent("on"+t,i)},setOptions:function(e){this.width=void 0===e.width?this.width:e.width,this.height=void 0===e.height?this.height:e.height,this.htmlNode=void 0===e.htmlNode?this.htmlNode:e.htmlNode,this.fonts=void 0===e.fonts?this.fonts:e.fonts,this.delay=void 0===e.delay?this.delay:e.delay,this.showOnDelay=void 0===e.showOnDelay?this.showOnDelay:e.showOnDelay,this.cookieExp=void 0===e.cookieExp?this.cookieExp:e.cookieExp,this.cookiePrefix=void 0===e.cookiePrefix?this.cookiePrefix:e.cookiePrefix,this.zoneId=void 0===e.zoneId?this.zoneId:e.zoneId,this.triggerType=void 0===e.triggerType?this.triggerType:e.triggerType,this.triggerSelector=void 0===e.triggerSelector?this.triggerSelector:e.triggerSelector,this.frequencyCount=void 0===e.frequencyCount?this.frequencyCount:e.frequencyCount,this.wdgtPadding=void 0===e.wdgtPadding?this.wdgtPadding:e.wdgtPadding,this.layout=void 0===e.layout?{}:e.layout,this.url=void 0===e.nativeWidgetUrl?null:e.nativeWidgetUrl,this.adsData=void 0===e.adsData?null:e.adsData,this.redirectUrl=void 0===e.redirectUrl?null:e.redirectUrl,this.destUrl=void 0===e.destUrl?null:e.destUrl},addCss:function(){this.wdgtCss&&this.htmlNode.insertBefore(this.wdgtCss,this.htmlNode.firstChild)},domReady:function(e){"interactive"===document.readyState||"complete"===document.readyState?e():this.addEvent(document,"DOMContentLoaded",e)},loadEvents:function(){var t=this;this.addEvent(this.wdgtClose,"click",function(e){e.stopPropagation(),t.hide()})},isValidBrowser:function(){return!(window.attachEvent&&!window.addEventListener)},createFakeUrl:function(e,t){return"https://"+this.extractDomain(t)+"/"+e.replace(/[^A-Za-z0-9 ]/g,"").replace(/ /g,"-").toLowerCase()},extractDomain:function(e){return(-1<e.indexOf("://")?e.split("/")[2]:e.split("/")[0]).split(":")[0]},generateSingleAd:function(e,t){var i=document.createElement("div");i.className="exo-native-widget-item-container";var n=document.createElement("a");n.className="exo-native-widget-item",this.isValidBrowser()?(n.setAttribute("href",this.createFakeUrl(e.title,e.original_url)),n.setAttribute("real-href",e.url),n.setAttribute("oncontextmenu","setRealHref(event)"),n.setAttribute("onmouseup","setRealHref(event)")):n.href=e.url,n.setAttribute("rel","nofollow"),t&&n.setAttribute("target","_blank");var o=document.createElement("div");o.className="exo-native-widget-item-image",o.style.backgroundImage='url("'+e.image+'")',o.style.backgroundPosition=e.image_position,n.appendChild(o);var d=document.createElement("div");d.className="exo-native-widget-item-content";var a=document.createElement("div");a.className="exo-native-widget-item-title",a.innerHTML=e.title,d.appendChild(a);var r,s,l=document.createElement("div");if(l.className="exo-native-widget-item-text",l.innerHTML=e.description,d.appendChild(l),n.appendChild(d),null!=e.imptrackers&&0<e.imptrackers.length)for(s=0;s<e.imptrackers.length;s++)(r=document.createElement("img")).src=e.imptrackers[s],r.width=1,r.height=1,n.appendChild(r);if(null!=e.eventtrackers&&0<e.eventtrackers.length)for(s=0;s<e.eventtrackers.length;s++)(r=document.createElement("img")).src=e.eventtrackers[s],r.width=1,r.height=1,n.appendChild(r);return n.appendChild(this.generateClearDiv()),i.appendChild(n),i},generateClearDiv:function(){var e=document.createElement("div");return e.className="clear",e},prepareData:function(e,t){var i=document.querySelectorAll('[data-idzone="'+this.zoneId+'"]');if(void 0!==i&&1===i.length)try{if(void 0===e.data||0===e.data.length)return void this.hide();for(var n=this.htmlNode.getElementsByClassName("exo-native-widget-outer-container")[0],o=1,d=0;d<e.data.length;d++)n.appendChild(this.generateSingleAd(e.data[d],this.layout.open_in_new_window)),o%this.layout.itemsPerRow||n.appendChild(this.generateClearDiv()),o++;void 0!==t&&t(e)}catch(e){return}},getAdAndShow:function(t){if(void 0!==this.dataRequested){if(this.dataRequested++,3<=this.dataRequested)return}else this.dataRequested=0;if(void 0!==this.adsData&&this.adsData)this.prepareData({data:this.adsData},t);else if(null!==this.url){var i=this,e=new XMLHttpRequest;e.onreadystatechange=function(){var e=this;4===e.readyState&&200===e.status&&((4!==e.readyState||200===e.status)&&e.responseText?i.prepareData(JSON.parse(e.responseText),t):i.hide())},e.open("GET",this.url,!0),e.withCredentials=!0,e.timeout=3e3,e.send()}else this.hide()},show:function(){},hide:function(){this.htmlNode.style.display="none"},incrementFrequencyCount:function(){var e,t=this.getShownCookieValue(),i=new Date,n="";null!==t.expires?(n=t.expires.toGMTString(),e=Math.max(0,Math.round((t.expires-i)/1e3/60))):(i.setTime(i.getTime()+60*this.cookieExp*1e3),n=i.toGMTString(),e=this.cookieExp);var o=t.count+1+"|"+n;this.cookieManager.create(this.cookiePrefix+"_shown_"+this.zoneId,o,e,!1)}};var ExoExit=function(){},ExoInter=function(){},ExoInline=function(){};ExoExit.prototype=Object.create(ExoWidget.prototype),ExoExit.prototype.overflowDefault="visible",ExoExit.prototype.showOnDelay=!1,ExoExit.prototype.delay=!1,ExoExit.prototype.addCss=function(){this.wdgtCss=document.createElement("style");var e,t=void 0===this.layout.widgetWidth?"718px":this.layout.widgetWidth;e=void 0===this.layout.widget_background_color||""===this.layout.widget_background_color||"inherit"===this.layout.widget_background_color?"#FFFFFF":this.layout.widget_background_color,this.wdgtCss.innerHTML='#exoWdgt:before,#exoWdgt>*{display:inline-block;vertical-align:middle} #exoWdgt,#exoWdgt:before{content:"";overflow:hidden} #exoWdgt{display:block;position:fixed;top:0;left:0;right:0;bottom:0;background:rgba(0,0,0,.6);z-index:-1;opacity:0;transition:opacity .2s,z-index 0s .2s;text-align:center;overflow-y:auto;white-space:nowrap;-webkit-overflow-scrolling:touch}#exoWdgt>*{white-space:normal;text-align:left} #exoWdgt:before{width:0;height:100%} #exoWdgt.widget-visible{z-index:99;opacity:1;transition:opacity .2s} #exoWdgtOuter{padding:'+this.wdgtPadding+"px;width:100%;max-width:"+t+";position:relative;overflow:hidden;overflow-x:hidden;overflow-y:auto;background:"+e+";z-index:-1;opacity:0;transform:scale(0);transition:opacity .2s,transform .2s,z-index 0s .2s} .widget-visible  #exoWdgtOuter{z-index:100;opacity:1;transform:scale(1);transition:opacity .2s,transform .2s} #exoWdgtClose{float:right;display:block;width:24px;height:24px;cursor:pointer;text-align:center;background:url(data:image/svg+xml;base64,PHN2ZyBmaWxsPSIjMDAwMDAwIiBoZWlnaHQ9IjI0IiB2aWV3Qm94PSIwIDAgMjQgMjQiIHdpZHRoPSIyNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4gICAgPHBhdGggZD0iTTE5IDYuNDFMMTcuNTkgNSAxMiAxMC41OSA2LjQxIDUgNSA2LjQxIDEwLjU5IDEyIDUgMTcuNTkgNi40MSAxOSAxMiAxMy40MSAxNy41OSAxOSAxOSAxNy41OSAxMy40MSAxMnoiLz4gICAgPHBhdGggZD0iTTAgMGgyNHYyNEgweiIgZmlsbD0ibm9uZSIvPjwvc3ZnPg==) no-repeat #fff} #exoWdgtClose:hover{opacity:.6;transition:all .4s ease-in-out}",this.htmlNode.style.maxWidth="100%",ExoWidget.prototype.addCss.call(this)},ExoExit.prototype.show=function(){if(!this.checkShownCookie()&&this.displayAllowed){var e=this;this.getAdAndShow(function(){e.wdgtWindow.classList.add("widget-visible"),e.displayAllowed=!1,e.incrementFrequencyCount(),e.overflowDefault=document.body.style.overflow,document.body.style.overflow="hidden",ExoWidget.prototype.show.call(e)})}},ExoExit.prototype.hide=function(){this.wdgtWindow.classList.remove("widget-visible"),document.body.style.overflow=this.overflowDefault},ExoExit.prototype.loadEvents=function(){var i=this;this.addEvent(document,"mouseout",function(e){if("input"!=(e=e||window.event).target.tagName.toLowerCase()){var t=e.relatedTarget||e.toElement;t&&"HTML"!=t.nodeName||i.show()}}.bind(this)),ExoWidget.prototype.loadEvents.call(this)},ExoExit.prototype.add=function(){this.wdgtWindow=document.createElement("div"),this.wdgtWindow.id="exoWdgt",this.wdgtOuter=document.createElement("div"),this.wdgtOuter.id="exoWdgtOuter",this.wdgtOuter.style.paddingTop="calc("+this.wdgtPadding+"px - 24px)",(this.htmlNode.getElementsByClassName("exo-native-widget-header-bottom")[0]||!1)&&(this.wdgtOuter.style.paddingBottom="calc("+this.wdgtPadding+"px - 24px)"),this.wdgtInner=document.createElement("div"),this.wdgtInner.id="exoWdgtInner",this.wdgtClose=document.createElement("span"),this.wdgtClose.id="exoWdgtClose",this.htmlNode&&this.wdgtInner.appendChild(this.htmlNode);var e=this.htmlNode.getElementsByClassName("exo-native-widget-header")[0]||!1;e&&(e.style.lineHeight="18px");var t=this.htmlNode.getElementsByClassName("exo-native-widget-outer-container")[0],i=document.createElement("div");i.className="clear",this.htmlNode.insertBefore(this.wdgtClose,t),this.htmlNode.insertBefore(i,t),this.wdgtOuter.appendChild(this.wdgtInner),this.wdgtWindow.appendChild(this.wdgtOuter),document.body.appendChild(this.wdgtWindow)},ExoInter.prototype=Object.create(ExoWidget.prototype),ExoInter.prototype.transitionSeconds=1.5,ExoInter.prototype.addCss=function(){var e,t=this.windowWidth;e=void 0===this.layout.widget_background_color||""===this.layout.widget_background_color||"inherit"===this.layout.widget_background_color?"#FFFFFF":this.layout.widget_background_color,this.wdgtCss=document.createElement("style"),this.wdgtCss.innerHTML="#exoWdgt {display:table; visibility:hidden;  position:fixed; width:100%; height:100%; overflow:hidden; top:0px; left:"+t+"px;}#exoWdgtOuter {padding:"+this.wdgtPadding+"px;width:"+this.windowWidth+"px; left:"+t+"px; display: table-cell; vertical-align: middle; height:100%; position:absolute; margin:0px; padding:0px; -webkit-transform: translateX(0px); transform: translateX(0px); transition: all "+this.transitionSeconds+"s ease; -webkit-transition: all "+this.transitionSeconds+"s ease;}#exoWdgtOuter #exoWdgtClose { display:table; position:absolute; z-index:9; cursor:pointer; color: #000; right:2%; top:5%; background: #fff; padding: 4px 0 4px 8px; font-family: helvetica,arial,sans-serif; }div.exo-native-widget { background-color:"+e+" !important;padding: "+this.wdgtPadding+"px }#exoWdgtInner {margin-left: auto; margin-right: auto; list-style:none; position: relative; float: left; margin: 0; padding: 0; width: 500px; height: 100%; background:rgba(0,0,0,.6); text-align: center; background-size: cover;  background-position:50% 50%; color:#fff; -webkit-transform: translate3d(0px,0px,0px); -webkit-transform-style: preserve-3d;}#exoWdgtInner:before {content: ''; display: inline-block; height: 100%; vertical-align: middle; margin-right: -0.25em;}.centered {display: inline-block; vertical-align: middle;}",this.wdgtInner.style.width=this.windowWidth+"px",ExoWidget.prototype.addCss.call(this)},ExoInter.prototype.show=function(e){if(!this.checkShownCookie()){if(2===this.triggerType)return this.redirectUrl=this.redirectUrl+"&t=nint&dest="+encodeURIComponent(e.href),void(window.location=this.redirectUrl);var t=this;this.getAdAndShow(function(){t.wdgtWindow.classList.contains("widget-visible")||t.incrementFrequencyCount(),t.wdgtWindow.classList.add("widget-visible"),document.body.style["-ms-overflow-style"]="none",t.wdgtWindow.style.left="0px",t.wdgtOuter.style.left="0px",t.wdgtOuter.style.transform="translateX(0px)",t.wdgtOuter.style["-ms-transform"]="translateX(0px)",t.wdgtOuter.style["-webkit-transform"]="translateX(0px)",t.wdgtInner.style.width=t.windowWidth+"px",t.wdgtOuter.style.width=t.windowWidth+"px",t.wdgtWindow.style.visibility="visible",t.wdgtOuter.style.visibility="visible",ExoWidget.prototype.show.call(t)})}},ExoInter.prototype.hide=function(){var e=this;void 0===this.destUrl||null===this.destUrl?(this.wdgtWindow.classList.remove("widget-visible"),this.wdgtOuter.style.transform="translateX(-"+this.windowWidth+"px)",this.wdgtWindow.style.visibility="hidden",this.wdgtOuter.style.visibility="hidden",setTimeout(function(){e.wdgtOuter.style.width=null,e.wdgtOuter.style.left=null,e.wdgtWindow.style.left=null,e.wdgtOuter.style.transform=null,document.body.style["-ms-overflow-style"]="scrollbar"},1e3*this.transitionSeconds+500)):window.location.replace(this.destUrl)},ExoInter.prototype.add=function(){this.wdgtWindow=document.createElement("div"),this.wdgtWindow.id="exoWdgt",this.wdgtOuter=document.createElement("div"),this.wdgtOuter.id="exoWdgtOuter",this.wdgtInner=document.createElement("div"),this.wdgtInner.id="exoWdgtInner",this.wdgtClose=document.createElement("span"),this.wdgtClose.id="exoWdgtClose";var e=document.createElement("span");e.style.verticalAlign="middle",e.style.display="table-cell",e.appendChild(document.createTextNode("Continue to Site"));var t=document.createElement("img");t.src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACQAAAAkCAQAAABLCVATAAAAWklEQVR4AWOgORgFo0CYQYgaxogwXGA4R7lRLEBD/gMhFYxKYPg3CI1KHJRGJQ1Ko1oY/oPhHsqMMWJ4BzIGSBoNamNGjWFhuEOxMQgXwYyh2CggHIpgFIwCAO4oQ1s4juqUAAAAAElFTkSuQmCC",t.style.verticalAlign="middle",t.style.display="table-cell",this.wdgtClose.appendChild(e),this.wdgtClose.appendChild(t),this.htmlNode&&(this.wdgtInner.appendChild(this.htmlNode),this.wdgtInner.firstChild.classList.add("centered"),this.wdgtInner.appendChild(this.wdgtClose));var i=this.htmlNode.getElementsByClassName("exo-native-widget-header")[0]||!1,n=this.htmlNode.getElementsByClassName("exo-native-widget-header-bottom")[0]||!1;n&&!i&&(this.htmlNode.style.paddingBottom="calc("+this.wdgtPadding+"px - 21px)"),i&&(i.style.lineHeight="18px",i.style.width="calc(100% - "+this.layout.item_padding+")",i.style.float="right",n||(this.htmlNode.style.paddingTop="calc("+this.wdgtPadding+"px - 21px)")),this.wdgtOuter.appendChild(this.wdgtInner),this.wdgtWindow.appendChild(this.wdgtOuter),document.body.appendChild(this.wdgtWindow)},ExoInter.prototype.loadEvents=function(){var t=this;if(this.addEvent(window,"resize",function(){t.windowWidth=Math.max(document.documentElement.clientWidth,window.innerWidth||0),t.wdgtInner.style.width=t.windowWidth+"px",t.wdgtOuter.style.width=t.windowWidth+"px",t.wdgtOuter.style.left="0px"}),2===this.triggerType){var e,i=document.querySelectorAll(this.triggerSelector);for(e=0;e<i.length;e++)this.addEvent(i[e],"click",function(e){if(!this.classList.contains("continue")){if("a"!==e.target.tagName.toLowerCase())return;e.preventDefault(),t.show(e.target),this.classList.add("continue")}})}ExoWidget.prototype.loadEvents.call(this)},ExoInline.prototype=Object.create(ExoWidget.prototype),ExoInline.prototype.loadEvents=function(){},ExoInline.prototype.show=function(){this.getAdAndShow()},ExoInline.prototype.add=function(){var e=document.querySelectorAll('[data-idzone="'+this.zoneId+'"]');void 0!==e&&1===e.length&&this.htmlNode&&e[0].parentNode.insertBefore(this.htmlNode,e[0].nextSibling);var t=this.htmlNode.getElementsByClassName("exo-native-widget-header")[0]||!1;t&&(t.style.width="calc(100% - "+this.layout.item_padding+")",t.style.float="right")},function(){var w=document.scripts[document.scripts.length-1].getAttribute("data-idzone"),o=document.scripts[document.scripts.length-1].getAttribute("data-ref"),e=document.scripts[document.scripts.length-1].getAttribute("data-idzone-fallback"),t=document.scripts[document.scripts.length-1].getAttribute("data-force-zone-refresh"),i=document.scripts[document.scripts.length-1].getAttribute("data-ad_tags"),d=document.scripts[document.scripts.length-1].getAttribute("data-dest");void 0===t&&(t=!1);var n,a=document.scripts[document.scripts.length-1].getAttribute("data-ad_sub"),r=document.scripts[document.scripts.length-1].getAttribute("data-email"),s=document.scripts[document.scripts.length-1].getAttribute("data-el");n=null!=o?o:top===self?document.URL:document.referrer;var l=document.createElement("a");if(l.setAttribute("href",document.scripts[document.scripts.length-1].getAttribute("src")),null===w)for(var g=2;w=document.scripts[document.scripts.length-g].getAttribute("data-idzone"),l.setAttribute("href",document.scripts[document.scripts.length-g].getAttribute("src")),g++,null===w&&g<5;);var h,c,p,m,u,x,v,f,y=l.hostname.split(".");y.length&&(y[0]=y[0].replace("ads","syndication")),void 0!==e&&e?(c=l.protocol+"//"+y.join(".")+"/splash.php?native-settings=1&split=1&main_zone="+w+"&fallback_zone="+e+"&ref="+encodeURI(document.location.href),p=l.protocol+"//"+y.join(".")+"/splash-zones-split.php?main_zone="+w+"&fallback_zone="+e+"&ref="+encodeURI(document.location.href),h=l.protocol+"//"+y.join(".")+"/postitial.php?split=1&main_zone="+w+"&fallback_zone="+e+"&ref="+encodeURI(document.location.href)):(c=l.protocol+"//"+y.join(".")+"/splash.php?native-settings=1&idzone="+w,p=l.protocol+"//"+y.join(".")+"/splash.php?idzone="+w,h=l.protocol+"//"+y.join(".")+"/postitial.php?idzone="+w),t&&(c+="&forceZoneRefresh="+t,p+="&forceZoneRefresh="+t,h+="&forceZoneRefresh="+t),null!=a&&(c+="&sub="+a,p+="&sub="+a,h+="&sub="+a),null!=n&&(c+="&p="+encodeURIComponent(n),p+="&p="+encodeURIComponent(n),h+="&ref="+encodeURIComponent(n)),null!=r&&(c+="&email="+r,p+="&email="+r,h+="&email="+r),null!=i&&(c+="&tags="+i,p+="&tags="+i,h+="&tags="+i),null!=s&&(c+="&el="+encodeURIComponent(s),p+="&el="+encodeURIComponent(s),h+="&el="+encodeURIComponent(s)),m=c,u=!0,x=3e3,v=function(){if(4===this.readyState&&200===this.status&&this.responseText){var e=document.querySelectorAll('[data-idzone="'+w+'"]');if(void 0!==e&&1===e.length)try{var t,i,n=JSON.parse(this.responseText);void 0!==n.data&&void 0!==n.layout?(t=n.data,i=n.layout):i=n,null!=o?i.adTriggerType=1:1===i.adTriggerType&&(i.adTriggerType=2,i.popTriggerMethod=3),function(e,t,i,n,o){var d=document.createElement("div");d.id="exoNativeWidget"+w,d.className="exo-native-widget",e=function(e){var t=[];t.textBoxWidth=0,t.textBoxHeight=0,t.textPaddingLeft=0,t.widgetWidth=parseInt(e.widget_width),t.widgetHeight=parseInt(e.widget_height),t.imgWidth=parseInt(e.image_width),t.imgHeight=parseInt(e.image_height);var i=e.text_position,n=parseInt(e.item_padding),o=(parseInt(e.format),parseInt(e.text_box_size)),d=1===e.title_enabled||1===e.description_enabled,a=e.header_enabled||"native-exit"===e.publisherAdType?21:0,r="native-exit"===e.publisherAdType?0:n;for(var s in t.widgetItemPadding=e.header_enabled?n:0,t.widgetReversedItemPadding=e.header_enabled?0:r,t.itemWidth=t.imgWidth,t.itemHeight=t.imgHeight,d&&(t.textBoxWidth="bottom"===i?t.imgWidth:o,t.textBoxHeight="right"===i?t.imgHeight:o,"right"===i?(t.itemWidth=t.imgWidth+o+6*(e.itemsPerRow-1),t.textPaddingLeft=5):t.itemHeight=t.imgHeight+o+6*(e.itemsPerCol-1)),t.widgetWidthMin=t.itemWidth*e.itemsPerRow+n*(e.itemsPerRow-1),t.widgetHeightMin=t.itemHeight*e.itemsPerCol+n*(e.itemsPerCol-1)+a,0==t.widgetWidth||isNaN(t.widgetWidth)?t.widgetWidth=t.widgetWidthMin:"native-exit"===e.publisherAdType&&(t.widgetWidth=t.widgetWidth-2*_),(0==t.widgetHeight||isNaN(t.widgetHeight))&&(t.widgetHeight=t.widgetHeightMin),t.horizontalMargin=(t.widgetWidth-(t.itemWidth*e.itemsPerRow+n*(e.itemsPerRow-1)))/(e.itemsPerRow+1),t.verticalMargin=(t.widgetHeight-a-(t.itemHeight*e.itemsPerCol+n*(e.itemsPerCol-1)))/(e.itemsPerCol+1),t.internalHorizontalPadding=n+t.horizontalMargin,t.internalVerticalPadding=n+t.verticalMargin,"native-exit"===e.publisherAdType&&e.header_enabled&&!e.header_is_on_top&&(t.widgetItemPadding+=t.internalVerticalPadding+21),t.widgetMainPadding=0,"native-interstitial"===e.publisherAdType&&(t.widgetMainPadding=_+21,e.header_enabled||(t.widgetItemPadding+=21)),t)isNaN(t[s])?e[s]="":e[s]=t[s]+"px";return e}(e),d.appendChild(function(e){var t=document.createElement("style");e.zone_id_prefix="#exoNativeWidget"+w,e.calculated_item_width=100/e.itemsPerRow+"%",e.item_title_display="block",e.title_enabled||(e.item_title_display="none"),e.item_description_display="block",e.description_enabled||(e.item_description_display="none"),e.string_image_border_style="",e.image_border_size&&e.image_border_color&&(e.string_image_border_style="border: "+e.image_border_size+" solid "+e.image_border_color+";"),"right"===e.text_position?(e.native_ad_zone_image_float="left",e.native_ad_zone_text_margin="",e.native_ad_zone_image_margin="0 0 0 "+e.horizontalMargin,e.native_ad_zone_image_width="width: "+e.imgWidth):(e.native_ad_zone_image_float="none",e.native_ad_zone_text_margin="auto",e.native_ad_zone_image_margin="auto",e.native_ad_zone_image_width="max-width: "+e.imgWidth);var i='.exo-native-widget * {    box-sizing: content-box;}{{zone_id_prefix}}.exo-native-widget {    width: 100%;    height: calc({{widgetHeight}} + {{widgetItemPadding}} + {{widgetMainPadding}});    max-width: {{widgetWidth}};    background-color: {{widget_background_color}};    box-sizing: border-box;    clear: both;    overflow: hidden;}{{zone_id_prefix}}.exo-native-widget .clear {    clear: both;}{{zone_id_prefix}}.exo-native-widget .exo-native-widget-outer-container {    width: calc(100% + {{item_padding}});    margin-left: -{{item_spacing_on_each_side}};    margin-top: -{{widgetReversedItemPadding}};}{{zone_id_prefix}}.exo-native-widget .exo-native-widget-header {    width: calc(100% - 30px - {{item_padding}});    float: left;    clear: both;    overflow: hidden;    line-height: 14px;    white-space: nowrap;    text-align: {{header_text_align}};    font-family: {{font_family}};    font-size: {{header_font_size}};    color: {{header_font_color}};    padding-left: {{item_spacing_on_each_side}};    padding-right: {{item_spacing_on_each_side}};    padding-top: 3px;    padding-bottom: 0;    height: 18px;    box-sizing: content-box;}{{zone_id_prefix}}.exo-native-widget .exo-native-widget-header a,{{zone_id_prefix}}.exo-native-widget .exo-native-widget-header a:visited {    text-decoration: none;    font-family: {{font_family}};    font-size:  {{header_font_size}};    color: {{header_font_color}};    display: inline-block;    height: 14px;    vertical-align: text-bottom;}{{zone_id_prefix}}.exo-native-widget .exo-native-widget-header a span {    display: inline-block;    height: 14px;    vertical-align: text-bottom;    width: 47px;    background: rgba(0, 0, 0, 0) url("{{branding_logo}}") repeat scroll 0 0 / 47px 14px;}{{zone_id_prefix}}.exo-native-widget .exo-native-widget-header a span:hover {    background: rgba(0, 0, 0, 0) url("{{branding_logo_hover}}") repeat scroll 0 0 / 47px 14px;}{{zone_id_prefix}}.exo-native-widget .exo-native-widget-header a img {    vertical-align: text-bottom;}{{zone_id_prefix}}.exo-native-widget .exo-native-widget-header-bottom {    padding-top: {{internalVerticalPadding}};}{{zone_id_prefix}}.exo-native-widget .exo-native-widget-item-container {    float: left;    width: calc({{calculated_item_width}} - {{item_padding}});    height: {{itemHeight}};    margin-top: {{internalVerticalPadding}};    overflow: hidden;    padding: 0 {{item_spacing_on_each_side}};}{{zone_id_prefix}}.exo-native-widget .exo-native-widget-item-container .exo-native-widget-item {    display: block;    text-decoration: none;    overflow: hidden;    box-sizing: border-box;}{{zone_id_prefix}}.exo-native-widget .exo-native-widget-item-container .exo-native-widget-item .exo-native-widget-item-image {    overflow: hidden;    height: {{imgHeight}};    {{native_ad_zone_image_width}};    background-size: cover;    background-repeat: no-repeat;    background-position: 50% 50%;    margin: {{native_ad_zone_image_margin}};    float: {{native_ad_zone_image_float}};    box-sizing: border-box;    {{string_image_border_style}}}{{zone_id_prefix}}.exo-native-widget .exo-native-widget-item-container .exo-native-widget-item .exo-native-widget-item-content {    margin-top: {{text_margin_top}};    margin-bottom: {{text_margin_bottom}};    margin-left: 0;    margin-right: 0;    padding: 0;    text-align: {{text_align}};    padding-left: {{textPaddingLeft}};    overflow: hidden;    max-width: {{textBoxWidth}};    max-height: {{textBoxHeight}};    margin: {{native_ad_zone_text_margin}};    line-height: normal;}{{zone_id_prefix}}.exo-native-widget .exo-native-widget-item-container .exo-native-widget-item .exo-native-widget-item-content .exo-native-widget-item-title {    font-family: {{font_family}};    font-size: {{title_font_size}};    color: {{title_font_color}};    font-weight: {{title_font_weight}};    text-decoration: {{title_decoration}};    display: {{item_title_display}};    padding-top: 8px;}{{zone_id_prefix}}.exo-native-widget .exo-native-widget-item-container .exo-native-widget-item:hover .exo-native-widget-item-content .exo-native-widget-item-title {    color: {{title_hover_color}};    font-weight: {{title_hover_font_weight}};    text-decoration: {{title_hover_decoration}};}{{zone_id_prefix}}.exo-native-widget .exo-native-widget-item-container .exo-native-widget-item .exo-native-widget-item-content .exo-native-widget-item-text {    font-family: {{font_family}};    font-size: {{description_font_size}};    color: {{description_font_color}};    font-weight: {{description_font_weight}};    text-decoration: {{description_decoration}};    display: {{item_description_display}};    padding-top: 8px;}{{zone_id_prefix}}.exo-native-widget .exo-native-widget-item-container .exo-native-widget-item:hover .exo-native-widget-item-content .exo-native-widget-item-text {    color: {{description_hover_color}};    font-weight: {{description_hover_font_weight}};    text-decoration: {{description_hover_decoration}};}',n=null;for(var o in e)n=new RegExp("{{"+o+"}}","g"),i=i.replace(n,e[o]);return t.innerHTML=i,t}(e)),e.mobile_layout_enabled&&d.appendChild(function(e,t,i){var n=document.createElement("style"),o="";"native-interstitial"===i&&(o+="            #exoWdgtInner {                overflow-y: scroll;            }            "+t+".exo-native-widget {                padding-top: 90px !important;            }            ");var d="@media all and (max-width: "+e+") {    "+t+".exo-native-widget {        width: 100% !important;        height: auto !important;    }    "+t+".exo-native-widget .exo-native-widget-item-container {        clear: both;        width: 100% !important;        max-width: 100% !important;        margin-left: 0 !important;    }    "+t+".exo-native-widget .exo-native-widget-item-outer-container {        width: 100% !important;    }    "+t+".exo-native-widget .exo-native-widget-item .exo-native-widget-item-image {        width: 100% !important;        max-width: 100% !important;        margin: auto !important    }    "+t+".exo-native-widget .exo-native-widget-item-container .exo-native-widget-item .exo-native-widget-item-content {        max-width: 100% !important;    }    "+t+".exo-native-widget .exo-native-widget-item-container .exo-native-widget-item {        margin: 0 auto !important;    }    "+o+"}";return n.innerHTML=d,n}(e.minimum_width_for_full_sized_layout,"#exoNativeWidget"+w,e.publisherAdType));e.customcss_enabled&&d.appendChild((a=e,r=document.createElement("style"),s=a.customcss.replace(/ *(:|;|{|}) */g,"$1").replace(/\/\*([^*]|[\r\n]|(\*+([^*/]|[\r\n])))*\*\/+/g,"").split("}").filter(function(e){return 0<e.trim().length}).map(function(e){return"#exoNativeWidget"+w+".exo-native-widget "+e}).join("} ")+"}",r.innerHTML=s,r));var a,r,s;window.attachEvent&&!window.addEventListener||d.appendChild(((l=document.createElement("script")).setAttribute("type","text/javascript"),scriptString='function setRealHref(e) {var caller = e.currentTarget || e.srcElement; caller.setAttribute("href", caller.getAttribute("real-href"));}',l.innerHTML=scriptString,l));var l;var g="";e.header_enabled&&e.header_is_on_top&&(g=e.widgetHeaderContentHtml);("native-exit"===e.publisherAdType||"native-exit"!==e.publisherAdType&&""!==g)&&d.appendChild(b(g));var h=document.createElement("div");if(h.className="exo-native-widget-outer-container",d.appendChild(h),e.header_enabled&&!e.header_is_on_top){var c="native-exit"===e.publisherAdType;d.appendChild(b(e.widgetHeaderContentHtml,c))}var p=document.createElement("div");p.className="clear",h.appendChild(p);var m={zoneId:w,htmlNode:d,cookieExp:parseInt(e.frequency),delay:parseInt(e.delaySeconds)||0,frequencyCount:void 0!==e.frequencyCount?parseInt(e.frequencyCount):0,wdgtPadding:_,nativeWidgetUrl:t,adsData:o,redirectUrl:i,destUrl:n};!function(e,t){var i=e.publisherAdType;void 0===t.layout&&(t.layout=e);"native-exit"===i&&(t.cookiePrefix="exoexit",(new ExoExit).init(t));if("native-interstitial"===i){var n=parseInt(e.adTriggerType);if(t.showOnDelay=1===n,2===(t.triggerType=n)){var o=parseInt(e.popTriggerMethod);if(3===o)t.triggerSelector="a:not(.exo-native-widget-item)";else if(2===o){var d,a="";if(-1===e.popTriggerClasses.indexOf(","))d=e.popTriggerClasses.split(" ");else{var r=e.popTriggerClasses.replace(/\s/g,"");d=r.split(",")}for(var s=0;s<d.length;s++)""!==d[s]&&("."!==d[s].substr(0,1)&&(d[s]="."+d[s]),a+=d[s]+", ");0<a.length&&(a=a.substr(0,a.length-2)),t.triggerSelector=a}}t.cookiePrefix="exointer",(new ExoInter).init(t)}"native-recommendation"===i&&(t.showOnDelay=!0,(new ExoInline).init(t))}(e,m)}(i,p,h,d,t),function(){function d(){if("undefined"!=typeof BetterJsPop)var e=BetterJsPop;else if(void 0!==window.popns&&"undefined"!==window[window.popns])var e=window[window.popns];if(void 0!==e){var t=e.getIgnoreTo(),i=!1;for(var n in t)if(t.hasOwnProperty(n)&&".exo-native-widget-item"===t[n]){i=!0;break}if(!i){e.ignoreTo(".exo-native-widget-item");for(var o=0;o<document.getElementsByClassName("exo-native-widget-item").length;o++)document.getElementsByClassName("exo-native-widget-item")[o].removeEventListener("mouseover",d,!1)}}}for(var e=0;e<document.getElementsByClassName("exo-native-widget-item").length;e++)document.getElementsByClassName("exo-native-widget-item")[e].addEventListener("mouseover",d,!1)}()}catch(e){return}}},(f=new XMLHttpRequest).onreadystatechange=v,f.open("GET",m,!0),f.withCredentials=u,f.timeout=x,f.send();var _=44;function b(e,t){t=void 0!==t;var i=document.createElement("div");return i.className="exo-native-widget-header"+(t?" exo-native-widget-header-bottom":""),i.innerHTML=e,i}}();