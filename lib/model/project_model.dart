// // To parse this JSON data, do
// //
// //     final welcome = welcomeFromJson(jsonString);

// import 'dart:convert';

// class Welcome {
//     Welcome({
//         this.code,
//         this.data,
//         this.message,
//     });

//     int code;
//     Data data;
//     String message;

//     factory Welcome.fromRawJson(String str) => Welcome.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
//         code: json["code"],
//         data: Data.fromJson(json["data"]),
//         message: json["message"],
//     );

//     Map<String, dynamic> toJson() => {
//         "code": code,
//         "data": data.toJson(),
//         "message": message,
//     };
// }

// class Data {
//     Data({
//         this.entries,
//         this.pagination,
//     });

//     List<Entry> entries;
//     Pagination pagination;

//     factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory Data.fromJson(Map<String, dynamic> json) => Data(
//         entries: List<Entry>.from(json["entries"].map((x) => Entry.fromJson(x))),
//         pagination: Pagination.fromJson(json["pagination"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "entries": List<dynamic>.from(entries.map((x) => x.toJson())),
//         "pagination": pagination.toJson(),
//     };
// }

// class Entry {
//     Entry({
//         this.id,
//         this.description,
//         this.productId,
//         this.laborId,
//         this.batchId,
//         this.stageId,
//         this.images,
//         this.processId,
//         this.businesses,
//         this.isTraceable,
//         this.executionTime,
//         this.loggedAt,
//         this.createdBy,
//         this.createdAt,
//         this.updatedBy,
//         this.updatedAt,
//         this.deletedBy,
//         this.deletedAt,
//         this.labor,
//         this.batch,
//         this.product,
//         this.stage,
//         this.process,
//     });

//     String id;
//     String description;
//     String productId;
//     LaborIdEnum laborId;
//     String batchId;
//     String stageId;
//     List<dynamic> images;
//     String processId;
//     List<Business> businesses;
//     bool isTraceable;
//     DateTime executionTime;
//     DateTime loggedAt;
//     LaborIdEnum createdBy;
//     DateTime createdAt;
//     LaborIdEnum updatedBy;
//     DateTime updatedAt;
//     String deletedBy;
//     dynamic deletedAt;
//     Labor labor;
//     Batch batch;
//     Product product;
//     Stage stage;
//     Process process;

//     factory Entry.fromRawJson(String str) => Entry.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory Entry.fromJson(Map<String, dynamic> json) => Entry(
//         id: json["id"],
//         description: json["description"],
//         productId: json["product_id"],
//         laborId: laborIdEnumValues.map[json["labor_id"]],
//         batchId: json["batch_id"],
//         stageId: json["stage_id"],
//         images: json["images"] == null ? null : List<dynamic>.from(json["images"].map((x) => x)),
//         processId: json["process_id"],
//         businesses: json["businesses"] == null ? null : List<Business>.from(json["businesses"].map((x) => Business.fromJson(x))),
//         isTraceable: json["is_traceable"],
//         executionTime: DateTime.parse(json["execution_time"]),
//         loggedAt: DateTime.parse(json["logged_at"]),
//         createdBy: laborIdEnumValues.map[json["created_by"]],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedBy: laborIdEnumValues.map[json["updated_by"]],
//         updatedAt: DateTime.parse(json["updated_at"]),
//         deletedBy: json["deleted_by"],
//         deletedAt: json["deleted_at"],
//         labor: Labor.fromJson(json["labor"]),
//         batch: Batch.fromJson(json["batch"]),
//         product: Product.fromJson(json["product"]),
//         stage: Stage.fromJson(json["stage"]),
//         process: Process.fromJson(json["process"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "description": description,
//         "product_id": productId,
//         "labor_id": laborIdEnumValues.reverse[laborId],
//         "batch_id": batchId,
//         "stage_id": stageId,
//         "images": images == null ? null : List<dynamic>.from(images.map((x) => x)),
//         "process_id": processId,
//         "businesses": businesses == null ? null : List<dynamic>.from(businesses.map((x) => x.toJson())),
//         "is_traceable": isTraceable,
//         "execution_time": executionTime.toIso8601String(),
//         "logged_at": loggedAt.toIso8601String(),
//         "created_by": laborIdEnumValues.reverse[createdBy],
//         "created_at": createdAt.toIso8601String(),
//         "updated_by": laborIdEnumValues.reverse[updatedBy],
//         "updated_at": updatedAt.toIso8601String(),
//         "deleted_by": deletedBy,
//         "deleted_at": deletedAt,
//         "labor": labor.toJson(),
//         "batch": batch.toJson(),
//         "product": product.toJson(),
//         "stage": stage.toJson(),
//         "process": process.toJson(),
//     };
// }

// class Batch {
//     Batch({
//         this.id,
//         this.batchNumber,
//         this.processId,
//         this.productId,
//         this.laborIds,
//         this.rawMaterialAreaId,
//         this.userId,
//         this.name,
//         this.images,
//         this.description,
//         this.createdBy,
//         this.createdAt,
//         this.updatedBy,
//         this.updatedAt,
//         this.deletedBy,
//         this.deletedAt,
//         this.process,
//         this.product,
//         this.labors,
//         this.user,
//     });

//     String id;
//     String batchNumber;
//     String processId;
//     String productId;
//     dynamic laborIds;
//     String rawMaterialAreaId;
//     String userId;
//     String name;
//     dynamic images;
//     String description;
//     String createdBy;
//     DateTime createdAt;
//     String updatedBy;
//     DateTime updatedAt;
//     String deletedBy;
//     dynamic deletedAt;
//     Process process;
//     Product product;
//     dynamic labors;
//     User user;

//     factory Batch.fromRawJson(String str) => Batch.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory Batch.fromJson(Map<String, dynamic> json) => Batch(
//         id: json["id"],
//         batchNumber: json["batch_number"],
//         processId: json["process_id"],
//         productId: json["product_id"],
//         laborIds: json["labor_ids"],
//         rawMaterialAreaId: json["raw_material_area_id"],
//         userId: json["user_id"],
//         name: json["name"],
//         images: json["images"],
//         description: json["description"],
//         createdBy: json["created_by"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedBy: json["updated_by"],
//         updatedAt: DateTime.parse(json["updated_at"]),
//         deletedBy: json["deleted_by"],
//         deletedAt: json["deleted_at"],
//         process: Process.fromJson(json["process"]),
//         product: Product.fromJson(json["product"]),
//         labors: json["labors"],
//         user: User.fromJson(json["user"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "batch_number": batchNumber,
//         "process_id": processId,
//         "product_id": productId,
//         "labor_ids": laborIds,
//         "raw_material_area_id": rawMaterialAreaId,
//         "user_id": userId,
//         "name": name,
//         "images": images,
//         "description": description,
//         "created_by": createdBy,
//         "created_at": createdAt.toIso8601String(),
//         "updated_by": updatedBy,
//         "updated_at": updatedAt.toIso8601String(),
//         "deleted_by": deletedBy,
//         "deleted_at": deletedAt,
//         "process": process.toJson(),
//         "product": product.toJson(),
//         "labors": labors,
//         "user": user.toJson(),
//     };
// }

// class Process {
//     Process({
//         this.id,
//         this.userId,
//         this.name,
//         this.images,
//         this.description,
//         this.certificate,
//         this.date,
//         this.createdBy,
//         this.createdAt,
//         this.updatedBy,
//         this.updatedAt,
//         this.deletedBy,
//         this.deletedAt,
//     });

//     String id;
//     String userId;
//     String name;
//     dynamic images;
//     String description;
//     String certificate;
//     String date;
//     String createdBy;
//     DateTime createdAt;
//     String updatedBy;
//     DateTime updatedAt;
//     String deletedBy;
//     dynamic deletedAt;

//     factory Process.fromRawJson(String str) => Process.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory Process.fromJson(Map<String, dynamic> json) => Process(
//         id: json["id"],
//         userId: json["user_id"],
//         name: json["name"],
//         images: json["images"],
//         description: json["description"],
//         certificate: json["certificate"],
//         date: json["date"],
//         createdBy: json["created_by"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedBy: json["updated_by"],
//         updatedAt: DateTime.parse(json["updated_at"]),
//         deletedBy: json["deleted_by"],
//         deletedAt: json["deleted_at"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "user_id": userId,
//         "name": name,
//         "images": images,
//         "description": description,
//         "certificate": certificate,
//         "date": date,
//         "created_by": createdBy,
//         "created_at": createdAt.toIso8601String(),
//         "updated_by": updatedBy,
//         "updated_at": updatedAt.toIso8601String(),
//         "deleted_by": deletedBy,
//         "deleted_at": deletedAt,
//     };
// }

// class Product {
//     Product({
//         this.id,
//         this.userId,
//         this.name,
//         this.description,
//         this.productGroupId,
//         this.productUnitId,
//         this.isHighlight,
//         this.price,
//         this.status,
//         this.isApproved,
//         this.images,
//         this.createdAt,
//         this.createdBy,
//         this.updatedAt,
//         this.updatedBy,
//         this.deletedAt,
//         this.deletedBy,
//         this.productGroup,
//         this.user,
//         this.productUnit,
//         this.countStamp,
//     });

//     String id;
//     String userId;
//     String name;
//     String description;
//     int productGroupId;
//     String productUnitId;
//     bool isHighlight;
//     int price;
//     bool status;
//     bool isApproved;
//     dynamic images;
//     DateTime createdAt;
//     String createdBy;
//     DateTime updatedAt;
//     String updatedBy;
//     dynamic deletedAt;
//     String deletedBy;
//     WardClass productGroup;
//     User user;
//     ProductUnit productUnit;
//     int countStamp;

//     factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory Product.fromJson(Map<String, dynamic> json) => Product(
//         id: json["id"],
//         userId: json["user_id"],
//         name: json["name"],
//         description: json["description"],
//         productGroupId: json["product_group_id"],
//         productUnitId: json["product_unit_id"],
//         isHighlight: json["is_highlight"],
//         price: json["price"],
//         status: json["status"],
//         isApproved: json["is_approved"],
//         images: json["images"],
//         createdAt: DateTime.parse(json["created_at"]),
//         createdBy: json["created_by"],
//         updatedAt: DateTime.parse(json["updated_at"]),
//         updatedBy: json["updated_by"],
//         deletedAt: json["deleted_at"],
//         deletedBy: json["deleted_by"],
//         productGroup: WardClass.fromJson(json["product_group"]),
//         user: User.fromJson(json["user"]),
//         productUnit: ProductUnit.fromJson(json["product_unit"]),
//         countStamp: json["count_stamp"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "user_id": userId,
//         "name": name,
//         "description": description,
//         "product_group_id": productGroupId,
//         "product_unit_id": productUnitId,
//         "is_highlight": isHighlight,
//         "price": price,
//         "status": status,
//         "is_approved": isApproved,
//         "images": images,
//         "created_at": createdAt.toIso8601String(),
//         "created_by": createdBy,
//         "updated_at": updatedAt.toIso8601String(),
//         "updated_by": updatedBy,
//         "deleted_at": deletedAt,
//         "deleted_by": deletedBy,
//         "product_group": productGroup.toJson(),
//         "user": user.toJson(),
//         "product_unit": productUnit.toJson(),
//         "count_stamp": countStamp,
//     };
// }

// class WardClass {
//     WardClass({
//         this.id,
//         this.name,
//         this.description,
//         this.createdAt,
//         this.createdBy,
//         this.updatedAt,
//         this.updatedBy,
//         this.deletedAt,
//         this.deletedBy,
//         this.meta,
//         this.districtId,
//         this.isShow,
//         this.alias,
//         this.provinceId,
//     });

//     int id;
//     String name;
//     String description;
//     DateTime createdAt;
//     String createdBy;
//     DateTime updatedAt;
//     String updatedBy;
//     dynamic deletedAt;
//     String deletedBy;
//     Meta meta;
//     int districtId;
//     bool isShow;
//     String alias;
//     int provinceId;

//     factory WardClass.fromRawJson(String str) => WardClass.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory WardClass.fromJson(Map<String, dynamic> json) => WardClass(
//         id: json["id"],
//         name: json["name"],
//         description: json["description"] == null ? null : json["description"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         createdBy: json["createdBy"],
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         updatedBy: json["updatedBy"],
//         deletedAt: json["deletedAt"],
//         deletedBy: json["deletedBy"],
//         meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
//         districtId: json["districtId"] == null ? null : json["districtId"],
//         isShow: json["isShow"] == null ? null : json["isShow"],
//         alias: json["alias"] == null ? null : json["alias"],
//         provinceId: json["provinceId"] == null ? null : json["provinceId"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "description": description == null ? null : description,
//         "createdAt": createdAt.toIso8601String(),
//         "createdBy": createdBy,
//         "updatedAt": updatedAt.toIso8601String(),
//         "updatedBy": updatedBy,
//         "deletedAt": deletedAt,
//         "deletedBy": deletedBy,
//         "meta": meta == null ? null : meta.toJson(),
//         "districtId": districtId == null ? null : districtId,
//         "isShow": isShow == null ? null : isShow,
//         "alias": alias == null ? null : alias,
//         "provinceId": provinceId == null ? null : provinceId,
//     };
// }

// class Meta {
//     Meta({
//         this.product,
//     });

//     int product;

//     factory Meta.fromRawJson(String str) => Meta.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory Meta.fromJson(Map<String, dynamic> json) => Meta(
//         product: json["product"],
//     );

//     Map<String, dynamic> toJson() => {
//         "product": product,
//     };
// }

// class ProductUnit {
//     ProductUnit({
//         this.id,
//         this.name,
//         this.createdAt,
//         this.createdBy,
//         this.updatedAt,
//         this.updatedBy,
//         this.deletedAt,
//         this.deletedBy,
//     });

//     String id;
//     String name;
//     DateTime createdAt;
//     String createdBy;
//     DateTime updatedAt;
//     String updatedBy;
//     dynamic deletedAt;
//     String deletedBy;

//     factory ProductUnit.fromRawJson(String str) => ProductUnit.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory ProductUnit.fromJson(Map<String, dynamic> json) => ProductUnit(
//         id: json["id"],
//         name: json["name"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         createdBy: json["createdBy"],
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         updatedBy: json["updatedBy"],
//         deletedAt: json["deletedAt"],
//         deletedBy: json["deletedBy"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "createdAt": createdAt.toIso8601String(),
//         "createdBy": createdBy,
//         "updatedAt": updatedAt.toIso8601String(),
//         "updatedBy": updatedBy,
//         "deletedAt": deletedAt,
//         "deletedBy": deletedBy,
//     };
// }

// class User {
//     User({
//         this.id,
//         this.name,
//         this.avatar,
//         this.banners,
//         this.images,
//         this.username,
//         this.fullName,
//         this.website,
//         this.location,
//         this.color,
//         this.scaleProduction,
//         this.scaleFactory,
//         this.representative,
//         this.roleId,
//         this.email,
//         this.phone,
//         this.slug,
//         this.businessRegistration,
//         this.businessRegistrationPlace,
//         this.businessRegistrationCreatedAt,
//         this.homeNumber,
//         this.thumbnail,
//         this.provinceId,
//         this.districtId,
//         this.wardId,
//         this.resetToken,
//         this.resetExpiredAt,
//         this.isLock,
//         this.isHighlight,
//         this.lockedAt,
//         this.isApproved,
//         this.lastLoginAt,
//         this.lastActivatedAt,
//         this.lastLoggedFailAt,
//         this.loginFailedCount,
//         this.lastLoggedAt,
//         this.manufacturingFormId,
//         this.manufacturingSectorId,
//         this.canEditTraceability,
//         this.createdBy,
//         this.createdAt,
//         this.updatedBy,
//         this.updatedAt,
//         this.deletedAt,
//         this.deletedBy,
//         this.password,
//         this.passwordConfirm,
//         this.province,
//         this.district,
//         this.ward,
//         this.role,
//         this.description,
//         this.address,
//         this.manufacturingForm,
//         this.manufacturingSector,
//         this.products,
//     });

//     String id;
//     String name;
//     String avatar;
//     dynamic banners;
//     dynamic images;
//     String username;
//     String fullName;
//     String website;
//     String location;
//     String color;
//     String scaleProduction;
//     String scaleFactory;
//     String representative;
//     String roleId;
//     String email;
//     String phone;
//     String slug;
//     String businessRegistration;
//     String businessRegistrationPlace;
//     String businessRegistrationCreatedAt;
//     String homeNumber;
//     String thumbnail;
//     int provinceId;
//     int districtId;
//     int wardId;
//     String resetToken;
//     DateTime resetExpiredAt;
//     bool isLock;
//     bool isHighlight;
//     dynamic lockedAt;
//     bool isApproved;
//     dynamic lastLoginAt;
//     dynamic lastActivatedAt;
//     dynamic lastLoggedFailAt;
//     int loginFailedCount;
//     dynamic lastLoggedAt;
//     int manufacturingFormId;
//     int manufacturingSectorId;
//     bool canEditTraceability;
//     String createdBy;
//     DateTime createdAt;
//     String updatedBy;
//     DateTime updatedAt;
//     dynamic deletedAt;
//     String deletedBy;
//     String password;
//     String passwordConfirm;
//     Province province;
//     UserDistrict district;
//     Ward ward;
//     dynamic role;
//     String description;
//     String address;
//     Manufacturing manufacturingForm;
//     Manufacturing manufacturingSector;
//     dynamic products;

//     factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory User.fromJson(Map<String, dynamic> json) => User(
//         id: json["id"],
//         name: json["name"],
//         avatar: json["avatar"],
//         banners: json["banners"],
//         images: json["images"],
//         username: json["username"],
//         fullName: json["full_name"],
//         website: json["website"],
//         location: json["location"],
//         color: json["color"],
//         scaleProduction: json["scale_production"],
//         scaleFactory: json["scale_factory"],
//         representative: json["representative"],
//         roleId: json["role_id"],
//         email: json["email"],
//         phone: json["phone"],
//         slug: json["slug"],
//         businessRegistration: json["business_registration"],
//         businessRegistrationPlace: json["business_registration_place"],
//         businessRegistrationCreatedAt: json["business_registration_created_at"],
//         homeNumber: json["home_number"],
//         thumbnail: json["thumbnail"],
//         provinceId: json["province_id"],
//         districtId: json["district_id"],
//         wardId: json["ward_id"],
//         resetToken: json["reset_token"],
//         resetExpiredAt: DateTime.parse(json["reset_expired_at"]),
//         isLock: json["is_lock"],
//         isHighlight: json["is_highlight"],
//         lockedAt: json["locked_at"],
//         isApproved: json["is_approved"],
//         lastLoginAt: json["last_login_at"],
//         lastActivatedAt: json["last_activated_at"],
//         lastLoggedFailAt: json["last_logged_fail_at"],
//         loginFailedCount: json["login_failed_count"],
//         lastLoggedAt: json["last_logged_at"],
//         manufacturingFormId: json["manufacturing_form_id"],
//         manufacturingSectorId: json["manufacturing_sector_id"],
//         canEditTraceability: json["can_edit_traceability"],
//         createdBy: json["created_by"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedBy: json["updated_by"],
//         updatedAt: DateTime.parse(json["updated_at"]),
//         deletedAt: json["deleted_at"],
//         deletedBy: json["deleted_by"],
//         password: json["password"],
//         passwordConfirm: json["password_confirm"],
//         province: Province.fromJson(json["province"]),
//         district: UserDistrict.fromJson(json["district"]),
//         ward: Ward.fromJson(json["ward"]),
//         role: json["role"],
//         description: json["description"],
//         address: json["address"],
//         manufacturingForm: Manufacturing.fromJson(json["manufacturing_form"]),
//         manufacturingSector: Manufacturing.fromJson(json["manufacturing_sector"]),
//         products: json["products"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "avatar": avatar,
//         "banners": banners,
//         "images": images,
//         "username": username,
//         "full_name": fullName,
//         "website": website,
//         "location": location,
//         "color": color,
//         "scale_production": scaleProduction,
//         "scale_factory": scaleFactory,
//         "representative": representative,
//         "role_id": roleId,
//         "email": email,
//         "phone": phone,
//         "slug": slug,
//         "business_registration": businessRegistration,
//         "business_registration_place": businessRegistrationPlace,
//         "business_registration_created_at": businessRegistrationCreatedAt,
//         "home_number": homeNumber,
//         "thumbnail": thumbnail,
//         "province_id": provinceId,
//         "district_id": districtId,
//         "ward_id": wardId,
//         "reset_token": resetToken,
//         "reset_expired_at": resetExpiredAt.toIso8601String(),
//         "is_lock": isLock,
//         "is_highlight": isHighlight,
//         "locked_at": lockedAt,
//         "is_approved": isApproved,
//         "last_login_at": lastLoginAt,
//         "last_activated_at": lastActivatedAt,
//         "last_logged_fail_at": lastLoggedFailAt,
//         "login_failed_count": loginFailedCount,
//         "last_logged_at": lastLoggedAt,
//         "manufacturing_form_id": manufacturingFormId,
//         "manufacturing_sector_id": manufacturingSectorId,
//         "can_edit_traceability": canEditTraceability,
//         "created_by": createdBy,
//         "created_at": createdAt.toIso8601String(),
//         "updated_by": updatedBy,
//         "updated_at": updatedAt.toIso8601String(),
//         "deleted_at": deletedAt,
//         "deleted_by": deletedBy,
//         "password": password,
//         "password_confirm": passwordConfirm,
//         "province": province.toJson(),
//         "district": district.toJson(),
//         "ward": ward.toJson(),
//         "role": role,
//         "description": description,
//         "address": address,
//         "manufacturing_form": manufacturingForm.toJson(),
//         "manufacturing_sector": manufacturingSector.toJson(),
//         "products": products,
//     };
// }

// class UserDistrict {
//     UserDistrict({
//         this.id,
//         this.name,
//         this.alias,
//         this.provinceId,
//         this.isShow,
//         this.createdBy,
//         this.createdAt,
//         this.updatedBy,
//         this.updatedAt,
//         this.deletedBy,
//         this.deletedAt,
//     });

//     int id;
//     String name;
//     String alias;
//     int provinceId;
//     bool isShow;
//     String createdBy;
//     DateTime createdAt;
//     String updatedBy;
//     DateTime updatedAt;
//     String deletedBy;
//     dynamic deletedAt;

//     factory UserDistrict.fromRawJson(String str) => UserDistrict.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory UserDistrict.fromJson(Map<String, dynamic> json) => UserDistrict(
//         id: json["id"],
//         name: json["name"],
//         alias: json["alias"],
//         provinceId: json["provinceId"],
//         isShow: json["isShow"],
//         createdBy: json["createdBy"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedBy: json["updatedBy"],
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         deletedBy: json["deletedBy"],
//         deletedAt: json["deletedAt"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "alias": alias,
//         "provinceId": provinceId,
//         "isShow": isShow,
//         "createdBy": createdBy,
//         "createdAt": createdAt.toIso8601String(),
//         "updatedBy": updatedBy,
//         "updatedAt": updatedAt.toIso8601String(),
//         "deletedBy": deletedBy,
//         "deletedAt": deletedAt,
//     };
// }

// class Manufacturing {
//     Manufacturing({
//         this.id,
//         this.name,
//     });

//     int id;
//     String name;

//     factory Manufacturing.fromRawJson(String str) => Manufacturing.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory Manufacturing.fromJson(Map<String, dynamic> json) => Manufacturing(
//         id: json["id"],
//         name: json["name"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//     };
// }

// class Province {
//     Province({
//         this.id,
//         this.alias,
//         this.name,
//         this.domain,
//         this.regionId,
//         this.latitude,
//         this.longitude,
//         this.isShow,
//     });

//     int id;
//     String alias;
//     String name;
//     String domain;
//     int regionId;
//     String latitude;
//     String longitude;
//     bool isShow;

//     factory Province.fromRawJson(String str) => Province.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory Province.fromJson(Map<String, dynamic> json) => Province(
//         id: json["id"],
//         alias: json["alias"],
//         name: json["name"],
//         domain: json["domain"],
//         regionId: json["regionId"],
//         latitude: json["latitude"],
//         longitude: json["longitude"],
//         isShow: json["isShow"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "alias": alias,
//         "name": name,
//         "domain": domain,
//         "regionId": regionId,
//         "latitude": latitude,
//         "longitude": longitude,
//         "isShow": isShow,
//     };
// }

// class Ward {
//     Ward({
//         this.id,
//         this.name,
//         this.districtId,
//         this.isShow,
//         this.createdBy,
//         this.createdAt,
//         this.updatedBy,
//         this.updatedAt,
//         this.deletedBy,
//         this.deletedAt,
//     });

//     int id;
//     String name;
//     int districtId;
//     bool isShow;
//     String createdBy;
//     DateTime createdAt;
//     String updatedBy;
//     DateTime updatedAt;
//     String deletedBy;
//     dynamic deletedAt;

//     factory Ward.fromRawJson(String str) => Ward.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory Ward.fromJson(Map<String, dynamic> json) => Ward(
//         id: json["id"],
//         name: json["name"],
//         districtId: json["districtId"],
//         isShow: json["isShow"],
//         createdBy: json["createdBy"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedBy: json["updatedBy"],
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         deletedBy: json["deletedBy"],
//         deletedAt: json["deletedAt"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "districtId": districtId,
//         "isShow": isShow,
//         "createdBy": createdBy,
//         "createdAt": createdAt.toIso8601String(),
//         "updatedBy": updatedBy,
//         "updatedAt": updatedAt.toIso8601String(),
//         "deletedBy": deletedBy,
//         "deletedAt": deletedAt,
//     };
// }

// class Business {
//     Business({
//         this.id,
//         this.content,
//     });

//     int id;
//     String content;

//     factory Business.fromRawJson(String str) => Business.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory Business.fromJson(Map<String, dynamic> json) => Business(
//         id: json["id"],
//         content: json["content"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "content": content,
//     };
// }

// enum LaborIdEnum { THE_622814338_AC5_F056_C37_FBF51 }

// final laborIdEnumValues = EnumValues({
//     "622814338ac5f056c37fbf51": LaborIdEnum.THE_622814338_AC5_F056_C37_FBF51
// });

// class Labor {
//     Labor({
//         this.id,
//         this.userId,
//         this.name,
//         this.phone,
//         this.email,
//         this.avatar,
//         this.address,
//         this.birthday,
//         this.provinceId,
//         this.districtId,
//         this.wardId,
//         this.homeNumber,
//         this.createdBy,
//         this.createdAt,
//         this.updatedBy,
//         this.updatedAt,
//         this.deletedBy,
//         this.deletedAt,
//         this.resetToken,
//         this.resetExpiredAt,
//         this.isLock,
//         this.lockedAt,
//         this.isApproved,
//         this.lastLoginAt,
//         this.lastActivatedAt,
//         this.lastLoggedFailAt,
//         this.loginFailedCount,
//         this.lastLoggedAt,
//         this.province,
//         this.district,
//         this.ward,
//         this.batches,
//     });

//     LaborIdEnum id;
//     UserIdEnum userId;
//     Name name;
//     String phone;
//     String email;
//     String avatar;
//     String address;
//     DateTime birthday;
//     int provinceId;
//     int districtId;
//     int wardId;
//     String homeNumber;
//     UserIdEnum createdBy;
//     DateTime createdAt;
//     UserIdEnum updatedBy;
//     DateTime updatedAt;
//     String deletedBy;
//     dynamic deletedAt;
//     String resetToken;
//     DateTime resetExpiredAt;
//     bool isLock;
//     dynamic lockedAt;
//     bool isApproved;
//     dynamic lastLoginAt;
//     DateTime lastActivatedAt;
//     DateTime lastLoggedFailAt;
//     int loginFailedCount;
//     DateTime lastLoggedAt;
//     Province province;
//     WardClass district;
//     WardClass ward;
//     dynamic batches;

//     factory Labor.fromRawJson(String str) => Labor.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory Labor.fromJson(Map<String, dynamic> json) => Labor(
//         id: laborIdEnumValues.map[json["id"]],
//         userId: userIdEnumValues.map[json["user_id"]],
//         name: nameValues.map[json["name"]],
//         phone: json["phone"],
//         email: json["email"],
//         avatar: json["avatar"],
//         address: json["address"],
//         birthday: DateTime.parse(json["birthday"]),
//         provinceId: json["province_id"],
//         districtId: json["district_id"],
//         wardId: json["ward_id"],
//         homeNumber: json["home_number"],
//         createdBy: userIdEnumValues.map[json["created_by"]],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedBy: userIdEnumValues.map[json["updated_by"]],
//         updatedAt: DateTime.parse(json["updated_at"]),
//         deletedBy: json["deleted_by"],
//         deletedAt: json["deleted_at"],
//         resetToken: json["resetToken"],
//         resetExpiredAt: DateTime.parse(json["reset_expired_at"]),
//         isLock: json["isLock"],
//         lockedAt: json["lockedAt"],
//         isApproved: json["isApproved"],
//         lastLoginAt: json["lastLoginAt"],
//         lastActivatedAt: DateTime.parse(json["lastActivatedAt"]),
//         lastLoggedFailAt: DateTime.parse(json["lastLoggedFailAt"]),
//         loginFailedCount: json["loginFailedCount"],
//         lastLoggedAt: DateTime.parse(json["lastLoggedAt"]),
//         province: Province.fromJson(json["province"]),
//         district: WardClass.fromJson(json["district"]),
//         ward: WardClass.fromJson(json["ward"]),
//         batches: json["batches"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": laborIdEnumValues.reverse[id],
//         "user_id": userIdEnumValues.reverse[userId],
//         "name": nameValues.reverse[name],
//         "phone": phone,
//         "email": email,
//         "avatar": avatar,
//         "address": address,
//         "birthday": birthday.toIso8601String(),
//         "province_id": provinceId,
//         "district_id": districtId,
//         "ward_id": wardId,
//         "home_number": homeNumber,
//         "created_by": userIdEnumValues.reverse[createdBy],
//         "created_at": createdAt.toIso8601String(),
//         "updated_by": userIdEnumValues.reverse[updatedBy],
//         "updated_at": updatedAt.toIso8601String(),
//         "deleted_by": deletedBy,
//         "deleted_at": deletedAt,
//         "resetToken": resetToken,
//         "reset_expired_at": resetExpiredAt.toIso8601String(),
//         "isLock": isLock,
//         "lockedAt": lockedAt,
//         "isApproved": isApproved,
//         "lastLoginAt": lastLoginAt,
//         "lastActivatedAt": lastActivatedAt.toIso8601String(),
//         "lastLoggedFailAt": lastLoggedFailAt.toIso8601String(),
//         "loginFailedCount": loginFailedCount,
//         "lastLoggedAt": lastLoggedAt.toIso8601String(),
//         "province": province.toJson(),
//         "district": district.toJson(),
//         "ward": ward.toJson(),
//         "batches": batches,
//     };
// }

// enum UserIdEnum { THE_620_C6_F2377_E4_DE28_A70_BD86_A }

// final userIdEnumValues = EnumValues({
//     "620c6f2377e4de28a70bd86a": UserIdEnum.THE_620_C6_F2377_E4_DE28_A70_BD86_A
// });

// enum Name { DUNG }

// final nameValues = EnumValues({
//     "dung": Name.DUNG
// });

// class Stage {
//     Stage({
//         this.id,
//         this.name,
//         this.processId,
//         this.description,
//         this.began,
//         this.finished,
//         this.businesses,
//         this.process,
//         this.createdBy,
//         this.createdAt,
//         this.updatedBy,
//         this.updatedAt,
//         this.deletedBy,
//         this.deletedAt,
//     });

//     String id;
//     String name;
//     String processId;
//     String description;
//     DateTime began;
//     DateTime finished;
//     dynamic businesses;
//     Process process;
//     String createdBy;
//     DateTime createdAt;
//     String updatedBy;
//     DateTime updatedAt;
//     String deletedBy;
//     dynamic deletedAt;

//     factory Stage.fromRawJson(String str) => Stage.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory Stage.fromJson(Map<String, dynamic> json) => Stage(
//         id: json["id"],
//         name: json["name"],
//         processId: json["process_id"],
//         description: json["description"],
//         began: DateTime.parse(json["began"]),
//         finished: DateTime.parse(json["finished"]),
//         businesses: json["businesses"],
//         process: Process.fromJson(json["process"]),
//         createdBy: json["created_by"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedBy: json["updated_by"],
//         updatedAt: DateTime.parse(json["updated_at"]),
//         deletedBy: json["deleted_by"],
//         deletedAt: json["deleted_at"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "process_id": processId,
//         "description": description,
//         "began": began.toIso8601String(),
//         "finished": finished.toIso8601String(),
//         "businesses": businesses,
//         "process": process.toJson(),
//         "created_by": createdBy,
//         "created_at": createdAt.toIso8601String(),
//         "updated_by": updatedBy,
//         "updated_at": updatedAt.toIso8601String(),
//         "deleted_by": deletedBy,
//         "deleted_at": deletedAt,
//     };
// }

// class Pagination {
//     Pagination({
//         this.page,
//         this.length,
//         this.search,
//         this.orderBy,
//         this.orderDir,
//         this.total,
//         this.deleted,
//     });

//     int page;
//     int length;
//     String search;
//     String orderBy;
//     String orderDir;
//     int total;
//     bool deleted;

//     factory Pagination.fromRawJson(String str) => Pagination.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
//         page: json["page"],
//         length: json["length"],
//         search: json["search"],
//         orderBy: json["orderBy"],
//         orderDir: json["orderDir"],
//         total: json["total"],
//         deleted: json["deleted"],
//     );

//     Map<String, dynamic> toJson() => {
//         "page": page,
//         "length": length,
//         "search": search,
//         "orderBy": orderBy,
//         "orderDir": orderDir,
//         "total": total,
//         "deleted": deleted,
//     };
// }

// class EnumValues<T> {
//     Map<String, T> map;
//     Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         if (reverseMap == null) {
//             reverseMap = map.map((k, v) => new MapEntry(v, k));
//         }
//         return reverseMap;
//     }
// }
