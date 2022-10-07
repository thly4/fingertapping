% Clear the workspace
close all;
clear;
sca;

fig = uifigure; 
dd = uidropdown(fig,'Items',{'Select Option', 'Practice', 'Recall'},...
                     'Value','Select Option',...
                     'ValueChangedFcn',@(dd,event) selection(dd));                 

% Create ValueChangedFcn callback:
function selection(dd)
value = dd.Value;
prompt = "Enter subject number: ";
subjectNum = input(prompt);

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

Screen('TextSize', window, 40);
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
Screen('TextSize', window, 30);
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


Screen('TextSize', window, 30);
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

Screen('TextSize', window, 30);
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

Screen('TextSize', window, 30);
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
numseq = readtable('/Users/taylorly/Lewis_Lab/SSTIM_Tasks/FingerTapping/fingerTappingNumbers.csv');
practiceTrials = table2array(numseq(1:2,1)); %set first 2 sequences of
%first column as practice trials

ntrial = length(practiceTrials);

T = table(); 
tempTable = table();

for i = 1:ntrial
    Condition = {'Practice'};

    %initialize response recording
    Presses = [];
    Timings = [];
    
%set up 30 second timer 
        wait_time = 10; 
        time_passed = 0;
        startSecs = GetSecs;
        endTime = startSecs + wait_time;

        KbQueueCreate;
        KbQueueStart;

        while GetSecs < endTime
            time_passed = GetSecs - startSecs;
            time_remaining = wait_time - time_passed;
            numberString = num2str(fix(time_remaining));

            seqString = num2str(practiceTrials(i));

            line1 = sprintf('%c - %c - %c - %c - %c \n', seqString(1), seqString(2), seqString(3), seqString(4), seqString(5));

            %display sequence and countdown timer
            Screen('TextSize', window, 60);
            DrawFormattedText(window, line1,...
            'center', 'center', black);
            DrawFormattedText(window, numberString, screenXpixels - 80, screenYpixels - 40, black);
            Screen('Flip', window);

            %record responses
            [pressed, firstPress]=KbQueueCheck;
            if pressed
                response = KbName(min(find(firstPress)));
                responseTime = firstPress(find(firstPress));
                if isempty(Presses)
                    Presses = response(1);
                    Timings = responseTime - startSecs;                 
                else
                    Presses(end+1) = response(1);
                    Timings(end+1) = responseTime - startSecs;
                end
                
                if firstPress == escKey
                    break;
                    ShowCursor;
                    sca;
                end

            end

        end
        KbQueueStop;

        if i == 1

            line1 = 'The second sequence will appear next.';
            line2 = '\n \n \n Press ENTER to continue.';

            Screen('TextSize', window, 40);
            DrawFormattedText(window, [line1 line2],...
                'center', screenYpixels * 0.25, white);
            Screen('Flip', window);

            keysOfInterest=zeros(1,256);
            keysOfInterest(KbName('Return'))=1;
            KbQueueCreate([],keysOfInterest);
            KbQueueStart;
            timeSecs = KbQueueWait;
            KbQueueRelease;

        end    

        Presses = cellstr(Presses);
        Timings = cellstr(num2str(Timings));

        tempTable.Condition(1,:) = Condition;
        tempTable.Trial(1,:) = i;
        tempTable.Sequence(1,:) = seqString;
        tempTable.Presses = Presses;
        tempTable.Timings = Timings;

        T = [T;tempTable];
end
    

%elseif strcmp(value, 'Learning')
    % code for learning trials

%-------------------------------------------------------------%
%----------------------LEARNING PHASE-------------------------%
%-------------------------------------------------------------%

DrawFormattedText(window, 'Good job! Press ENTER to begin the real experiment.', 'center',...
    'center', black);
Screen('Flip', window);

    keysOfInterest=zeros(1,256);
    keysOfInterest(KbName('Return'))=1;
    KbQueueCreate([],keysOfInterest);
    KbQueueStart;
    timeSecs = KbQueueWait;
    KbQueueRelease;

%wait for key press
KbStrokeWait;
[keyIsDown,Secs, keyCode] = KbCheck;
    if keyCode(escKey)
        ShowCursor;
        sca;
        return
    end

%load in and begin learning trials

numseq = readtable('/Users/taylorly/Lewis_Lab/SSTIM_Tasks/FingerTapping/fingerTappingNumbers.csv');
%learningTrials = table2array(numseq(:,3)); %3rd row as learning sequences
learningTrials = table2array(numseq(1:3,3)); %debugging sequences

%randomize order of sequences
idx=randperm(length(learningTrials));
learningTrials=learningTrials(idx);
ntrial = length(learningTrials);

for i = 1:ntrial
    Condition = {'Learning'};

    line1 = 'Remember to type each sequence as quickly and accurately as you can';
    line2 = '\n Type them as many times as you can within the time limit.';
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

    %initialize response recording
    Presses = [];
    Timings = [];

%set up 30 second timer 
        wait_time = 10; 
        time_passed = 0;
        startSecs = GetSecs;
        endTime = startSecs + wait_time;

        KbQueueCreate;
        KbQueueStart;

        while GetSecs < endTime
            time_passed = GetSecs - startSecs;
            time_remaining = wait_time - time_passed;
            numberString = num2str(fix(time_remaining));

            seqString = num2str(learningTrials(i));

            line1 = sprintf('%c - %c - %c - %c - %c \n', seqString(1), seqString(2), seqString(3), seqString(4), seqString(5));

            %display sequence and countdown timer
            Screen('TextSize', window, 60);
            DrawFormattedText(window, line1,...
            'center', 'center', black);
            DrawFormattedText(window, numberString, screenXpixels - 80, screenYpixels - 40, black);
            Screen('Flip', window);

            %record responses
            [pressed, firstPress]=KbQueueCheck;
            if pressed
                response = KbName(min(find(firstPress)));
                responseTime = firstPress(find(firstPress));
                if isempty(Presses)
                    Presses = response(1);
                    Timings = responseTime - startSecs;                 
                else
                    Presses(end+1) = response(1);
                    Timings(end+1) = responseTime - startSecs;
                end
                
                if firstPress == escKey
                    break;
                    ShowCursor;
                    sca;
                end

            end

        end
        KbQueueStop;

        Presses = cellstr(Presses);
        Timings = cellstr(num2str(Timings));

        tempTable.Condition(1,:) = Condition;
        tempTable.Trial(1,:) = i;
        tempTable.Sequence(1,:) = seqString;
        tempTable.Presses = Presses;
        tempTable.Timings = Timings;

        T = [T;tempTable];

end

writetable(T, sprintf('FingerTapping_subject%d.csv',subjectNum))

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
    

%-------------------------------------------------------------%
%----------------------RECALL PHASE-------------------------%
%-------------------------------------------------------------%

elseif strcmp(value, 'Recall')
    %code for recall trials

    data = readtable(sprintf('FingerTapping_subject%d.csv',subjectNum), 'Format', '%s%f%s%s%s');

    [r,c] = size(data);

    recallTrials = data.Sequence(r-2:r);

    ntrial = length(recallTrials);
 
    tempTable = table();

for i = 1:ntrial
    Condition = {'Recall'};

    line1 = 'You will now tap 3 sequences of numbers.';
    line2 = '\n Between each sequence, you can rest as long as you want.';
    line3 = '\n Remember to type each sequence as quickly and accurately as you can,';
    line4 = '\n and to type them as many times as you can within the time limit.';
    line5 = '\n \n Press ENTER when you are ready to begin.';

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

    %initialize response recording
    Presses = [];
    Timings = [];

%set up 30 second timer 
        wait_time = 10; 
        time_passed = 0;
        startSecs = GetSecs;
        endTime = startSecs + wait_time;

        KbQueueCreate;
        KbQueueStart;

        while GetSecs < endTime
            time_passed = GetSecs - startSecs;
            time_remaining = wait_time - time_passed;
            numberString = num2str(fix(time_remaining));

            seqString = char(recallTrials(i));

            line1 = sprintf('%c - %c - %c - %c - %c \n', seqString(1), seqString(2), seqString(3), seqString(4), seqString(5));

            %display sequence and countdown timer
            Screen('TextSize', window, 60);
            DrawFormattedText(window, line1,...
            'center', 'center', black);
            DrawFormattedText(window, numberString, screenXpixels - 80, screenYpixels - 40, black);
            Screen('Flip', window);

            %record responses
            [pressed, firstPress]=KbQueueCheck;
            if pressed
                response = KbName(min(find(firstPress)));
                responseTime = firstPress(find(firstPress));
                if isempty(Presses)
                    Presses = response(1);
                    Timings = responseTime - startSecs;                 
                else
                    Presses(end+1) = response(1);
                    Timings(end+1) = responseTime - startSecs;
                end
                
                if firstPress == escKey
                    break;
                    ShowCursor;
                    sca;
                end

            end

        end
        KbQueueStop;

        Presses = cellstr(Presses);
        Timings = cellstr(num2str(Timings));

        tempTable.Condition(1,:) = Condition;
        tempTable.Trial(1,:) = i;
        tempTable.Sequence(1,:) = seqString;
        tempTable.Presses = Presses;
        tempTable.Timings = Timings;

        data = [data; tempTable];

end

writetable(data, sprintf('FingerTapping_subject%d.csv',subjectNum))

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

end

end
