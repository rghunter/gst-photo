/*
 * gst-OpticalProcessor.cpp
 *
 *  Created on: Jul 1, 2012
 *      Author: rghunter
 */

#include <opencv2/opencv.hpp>
#include "gstopticalquad.h"
#include <iostream>
#include <sys/types.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <string.h>
#include <netdb.h>

#define WINDOW_SIZE 10
#define MAX_CORNERS 100
#define HISTORY 2
using namespace std;
using namespace cv;

Mat output_frame, save_image;
int counter;
int sock, length, n;
socklen_t fromlen;
struct sockaddr_in server;
struct sockaddr_in from;
char buf[1024];

void error(const char *msg)
{
    perror(msg);
    exit(0);
}

gboolean init_frameprocessor(int width, int height)
{
	counter = 0;
	save_image.create(width,height,CV_8UC3);
	output_frame.create(width,height,CV_8UC3);
	sock=socket(AF_INET, SOCK_DGRAM, 0);
	if (sock < 0) 
		error("Opening socket");
	length = sizeof(server);
	bzero(&server,length);
	server.sin_family=AF_INET;
	server.sin_addr.s_addr=INADDR_ANY;
	server.sin_port=htons(atoi("3300"));
	if (bind(sock,(struct sockaddr *)&server,length)<0) 
		error("binding");
	fromlen = sizeof(struct sockaddr_in);
	std::cout << "SETUP PORT SUCESSFUL" << std::endl;
	return TRUE;
}
void process_frame(IplImage *input, IplImage *output)
{

	Mat raw_frame(input);
	Mat color_frame;
	
	if(recvfrom(sock,buf,5,MSG_DONTWAIT,(struct sockaddr *)&from,&fromlen) > 0){
		//char filename[50];
		char * filename = "/tmp/ramdisk/testImage.jpg";
		cvtColor(raw_frame,color_frame,CV_RGB2BGR);
		//sprintf(filename,"frame_%i.jpg",counter);
		save_image = color_frame.clone();
		std::cout << "Saving Image" << std::endl;
		imwrite("/tmp/ramdisk/testImage.jpg",save_image);
		bitwise_not(raw_frame,output_frame);
		counter++;
	}else{
	output_frame = raw_frame.clone();
	}
	

	*output = output_frame;

	return;
}
void cleanup_frameprocessor(void)
{

}
