fliename = "F:\data\3.0_normal_data\origin\MR0201881\MR0201881_T2W\MR0201881_T2W_";
writepath = "F:\data\3.0_normal_data\matlabshengcheng\MR0201881_T2W_";
N = 20;
for i = 0:N-1

    Ia = dicomread(fliename+num2str(i)+".dcm");
    Da = dicominfo(fliename+num2str(i)+".dcm");
    if i == N-1
        Ib = dicomread(fliename+num2str(i)+".dcm");
        Db = dicominfo(fliename+num2str(i)+".dcm");
    else
        Ib = dicomread(fliename+num2str(i+1)+".dcm");
        Db = dicominfo(fliename+num2str(i+1)+".dcm");
    end
    Da.InstanceNumber = i * 2 + 1;
    Da.SliceThickness = 2;
    dicomwrite(Ia, writepath+num2str(2*i)+".dcm",Da);


    Da.InstanceNumber = i * 2 + 2;
    Da.SliceLocation = Da.SliceLocation+2.2;
    Da.ImagePositionPatient(3,1) = Da.ImagePositionPatient(3,1)+2.2;
    dicomwrite((Ia+Ib)/2, writepath+num2str(2*i+1)+".dcm",Da);
end



% for i = 0:0
%     Ia = dicomread(fliename+num2str(i)+".dcm")
%     Ib = dicomread(fliename+num2str(i+1)+".dcm")
%     Imid = (Ia+Ib)/2
%     imshow(Imid,[]);
% end