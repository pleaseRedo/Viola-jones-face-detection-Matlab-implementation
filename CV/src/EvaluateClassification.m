% EvaluateClassification.m

function EvaluateClassification(test_pred, test_true, names, rects, im);

% Evaluate the classifications of face images represented by rects in im

% test_pred should be a vector of numbers from 1 to 20 corresponding to the
% person in the dataset

nRects = size(rects, 1);
nTest = sum(~strcmp(test_true, 'x'));

figure; imshow(im);
strRed = {'Color', 'r', 'BackgroundColor', 'k', 'FontSize', 12};
strGreen = {'Color', 'g', 'BackgroundColor', 'k', 'FontSize', 12};
nCorrect = 0;
for i = 1:nRects
    if (~strcmp(test_true{i}, 'x'))
        if (strcmp(names{test_pred(i)}, test_true{i}))
            text(rects(i, 2), rects(i, 1), names{test_pred(i)}, strGreen{:});
            nCorrect = nCorrect + 1;
        else
            text(rects(i, 2), rects(i, 1), names{test_pred(i)}, strRed{:});
        end;
    end;
end;

disp(sprintf('%d out of %d correct', nCorrect, nTest));