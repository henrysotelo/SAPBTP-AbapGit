@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Libros de la biblioteca virtual'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZC_LIBRO_8712
  as select from    ztb_libros_12          as Libros
    inner join      ztb_catego_12          as Categoria on Categoria.bi_categ = Libros.bi_categ
    left outer join ZC_CLNTS_LIB_8712      as Ventas    on Ventas.IdLibro = Libros.id_libro
    association [0..*] to ZC_CLIENTES_8712 as _Clientes on _Clientes.idLibro =  $projection.IdLibro  
{
  key Libros.id_libro  as IdLibro,
      Libros.bi_categ  as Categoria,
      Libros.titulo    as Titulo,
      Libros.autor     as Autor,
      Libros.editorial as Editorial,
      Libros.idioma    as Idioma,
      Libros.paginas   as Paginas,
      @Semantics.amount.currencyCode : 'moneda'
      Libros.precio    as Precio,
      case
         when Ventas.Ventas < 1 then 0
         when Ventas.Ventas = 1 then 1
         when Ventas.Ventas = 2 then 2
        else 3
      end              as Ventas,
        case Ventas.Ventas
        when 0 then ''
        else ''
      end              as Text,
      Libros.moneda    as Moneda,
      Libros.formato   as Formato,
      Categoria.descripcion as Descripcion,
      Libros.url       as Url,
      _Clientes
}



















