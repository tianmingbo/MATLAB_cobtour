function varargout = GUI_InteractivelyDraw_Contours(varargin)
% GUI_INTERACTIVELYDRAW_CONTOURS MATLAB code for GUI_InteractivelyDraw_Contours.fig
%      GUI_INTERACTIVELYDRAW_CONTOURS, by itself, creates a new GUI_INTERACTIVELYDRAW_CONTOURS or raises the existing
%      singleton*.
%
%      H = GUI_INTERACTIVELYDRAW_CONTOURS returns the handle to a new GUI_INTERACTIVELYDRAW_CONTOURS or the handle to
%      the existing singleton*.
%
%      GUI_INTERACTIVELYDRAW_CONTOURS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_INTERACTIVELYDRAW_CONTOURS.M with the given input arguments.
%
%      GUI_INTERACTIVELYDRAW_CONTOURS('Property','Value',...) creates a new GUI_INTERACTIVELYDRAW_CONTOURS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_InteractivelyDraw_Contours_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_InteractivelyDraw_Contours_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_InteractivelyDraw_Contours

% Last Modified by GUIDE v2.5 12-Apr-2019 22:00:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @GUI_InteractivelyDraw_Contours_OpeningFcn, ...
    'gui_OutputFcn',  @GUI_InteractivelyDraw_Contours_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before GUI_InteractivelyDraw_Contours is made visible.
function GUI_InteractivelyDraw_Contours_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_InteractivelyDraw_Contours (see VARARGIN)
global DataIncludingImages;
handles.image_data=DataIncludingImages.lv_image; %% read the image for which you want to draw contours
if isfield(DataIncludingImages,'endo_contour')==1 && ~isempty(DataIncludingImages.endo_contour)
    handles.endo_contour=DataIncludingImages.endo_contour;
else
    handles.endo_contour=[];
end;
if isfield(DataIncludingImages,'epi_contour')==1 && ~isempty(DataIncludingImages.epi_contour)
    handles.epi_contour=DataIncludingImages.epi_contour;
else
    handles.epi_contour=[];
end;
bUpdateEndo=0;bUpdateEpi=0;
bUpdateDDAEndo=0;bUpdateDDAEpi=0;
updateAxes(handles,bUpdateEndo,bUpdateEpi,bUpdateDDAEndo,bUpdateDDAEpi)
% Choose default command line output for GUI_InteractivelyDraw_Contours
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
% UIWAIT makes GUI_InteractivelyDraw_Contours wait for user response (see UIRESUME)
uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_InteractivelyDraw_Contours_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Get default command line output from handles structure
% varargout{1} = handles.output;


function updateAxes(handles,bUpdateEndo,bUpdateEpi,bUpdateDDAEndo,bUpdateDDAEpi)
% handles = guidata(handles.figure1);
global GlobalSetting;
axes(handles.axesImage);

% imagesc(handles.image_data);
% [sizey sizex]=size(handles.image_data);(floor(sizey/2+0.5-sizey/8):ceil(sizey/2+0.5+sizey/8),:)
% imagesc(flipud(handles.image_data),'InitialMagnification','fit');
%matlab中的flipud函数实现矩阵的上下翻转。flipud(X)实现了矩阵X的上下翻转。
[sizey sizex]=size(handles.image_data);
handles.image_data=flipud(handles.image_data);
imshow(handles.image_data(floor(sizey/2+0.5-sizey/8):ceil(sizey/2+0.5+sizey/8),:),[],'InitialMagnification','fit','border','tight','Colormap',GlobalSetting.ImageDisplay.GEColormap);
%imshow(ImageCurrent(floor(sizey/2+0.5-sizey/8):ceil(sizey/2+0.5+sizey/8),:),[],'InitialMagnification','fit','border','tight','Colormap',GEColormap);%after cutting for better view
colormap(GlobalSetting.ImageDisplay.GEColormap);%change colour
set(gca, 'YDir', 'normal');
if bUpdateEndo==1   % lv perfusion polarmap
    hold on;
    if isfield(handles,'endo_contour')==1 && ~isempty(handles.endo_contour)
        %handles.endo_contour(:,2)=handles.endo_contour(:,2)+floor(sizey/2+0.5-sizey/8);
        plot(handles.endo_contour(:,1),handles.endo_contour(:,2),'w','linewidth',2);
    end;
    hold off;
    axis off;
end
if bUpdateEpi==1   % lv perfusion polarmap
    hold on;
    if isfield(handles,'epi_contour')==1 && ~isempty(handles.epi_contour)
        %handles.epi_contour(:,2)=handles.epi_contour(:,2)+floor(sizey/2+0.5-sizey/8);
        plot(handles.epi_contour(:,1),handles.epi_contour(:,2),'r','linewidth',2);
    end;
    hold off;
    axis off;
end;
if bUpdateDDAEndo==1   % lv perfusion polarmap
    hold on;
    if isfield(handles,'DDAendo_contour')==1 && ~isempty(handles.DDAendo_contour)
        %handles.DDAendo_contour(:,2)=handles.DDAendo_contour(:,2)+floor(sizey/2+0.5-sizey/8);
        plot(handles.DDAendo_contour(:,1),handles.DDAendo_contour(:,2),'black','linewidth',4);
    end;
    hold off;
    axis off;
end
if bUpdateDDAEpi==1   % lv perfusion polarmap
    hold on;
    if isfield(handles,'DDAepi_contour')==1 && ~isempty(handles.DDAepi_contour)
        %handles.DDAepi_contour(:,2)=handles.DDAepi_contour(:,2)+floor(sizey/2+0.5-sizey/8);
        plot(handles.DDAepi_contour(:,1),handles.DDAepi_contour(:,2),'b','linewidth',4);
    end;
    hold off;
    axis off;
end;    % Choose default command line output for GUI_InteractivelyDraw_Contours

% --- Executes on button press in pushbuttonRedrawEndo.
function pushbuttonRedrawEndo_Callback(hObject, eventdata, handles)
try
    global DataIncludingImages;
    axes(handles.axesImage);
    h_poly=impoly();
    temp_pos = getPosition(h_poly);
    handles.endo_contour=[temp_pos(:,1:2); temp_pos(1,1:2)];

    guidata(hObject, handles);
    bUpdateEndo=1;bUpdateEpi=1;
    bUpdateDDAEndo=0;bUpdateDDAEpi=0;
    updateAxes(handles,bUpdateEndo,bUpdateEpi,bUpdateDDAEndo,bUpdateDDAEpi)
catch err
    return;
end;


% --- Executes on button press in pushbuttonRedrawEpi.
function pushbuttonRedrawEpi_Callback(hObject, eventdata, handles)
try
    global DataIncludingImages;
    axes(handles.axesImage);
    h_poly=impoly();
    temp_pos = getPosition(h_poly);
    handles.temp_pos=temp_pos;
    handles.epi_contour=[temp_pos(:,1:2); temp_pos(1,1:2)];
%     DataIncludingImages.lv_image(temp_pos)=0;
    guidata(hObject, handles);
    bUpdateEndo=1;bUpdateEpi=1;
    bUpdateDDAEndo=0;bUpdateDDAEpi=0;
    updateAxes(handles,bUpdateEndo,bUpdateEpi,bUpdateDDAEndo,bUpdateDDAEpi)
catch err
    return;
end;

% --- Executes on button press in pushbuttonSave.
function pushbuttonSave_Callback(hObject, eventdata, handles)
global DataIncludingImages;
DataIncludingImages.lv_image=DataIncludingImages.lv_image';
% DataIncludingImages.DDAendo_contour=DataIncludingImages.DDAendo_contour+floor(sizey/2+0.5-sizey/8);
% DataIncludingImages.DDAepi_contour=DataIncludingImages.DDAepi_contour+floor(sizey/2+0.5-sizey/8);

if ~isempty(handles.endo_contour)
    DataIncludingImages.endo_contour=handles.endo_contour;
else
    DataIncludingImages.endo_contour=[];
end;
if ~isempty(handles.epi_contour)
    DataIncludingImages.epi_contour=handles.epi_contour;
else
    DataIncludingImages.epi_contour=[];
end;
save(sprintf('%s/DataIncludingImagesfor%s',DataIncludingImages.path,DataIncludingImages.filename),'DataIncludingImages');

% --- Executes on button press in pushbuttonClose.
function pushbuttonClose_Callback(hObject, eventdata, handles)
close;


% --- Executes on button press in pushbuttonDeleteEndo.
function pushbuttonDeleteEndo_Callback(hObject, eventdata, handles)
if isfield(handles,'endo_contour')==1
    handles.endo_contour=[];
end;
if isfield(handles,'DDAendo_contour')==1
    handles.DDAendo_contour=[];
end;
guidata(hObject, handles);
bUpdateEndo=1;bUpdateEpi=1;
bUpdateDDAEndo=1;bUpdateDDAEpi=1;
updateAxes(handles,bUpdateEndo,bUpdateEpi,bUpdateDDAEndo,bUpdateDDAEpi)


% --- Executes on button press in pushbuttonDeleteEpi.
function pushbuttonDeleteEpi_Callback(hObject, eventdata, handles)
if isfield(handles,'epi_contour')==1
    handles.epi_contour=[];
end;
if isfield(handles,'DDAepi_contour')==1
    handles.DDAepi_contour=[];
end;
guidata(hObject, handles);
bUpdateEndo=1;bUpdateEpi=1;
bUpdateDDAEndo=1;bUpdateDDAEpi=1;
updateAxes(handles,bUpdateEndo,bUpdateEpi,bUpdateDDAEndo,bUpdateDDAEpi)


% --- Executes on button press in pushbuttonConvertContoursIntoPixels.
function pushbuttonConvertContoursIntoPixels_Callback(hObject, eventdata, handles)
global DataIncludingImages;

[sizey sizex]=size(DataIncludingImages.lv_image);
handles.epi_contour(:,2)=handles.epi_contour(:,2)+floor(sizex/2-0.5-sizex/8);
handles.endo_contour(:,2)=handles.endo_contour(:,2)+floor(sizex/2-0.5-sizex/8);

if isfield(handles,'endo_contour')==1 && ~isempty(handles.endo_contour)
    n=size(handles.endo_contour(:,1));
    endodatax=[];
    endodatay=[];
    for i=1:n-1
        [endotemp_posx endotemp_posy]=DDALine(handles.endo_contour(i,1),handles.endo_contour(i,2),handles.endo_contour(i+1,1),handles.endo_contour(i+1,2));
        endodatax=[endodatax endotemp_posx];
        endodatay=[endodatay endotemp_posy];
    end
    %     handles.endo_contour=[endodatax; endodatay];
    handles.DDAendo_contour=round([endodatax; endodatay]');
    DataIncludingImages.DDAendo_contour=round([endodatax; endodatay]');
    t=size(DataIncludingImages.DDAendo_contour(:,1));
    for k=1:t(1)
        DataIncludingImages.profileimage(handles.DDAendo_contour(k,1),handles.DDAendo_contour(k,2))=1;
        DataIncludingImages.endoprofileimage(handles.DDAendo_contour(k,1),handles.DDAendo_contour(k,2))=1;
    end;
    DataIncludingImages.endoprofileimage=DataIncludingImages.endoprofileimage';
    DataIncludingImages.endoprofileimage=flipud(DataIncludingImages.endoprofileimage);
end;
if isfield(handles,'epi_contour')==1 && ~isempty(handles.epi_contour)
    m=size(handles.epi_contour(:,1));
    epidatax=[];
    epidatay=[];
    for i=1:m-1
        [epitemp_posx epitemp_posy]=DDALine(handles.epi_contour(i,1),handles.epi_contour(i,2),handles.epi_contour(i+1,1),handles.epi_contour(i+1,2));
        epidatax=[epidatax epitemp_posx];
        epidatay=[epidatay epitemp_posy];
    end;
    %     handles.epi_contour=[epidatax; epidatay];
    handles.DDAepi_contour=round([epidatax; epidatay]');
    DataIncludingImages.DDAepi_contour=round([epidatax; epidatay]');
    s=size(DataIncludingImages.DDAepi_contour(:,1));
    for j=1:s(1)
        DataIncludingImages.profileimage(handles.DDAepi_contour(j,1),handles.DDAepi_contour(j,2))=1;
        DataIncludingImages.epiprofileimage(handles.DDAepi_contour(j,1),handles.DDAepi_contour(j,2))=1;
    end;
    DataIncludingImages.epiprofileimage=DataIncludingImages.epiprofileimage';
    DataIncludingImages.epiprofileimage=flipud(DataIncludingImages.epiprofileimage);
    DataIncludingImages.profileimage=DataIncludingImages.profileimage';
    DataIncludingImages.profileimage=flipud(DataIncludingImages.profileimage);
end
ReconPath=DataIncludingImages.endoprofileimage;
save(sprintf('%s/Endocardial_contour_%s',DataIncludingImages.path,DataIncludingImages.filename),'ReconPath');
ReconPath=[];
ReconPath=DataIncludingImages.epiprofileimage;
save(sprintf('%s/Epicardial_contour_%s',DataIncludingImages.path,DataIncludingImages.filename),'ReconPath');

handles.DDAepi_contour(:,2)=handles.DDAepi_contour(:,2)-floor(sizex/2-0.5-sizex/8);
handles.DDAendo_contour(:,2)=handles.DDAendo_contour(:,2)-floor(sizex/2-0.5-sizex/8);
%田明博改
% [hang lie]=size(handles.DDAendo_contour);
% for i=1:hang
%     b=handles.DDAendo_contour(i,:);
%     handles.image_data(b(2)+floor(sizex/2+0.5-sizex/8),b(1))=0;
% end
% [hang lie]=size(handles.DDAepi_contour);
% for i=1:hang
%     b=handles.DDAepi_contour(i,:);
%     handles.image_data(b(2)+floor(sizex/2+0.5-sizex/8),b(1))=0;
% end

guidata(hObject, handles);
%     bUpdateddaEndo=1;bUpdatddaeEpi=1;
bUpdateEndo=0;bUpdateEpi=0;
bUpdateDDAEndo=1;bUpdateDDAEpi=1;
updateAxes(handles,bUpdateEndo,bUpdateEpi,bUpdateDDAEndo,bUpdateDDAEpi)
handles.output = hObject;
% Update handles structure
%%%%

% --- Executes on button press in pushbuttonLoadimage.
function pushbuttonLoadimage_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonLoadimage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global DataIncludingImages;
DataIncludingImages.lv_image=[];
DataIncludingImages.DDAendo_contour=[];
DataIncludingImages.DDAepi_contour=[];
DataIncludingImages.filename=[];
DataIncludingImages.path=[];
[filenames,path]=uigetfile('F:\左心分割\ContourDrawing10-11','Multiselect','on');
file_name=fullfile(path,filenames);
load(file_name);
DataIncludingImages.lv_image=ImageCurrent';
[x y]=size(DataIncludingImages.lv_image);
DataIncludingImages.profileimage=zeros(x,y);
DataIncludingImages.endoprofileimage=zeros(x,y);
DataIncludingImages.epiprofileimage=zeros(x,y);
DataIncludingImages.filename=filenames;
DataIncludingImages.path=path;
handles.image_data=ImageCurrent;
handles.endo_contour=[];
handles.epi_contour=[];
bUpdateEndo=1;bUpdateEpi=1;
bUpdateDDAEndo=0;bUpdateDDAEpi=0;
updateAxes(handles,bUpdateEndo,bUpdateEpi,bUpdateDDAEndo,bUpdateDDAEpi)
% Choose default command line output for GUI_InteractivelyDraw_Contours
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
% UIWAIT makes GUI_InteractivelyDraw_Contours wait for user response (see UIRESUME)
uiwait(handles.figure1);


% --- Executes on button press in pushbuttonLoadExistingSession.
function pushbuttonLoadExistingSession_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonLoadExistingSession (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filenames,path]=uigetfile('F:\左心分割\ContourDrawing10-11','Multiselect','on');
file_name=fullfile(path,filenames);
load(file_name);
handles.image_data=DataIncludingImages.lv_image; %% read the image for which you want to draw contours

if isfield(DataIncludingImages,'DDAendo_contour')==1 && ~isempty(DataIncludingImages.DDAendo_contour)
    handles.DDAendo_contour=DataIncludingImages.DDAendo_contour;
else
    handles.DDAendo_contour=[];
end;

if isfield(DataIncludingImages,'DDAepi_contour')==1 && ~isempty(DataIncludingImages.DDAepi_contour)
    handles.DDAepi_contour=DataIncludingImages.DDAepi_contour;
else
    handles.DDAepi_contour=[];
end;
bUpdateEndo=0;bUpdateEpi=0;
bUpdateDDAEndo=1;bUpdateDDAEpi=1;
updateAxes1(handles,bUpdateEndo,bUpdateEpi,bUpdateDDAEndo,bUpdateDDAEpi)
% global GlobalSetting;
% axes(handles.axesImage);
% % imagesc(handles.image_data);
% % imagesc(flipud(handles.image_data),'InitialMagnification','fit');%matlab中的flipud函数实现矩阵的上下翻转。flipud(X)实现了矩阵X的上下翻转。
% imshow(flipud(handles.image_data),[],'InitialMagnification','fit','border','tight','Colormap',GlobalSetting.ImageDisplay.GEColormap);
% colormap(GlobalSetting.ImageDisplay.GEColormap);%change colour
% set(gca, 'YDir', 'normal');
% if bUpdateDDAEndo==1   % lv perfusion polarmap
%     hold on;
%     if isfield(handles,'DDAendo_contour')==1 && ~isempty(handles.DDAendo_contour)
%         plot(handles.DDAendo_contour(:,1),handles.DDAendo_contour(:,2),'w','linewidth',2);
%     end;
%     hold off;
%     axis off;
% end
% if bUpdateDDAEpi==1   % lv perfusion polarmap
%     hold on;
%     if isfield(handles,'DDAepi_contour')==1 && ~isempty(handles.DDAepi_contour)
%         plot(handles.DDAepi_contour(:,1),handles.DDAepi_contour(:,2),'r','linewidth',2);
%     end;
%     hold off;
%     axis off;
% end;    % Choose default command line output for GUI_InteractivelyDraw_Contours
% handles.image_data=DataIncludingImages.lv_image; %% read the image for which you want to draw contours
%     if isfield(DataIncludingImages,'DDAendo_contour')==1 && ~isempty(DataIncludingImages.DDAendo_contour)
%         handles.endo_contour=DataIncludingImages.DDAendo_contour;
%     else
%         handles.endo_contour=[];
%     end;
%     if isfield(DataIncludingImages,'DDAepi_contour')==1 && ~isempty(DataIncludingImages.DDAepi_contour)
%         handles.epi_contour=DataIncludingImages.DDAepi_contour;
%     else
%         handles.DDAepi_contour=[];
%     end;
%     bUpdateEndo=1;bUpdateEpi=1;
%     updateAxes(handles,bUpdateEndo,bUpdateEpi);
%     % Choose default command line output for GUI_InteractivelyDraw_Contours
%     handles.output = hObject;
%     % Update handles structure
%     guidata(hObject, handles);
%     % UIWAIT makes GUI_InteractivelyDraw_Contours wait for user response (see UIRESUME)
%     uiwait(handles.figure1);




function updateAxes1(handles,bUpdateEndo,bUpdateEpi,bUpdateDDAEndo,bUpdateDDAEpi)
% handles = guidata(handles.figure1);
global GlobalSetting;
axes(handles.axesImage);
% imagesc(handles.image_data);
% imagesc(flipud(handles.image_data),'InitialMagnification','fit');%matlab中的flipud函数实现矩阵的上下翻转。flipud(X)实现了矩阵X的上下翻转。
imshow(flipud(handles.image_data),[],'InitialMagnification','fit','border','tight','Colormap',GlobalSetting.ImageDisplay.GEColormap);
colormap(GlobalSetting.ImageDisplay.GEColormap);%change colour
set(gca, 'YDir', 'normal');
if bUpdateEndo==1   % lv perfusion polarmap
    hold on;
    if isfield(handles,'endo_contour')==1 && ~isempty(handles.endo_contour)
        plot(handles.endo_contour(:,1),handles.endo_contour(:,2),'w','linewidth',2);
    end;
    hold off;
    axis off;
end
if bUpdateEpi==1   % lv perfusion polarmap
    hold on;
    if isfield(handles,'epi_contour')==1 && ~isempty(handles.epi_contour)
        plot(handles.epi_contour(:,1),handles.epi_contour(:,2),'r','linewidth',2);
    end;
    hold off;
    axis off;
end;
if bUpdateDDAEndo==1   % lv perfusion polarmap
    hold on;
    if isfield(handles,'DDAendo_contour')==1 && ~isempty(handles.DDAendo_contour)
        plot(handles.DDAendo_contour(:,1),handles.DDAendo_contour(:,2),'w','linewidth',2);
    end;
    hold off;
    axis off;
end
if bUpdateDDAEpi==1   % lv perfusion polarmap
    hold on;
    if isfield(handles,'DDAepi_contour')==1 && ~isempty(handles.DDAepi_contour)
        plot(handles.DDAepi_contour(:,1),handles.DDAepi_contour(:,2),'r','linewidth',2);
    end;
    hold off;
    axis off;
end;    % Choose default command line output for GUI_InteractivelyDraw_Contours


% --- Executes on button press in pushbutton10.



function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h=figure(LoadImage);
LoadImage('Visible','on');%打开所调用的界面，其中LoadImage是界面名称
