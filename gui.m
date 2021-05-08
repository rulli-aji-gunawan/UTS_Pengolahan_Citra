function varargout = gui(varargin)
% GUI MATLAB code for gui.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui

% Last Modified by GUIDE v2.5 08-May-2021 07:19:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
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


% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui (see VARARGIN)

% Choose default command line output for gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
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
[filename, pathname] = uigetfile({'*.jpg','*.png'});
A = imread([pathname, filename]);

% Menampilkan di Axes1
axes(handles.axes1);
imshow(A);

R=A(:,:,1);
G=A(:,:,2);
B=A(:,:,3);

axes(handles.axes2)
h=histogram(R,256);
h.FaceColor='r';
h.EdgeColor='r';

xlim([0,255])
grid on
hold on
h=histogram(G,256);
h.FaceColor='g';
h.EdgeColor='g';

xlim([0,255])
grid on
hold on
h=histogram(B,256);
h.FaceColor='b';
h.EdgeColor='b';

xlim([0,255])
grid on
hold off
title('histogram')

handles.A=A;
handles.R=R;
handles.G=G;
handles.B=B;
guidata(hObject,handles)



% --- Executes on button press in rbR.
function rbR_Callback(hObject, eventdata, handles)
% hObject    handle to rbR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rbR
set(hObject,'Value',1);
set(handles.rbG,'Value',0);
set(handles.rbB,'Value',0);

A=handles.A;
R=handles.R;
G=handles.G;
B=handles.B;

 
R=A(:,:,1);
G=A(:,:,2);
B=A(:,:,3);

a = zeros(size(A,1),size(A,2));
redOnly = cat(3,R,a,a);
greenOnly = cat(3,a,G,a);
blueOnly = cat(3,a,a,B);
axes(handles.axes3)
imshow(redOnly);

axes(handles.axes4)
h=histogram(R,256);
h.FaceColor='r';
h.EdgeColor='r';


% --- Executes on button press in rbG.
function rbG_Callback(hObject, eventdata, handles)
% hObject    handle to rbG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rbG
set(hObject,'Value',1);
set(handles.rbR,'Value',0);
set(handles.rbB,'Value',0);

A=handles.A;
R=handles.R;
G=handles.G;
B=handles.B;

 
R=A(:,:,1);
G=A(:,:,2);
B=A(:,:,3);

a = zeros(size(A,1),size(A,2));
redOnly = cat(3,R,a,a);
greenOnly = cat(3,a,G,a);
blueOnly = cat(3,a,a,B);
axes(handles.axes3)
imshow(greenOnly);

axes(handles.axes4)
h=histogram(G,256);
h.FaceColor='g';
h.EdgeColor='g';


% --- Executes on button press in rbB.
function rbB_Callback(hObject, eventdata, handles)
% hObject    handle to rbB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rbB
set(hObject,'Value',1);
set(handles.rbR,'Value',0);
set(handles.rbG,'Value',0);

A=handles.A;
R=handles.R;
G=handles.G;
B=handles.B;

 
R=A(:,:,1);
G=A(:,:,2);
B=A(:,:,3);

a = zeros(size(A,1),size(A,2));
redOnly = cat(3,R,a,a);
greenOnly = cat(3,a,G,a);
blueOnly = cat(3,a,a,B);
axes(handles.axes3)
imshow(blueOnly);

axes(handles.axes4)
h=histogram(B,256);
h.FaceColor='b';
h.EdgeColor='b';


% --- Executes on button press in btnAdd.
function btnAdd_Callback(hObject, eventdata, handles)
% hObject    handle to btnAdd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[filename, pathname] = uigetfile({'*.jpg','*.png'});
B = imread([pathname, filename]);

% Menampilkan di Axes6
axes(handles.axes6);
imshow(B);
handles.B = imread(fullfile(pathname,filename));
guidata(hObject,handles)



% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

B=handles.B;
get(hObject,'Value');

axes(handles.axes7);
GS = rgb2gray(B);
imshow(GS)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

B=handles.B;
get(hObject,'Value');

axes(handles.axes8);
BW = im2bw(B,0.5);
imshow(BW)


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

A=handles.A;
get(hObject,'Value');
iA = rgb2gray(A);
iA_Selection = iA ((1:300),(1:300));

B=handles.B;
get(hObject,'Value');
iB = rgb2gray(B);
iB_Selection = iB ((1:300),(1:300));

iC = iA_Selection+iB_Selection;
axes(handles.axes12);
imshow(iC)



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
