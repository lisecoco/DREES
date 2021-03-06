function model_order=drxlr_gui_get_model_order_bootstrap(x,y,outcome, min_order, max_order,nboot,test_method, logiter_param,logtol_param, lambda)
%  Wrapper class for model order using bootstrap (+0.632)
%  Designed to be called from DREXLER_GUI
%
%  Originally written by Issam El Naqa 2003-2005
%  Extracted by AJH 2005 into a gui wrapper class and processing subfunction
%
%  For scripted use, see drxlr_find_model_order_bootstrap.m
%
% Copyright 2010, Joseph O. Deasy, on behalf of the DREES development team.
% 
% This file is part of the Dose Response Explorer System (DREES).
% 
% DREES development has been led by:  Issam El Naqa, Aditya Apte, Gita Suneja, and Joseph O. Deasy.
% 
% DREES has been financially supported by the US National Institutes of Health under multiple grants.
% 
% DREES is distributed under the terms of the Lesser GNU Public License. 
% 
%     This version of DREES is free software: you can redistribute it and/or modify
%     it under the terms of the GNU General Public License as published by
%     the Free Software Foundation, either version 3 of the License, or
%     (at your option) any later version.
% 
% DREES is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
% without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
% See the GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with DREES.  If not, see <http://www.gnu.org/licenses/>.

waitbar_handle = waitbar(0,['Model order estimation...']);
set(waitbar_handle,'name','Automated logistic regression');

% This is being run in a gui
guiflag =1;

[model_order, rs_boot_grade, rs_test_grade, rs_true_grade_mean, rs_true_grade_se] = drxlr_find_model_order_bootstrap(x,y,outcome, min_order, max_order,nboot,test_method, logiter_param,logtol_param, lambda, guiflag, waitbar_handle);

close(waitbar_handle);

figure, errorbar([min_order:max_order], rs_true_grade_mean,rs_true_grade_se)
xlabel('Model order'), ylabel('Spearman Correlation')
title('Bootstrap Model Order Estimation')

return
