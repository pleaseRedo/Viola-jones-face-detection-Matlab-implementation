function verifyImageDir(imagedir)
    if exist(imagedir, 'dir') == 0
        error('Error: Image directory set incorrectly');
    end
end