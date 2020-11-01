[{
  "name":"классификация по первой странице",
  "slug":"first_page",
  "base":true,
},
{
  "name":"базовая классификация",
  "slug":"basic",
  "base":true,
},
{
  "name":"предопределенный пользователем",
  "slug":"user",
  "base":true,
},
{
  "name":"Свидетельство об утверждении",
  "slug":"certificate_of_approval",
  "base":false,
},
{
  "name":"архитектурно-градостроительного решения",
  "slug":"architectural_urban_planning_solutions",
  "base":false,
},
{
  "name":"Договор аренды земельного участка",
  "slug":"land_lease_contract",
  "base":false,
},
{
  "name":"Технический паспорт",
  "slug":"technichal_passport",
  "base":false,
},
{
  "name":"Разрешение на строительство",
  "slug":"building_permit",
  "base":false,
},
{
  "name":"Разрешение на ввод объекта в эксплуатацию",
  "slug":"facility_into_operation_permission",
  "base":false,
}].each do |classification_type_params|
  ClassificationType.create classification_type_params
end
