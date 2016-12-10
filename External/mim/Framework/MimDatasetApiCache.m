classdef MimDatasetApiCache < handle
    % MimDatasetApiCache. Part of the internal framework for the Pulmonary Toolkit.
    %
    %     You should not use this class within your own code. It is intended to
    %     be used internally within the Pulmonary Toolkit.
    %
    %     MimDatasetApiCache stores a map of MimDataset objects, and
    %     ensures only one MimDataset exists for a given UID. This improves
    %     thread safety by ensuring multiple MimDataset objects aren't
    %     interacting with the same cache files.
    %
    %
    %     Licence
    %     -------
    %     Part of the TD Pulmonary Toolkit. https://github.com/tomdoel/pulmonarytoolkit
    %     Author: Tom Doel, 2014.  www.tomdoel.com
    %     Distributed under the GNU GPL v3 licence. Please see website for details.
    %
    
    properties (Access = private)
        FrameworkAppDef
        DatasetCacheMap
    end
    
    methods
        function obj = MimDatasetApiCache(framework_app_def)
            obj.FrameworkAppDef = framework_app_def;
            obj.DatasetCacheMap = containers.Map;
        end
        
        function dataset_disk_cache = GetDatasetDiskCache(obj, uid, reporting)
            if obj.DatasetCacheMap.isKey(uid)
                dataset_disk_cache = obj.DatasetCacheMap(uid);
            else
                dataset_disk_cache = MimDatasetCacheSelector(uid, obj.FrameworkAppDef, reporting);
                obj.DatasetCacheMap(uid) = dataset_disk_cache;
            end
        end
    end
end
