% Clear the workspace
close all;
clear;
sca;

fig = uifigure; 
dd = uidropdown(fig,'Items',{'Select Option', 'Practice', 'Learning', 'Recall'},...
                     'Value','Select Option',...
                     'ValueChangedFcn',@(dd,event) selection(dd));                 

% Create ValueChangedFcn callback:
function selection(dd)
value = dd.Value;
prompt = "Enter subject number: ";
subjectNum = input(prompt)

ListenChar(2);

Screen('Preference', 'SkipSyncTests', 1);
PsychDefaultSetup(2);
screens = Screen('Screens');
screenNumber = max(screens);

KbName('UnifyKeyNames');

% Define the keyboard keys that are listened for 
Key1 = KbName('1!'); Key2 = KbName('2@'); Key3 = KbName('3#'); Key4 = KbName('4$');
spaceKey = KbName('space'); %press key prompt for the subject to continue
escKey = KbName('ESCAPE'); %end experiment loop
corrKey = [30, 31, 32, 33]; %keys 1-4

% Define black, white and grey
white = WhiteIndex(screenNumber);
black = BlackIndex(screenNumber);
grey = white / 2;

% Setup the screen background
[window,windowRect] = Screen(screenNumber, 'OpenWindow',[],[0 0 500 400]);
%[window, windowRect] = PsychImaging('OpenWindow', screenNumber, grey);
Screen('BlendFunction', window, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA');
[screenXpixels, screenYpixels] = Screen('WindowSize', window);
[xCenter, yCenter] = RectCenter(windowRect);

%HideCursor;


if strcmp(value, 'Practice')
    %code for intructions + practice trials
    %--------------------------------------------------------------------------
%                         Present Intructions
%--------------------------------------------------------------------------

line1 = 'In this task, you will tap keys on the keyboard in specific sequences.';
line2 = '\n These sequences all use the numbers 1 to 4.';
line3 = '\n\n Rest all fingers (other than your thumb) of your left hand over those keys,';
line4 = '\n and use your little finger to press 1, your ring finger to press 2,';
line5 = '\n your middle finger to press 3, and your index finger to press 4.';
line6 = '\n \n \n Press any key to continue.';

Screen('TextSize', window, 20);
%Screen('TextSize', window, 40);
DrawFormattedText(window, [line1 line2 line3 line4 line5 line6 ],...
    'center', screenYpixels * 0.25, white);
Screen('Flip', window);

%wait for key press
KbStrokeWait;
[keyIsDown,secs, keyCode] = KbCheck;
        if keyCode(escKey)
            ShowCursor;
            sca;
            return
        end
           
%wakeup=WaitSecs(5); % enforce 5 second break after key is pressed

%prompt through key presses 4-1
Screen('TextSize', window, 24);
DrawFormattedText(window, [line1 line2 line3 line4 line5],...
    'center', screenYpixels * 0.25-100, white);

Screen('TextSize', window, 50);
DrawFormattedText(window, 'Press 4 with your index finger.', 'center',...
    'center', black);
Screen('Flip', window);

[keyIsDown,secs, keyCode] = KbCheck;
        if keyCode(escKey)
            ShowCursor;
            sca;
            return
        end
        
[secs, keyCode, deltaSecs] = KbStrokeWait;
if keyCode(Key1)
    response = 1;
elseif keyCode(Key2)
    response = 2;
elseif keyCode(Key3)
    response = 3;
elseif keyCode(Key4)
    response = 4;
end

while response ~=4
    
Screen('TextSize', window, 50);
DrawFormattedText(window, 'Press 4 with your index finger.', 'center',...
    'center', black);
Screen('Flip', window);

[secs, keyCode, deltaSecs] = KbStrokeWait;
    if keyCode(Key1)
        response = 1;
    elseif keyCode(Key2)
        response = 2;
    elseif keyCode(Key3)
        response = 3;
    elseif keyCode(Key4)
        response = 4;
    end

end

%wakeup=WaitSecs(5); % enforce 5 second break after key is pressed


Screen('TextSize', window, 24);
DrawFormattedText(window, [line1 line2 line3 line4 line5],...
    'center', screenYpixels * 0.25-100, white);

Screen('TextSize', window, 50);
DrawFormattedText(window, 'Now; press 3 with your middle finger.', 'center',...
    'center', black);
Screen('Flip', window);

[keyIsDown,secs, keyCode] = KbCheck;
        if keyCode(escKey)
            ShowCursor;
            sca;
            return
        end
        
[secs, keyCode, deltaSecs] = KbStrokeWait;
if keyCode(Key1)
    response = 1;
elseif keyCode(Key2)
    response = 2;
elseif keyCode(Key3)
    response = 3;
elseif keyCode(Key4)
    response = 4;
end

while response ~=3
    
Screen('TextSize', window, 50);
DrawFormattedText(window, 'Now, press 3 with your middle finger.', 'center',...
    'center', black);
Screen('Flip', window);

[secs, keyCode, deltaSecs] = KbStrokeWait;
    if keyCode(Key1)
        response = 1;
    elseif keyCode(Key2)
        response = 2;
    elseif keyCode(Key3)
        response = 3;
    elseif keyCode(Key4)
        response = 4;
    end

end

%wakeup=WaitSecs(5); % enforce 5 second break after key is pressed

Screen('TextSize', window, 24);
DrawFormattedText(window, [line1 line2 line3 line4 line5],...
    'center', screenYpixels * 0.25-100, white);

Screen('TextSize', window, 50);
DrawFormattedText(window, 'Now; press 2 with your ring finger.', 'center',...
    'center', black);
Screen('Flip', window);

[keyIsDown,secs, keyCode] = KbCheck;
        if keyCode(escKey)
            ShowCursor;
            sca;
            return
        end
        
[secs, keyCode, deltaSecs] = KbStrokeWait;
if keyCode(Key1)
    response = 1;
elseif keyCode(Key2)
    response = 2;
elseif keyCode(Key3)
    response = 3;
elseif keyCode(Key4)
    response = 4;
end

while response ~=2
    
Screen('TextSize', window, 50);
DrawFormattedText(window, 'Now, press 2 with your ring finger.', 'center',...
    'center', black);
Screen('Flip', window);

[secs, keyCode, deltaSecs] = KbStrokeWait;
    if keyCode(Key1)
        response = 1;
    elseif keyCode(Key2)
        response = 2;
    elseif keyCode(Key3)
        response = 3;
    elseif keyCode(Key4)
        response = 4;
    end

end

%wakeup=WaitSecs(5); % enforce 5 second break after key is pressed

Screen('TextSize', window, 24);
DrawFormattedText(window, [line1 line2 line3 line4 line5],...
    'center', screenYpixels * 0.25-100, white);

Screen('TextSize', window, 50);
DrawFormattedText(window, 'Now, press 1 with your little finger.', 'center',...
    'center', black);
Screen('Flip', window);

[keyIsDown,secs, keyCode] = KbCheck;
        if keyCode(escKey)
            ShowCursor;
            sca;
            return
        end
[secs, keyCode, deltaSecs] = KbStrokeWait;
if keyCode(Key1)
    response = 1;
elseif keyCode(Key2)
    response = 2;
elseif keyCode(Key3)
    response = 3;
elseif keyCode(Key4)
    response = 4;
end

while response ~=1
    
Screen('TextSize', window, 50);
DrawFormattedText(window, 'Now, press 1 with your little finger.', 'center',...
    'center', black);
Screen('Flip', window);

[secs, keyCode, deltaSecs] = KbStrokeWait;
    if keyCode(Key1)
        response = 1;
    elseif keyCode(Key2)
        response = 2;
    elseif keyCode(Key3)
        response = 3;
    elseif keyCode(Key4)
        response = 4;
    end

end

%wakeup=WaitSecs(5); % enforce 5 second break after key is pressed


%--------------------------------------------------------------------------
%                           Practice Trials
%--------------------------------------------------------------------------

line1 = 'You will now receive two practice trials.';
line2 = '\n Tap the sequences that appear on the top of the screen';
line3 = '\n as quickly and accurately as possible.';
line4 = '\n You will have 30 seconds per trial to tap them as many times as you can.';
line5 = '\n If you have any questions, please ask the experimenter for help at any time.';
line6 = '\n \n \n Press any key to continue.';

Screen('TextSize', window, 40);
DrawFormattedText(window, [line1 line2 line3 line4 line5 line6],...
    'center', screenYpixels * 0.25, white);
Screen('Flip', window);

%wait for key press
KbStrokeWait;
[keyIsDown,secs, keyCode] = KbCheck;
        if keyCode(escKey)
            ShowCursor;
            sca;
            return
        end
           
%wakeup=WaitSecs(5); % enforce 5 second break after key is pressed


% load number sequences 
%numseq = readtable('/Users/taylorly/Lewis_Lab/SSTIM_Tasks/FingerTapping/fingerTappingNumbers.csv');
%practiceTrials = table2array(numseq(:,1:2)); %set first 2 rows as trial sequences

practicesequence = readtable('/Users/taylorly/Lewis_Lab/SSTIM_Tasks/FingerTapping/practicesequence.csv');
practicesequence = table2array(practicesequence);

%set up 30 second timer 
        wait_time = 10; 
        time_passed = 0;
        startSecs = GetSecs;
        endTime = startSecs + wait_time;

        %initialize response recording
        response_array = [];
        all_times = [];

        KbQueueCreate;
        KbQueueStart;

        while GetSecs < endTime
            time_passed = GetSecs - startSecs;
            time_remaining = wait_time - time_passed;
            numberString = num2str(time_remaining);

            seqString = num2str(practicesequence);

            line1 = sprintf('%c - %c - %c - %c - %c \n', seqString(1), seqString(2), seqString(3), seqString(4), seqString(5));

            %display sequence and countdown timer
            Screen('TextSize', window, 60);
            DrawFormattedText(window, line1,...
            'center', 'center', black);
            DrawFormattedText(window, numberString, screenXpixels - 60, screenYpixels - 25, black);
            Screen('Flip', window);

            %record responses
            [pressed, firstPress]=KbQueueCheck;
            if pressed
                response = KbName(min(find(firstPress)));
                responseTime = firstPress(find(firstPress));
                if isempty(response_array)
                    response_array = response(1);
                    all_times = responseTime - startSecs;                 
                else
                    response_array(end+1) = response(1);
                    all_times(end+1) = responseTime - startSecs;
                end
                
                if firstPress == escKey
                    break;
                    ShowCursor;
                    sca;
                end

            end

        end
        KbQueueStop;

        writematrix(response_array, 'response_array.txt')
        writematrix(all_times, 'all_times.txt')


  %wait for key press
  KbStrokeWait;
  [keyIsDown,secs, keyCode] = KbCheck;
    if keyCode(escKey)
        ShowCursor;
        sca; 
        return
    end

    ListenChar(0);
sca
    
elseif strcmp(value, 'Learning')
    % code for learning trials

DrawFormattedText(window, 'Good job! Press any key to begin the real experiment.', 'center',...
    'center', black);
Screen('Flip', window);


%wait for key press
KbStrokeWait;
[keyIsDown,Secs, keyCode] = KbCheck;
    if keyCode(escKey)
        ShowCursor;
        sca;
        return
    end

    line1 = 'Remember to type each sequence as quickly and accurately as you can';
    line2 = '\n Type them as many times as you can within the time limit';
    line3 = '\n Press ENTER with your right hand when you are ready';
    line4 = '\n Make sure your left hand is already in position.';
    line5 = '\n Start tapping as soon as you see the sequence';

Screen('TextSize', window, 40);
DrawFormattedText(window, [line1 line2 line3 line4 line5],...
    'center', screenYpixels * 0.25, black);
Screen('Flip', window);

keysOfInterest=zeros(1,256);
keysOfInterest(KbName('Return'))=1;
KbQueueCreate([],keysOfInterest);
KbQueueStart;
timeSecs = KbQueueWait;
KbQueueRelease;

%load in and begin learning trials

%numseq = readtable('/Users/taylorly/Lewis_Lab/SSTIM_Tasks/FingerTapping/fingerTappingNumbers.csv');
%learningTrials = table2array(numseq(:,3)); %3rd row as learning sequences

practicesequence = readtable('/Users/taylorly/Lewis_Lab/SSTIM_Tasks/FingerTapping/practicesequence.csv');
practicesequence = table2array(practicesequence);

%set up 30 second timer 
        wait_time = 10; 
        time_passed = 0;
        startSecs = GetSecs;
        endTime = startSecs + wait_time;

        %initialize response recording
        response_array = [];
        all_times = [];

        KbQueueCreate;
        KbQueueStart;

        while GetSecs < endTime
            time_passed = GetSecs - startSecs;
            time_remaining = wait_time - time_passed;
            numberString = num2str(time_remaining);

            seqString = num2str(practicesequence);

            line1 = sprintf('%c - %c - %c - %c - %c \n', seqString(1), seqString(2), seqString(3), seqString(4), seqString(5));

            %display sequence and countdown timer
            Screen('TextSize', window, 60);
            DrawFormattedText(window, line1,...
            'center', 'center', black);
            DrawFormattedText(window, numberString, screenXpixels - 60, screenYpixels - 25, black);
            Screen('Flip', window);

            %record responses
            [pressed, firstPress]=KbQueueCheck;
            if pressed
                response = KbName(min(find(firstPress)));
                responseTime = firstPress(find(firstPress));
                if isempty(response_array)
                    response_array = response(1);
                    all_times = responseTime - startSecs;                 
                else
                    response_array(end+1) = response(1);
                    all_times(end+1) = responseTime - startSecs;
                end
                
                if firstPress == escKey
                    break;
                    ShowCursor;
                    sca;
                end

            end

        end
        KbQueueStop;

        %writematrix(response_array, sprintf('keyResponses_subject_%d.txt', subjectNum))
        %writematrix(all_times, sprintf('responseTime_subject_%d.txt', subjectNum))

        %responsefile = sprintf('keyResponses_subject%d.txt',subjectNum);
        %timefile = sprintf('responseTime_subject%d.txt', subjectNum);

        writematrix(response_array, sprintf('keyResponses_subject%d.txt',subjectNum))
        writematrix(all_times, sprintf('responseTime_subject%d.txt', subjectNum))

%wait for key press
KbStrokeWait;
[keyIsDown,Secs, keyCode] = KbCheck;
        if keyCode(escKey)
            ShowCursor;
            sca;
            return
        end

ListenChar(0);
sca




    
elseif strcmp(value, 'Recall')
    %code for recall trials
    

end

end
