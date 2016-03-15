function [ imageObject ] = addImageToAxes( imageFilename, axesHandle, axesWidth)
% Opens the image filename and adds it to the axes
% Return the image object
% If axesWidth = 0 then use images default pixel size


% Open the file to get the imageData
imageData = imread(imageFilename);
% Create an image object and make the parent the axes
imageObject = image(imageData, 'Parent', axesHandle);

% Make unit of the axes 'pixels'
% Visible off
set(axesHandle, 'Units', 'Pixels','Visible','Off');
% Get current 'Position' of the axes sot aht we can use the x and y
currentPosition = get(axesHandle, 'Position');
% Get the number of rows and columns of the image
[rows_height, cols_width,depth] = size(imageData);
% If axes width = 0
if axesWidth == 0
    axesWidth = cols_width;
    axesHeight = rows_height;
else
    axesHeight = axesWidth * rows_height / cols_width;
end
    % axesWidth = #cols
    % axesHeight = #rows
% else
    % use the axesWidth and aspect ratio to calc the height
% end

% set the new 'Position' on the axes
set(axesHandle, 'Position', [currentPosition(1) currentPosition(2) axesWidth axesHeight]);

    
end
