close all
clear all
clc
%保存的时候加，载入的时候减
global DataIncludingImages;
global GlobalSetting;

load('DataIncludingImages.mat');
load('GEColormap.mat');
% load('sliceimage.mat');
%%初始化
DataIncludingImages.lv_image=[];
DataIncludingImages.DDAendo_contour=[];
DataIncludingImages.DDAepi_contour=[];
DataIncludingImages.filename=[];
DataIncludingImages.path=[];
% DataIncludingImages.profileimage=zeros(31,127);
% DataIncludingImages.endoprofileimage=zeros(31,127);
% DataIncludingImages.epiprofileimage=zeros(31,127);
GlobalSetting.ImageDisplay.GEColormap=GEColormap;

GUI_InteractivelyDraw_Contours('name','Draw endo and epi contours on MPI images');%,'WindowStyle','modal')); 