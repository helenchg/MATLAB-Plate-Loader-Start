function varargout = PlateLoaderGui(varargin)
% PLATELOADERGUI MATLAB code for PlateLoaderGui.fig
%      PLATELOADERGUI, by itself, creates a new PLATELOADERGUI or raises the existing
%      singleton*.
%
%      H = PLATELOADERGUI returns the handle to a new PLATELOADERGUI or the handle to
%      the existing singleton*.
%
%      PLATELOADERGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PLATELOADERGUI.M with the given input arguments.
%
%      PLATELOADERGUI('Property','Value',...) creates a new PLATELOADERGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before PlateLoaderGui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to PlateLoaderGui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help PlateLoaderGui

% Last Modified by GUIDE v2.5 15-Mar-2016 10:16:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PlateLoaderGui_OpeningFcn, ...
                   'gui_OutputFcn',  @PlateLoaderGui_OutputFcn, ...
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


% --- Executes just before PlateLoaderGui is made visible.
function PlateLoaderGui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to PlateLoaderGui (see VARARGIN)

% Choose default command line output for PlateLoaderGui
handles.output = hObject;
handles.user.connected = 'false';
handles.user.robot = 0;

handles.user.timeTable = [60 20 30
            0 30 30
            30 0 30
            30 30 0
            30 20 60];
% handles.user.robot = PlateLoaderSim;
handles.user.background = addImageToAxes('robot_background.jpg', handles.axes_background, 0);
handles.user.gripperClosed = addImageToAxes('gripper_closed_no_plate.jpg', handles.axes_gripper, 100);
handles.user.bars = addImageToAxes('extended_bars.jpg', handles.axes_bars, 0);
set(handles.user.bars, 'Visible', 'Off'); 
handles.user.moveAmountX = 95;
handles.user.moveAmountY = 130;
% set(handles.axes_background, 'Position', [0 0 0 0])
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes PlateLoaderGui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = PlateLoaderGui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton_reset.
function pushbutton_reset_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.user.robot.reset;
set(handles.text_response, 'String', handles.user.robot.reset);
set(handles.axes_gripper, 'Position', [396 497 100 57]);
set(handles.axes_bars, 'Position', [420 424 53 129]);
set(handles.user.bars, 'Visible', 'Off');
guidata(hObject, handles);

% --- Executes on button press in pushbutton_x1.
function pushbutton_x1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_x1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.user.robot.x(1);
set(handles.text_response, 'String', handles.user.robot.x(1));
set(handles.axes_gripper, 'Position', [396-2*handles.user.moveAmountX 497 100 57]);
set(handles.axes_bars, 'Position', [420-2*handles.user.moveAmountX 424 53 129]);
set(handles.user.bars, 'Visible', 'Off');

guidata(hObject, handles);


% --- Executes on button press in pushbutton_x2.
function pushbutton_x2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_x2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.user.robot.x(2);
set(handles.text_response, 'String', handles.user.robot.x(2));
set(handles.axes_gripper, 'Position', [396-handles.user.moveAmountX 497 100 57]);
set(handles.axes_bars, 'Position', [420-handles.user.moveAmountX 424 53 129]);
set(handles.user.bars, 'Visible', 'Off');

guidata(hObject, handles);


% --- Executes on button press in pushbutton_x3.
function pushbutton_x3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_x3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.user.robot.x(3);
set(handles.text_response, 'String', handles.user.robot.x(3));
set(handles.axes_gripper, 'Position', [396 497 100 57]);
set(handles.axes_bars, 'Position', [420 424 53 129]);
set(handles.user.bars, 'Visible', 'Off');

guidata(hObject, handles);


% --- Executes on button press in pushbutton_x4.
function pushbutton_x4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_x4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.user.robot.x(4);
set(handles.text_response, 'String', handles.user.robot.x(4));
set(handles.axes_gripper, 'Position', [396+handles.user.moveAmountX 497 100 57]);
set(handles.axes_bars, 'Position', [420+handles.user.moveAmountX 424 53 129]);
set(handles.user.bars, 'Visible', 'Off');

guidata(hObject, handles);


% --- Executes on button press in pushbutton_x5.
function pushbutton_x5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_x5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.user.robot.x(5);
set(handles.text_response, 'String', handles.user.robot.x(5));
set(handles.axes_gripper, 'Position', [396+2*handles.user.moveAmountX 497 100 57]);
set(handles.axes_bars, 'Position', [420+2*handles.user.moveAmountX 424 53 129]);
set(handles.user.bars, 'Visible', 'Off');


guidata(hObject, handles);


% --- Executes on button press in pushbutton_open.
function pushbutton_open_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.user.robot.open;
set(handles.text_response, 'String', handles.user.robot.open);
guidata(hObject, handles);


% --- Executes on button press in pushbutton_close.
function pushbutton_close_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.user.robot.close;
set(handles.text_response, 'String', handles.user.robot.close);
guidata(hObject, handles);


% --- Executes on button press in pushbutton_retract.
function pushbutton_retract_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_retract (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% if handles.user.robot ~= 0
% set(handles.axes_gripper, 'Position', [100 100 0 0]);
handles.user.robot.retract;
set(handles.text_response, 'String', handles.user.robot.retract);
set(handles.user.bars, 'Visible', 'Off');
set(handles.axes_gripper, 'Position', get(handles.axes_gripper, 'Position') + [0 handles.user.moveAmountY 0 0]);

guidata(hObject, handles);


% --- Executes on button press in pushbutton_extend.
function pushbutton_extend_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_extend (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.user.robot.extend;
set(handles.text_response, 'String', handles.user.robot.extend);
set(handles.user.bars, 'Visible', 'On');
set(handles.axes_gripper, 'Position', get(handles.axes_gripper, 'Position') + [0 -handles.user.moveAmountY 0 0]);

guidata(hObject, handles);


% --- Executes on selection change in popupmenu_from.
function popupmenu_from_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_from (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_from contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_from
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function popupmenu_from_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_from (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
guidata(hObject, handles);



% --- Executes on selection change in popupmenu_to.
function popupmenu_to_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_to (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_to contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_to
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function popupmenu_to_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_to (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_movePlate.
function pushbutton_movePlate_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_movePlate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fromValue = get(handles.popupmenu_from, 'Value');
toValue = get(handles.popupmenu_to, 'Value');
handles.user.robot.movePlate(fromValue,toValue);
set(handles.text_response, 'String', handles.user.robot.movePlate(fromValue,toValue));
guidata(hObject, handles);

% --- Executes on button press in pushbutton_eSpecial.
function pushbutton_eSpecial_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_eSpecial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.user.robot.especial;
guidata(hObject, handles);


% --- Executes on button press in pushbutton_cSpecial.
function pushbutton_cSpecial_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_cSpecial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton_setTimeDelays.
function pushbutton_setTimeDelays_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_setTimeDelays (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton_resetTimeDelays.
function pushbutton_resetTimeDelays_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_resetTimeDelays (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function comPort_Callback(hObject, eventdata, handles)
% hObject    handle to comPort (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of comPort as text
%        str2double(get(hObject,'String')) returns contents of comPort as a double


% --- Executes during object creation, after setting all properties.
function comPort_CreateFcn(hObject, eventdata, handles)
% hObject    handle to comPort (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_connect.
function pushbutton_connect_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_connect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open_ports = instrfind('Type', 'serial', 'Status', 'open');
if ~isempty(open_ports)
    fclose(open_ports);
end

value = str2double(get(handles.comPort, 'String'));
if value ~= 0
handles.user.robot = PlateLoader(value)
else
    handles.user.robot = PlateLoaderSim(value);
end

% fprintf('the value is %d', value);
% fprintf('Connecting to robot... COM%s \n\n', handles.comPort.String);
% com = sprintf('COM%s', handles.comPort.String);
% s = serial(com,'BaudRate',19200,'Terminator',10,'Timeout',5);
connected = sprintf('Connected to COM%s',handles.comPort.String);
set(handles.text_response, 'String', connected);
handles.user.connected = 'true';
fprintf('%s\n\n',handles.user.connected);
guidata(hObject,handles);


% --- Executes on button press in pushbutton_disconnect.
function pushbutton_disconnect_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_disconnect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open_ports = instrfind('Type', 'serial', 'Status', 'open');
if ~isempty(open_ports)
    fclose(open_ports);
end
handles.user.connected = 'false';
fprintf('%s\n\n',handles.user.connected);
fprintf('Closed COM PORT \n \n');
set(handles.text_response, 'String', 'Closed COM port');
guidata(hObject, handles);

% --- Executes on button press in pushbutton_getStatus.
function pushbutton_getStatus_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_getStatus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text_response, 'String', handles.user.robot.getStatus);
guidata(hObject, handles);
