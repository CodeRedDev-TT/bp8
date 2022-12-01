(function (){
    var HTMLBuilder = {
        generateStationAsset: function(name, url, cols){
            console.log(url);
            return "\n" +
                "                <div class='" +cols +" mt-5 station' style=\"\">\n" +
                "                    <h2>"+ name +"</h2>\n" +
                "                   <video autoplay muted loop>" +
                "                      <source src='"+ url+"' type='video/mp4'>" +
                "                   </video>" +
                "                </div>"
        }
    }


    window.HTMLBuilder = HTMLBuilder;
})();
