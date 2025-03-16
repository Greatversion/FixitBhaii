class ServiceModel {
    ServiceModel({
        required this.serviceName,
        required this.categoryIds,
        required this.subCategoryIds,
        required this.serviceDescription,
        required this.commonIssues,
        required this.preRequisites,
        required this.fixItYourselfGuide,
        required this.priceModel,
        required this.availabilitySchedule,
        required this.customizationOptions,
        required this.locationAvailability,
        required this.estimatedServiceTime,
        required this.serviceRating,
        required this.tags,
        required this.serviceType,
        required this.servicePriority,
        required this.thumbnailImage,
        required this.serviceImages,
        required this.serviceVideos,
        required this.createdAt,
        required this.updatedAt,
        required this.lastUpdatedBy,
        required this.status,
    });

    final String? serviceName;
    final List<String> categoryIds;
    final List<String> subCategoryIds;
    final String? serviceDescription;
    final List<String> commonIssues;
    final List<String> preRequisites;
    final List<String> fixItYourselfGuide;
    final PriceModel? priceModel;
    final AvailabilitySchedule? availabilitySchedule;
    final List<CustomizationOption> customizationOptions;
    final List<LocationAvailability> locationAvailability;
    final EstimatedServiceTime? estimatedServiceTime;
    final ServiceRating? serviceRating;
    final List<String> tags;
    final String? serviceType;
    final String? servicePriority;
    final ThumbnailImage? thumbnailImage;
    final List<ThumbnailImage> serviceImages;
    final List<ThumbnailImage> serviceVideos;
    final String? createdAt;
    final String? updatedAt;
    final String? lastUpdatedBy;
    final String? status;

    factory ServiceModel.fromJson(Map<String, dynamic> json){ 
        return ServiceModel(
            serviceName: json["service_name"],
            categoryIds: json["category_ids"] == null ? [] : List<String>.from(json["category_ids"]!.map((x) => x)),
            subCategoryIds: json["sub_category_ids"] == null ? [] : List<String>.from(json["sub_category_ids"]!.map((x) => x)),
            serviceDescription: json["service_description"],
            commonIssues: json["common_issues"] == null ? [] : List<String>.from(json["common_issues"]!.map((x) => x)),
            preRequisites: json["pre_requisites"] == null ? [] : List<String>.from(json["pre_requisites"]!.map((x) => x)),
            fixItYourselfGuide: json["fix_it_yourself_guide"] == null ? [] : List<String>.from(json["fix_it_yourself_guide"]!.map((x) => x)),
            priceModel: json["price_model"] == null ? null : PriceModel.fromJson(json["price_model"]),
            availabilitySchedule: json["availability_schedule"] == null ? null : AvailabilitySchedule.fromJson(json["availability_schedule"]),
            customizationOptions: json["customization_options"] == null ? [] : List<CustomizationOption>.from(json["customization_options"]!.map((x) => CustomizationOption.fromJson(x))),
            locationAvailability: json["location_availability"] == null ? [] : List<LocationAvailability>.from(json["location_availability"]!.map((x) => LocationAvailability.fromJson(x))),
            estimatedServiceTime: json["estimated_service_time"] == null ? null : EstimatedServiceTime.fromJson(json["estimated_service_time"]),
            serviceRating: json["service_rating"] == null ? null : ServiceRating.fromJson(json["service_rating"]),
            tags: json["tags"] == null ? [] : List<String>.from(json["tags"]!.map((x) => x)),
            serviceType: json["service_type"],
            servicePriority: json["service_priority"],
            thumbnailImage: json["thumbnail_image"] == null ? null : ThumbnailImage.fromJson(json["thumbnail_image"]),
            serviceImages: json["service_images"] == null ? [] : List<ThumbnailImage>.from(json["service_images"]!.map((x) => ThumbnailImage.fromJson(x))),
            serviceVideos: json["service_videos"] == null ? [] : List<ThumbnailImage>.from(json["service_videos"]!.map((x) => ThumbnailImage.fromJson(x))),
            createdAt: json["created_at"],
            updatedAt: json["updated_at"],
            lastUpdatedBy: json["last_updated_by"],
            status: json["status"],
        );
    }

    Map<String, dynamic> toJson() => {
        "service_name": serviceName,
        "category_ids": categoryIds.map((x) => x).toList(),
        "sub_category_ids": subCategoryIds.map((x) => x).toList(),
        "service_description": serviceDescription,
        "common_issues": commonIssues.map((x) => x).toList(),
        "pre_requisites": preRequisites.map((x) => x).toList(),
        "fix_it_yourself_guide": fixItYourselfGuide.map((x) => x).toList(),
        "price_model": priceModel?.toJson(),
        "availability_schedule": availabilitySchedule?.toJson(),
        "customization_options": customizationOptions.map((x) => x.toJson()).toList(),
        "location_availability": locationAvailability.map((x) => x.toJson()).toList(),
        "estimated_service_time": estimatedServiceTime?.toJson(),
        "service_rating": serviceRating?.toJson(),
        "tags": tags.map((x) => x).toList(),
        "service_type": serviceType,
        "service_priority": servicePriority,
        "thumbnail_image": thumbnailImage?.toJson(),
        "service_images": serviceImages.map((x) => x.toJson()).toList(),
        "service_videos": serviceVideos.map((x) => x.toJson()).toList(),
        "created_at": createdAt,
        "updated_at": updatedAt,
        "last_updated_by": lastUpdatedBy,
        "status": status,
    };

}

class AvailabilitySchedule {
    AvailabilitySchedule({
        required this.mon,
        required this.tue,
        required this.thu,
        required this.fri,
    });

    final List<String> mon;
    final List<String> tue;
    final List<String> thu;
    final List<String> fri;

    factory AvailabilitySchedule.fromJson(Map<String, dynamic> json){ 
        return AvailabilitySchedule(
            mon: json["Mon"] == null ? [] : List<String>.from(json["Mon"]!.map((x) => x)),
            tue: json["Tue"] == null ? [] : List<String>.from(json["Tue"]!.map((x) => x)),
            thu: json["Thu"] == null ? [] : List<String>.from(json["Thu"]!.map((x) => x)),
            fri: json["Fri"] == null ? [] : List<String>.from(json["Fri"]!.map((x) => x)),
        );
    }

    Map<String, dynamic> toJson() => {
        "Mon": mon.map((x) => x).toList(),
        "Tue": tue.map((x) => x).toList(),
        "Thu": thu.map((x) => x).toList(),
        "Fri": fri.map((x) => x).toList(),
    };

}

class CustomizationOption {
    CustomizationOption({
        required this.optionName,
        required this.additionalPrice,
    });

    final String? optionName;
    final int? additionalPrice;

    factory CustomizationOption.fromJson(Map<String, dynamic> json){ 
        return CustomizationOption(
            optionName: json["option_name"],
            additionalPrice: json["additional_price"],
        );
    }

    Map<String, dynamic> toJson() => {
        "option_name": optionName,
        "additional_price": additionalPrice,
    };

}

class EstimatedServiceTime {
    EstimatedServiceTime({
        required this.time,
        required this.unit,
    });

    final int? time;
    final String? unit;

    factory EstimatedServiceTime.fromJson(Map<String, dynamic> json){ 
        return EstimatedServiceTime(
            time: json["time"],
            unit: json["unit"],
        );
    }

    Map<String, dynamic> toJson() => {
        "time": time,
        "unit": unit,
    };

}

class LocationAvailability {
    LocationAvailability({
        required this.region,
        required this.coordinates,
        required this.radius,
    });

    final String? region;
    final Coordinates? coordinates;
    final int? radius;

    factory LocationAvailability.fromJson(Map<String, dynamic> json){ 
        return LocationAvailability(
            region: json["region"],
            coordinates: json["coordinates"] == null ? null : Coordinates.fromJson(json["coordinates"]),
            radius: json["radius"],
        );
    }

    Map<String, dynamic> toJson() => {
        "region": region,
        "coordinates": coordinates?.toJson(),
        "radius": radius,
    };

}

class Coordinates {
    Coordinates({
        required this.lat,
        required this.lng,
    });

    final double? lat;
    final double? lng;

    factory Coordinates.fromJson(Map<String, dynamic> json){ 
        return Coordinates(
            lat: json["lat"],
            lng: json["lng"],
        );
    }

    Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
    };

}

class PriceModel {
    PriceModel({
        required this.isDiscountAvailable,
        required this.basePrice,
        required this.dynamicPricing,
    });

    final bool? isDiscountAvailable;
    final int? basePrice;
    final DynamicPricing? dynamicPricing;

    factory PriceModel.fromJson(Map<String, dynamic> json){ 
        return PriceModel(
            isDiscountAvailable: json["is_discount_available"],
            basePrice: json["base_price"],
            dynamicPricing: json["dynamic_pricing"] == null ? null : DynamicPricing.fromJson(json["dynamic_pricing"]),
        );
    }

    Map<String, dynamic> toJson() => {
        "is_discount_available": isDiscountAvailable,
        "base_price": basePrice,
        "dynamic_pricing": dynamicPricing?.toJson(),
    };

}

class DynamicPricing {
    DynamicPricing({
        required this.discounts,
        required this.additionalCharges,
    });

    final List<Discount> discounts;
    final AdditionalCharges? additionalCharges;

    factory DynamicPricing.fromJson(Map<String, dynamic> json){ 
        return DynamicPricing(
            discounts: json["discounts"] == null ? [] : List<Discount>.from(json["discounts"]!.map((x) => Discount.fromJson(x))),
            additionalCharges: json["additional_charges"] == null ? null : AdditionalCharges.fromJson(json["additional_charges"]),
        );
    }

    Map<String, dynamic> toJson() => {
        "discounts": discounts.map((x) => x.toJson()).toList(),
        "additional_charges": additionalCharges?.toJson(),
    };

}

class AdditionalCharges {
    AdditionalCharges({
        required this.outOfArea,
        required this.premiumParts,
    });

    final int? outOfArea;
    final int? premiumParts;

    factory AdditionalCharges.fromJson(Map<String, dynamic> json){ 
        return AdditionalCharges(
            outOfArea: json["out_of_area"],
            premiumParts: json["premium_parts"],
        );
    }

    Map<String, dynamic> toJson() => {
        "out_of_area": outOfArea,
        "premium_parts": premiumParts,
    };

}

class Discount {
    Discount({
        required this.minPrice,
        required this.maxPrice,
        required this.discountPercentage,
    });

    final int? minPrice;
    final int? maxPrice;
    final int? discountPercentage;

    factory Discount.fromJson(Map<String, dynamic> json){ 
        return Discount(
            minPrice: json["min_price"],
            maxPrice: json["max_price"],
            discountPercentage: json["discount_percentage"],
        );
    }

    Map<String, dynamic> toJson() => {
        "min_price": minPrice,
        "max_price": maxPrice,
        "discount_percentage": discountPercentage,
    };

}

class ThumbnailImage {
    ThumbnailImage({
        required this.url,
        required this.altText,
    });

    final String? url;
    final String? altText;

    factory ThumbnailImage.fromJson(Map<String, dynamic> json){ 
        return ThumbnailImage(
            url: json["url"],
            altText: json["alt_text"],
        );
    }

    Map<String, dynamic> toJson() => {
        "url": url,
        "alt_text": altText,
    };

}

class ServiceRating {
    ServiceRating({
        required this.averageRating,
        required this.totalReviews,
    });

    final double? averageRating;
    final int? totalReviews;

    factory ServiceRating.fromJson(Map<String, dynamic> json){ 
        return ServiceRating(
            averageRating: json["average_rating"],
            totalReviews: json["total_reviews"],
        );
    }

    Map<String, dynamic> toJson() => {
        "average_rating": averageRating,
        "total_reviews": totalReviews,
    };

}
