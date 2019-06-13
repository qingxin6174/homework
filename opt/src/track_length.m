function track_len = track_length(pathSegObj)
% 返回轨迹总长
track_len = 0;
for idx = 1:length(pathSegObj)
    track_len = track_len + pathSegObj{idx}.Length;
end