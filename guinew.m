
UIControl_FontSize_bak = get(0, 'DefaultUIControlFontSize');
        set(0, 'DefaultUIControlFontSize', 10);
ch=menu('Speaker Recognition System','Samples','MFCC','Testing','Exit');
    if ch==1
        
        %set(0, 'DefaultUIControlFontSize', UIControl_FontSize_bak);
       ch1=menu('Recordings','Browser for file');
       if ch1==1
            %change path according to your pc
          [filename,pathname] = uigetfile('C:\MyStuff\notes\be proj\dataset\run_project\Recordings\*.wav');
            path1= strcat(pathname,filename);
            y=path1;
            disp(y);
            [voiceIn,fs] = wavread(y);
            plot(voiceIn,'DisplayName','voiceIn','YDataSource','voiceIn');
            figure(gcf)
            sound(voiceIn,fs); 
       end
    end
    if ch==2
        mfccgui; 
    end
    if ch==3
        testinggui
    end
    