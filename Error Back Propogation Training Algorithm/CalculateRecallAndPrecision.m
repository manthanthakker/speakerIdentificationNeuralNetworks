
clear all;clc;
%load backp.mat W V Z;
load weights-707070.mat W V;
[filename,pathname] = uigetfile('C:\MyStuff\notes\be proj\dataset\run_project\mfccexcelfiles\*.xlsx');
%pathname
%filename

            path1= strcat(pathname,filename);  
            path1
            %filename=filename(1:end-5)
            S=filename;
            idx = find(ismember(S,'./\:'),1,'last');
            if S(idx) == '.'; S(idx:end) = []; 
            end
            extractnum=str2num(S);
xx=extractnum;
%ll=logical(xx);

sp1=0;
sp2=0;
sp3=0;
for i=0:0
   %fu =strcat('C:\Users\manthan\Google Drive\BE PROJECT\artificial\new audio\20-c\dual\12\sample',num2str(i),'_12.xls');
    
   % fu=strcat('C:\Users\manthan\Google Drive\BE PROJECT\artificial\new audio\20-c\dual\12\run.xlsx');
 Z=xlsread(path1);
%Z=xlsread('C:\Users\manthan\Desktop\be\20-coeff\w1\s1.xlsx');
count1=0;
count2=0;
count3=0;
trai_pairs=80;
        for p=20:trai_pairs
    
  
            z=transpose(Z(p,:));
            y=(tansig(V*(z)));
            o=(tansig(W*(y)));
            d1=abs(1-o(1));
            d2=abs(1-o(2));
            d3=abs(1-o(3));
            X=[d1 d2 d3];
            %    X=[d1 d2]; %Remove this for 3 speakers
            d=min(X);
            if(d==d1)
            count1=count1+1;
            end
            if(d==d2)
            count2=count2+1;
            end
            if(d==d3)
            count3=count3+1;
            end
   

   
        end
            %count1
            %count2
            %count3
            X=[count1 count2 count3];
            x1=1;
            x2=2;
            x3=3;
            x4=4;

if(xx<5)
            X=sort(X);
            c=X(2);
            d=X(3);
           %disp('hello');
           %c=max(X);
           %c
           if(c==count1 || d==count1)
           sp1=sp1+1;
           disp('s1');
           
           end
           if(c==count2 || d==count2)
           sp2=sp2+1;
           disp('s2');
           end
           if(c==count3 || d==count3)
           sp3=sp3+1;
           disp('s3');
           end
           if(sp1==1 && sp2==1)
               femalemalegui
           end
           if(sp2==1 && sp3==1)
               malemarathigui
           end
           if(sp1==1 && sp3==1)
               femalemarathigui
           end
           
           
end
    
if(xx>x4)
    
            %disp('SSSSSSSSup');
            c=max(X);
            if(c==count1)
            sp1=sp1+1;
            disp('s1');
            end
            if(c==count2)
            sp2=sp2+1;
            disp('s2');
            end
            if(c==count3)
            sp3=sp3+1;
            disp('s3');
            end
            if(sp1==1)
               femaleusgui
           end
           if(sp2==1)
               maleusgui
           end
           if(sp3==1)
               marathigui
           end

    
end% single ka end

end%for ka end

sp1
sp2
sp3
