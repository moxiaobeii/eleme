(function(window){var svgSprite='<svg><symbol id="icon-dengpao" viewBox="0 0 1024 1024"><path d="M512.048128 64.06144C343.182336 60.558336 198.81984 207.555584 203.191296 378.169344c0 64.740352 18.37568 113.739776 37.628928 151.359488 6.996992 11.378688 15.741952 23.625728 25.372672 34.9952 20.122624 21.878784 30.62272 33.248256 51.61472 51.623936l7.875584 6.996992c31.501312 28.875776 42.870784 38.498304 46.373888 62.124032v47.243264c0 0.877568 0 1.75616 0.877568 3.503104h-0.877568v81.369088c0 84.872192 55.996416 142.615552 140.868608 142.615552 83.116032 0 139.112448-57.74336 139.112448-142.615552v-81.369088h-0.877568v-0.877568c0.877568-0.869376 0.877568-1.746944 0.877568-2.625536v-47.243264c0-10.500096 2.625536-21.001216 8.753152-30.62272 6.119424-10.500096 12.24704-18.37568 18.366464-24.495104 6.12864-6.12864 17.498112-15.750144 34.125824-30.62272l25.372672-23.625728c13.995008-13.125632 35.873792-36.75136 47.243264-57.74336 20.13184-35.004416 35.004416-78.743552 35.004416-139.990016 0.002048-173.239296-135.616512-314.107904-308.855808-314.107904z m-0.877568 839.943168c-52.493312 0-83.116032-33.248256-83.116032-86.619136v-37.620736c23.625728 7.875584 51.623936 12.24704 83.994624 12.24704 34.125824 0 62.124032-5.250048 83.994624-13.125632v38.498304c-0.001024 55.118848-31.502336 86.62016-84.873216 86.62016z m165.363712-346.477568l-5.250048 4.37248c-24.495104 21.001216-33.23904 29.754368-50.746368 51.623936-17.498112 21.001216-24.495104 43.748352-24.495104 71.74656v34.9952c-20.122624 11.378688-48.120832 16.628736-84.872192 16.628736-47.243264 0-71.737344-8.753152-83.116032-15.750144v-35.873792c0-28.875776-15.750144-57.74336-48.120832-88.36608-4.37248-3.503104-10.500096-8.753152-18.37568-16.628736l-6.119424-5.250048-24.50432-22.74816c-11.369472-13.125632-31.492096-34.117632-41.992192-52.493312-16.628736-30.62272-29.754368-69.122048-29.754368-121.614336 0-71.74656 24.50432-132.993024 73.493504-182.870016 48.9984-49.867776 108.49792-75.240448 179.366912-75.240448 139.112448-3.503104 255.485952 118.989824 252.860416 258.110464 0 48.120832-10.500096 83.994624-27.128832 111.11424-17.497088 27.998208-36.742144 47.24224-61.24544 68.243456z" fill="" ></path></symbol><symbol id="icon-shoucang" viewBox="0 0 1024 1024"><path d="M302.08 844.8l171.52-69.632 38.4-15.36 38.4 15.36L721.92 844.8l-5.12-189.44-1.024-37.376 23.552-29.184 110.08-137.216-177.152-53.76-34.304-10.24-20.48-29.184L512 205.312 406.528 357.888l-20.48 29.184-34.304 10.24-177.152 53.76 110.08 137.216 23.552 29.184-1.024 37.888-5.12 189.44m526.336 153.6L512 870.4l-316.416 128 9.216-346.112L0 397.312l322.048-97.792L512 25.6l189.952 273.92L1024 397.312 819.2 652.288l9.216 346.112z" fill="" ></path></symbol></svg>';var script=function(){var scripts=document.getElementsByTagName("script");return scripts[scripts.length-1]}();var shouldInjectCss=script.getAttribute("data-injectcss");var ready=function(fn){if(document.addEventListener){if(~["complete","loaded","interactive"].indexOf(document.readyState)){setTimeout(fn,0)}else{var loadFn=function(){document.removeEventListener("DOMContentLoaded",loadFn,false);fn()};document.addEventListener("DOMContentLoaded",loadFn,false)}}else if(document.attachEvent){IEContentLoaded(window,fn)}function IEContentLoaded(w,fn){var d=w.document,done=false,init=function(){if(!done){done=true;fn()}};var polling=function(){try{d.documentElement.doScroll("left")}catch(e){setTimeout(polling,50);return}init()};polling();d.onreadystatechange=function(){if(d.readyState=="complete"){d.onreadystatechange=null;init()}}}};var before=function(el,target){target.parentNode.insertBefore(el,target)};var prepend=function(el,target){if(target.firstChild){before(el,target.firstChild)}else{target.appendChild(el)}};function appendSvg(){var div,svg;div=document.createElement("div");div.innerHTML=svgSprite;svgSprite=null;svg=div.getElementsByTagName("svg")[0];if(svg){svg.setAttribute("aria-hidden","true");svg.style.position="absolute";svg.style.width=0;svg.style.height=0;svg.style.overflow="hidden";prepend(svg,document.body)}}if(shouldInjectCss&&!window.__iconfont__svg__cssinject__){window.__iconfont__svg__cssinject__=true;try{document.write("<style>.svgfont {display: inline-block;width: 1em;height: 1em;fill: currentColor;vertical-align: -0.1em;font-size:16px;}</style>")}catch(e){console&&console.log(e)}}ready(appendSvg)})(window)