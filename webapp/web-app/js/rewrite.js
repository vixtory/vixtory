
//Proxy injects this function to the loaded page 
//function rewrites all href attributes of link tags
//target attributes are set to _self

function encode(url){
var encoded=escape(url);
return encoded;
}

//this function updates parent
function callparent(u){


    if (window.parent.document.getElementById('header')){
       // alert('dochead');
      var  tit = window.parent.document.getElementById('title');
      if (tit){
      //tit.innerHTML=u;
      tit.value=u;
      window.parent.getRequirements();
      }
    }
    }



function rewrite(base)
{
 var a = document.getElementsByTagName("a");
 for( var i=0, limit = a.length; i < limit; ++i )
 {
   if( a[i].href ) {
   a[i].href=base + "" + encode(a[i].href);
   a[i].target='_self';
    }
 }
 }
 
 
 function rewriteforms(base)
 {
  var a = document.getElementsByTagName("form");
 
 for( var i=0, limit = a.length; i < limit; ++i )
 {
   if( a[i].action ) {
   a[i].action=base + "" + encode(a[i].action);
   a[i].target='_self';
   //alert(a[i].action);
    }
    
 }
}
