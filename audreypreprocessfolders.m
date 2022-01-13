cd('/Users/audreyhooker/Desktop/XFBcohort/');
k=1;
q=1;
xfbDirect=cd; 
xfbDirectS=convertCharsToStrings(xfbDirect); 
stateDir=strcat(xfbDirectS,'/statescript_logs/'); %directory for statescript logs
folderContents=dir; %make struct of all folder info
folderNames=extractfield(folderContents, 'name');%take name column, put in new cells
dateYes=contains(folderNames,'2'); %which positions are real dates/folders
alldates= sum(dateYes);%how many real folders/dates are there
things2=string(zeros(alldates,1)); %make a new table to list all the real folders
while k<= length(folderNames) %go through folders
    cd(xfbDirectS)
    j=1;
    if dateYes(k)== 1 %check if folder is real date, otherwise skip
        value= folderNames(k); %pulls out name from folderNames
        value1=(cell2mat(value)); %converts from cell array to string
        valueS=convertCharsToStrings(value1);
        things2(q,1)= valueS; %adds string to table things2
        newfolder=strcat(stateDir, valueS); %where finished statescript files will go
        mkdir(newfolder)
        rawFolder=strcat(xfbDirectS,'/',valueS); %directory for each raw data folder
        q=q+1;
        cd(rawFolder)
        list=dir('*.stateScriptLog');  %inside raw data folder, get only statescipt files
        while j<=length(list)
            copyfile(list(j).name,newfolder) %copy each raw file to the new statescript folder
             j=j+1;
        end
    end
    k= k+1;
  
end
