var videos = 1;
var publisherObj;

var subscriberObj = {};

var MAX_WIDTH_VIDEO = 264;
var MAX_HEIGHT_VIDEO = 198;

var MIN_WIDTH_VIDEO = 200;
var MIN_HEIGHT_VIDEO = 150;

var MAX_WIDTH_BOX = 800;
var MAX_HEIGHT_BOX = 600;

var CURRENT_WIDTH = MAX_WIDTH_VIDEO;
var CURRENT_HEIGHT = MAX_HEIGHT_VIDEO;

function layoutManager() {
  var estBoxWidth = MAX_WIDTH_BOX / videos;
  var width = Math.min(MAX_WIDTH_VIDEO, Math.max(MIN_WIDTH_VIDEO, 
        estBoxWidth));
  var height = 3*width/4;

  publisherObj.height = height;
  publisherObj.width = width;

  for(var subscriberDiv in subscriberObj) {
    subscriberDiv.height = height;
    subscriberDiv.width = width;
  }

  CURRENT_HEIGHT = height;
  CURRENT_WIDTH = width;
}