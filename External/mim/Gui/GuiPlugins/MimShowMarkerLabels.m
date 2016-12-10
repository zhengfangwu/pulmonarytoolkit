classdef MimShowMarkerLabels < MimGuiPlugin
    % MimShowMarkerLabels. Gui Plugin for switching transparency of zero
    %
    %     You should not use this class within your own code. It is intended to
    %     be used by the gui of the Pulmonary Toolkit.
    %
    %     MimShowMarkerLabels is a Gui Plugin for the MIM Toolkit.
    %
    %
    %     Licence
    %     -------
    %     Part of the TD Pulmonary Toolkit. https://github.com/tomdoel/pulmonarytoolkit
    %     Author: Tom Doel, 2012.  www.tomdoel.com
    %     Distributed under the GNU GPL v3 licence. Please see website for details.
    %    
    
    properties
        ButtonText = 'Show coordinates'
        SelectedText = 'Hide coordinates'
        ToolTip = 'Changes whether markers show coordinate labels'
        Category = 'Marker display'
        Visibility = 'Dataset'
        Mode = 'Markers'

        HidePluginInDisplay = false
        PTKVersion = '1'
        ButtonWidth = 6
        ButtonHeight = 1
        Icon = 'marker_label.png'
    end
    
    methods (Static)
        function RunGuiPlugin(gui_app)
            gui_app.ImagePanel.MarkerImageDisplayParameters.ShowLabels = ~gui_app.ImagePanel.MarkerImageDisplayParameters.ShowLabels;
        end
        
        function enabled = IsEnabled(gui_app)
            enabled = gui_app.IsDatasetLoaded && gui_app.ImagePanel.OverlayImage.ImageExists;
        end
        
        function is_selected = IsSelected(gui_app)
            is_selected = gui_app.ImagePanel.MarkerImageDisplayParameters.ShowLabels;
        end
    end
end