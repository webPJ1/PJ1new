
 </div>	  
</div>

<div id="Slide">
<div class="slideshow-container">
  <div class="mySlides fade">
    
    <img src="images/zero-s-2009-moto.jpeg" style="width: 100%;" >
    
  </div>

  <div class="mySlides fade">
    
    <img src="images/xeee1.jpg" style="width: 100%; " >
    
  </div>

  <div class="mySlides fade">
    
    <img src="images/io.jpg" style="width: 100%;" >
    
  </div>
</div>
<script>
var slideIndex = 0;
showSlides();

function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none"; 
    }
    slideIndex++;
    if (slideIndex> slides.length) {slideIndex = 1} 
    slides[slideIndex-1].style.display = "block"; 
    setTimeout(showSlides, 2000); // Change image every 2 seconds
}
</script>


</div>
