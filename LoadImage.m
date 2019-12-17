function varargout = untitled2(varargin)
% UNTITLED2 MATLAB code for untitled2.fig
%      UNTITLED2, by itself, creates a new UNTITLED2 or raises the existing
%      singleton*.
%
%      H = UNTITLED2 returns the handle to a new UNTITLED2 or the handle to
%      the existing singleton*.
%
%      UNTITLED2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED2.M with the given input arguments.
%
%      UNTITLED2('Property','Value',...) creates a new UNTITLED2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled2

% Last Modified by GUIDE v2.5 28-Dec-2018 16:53:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @untitled2_OpeningFcn, ...
    'gui_OutputFcn',  @untitled2_OutputFcn, ...
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


% --- Executes just before untitled2 is made visible.
function untitled2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled2 (see VARARGIN)

% Choose default command line output for untitled2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled2_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


[filenames,path]=uigetfile('*.mat','Multiselect','on');%打开文件选择对话框，得到文件名
GEColormap=loadGEColormap();

for i=1:20
    image_file=sprintf('%s/image_slice%d.mat',path,i); load(image_file);
    epicardial_file=sprintf('%s/Endocardial_contour_slice%d.mat',path,i); load(epicardial_file);

    [sizey sizex]=size(ImageCurrent);
    
    %     subplot(2,10,i),imshow(ImageCurrent(floor(sizey/2+0.5-sizey/8):ceil(sizey/2+0.5+sizey/8),:),[],'InitialMagnification','fit','border','tight','Colormap',GEColormap);%after cutting for better view
    %     imshow(ImageCurrent,[],'InitialMagnification','fit','border','tight','Colormap',GEColormap);%show the image with original size
    if i==1
        handles.a=ImageCurrent;
        handles.a1=ReconPath;
        guidata(hObject,handles);
        axes(handles.axes1);
    elseif i==2
        handles.b=ImageCurrent;
        handles.b1=ReconPath;
        guidata(hObject,handles);
        axes(handles.axes2);
    elseif i==3
        handles.c=ImageCurrent;
        handles.c1=ReconPath;
        guidata(hObject,handles);
        axes(handles.axes3);
    elseif i==4
        handles.d=ImageCurrent;
        handles.d1=ReconPath;
        guidata(hObject,handles);
        axes(handles.axes4);
    elseif i==5
        handles.e=ImageCurrent;
        handles.e1=ReconPath;
        guidata(hObject,handles);
        axes(handles.axes5);
    elseif i==6
        handles.f=ImageCurrent;
        handles.f1=ReconPath;
        guidata(hObject,handles);
        axes(handles.axes6);
    elseif i==7
        handles.g=ImageCurrent;
        handles.g1=ReconPath;
        guidata(hObject,handles);
        axes(handles.axes7);
    elseif i==8
        handles.h=ImageCurrent;
        handles.h1=ReconPath;
        guidata(hObject,handles);
        axes(handles.axes8);
    elseif i==9
        handles.i=ImageCurrent;
        handles.i1=ReconPath;
        guidata(hObject,handles);
        axes(handles.axes9);
    elseif i==10
        handles.j=ImageCurrent;
        handles.j1=ReconPath;
        guidata(hObject,handles);
        axes(handles.axes10);
    elseif i==11
        handles.k=ImageCurrent;
        handles.k1=ReconPath;
        guidata(hObject,handles);
        axes(handles.axes11);
    elseif i==12
        handles.l=ImageCurrent;
        handles.l1=ReconPath;
        guidata(hObject,handles);
        axes(handles.axes12);
    elseif i==13
        handles.m=ImageCurrent;
        handles.m1=ReconPath;
        guidata(hObject,handles);
        axes(handles.axes13);
    elseif i==14
        handles.n=ImageCurrent;
        handles.n1=ReconPath;
        guidata(hObject,handles);
        axes(handles.axes14);
    elseif i==15
        handles.o=ImageCurrent;
        handles.o1=ReconPath;
        guidata(hObject,handles);
        axes(handles.axes15);
    elseif i==16
        handles.p=ImageCurrent;
        handles.p1=ReconPath;
        guidata(hObject,handles);
        axes(handles.axes16);
    elseif i==17
        handles.q=ImageCurrent;
        handles.q1=ReconPath;
        guidata(hObject,handles);
        axes(handles.axes17);
    elseif i==18
        handles.r=ImageCurrent;
        handles.r1=ReconPath;
        guidata(hObject,handles);
        axes(handles.axes18);
    elseif i==19
        handles.s=ImageCurrent;
        handles.s1=ReconPath;
        guidata(hObject,handles);
        axes(handles.axes19);
    elseif i==20
        handles.t=ImageCurrent;
        handles.t1=ReconPath;
        guidata(hObject,handles);
        axes(handles.axes20);
         end
        ImageCurrent=ImageCurrent.*(1-ReconPath);
        imshow(ImageCurrent(floor(sizey/2+0.5-sizey/8):ceil(sizey/2+0.5+sizey/8),:),[],'InitialMagnification','fit','border','tight','Colormap',GEColormap);%after cutting for better view

  
    %     imshow(ImageCurrent,[],'InitialMagnification','fit','border','tight','Colormap',GEColormap);%show the image with original size
    
    %     saveas(h_fig,sprintf('draw_Gate%d_slice%d.jpg',igate,i));
end
pause(15);
for i=1:20
    image_file=sprintf('%s/image_slice%d.mat',path,i); load(image_file);
    epicardial_file=sprintf('%s/Epicardial_contour_slice%d.mat',path,i); load(epicardial_file);

    [sizey sizex]=size(ImageCurrent);
    
    %     subplot(2,10,i),imshow(ImageCurrent(floor(sizey/2+0.5-sizey/8):ceil(sizey/2+0.5+sizey/8),:),[],'InitialMagnification','fit','border','tight','Colormap',GEColormap);%after cutting for better view
    %     imshow(ImageCurrent,[],'InitialMagnification','fit','border','tight','Colormap',GEColormap);%show the image with original size
    if i==1
        handles.a=ImageCurrent;
        handles.a1=ReconPath;
        guidata(hObject,handles);
        axes(handles.axes1);
    elseif i==2
        handles.b=ImageCurrent;
        handles.b1=ReconPath;
        guidata(hObject,handles);
        axes(handles.axes2);
    elseif i==3
        handles.c=ImageCurrent;
        handles.c1=ReconPath;
        guidata(hObject,handles);
        axes(handles.axes3);
    elseif i==4
        handles.d=ImageCurrent;
        handles.d1=ReconPath;
        guidata(hObject,handles);
        axes(handles.axes4);
    elseif i==5
        handles.e=ImageCurrent;
        handles.e1=ReconPath;
        guidata(hObject,handles);
        axes(handles.axes5);
    elseif i==6
        handles.f=ImageCurrent;
        handles.f1=ReconPath;
        guidata(hObject,handles);
        axes(handles.axes6);
    elseif i==7
        handles.g=ImageCurrent;
        handles.g1=ReconPath;
        guidata(hObject,handles);
        axes(handles.axes7);
    elseif i==8
        handles.h=ImageCurrent;
        handles.h1=ReconPath;
        guidata(hObject,handles);
        axes(handles.axes8);
    elseif i==9
        handles.i=ImageCurrent;
        handles.i1=ReconPath;
        guidata(hObject,handles);
        axes(handles.axes9);
    elseif i==10
        handles.j=ImageCurrent;
        handles.j1=ReconPath;
        guidata(hObject,handles);
        axes(handles.axes10);
    elseif i==11
        handles.k=ImageCurrent;
        handles.k1=ReconPath;
        guidata(hObject,handles);
        axes(handles.axes11);
    elseif i==12
        handles.l=ImageCurrent;
        handles.l1=ReconPath;
        guidata(hObject,handles);
        axes(handles.axes12);
    elseif i==13
        handles.m=ImageCurrent;
        handles.m1=ReconPath;
        guidata(hObject,handles);
        axes(handles.axes13);
    elseif i==14
        handles.n=ImageCurrent;
        handles.n1=ReconPath;
        guidata(hObject,handles);
        axes(handles.axes14);
    elseif i==15
        handles.o=ImageCurrent;
        handles.o1=ReconPath;
        guidata(hObject,handles);
        axes(handles.axes15);
    elseif i==16
        handles.p=ImageCurrent;
        handles.p1=ReconPath;
        guidata(hObject,handles);
        axes(handles.axes16);
    elseif i==17
        handles.q=ImageCurrent;
        handles.q1=ReconPath;
        guidata(hObject,handles);
        axes(handles.axes17);
    elseif i==18
        handles.r=ImageCurrent;
        handles.r1=ReconPath;
        guidata(hObject,handles);
        axes(handles.axes18);
    elseif i==19
        handles.s=ImageCurrent;
        handles.s1=ReconPath;
        guidata(hObject,handles);
        axes(handles.axes19);
    elseif i==20
        handles.t=ImageCurrent;
        handles.t1=ReconPath;
        guidata(hObject,handles);
        axes(handles.axes20);
         end
        ImageCurrent=ImageCurrent.*(1-ReconPath);
        imshow(ImageCurrent(floor(sizey/2+0.5-sizey/8):ceil(sizey/2+0.5+sizey/8),:),[],'InitialMagnification','fit','border','tight','Colormap',GEColormap);%after cutting for better view

  
    %     imshow(ImageCurrent,[],'InitialMagnification','fit','border','tight','Colormap',GEColormap);%show the image with original size
    
    %     saveas(h_fig,sprintf('draw_Gate%d_slice%d.jpg',igate,i));
end
pause(5);
% h = msgbox('请选择想要修改的轮廓序号');



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
