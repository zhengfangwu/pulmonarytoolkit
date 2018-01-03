classdef PTKEnableAirwayAnalysis < MimGuiPlugin
    % PTKEnableAirwayAnalysis. Gui Plugin for activating lobe segmentation
    %
    %     You should not use this class within your own code. It is intended to
    %     be used by the gui of the Pulmonary Toolkit.
    %
    %
    %     Licence
    %     -------
    %     Part of the TD Pulmonary Toolkit. https://github.com/tomdoel/pulmonarytoolkit
    %     Author: Tom Doel, 2012.  www.tomdoel.com
    %     Distributed under the GNU GPL v3 licence. Please see website for details.
    %    
    
    properties
        ButtonText = 'Turn on airways'
        SelectedText = 'Turn off airways'
        ToolTip = 'Controls whether analysis will include airway metrics'
        Category = 'CT regional'
        Visibility = 'Dataset'
        Mode = 'Analysis'

        HidePluginInDisplay = false
        PTKVersion = '1'
        ButtonWidth = 6
        ButtonHeight = 1
        Icon = 'airway_analysis.png'
        Location = 2
    end
    
    methods (Static)
        function RunGuiPlugin(gui_app)
            gui_app.AnalysisProfile.SetProfileActive('Airways', ~PTKEnableAirwayAnalysis.IsSelected(gui_app));
        end

        function enabled = IsEnabled(gui_app)
            enabled = gui_app.IsDatasetLoaded() && gui_app.IsCT();
        end
        
        function is_selected = IsSelected(gui_app)
            is_selected = gui_app.AnalysisProfile.IsActive('Airways', true);
        end

    end
end