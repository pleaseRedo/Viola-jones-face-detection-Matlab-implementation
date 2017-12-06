function DrawRectangle(row0, col0, row1, col1, styleStr)

% Draw a rectange from row0, col0 to row1, col1

line([col0; col0], [row0; row1], styleStr{:});
line([col1; col1], [row0; row1], styleStr{:});
line([col0; col1], [row0; row0], styleStr{:});
line([col0; col1], [row1; row1], styleStr{:});