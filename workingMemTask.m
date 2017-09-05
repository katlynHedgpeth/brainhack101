
% Subject info
prompt = {'Subject number:', 'Subject initials:', 'Handedness:', 'Slack:',}; 
defaults = {'1907', 'carl', '', '0'}; 
answer = inputdlg(prompt, 'Subject Number', 1.2,defaults);
subject = answer{1,:}; 
initials = answer{2,:}; 
handedness = answer{3,:}; 
fileName = [subject initials]; 
a = 1; 

addpath /Users/krh2382/Dropbox (LewPeaLab)/STUFF/color-wheel/slider_code_circ_original

% Default setup 
sca; 
close all; 
clearvars;   

PsychDefaultSetup(2); 

screens = Screen('Screens'); 

screenNumber = max(screens); 

black = BlackIndex(screenNumber); 
white = WhiteIndex(screenNumber); 
grey = white / 2; 

[window, windowRect] = PsychImaging('OpenWindow', screenNumber, grey);    

[screenXpixels, screenYpixels] = Screen('WindowSize', window); 

[xCenter, yCenter] = RectCenter(windowRect); 

% Measure vertical refresh rate of monitor 
ifi = Screen('GetFlipInterval', window);
 
% Retrieve max priority number 
topPriorityLevel = MaxPriority(window); 
Priority(topPriorityLevel); %Prioritizes MATLAB on computer

% % Length of time and number of seconds for each test
% numSecs = 3; 
% numFrames = round(numSecs/ifi); 

% Flip every frame
waitframes = 1; 

% COLORS

white = [255 255 255];
red = [227 2 24];
blue = [48 62 152];
green = [95 180 46];
yellow = [251 189 18];
black = [0 0 0];  

% Set screen to grey
Screen('FillRect', window, grey);


%% Fixation: Section 1

% Start creating diamond in middle of screen
numSides = 4; 
anglesDeg = linspace(0, 360, numSides + 1); 
anglesRad = anglesDeg * (pi/180); 
radius = 25 ; 

yPosVector = sin(anglesRad) .* radius + yCenter; 
xPosVector = cos(anglesRad) .* radius + xCenter; 

diamondColor = [0 0 0]; 

lineWidth = 4; 

Screen('FramePoly', window, diamondColor, [xPosVector; yPosVector]', lineWidth); 

vbl = Screen('Flip', window);       
    
WaitSecs(1); %seconds 
  


%% Encoding: Section 2

% Start creating diamond in middle of screen
numSides = 4; 
anglesDeg = linspace(0, 360, numSides + 1); 
anglesRad = anglesDeg * (pi/180); 
radius = 25 ; 

yPosVector = sin(anglesRad) .* radius + yCenter; 
xPosVector = cos(anglesRad) .* radius + xCenter; 

diamondColor = [0 0 0]; 

lineWidth = 4;

Screen('FramePoly', window, diamondColor, [xPosVector; yPosVector]', lineWidth); 

% Draw rings
baseRect = [0 0 200 200]; 

%Ring 1
maxDiameter = max(baseRect) * 1.01; 
offcenterRing1 = CenterRectOnPointd(baseRect, xCenter + 150, yCenter); 

ring1Color = [255 0 0];    
Screen('FrameOval', window, ring1Color, offcenterRing1, 50);  

%Ring 2
maxDiameter = max(baseRect) * 1.01; 
offcenterRing2 = CenterRectOnPointd(baseRect, xCenter - 150, yCenter);  

ring2Color = [0 0 255];   
Screen('FrameOval', window, ring2Color, offcenterRing2, 50);   
  

Screen('DrawingFinished', window); 

vbl = Screen('Flip', window);      

WaitSecs(1/3);
Priority(0); 


%% Post-cue: Section 3

% Start creating diamond in middle of screen
numSides = 4; 
anglesDeg = linspace(0, 360, numSides + 1); 
anglesRad = anglesDeg * (pi/180); 
radius = 25 ; 

yPosVector = sin(anglesRad) .* radius + yCenter; 
xPosVector = cos(anglesRad) .* radius + xCenter; 

diamondColor = [0 0 0]; 

lineWidth = 4; 

Screen('FramePoly', window, diamondColor, [xPosVector; yPosVector]', lineWidth); 

vbl = Screen('Flip', window);       
    
WaitSecs(1/3); %seconds 


%% Retention, Section 4A

imageLocation = '/Users/krh2382/Dropbox (LewPeaLab)/STUDY/frankenstumpf/figures/energySquare.png'
image = imread(imageLocation)

imageTexture = Screen('MakeTexture', window, image); 

% Draw image to screen
Screen('DrawTexture', window, imageTexture, [], [], 0); 

Screen('Flip', window); 

WaitSecs(8); 


%% First probe, Section 5A

Screen('TextSize', window, 80); 
Screen('TextFont', window, 'Courier'); 
DrawFormattedText(window, 'Insert color slider!', 'center', 'center', [255 255 255]);

Screen('Flip', window); 

WaitSecs(4.2); 



%% Feedback: Section 6A 

Screen('TextSize', window, 80); 
Screen('TextFont', window, 'Arial'); 
DrawFormattedText(window, 'incorrect', 'center', 'center', black); 

Screen('Flip', window); 

WaitSecs(0.8); 



%% Delay: Section 7A

Screen('Flip', window); 

WaitSecs(0.5); 


%% Retro-cue: Section 8A

Screen('TextSize', window, 80); 
Screen('TextFont', window, 'Arial'); 
DrawFormattedText(window, 'STAY', 'center', 'center', black); 

Screen('Flip', window); 

WaitSecs(1/3); 



%% Delay: Section 9A 

Screen('Flip', window); 

WaitSecs(8); 



%% Second probe: Section 10As

Screen('TextSize', window, 80); 
Screen('TextFont', window, 'Courier'); 
DrawFormattedText(window, 'Insert color slider!', 'center', 'center', [255 255 255]);

Screen('Flip', window); 

WaitSecs(4.2); 


%%
% Wait for keyboard key press to exit 
%KbStrokeWait; 

sca;    

%%
   



% [xCenter, yCenter] = RectCenter(windowRect); 
% 
% Screen('BlendFunction', window, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA'); 
% 
% % TIMING
% 
% isiTimeSecs = 1; 
% isiTimeFrames = round(isiTimeSecs / ifi); 
% 
% waitframes = 1; 
% 
% % KEYBOARD
% 
% escapeKey = KbName('ESCAPE'); 
% leftKey = KbName('LeftArrow'); 
% rightKey = KbName('RightArrow'); 
% downKey = KbName('DownArrow'); 
% 

% 
% % RESPONSE MATRIX
% 
% % respMat = nan(4, numTrials); 
% 
% % EXPERIMENTscasscx
% 
% for trial = 1:numTrials
%     %skipped lots of things
%     
%     respToBeMade = true; 
%     
%     if trial == 1 
%         numSides = 4; 
%         anglesDeg = linspace(0, 360, numSides + 1); 
%         anglesRad = anglesDeg * (pi/180); 
%         radius = 25 ; 
% 
%         yPosVector = sin(anglesRad) .* radius + yCenter; 
%         xPosVector = cos(anglesRad) .* radius + xCenter; 
% 
%         rectColor = [0 0 0]; 
% 
%         lineWidth = 3; 
% 
%         Screen('FramePoly', window, rectColor, [xPosVector; yPosVector]', lineWidth); 
% 
%         Screen('Flip', window); 
% 
%         KbStrokeWait;
%     end
%     
% end 
%     
    