class VendorModel {
    VendorModel({
        required this.vendorId,
        required this.businessName,
        required this.ownerName,
        required this.email,
        required this.phoneNumber,
        required this.address,
        required this.businessDetails,
        required this.verificationStatus,
        required this.verificationDetails,
        required this.servicesOffered,
        required this.associatedTechnicians,
        required this.ratings,
        required this.financialDetails,
        required this.subscriptionPlan,
        required this.status,
        required this.featured,
        required this.profilePicture,
        required this.profileBanner,
        required this.createdAt,
        required this.updatedAt,
    });

    final String? vendorId;
    final String? businessName;
    final String? ownerName;
    final String? email;
    final String? phoneNumber;
    final Address? address;
    final BusinessDetails? businessDetails;
    final String? verificationStatus;
    final VerificationDetails? verificationDetails;
    final List<ServicesOffered> servicesOffered;
    final List<AssociatedTechnician> associatedTechnicians;
    final Ratings? ratings;
    final FinancialDetails? financialDetails;
    final SubscriptionPlan? subscriptionPlan;
    final String? status;
    final bool? featured;
    final Profile? profilePicture;
    final Profile? profileBanner;
    final String? createdAt;
    final String? updatedAt;

    factory VendorModel.fromJson(Map<String, dynamic> json){ 
        return VendorModel(
            vendorId: json["vendor_id"],
            businessName: json["business_name"],
            ownerName: json["owner_name"],
            email: json["email"],
            phoneNumber: json["phone_number"],
            address: json["address"] == null ? null : Address.fromJson(json["address"]),
            businessDetails: json["business_details"] == null ? null : BusinessDetails.fromJson(json["business_details"]),
            verificationStatus: json["verification_status"],
            verificationDetails: json["verification_details"] == null ? null : VerificationDetails.fromJson(json["verification_details"]),
            servicesOffered: json["services_offered"] == null ? [] : List<ServicesOffered>.from(json["services_offered"]!.map((x) => ServicesOffered.fromJson(x))),
            associatedTechnicians: json["associated_technicians"] == null ? [] : List<AssociatedTechnician>.from(json["associated_technicians"]!.map((x) => AssociatedTechnician.fromJson(x))),
            ratings: json["ratings"] == null ? null : Ratings.fromJson(json["ratings"]),
            financialDetails: json["financial_details"] == null ? null : FinancialDetails.fromJson(json["financial_details"]),
            subscriptionPlan: json["subscription_plan"] == null ? null : SubscriptionPlan.fromJson(json["subscription_plan"]),
            status: json["status"],
            featured: json["featured"],
            profilePicture: json["profile_picture"] == null ? null : Profile.fromJson(json["profile_picture"]),
            profileBanner: json["profile_banner"] == null ? null : Profile.fromJson(json["profile_banner"]),
            createdAt: json["created_at"],
            updatedAt: json["updated_at"],
        );
    }

    Map<String, dynamic> toJson() => {
        "vendor_id": vendorId,
        "business_name": businessName,
        "owner_name": ownerName,
        "email": email,
        "phone_number": phoneNumber,
        "address": address?.toJson(),
        "business_details": businessDetails?.toJson(),
        "verification_status": verificationStatus,
        "verification_details": verificationDetails?.toJson(),
        "services_offered": servicesOffered.map((x) => x.toJson()).toList(),
        "associated_technicians": associatedTechnicians.map((x) => x.toJson()).toList(),
        "ratings": ratings?.toJson(),
        "financial_details": financialDetails?.toJson(),
        "subscription_plan": subscriptionPlan?.toJson(),
        "status": status,
        "featured": featured,
        "profile_picture": profilePicture?.toJson(),
        "profile_banner": profileBanner?.toJson(),
        "created_at": createdAt,
        "updated_at": updatedAt,
    };

}

class Address {
    Address({
        required this.street,
        required this.city,
        required this.state,
        required this.zipcode,
        required this.country,
        required this.addressLink,
    });

    final String? street;
    final String? city;
    final String? state;
    final String? zipcode;
    final String? country;
    final String? addressLink;

    factory Address.fromJson(Map<String, dynamic> json){ 
        return Address(
            street: json["street"],
            city: json["city"],
            state: json["state"],
            zipcode: json["zipcode"],
            country: json["country"],
            addressLink: json["address_link"],
        );
    }

    Map<String, dynamic> toJson() => {
        "street": street,
        "city": city,
        "state": state,
        "zipcode": zipcode,
        "country": country,
        "address_link": addressLink,
    };

}

class AssociatedTechnician {
    AssociatedTechnician({
        required this.technicianId,
        required this.technicianName,
        required this.status,
    });

    final String? technicianId;
    final String? technicianName;
    final String? status;

    factory AssociatedTechnician.fromJson(Map<String, dynamic> json){ 
        return AssociatedTechnician(
            technicianId: json["technician_id"],
            technicianName: json["technician_name"],
            status: json["status"],
        );
    }

    Map<String, dynamic> toJson() => {
        "technician_id": technicianId,
        "technician_name": technicianName,
        "status": status,
    };

}

class BusinessDetails {
    BusinessDetails({
        required this.registrationNumber,
        required this.businessType,
        required this.gstNumber,
        required this.taxIdentificationNumber,
        required this.website,
    });

    final String? registrationNumber;
    final String? businessType;
    final String? gstNumber;
    final String? taxIdentificationNumber;
    final String? website;

    factory BusinessDetails.fromJson(Map<String, dynamic> json){ 
        return BusinessDetails(
            registrationNumber: json["registration_number"],
            businessType: json["business_type"],
            gstNumber: json["gst_number"],
            taxIdentificationNumber: json["tax_identification_number"],
            website: json["website"],
        );
    }

    Map<String, dynamic> toJson() => {
        "registration_number": registrationNumber,
        "business_type": businessType,
        "gst_number": gstNumber,
        "tax_identification_number": taxIdentificationNumber,
        "website": website,
    };

}

class FinancialDetails {
    FinancialDetails({
        required this.totalRevenue,
        required this.currency,
        required this.bankDetails,
    });

    final String? totalRevenue;
    final String? currency;
    final BankDetails? bankDetails;

    factory FinancialDetails.fromJson(Map<String, dynamic> json){ 
        return FinancialDetails(
            totalRevenue: json["total_revenue"],
            currency: json["currency"],
            bankDetails: json["bank_details"] == null ? null : BankDetails.fromJson(json["bank_details"]),
        );
    }

    Map<String, dynamic> toJson() => {
        "total_revenue": totalRevenue,
        "currency": currency,
        "bank_details": bankDetails?.toJson(),
    };

}

class BankDetails {
    BankDetails({
        required this.accountHolderName,
        required this.accountNumber,
        required this.ifscCode,
        required this.bankName,
    });

    final String? accountHolderName;
    final String? accountNumber;
    final String? ifscCode;
    final String? bankName;

    factory BankDetails.fromJson(Map<String, dynamic> json){ 
        return BankDetails(
            accountHolderName: json["account_holder_name"],
            accountNumber: json["account_number"],
            ifscCode: json["ifsc_code"],
            bankName: json["bank_name"],
        );
    }

    Map<String, dynamic> toJson() => {
        "account_holder_name": accountHolderName,
        "account_number": accountNumber,
        "ifsc_code": ifscCode,
        "bank_name": bankName,
    };

}

class Profile {
    Profile({
        required this.url,
        required this.alternateText,
    });

    final String? url;
    final String? alternateText;

    factory Profile.fromJson(Map<String, dynamic> json){ 
        return Profile(
            url: json["url"],
            alternateText: json["alternate_text"],
        );
    }

    Map<String, dynamic> toJson() => {
        "url": url,
        "alternate_text": alternateText,
    };

}

class Ratings {
    Ratings({
        required this.avgRating,
        required this.reviewsCount,
    });

    final String? avgRating;
    final String? reviewsCount;

    factory Ratings.fromJson(Map<String, dynamic> json){ 
        return Ratings(
            avgRating: json["avg_rating"],
            reviewsCount: json["reviews_count"],
        );
    }

    Map<String, dynamic> toJson() => {
        "avg_rating": avgRating,
        "reviews_count": reviewsCount,
    };

}

class ServicesOffered {
    ServicesOffered({
        required this.serviceId,
        required this.serviceName,
    });

    final String? serviceId;
    final String? serviceName;

    factory ServicesOffered.fromJson(Map<String, dynamic> json){ 
        return ServicesOffered(
            serviceId: json["service_id"],
            serviceName: json["service_name"],
        );
    }

    Map<String, dynamic> toJson() => {
        "service_id": serviceId,
        "service_name": serviceName,
    };

}

class SubscriptionPlan {
    SubscriptionPlan({
        required this.planName,
        required this.planStartDate,
        required this.planEndDate,
        required this.isActive,
    });

    final String? planName;
    final String? planStartDate;
    final String? planEndDate;
    final bool? isActive;

    factory SubscriptionPlan.fromJson(Map<String, dynamic> json){ 
        return SubscriptionPlan(
            planName: json["plan_name"],
            planStartDate: json["plan_start_date"],
            planEndDate: json["plan_end_date"],
            isActive: json["is_active"],
        );
    }

    Map<String, dynamic> toJson() => {
        "plan_name": planName,
        "plan_start_date": planStartDate,
        "plan_end_date": planEndDate,
        "is_active": isActive,
    };

}

class VerificationDetails {
    VerificationDetails({
        required this.idProofType,
        required this.idProofNumber,
        required this.businessLicense,
        required this.backgroundCheckStatus,
        required this.verifiedBy,
        required this.verificationDate,
    });

    final String? idProofType;
    final String? idProofNumber;
    final BusinessLicense? businessLicense;
    final String? backgroundCheckStatus;
    final String? verifiedBy;
    final String? verificationDate;

    factory VerificationDetails.fromJson(Map<String, dynamic> json){ 
        return VerificationDetails(
            idProofType: json["id_proof_type"],
            idProofNumber: json["id_proof_number"],
            businessLicense: json["business_license"] == null ? null : BusinessLicense.fromJson(json["business_license"]),
            backgroundCheckStatus: json["background_check_status"],
            verifiedBy: json["verified_by"],
            verificationDate: json["verification_date"],
        );
    }

    Map<String, dynamic> toJson() => {
        "id_proof_type": idProofType,
        "id_proof_number": idProofNumber,
        "business_license": businessLicense?.toJson(),
        "background_check_status": backgroundCheckStatus,
        "verified_by": verifiedBy,
        "verification_date": verificationDate,
    };

}

class BusinessLicense {
    BusinessLicense({
        required this.licenseNumber,
        required this.expiryDate,
    });

    final String? licenseNumber;
    final String? expiryDate;

    factory BusinessLicense.fromJson(Map<String, dynamic> json){ 
        return BusinessLicense(
            licenseNumber: json["license_number"],
            expiryDate: json["expiry_date"],
        );
    }

    Map<String, dynamic> toJson() => {
        "license_number": licenseNumber,
        "expiry_date": expiryDate,
    };

}
