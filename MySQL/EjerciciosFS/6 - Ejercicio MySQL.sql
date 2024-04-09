use pvalverde;

select *,
    case editorial
        when 'PLANETA' then 'EDITORIAL 1'
        when 'O´REILLY' then 'EDITORIAL 2'
        when 'RBA' then 'EDITORIAL 3'
        else 'Otro'
    end as descripcion
from
    editoriales;