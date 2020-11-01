ClassificationType.delete_all
[{
  "name":"классификация по первой странице",
  "slug":"first_page",
  "base":false,
  "user_label":false,
},
{
  "name":"базовая классификация",
  "slug":"basic",
  "base":true,
  "user_label":false,
},
{
  "name":"предопределенный пользователем",
  "slug":"user",
  "base":false,
  "user_label":false,
},
{
  "name":"Свидетельство об утверждении",
  "slug":"certificate_of_approval",
  "base":false,
  "user_label":true,
},
{
  "name":"архитектурно-градостроительного решения",
  "slug":"architectural_urban_planning_solutions",
  "base":false,
  "user_label":true,
},
{
  "name":"Договор аренды земельного участка",
  "slug":"land_lease_contract",
  "base":false,
  "user_label":true,
},
{
  "name":"Технический паспорт",
  "slug":"technichal_passport",
  "base":false,
  "user_label":true,
},
{
  "name":"Разрешение на строительство",
  "slug":"building_permit",
  "base":false,
  "user_label":true,
},
{
  "name":"Разрешение на ввод объекта в эксплуатацию",
  "slug":"facility_into_operation_permission",
  "base":false,
  "user_label":true,
}].each do |classification_type_params|
  ClassificationType.create classification_type_params
end
