/*first open a gif in a new tab (make sure the url ends with .gif) then paste link into split on ezgif.com
then upload, split to frames, then download as a zip file
*/

PImage [] gif;//makes an array for the images
int frames;//how many frames there are

void setup () {
  size (600, 600);
  frames=9;
  gif=new PImage [frames];
  
  for (int i=0; i<=frames-1; i+=1) {
    gif [i]=loadImage ("frame_"+i+"_delay-0.2s.gif");//split this string and add 'i' in the middle
  }
}

void draw () {
  image (gif[0], 0, 0, width, height);
}
