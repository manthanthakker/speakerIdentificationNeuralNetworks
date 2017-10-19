function varargout = mfccgui(varargin)
% MFCCGUI M-file for mfccgui.fig
%      MFCCGUI, by itself, creates a new MFCCGUI or raises the existing
%      singleton*.
%
%      H = MFCCGUI returns the handle to a new MFCCGUI or the handle to
%      the existing singleton*.
%
%      MFCCGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MFCCGUI.M with the given input arguments.
%
%      MFCCGUI('Property','Value',...) creates a new MFCCGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before mfccgui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to mfccgui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mfccgui

% Last Modified by GUIDE v2.5 24-Apr-2016 02:05:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mfccgui_OpeningFcn, ...
                   'gui_OutputFcn',  @mfccgui_OutputFcn, ...
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


% --- Executes just before mfccgui is made visible.
function mfccgui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to mfccgui (see VARARGIN)

% Choose default command line output for mfccgui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes mfccgui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = mfccgui_OutputFcn(hObject, eventdata, handles) 
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
example

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
option=menu('EXCEL MFCC FILES','Signal 1','Signal 2','Signal 3','Signal 4','Signal 5','Signal 6','Signal 7','Signal 8','Signal 9','Signal 10');
if option==1
    Excel = actxserver('Excel.Application');
Excel.Workbooks.Open('C:\MyStuff\notes\be proj\dataset\run_project\mfccexcelfiles\4.xlsx');
Excel.Visible = 1; % Open the Excel spreadsheet
delete(Excel);      % Close the activex server
end
if option==2
    Excel = actxserver('Excel.Application');
Excel.Workbooks.Open('C:\MyStuff\notes\be proj\dataset\run_project\mfccexcelfiles\1.xlsx');
Excel.Visible = 1; % Open the Excel spreadsheet
delete(Excel);      % Close the activex server
end
if option==3
    Excel = actxserver('Excel.Application');
Excel.Workbooks.Open('C:\MyStuff\notes\be proj\dataset\run_project\mfccexcelfiles\2.xlsx');
Excel.Visible = 1; % Open the Excel spreadsheet
delete(Excel);      % Close the activex server
end
if option==4
    Excel = actxserver('Excel.Application');
Excel.Workbooks.Open('C:\MyStuff\notes\be proj\dataset\run_project\mfccexcelfiles\3.xlsx');
Excel.Visible = 1; % Open the Excel spreadsheet
delete(Excel);      % Close the activex server
end
if option==5
    Excel = actxserver('Excel.Application');
Excel.Workbooks.Open('C:\MyStuff\notes\be proj\dataset\run_project\mfccexcelfiles\10.xlsx');
Excel.Visible = 1; % Open the Excel spreadsheet
delete(Excel);      % Close the activex server
end
if option==6
    Excel = actxserver('Excel.Application');
Excel.Workbooks.Open('C:\MyStuff\notes\be proj\dataset\run_project\mfccexcelfiles\16.xlsx');
Excel.Visible = 1; % Open the Excel spreadsheet
delete(Excel);      % Close the activex server
end
if option==7
    Excel = actxserver('Excel.Application');
Excel.Workbooks.Open('C:\MyStuff\notes\be proj\dataset\run_project\mfccexcelfiles\15.xlsx');
Excel.Visible = 1; % Open the Excel spreadsheet
delete(Excel);      % Close the activex server
end
if option==8
    Excel = actxserver('Excel.Application');
Excel.Workbooks.Open('C:\MyStuff\notes\be proj\dataset\run_project\mfccexcelfiles\20.xlsx');
Excel.Visible = 1; % Open the Excel spreadsheet
delete(Excel);      % Close the activex server
end
if option==9
    Excel = actxserver('Excel.Application');
Excel.Workbooks.Open('C:\MyStuff\notes\be proj\dataset\run_project\mfccexcelfiles\25.xlsx');
Excel.Visible = 1; % Open the Excel spreadsheet
delete(Excel);      % Close the activex server
end
if option==10
    Excel = actxserver('Excel.Application');
Excel.Workbooks.Open('C:\MyStuff\notes\be proj\dataset\run_project\mfccexcelfiles\30.xlsx');
Excel.Visible = 1; % Open the Excel spreadsheet
delete(Excel);      % Close the activex server
end
% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes during object creation, after setting all properties.
close all;
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
axes(hObject)
imshow('C:\MyStuff\notes\be proj\dataset\run_project\d.jpg')
