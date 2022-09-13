% Clear the workspace
close all;
clear;
sca;


fig = uifigure; 
dd = uidropdown(fig, 'Items', {'practice','learning', 'recall'},...
    'Value', 'practice'); 
value = dd.Value;

if strcmp(value, 'practice')
    execute practice
elseif learning
    execute learning
elseif recall 
    execute recall 
end


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
[window, windowRect] = PsychImaging('OpenWindow', screenNumber, grey);
[window, windowRect] = Screen(screenNumber, 'OpenWindow', [], [0 0 500 400]);
Screen('BlendFunction', window, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA');
[screenXpixels, screenYpixels] = Screen('WindowSize', window);
[xCenter, yCenter] = RectCenter(windowRect);

HideCursor;

if strcmp(type, 'practice')
end 

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
[keyIsDown,Secs, keyCode] = KbCheck;
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

[keyIsDown,Secs, keyCode] = KbCheck;
        if keyCode(escKey)
            ShowCursor;
            sca;
            return
        end
        
[~, keyCode, deltaSecs] = KbStrokeWait;
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

[~, keyCode, deltaSecs] = KbStrokeWait;
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

[keyIsDown,Secs, keyCode] = KbCheck;
        if keyCode(escKey)
            ShowCursor;
            sca;
            return
        end
        
[~, keyCode, deltaSecs] = KbStrokeWait;
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

[~, keyCode, deltaSecs] = KbStrokeWait;
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

[keyIsDown,Secs, keyCode] = KbCheck;
        if keyCode(escKey)
            ShowCursor;
            sca;
            return
        end
        
[~, keyCode, deltaSecs] = KbStrokeWait;
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

[~, keyCode, deltaSecs] = KbStrokeWait;
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

[keyIsDown,Secs, keyCode] = KbCheck;
        if keyCode(escKey)
            ShowCursor;
            sca;
            return
        end
        
[~, keyCode, deltaSecs] = KbStrokeWait;
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

[~, keyCode, deltaSecs] = KbStrokeWait;
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

%% 
%% 


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
[keyIsDown,Secs, keyCode] = KbCheck;
        if keyCode(escKey)
            ShowCursor;
            sca;
            return
        end
           
%wakeup=WaitSecs(5); % enforce 5 second break after key is pressed


% load number sequences 
numseq = readtable('/Users/iris/MATLAB-Drive/numberseq.csv');
practiceTrials = table2array(numseq(:,1:2)); %set first 2 rows as trial sequences

KbQueueCreate; 


for ptrial = 1:2
    
    KbQueueStart;

    %randomize order of sequences
    idx=randperm(length(practiceTrials));
    seqOrder=practiceTrials(idx);
    
    for i = 1:length(practiceTrials(:,ptrial))
        seq = practiceTrials(:,ptrial);
        
        %set up 30 second timer 
        wait_time = 30;
        interval = 1;
        time_passed = 0;
        while time_passed < wait_time
            pause(interval)
            time_passed = time_passed + interval;
            time_remaining = wait_time - time_passed;
            numberString = num2str(time_remaining);

            line1 = sprintf('%s \n', num2str(seqOrder(i)));
        
            %display sequence and countdown timer
            Screen('TextSize', window, 60);
            DrawFormattedText(window, line1,...
            'center', 'center', black);
            DrawFormattedText(window, numberString, screenXpixels - 60, screenYpixels - 25, black);
            Screen('Flip', window);

            KbQueueStop;
        end
    end

end

KbQueueStop;

DrawFormattedText(window, 'Good job! Press any key to begin the real experiment.', 'center',...
    'center', black);


%wait for key press
KbStrokeWait;
[keyIsDown,Secs, keyCode] = KbCheck;
    if keyCode(escKey)
        ShowCursor;
        sca;
        return
    end

 
if strcmp(value, 'learning')
end 
%-------------------------------------------------------------%
%----------------------LEARNING PHASE-------------------------%
%-------------------------------------------------------------%

line1 = 'Remember to type each sequence as quickly and accurately as you can';
line2 = '\n Type them as many times as you can within the time limit';
line3 = '\n Press ENTER with your right hand when you are ready';
line4 = '\n Make sure your left hand is already in position.';
line5 = '\n Start tapping as soon as you see the sequence';

Screen('TextSize', window, 40);
DrawFormattedText(window, [line1 line2 line3 line4 line5],...
    'center', screenYpixels * 0.25, white);
Screen('Flip', window);

HideCursor;

%wait for key press
KbStrokeWait;
[keyIsDown,Secs, keyCode] = KbCheck;
        if keyCode(escKey)
            ShowCursor;
            sca;
            return
        end
  
%enforce a wait of 2 seconds% 
%wake =  4321 Waitsecs(2);
% 

numseq = readtable('/Users/iris/MATLAB-Drive/numberseq.csv');
learningTrials = table2array(numseq(:,3));

KbQueueCreate;

for ltrial = 1

    KbQueueStart;

    %randomize order of sequences
    idx=randperm(length(learningTrials));
    seqorder=learningTrials(idx);
    
    for i = 1:length(learningTrials(:,ltrial))
        seq = learningTrials(:,ltrial);
        
        wait_time = 30;
        time_passed = 0;
        startSecs = GetSecs;
        endTime = startSecs + wait_time;
        all_times = [];
        response_array = [];
        


        %set up 30 second timer
        while GetSecs < endTime
            time_passed = GetSecs - startSecs;
            time_remaining = wait_time - time_passed;
            numberString = num2str(time_remaining);

            seqString = num2str(seqorder(i));


            line1 = sprintf('%c - %c - %c - %c - %c \n', seqString(1), seqString(2), seqString(3), seqString(4));
        
            %display sequence and timer
            Screen('TextSize', window, 60);
            DrawFormattedText(window, line1,...
            'center', 'center', black);
            DrawFormattedText(window, numberString, screenXpixels - 60, screenYpixels - 25, black);
            Screen('Flip', window);
           
        [keyIsDown, responseTime, keyCode] = KbCheck; 
        if keyIsDown
            response = find(keyCode, 1); 
            response = KbName(response); 
            if length(response_array) == 0 
                response_array = response(1); 
                all_times = responseTime - startSecs; 
            else 
                response_array(end + 1) = response(1); 
                all_times(end+1) = responseTime - startSecs; 
            end
        end 
                KbQueueStop; 

            if keyCode == escKey 
                break;             
            end 
    end
    
end
end 


save seqorder.mat


ListenChar(0); 

if strcmp(type, 'recall')
end 
 
%-------------------------------------------------------------%
%-----------------------RECALL PHASE--------------------------% 
%-------------------------------------------------------------%

writetable(table, sprintf('subject_%d.csv', subjectNum))


     





   

 






 

