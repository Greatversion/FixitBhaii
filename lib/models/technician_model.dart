class TechnicianModel {
    TechnicianModel({
        required this.technicianId,
        required this.name,
        required this.email,
        required this.phoneNumber,
        required this.address,
        required this.associatedVendor,
        required this.skills,
        required this.serviceArea,
        required this.availability,
        required this.ratings,
        required this.status,
        required this.featured,
        required this.profilePicture,
        required this.servicesProvided,
        required this.verificationStatus,
        required this.verificationDetails,
        required this.experience,
        required this.earnings,
        required this.bankDetails,
        required this.createdAt,
        required this.updatedAt,
    });

    final String? technicianId;
    final String? name;
    final String? email;
    final String? phoneNumber;
    final Address? address;
    final List<AssociatedVendor> associatedVendor;
    final List<String> skills;
    final ServiceArea? serviceArea;
    final Availability? availability;
    final Ratings? ratings;
    final String? status;
    final bool? featured;
    final ProfilePicture? profilePicture;
    final List<String> servicesProvided;
    final String? verificationStatus;
    final VerificationDetails? verificationDetails;
    final Experience? experience;
    final Earnings? earnings;
    final BankDetails? bankDetails;
    final String? createdAt;
    final String? updatedAt;

    factory TechnicianModel.fromJson(Map<String, dynamic> json){ 
        return TechnicianModel(
            technicianId: json["technician_id"],
            name: json["name"],
            email: json["email"],
            phoneNumber: json["phone_number"],
            address: json["address"] == null ? null : Address.fromJson(json["address"]),
            associatedVendor: json["associated_vendor"] == null ? [] : List<AssociatedVendor>.from(json["associated_vendor"]!.map((x) => AssociatedVendor.fromJson(x))),
            skills: json["skills"] == null ? [] : List<String>.from(json["skills"]!.map((x) => x)),
            serviceArea: json["service_area"] == null ? null : ServiceArea.fromJson(json["service_area"]),
            availability: json["availability"] == null ? null : Availability.fromJson(json["availability"]),
            ratings: json["ratings"] == null ? null : Ratings.fromJson(json["ratings"]),
            status: json["status"],
            featured: json["featured"],
            profilePicture: json["profile_picture"] == null ? null : ProfilePicture.fromJson(json["profile_picture"]),
            servicesProvided: json["services_provided"] == null ? [] : List<String>.from(json["services_provided"]!.map((x) => x)),
            verificationStatus: json["verification_status"],
            verificationDetails: json["verification_details"] == null ? null : VerificationDetails.fromJson(json["verification_details"]),
            experience: json["experience"] == null ? null : Experience.fromJson(json["experience"]),
            earnings: json["earnings"] == null ? null : Earnings.fromJson(json["earnings"]),
            bankDetails: json["bank_details"] == null ? null : BankDetails.fromJson(json["bank_details"]),
            createdAt: json["created_at"],
            updatedAt: json["updated_at"],
        );
    }

    Map<String, dynamic> toJson() => {
        "technician_id": technicianId,
        "name": name,
        "email": email,
        "phone_number": phoneNumber,
        "address": address?.toJson(),
        "associated_vendor": associatedVendor.map((x) => x.toJson()).toList(),
        "skills": skills.map((x) => x).toList(),
        "service_area": serviceArea?.toJson(),
        "availability": availability?.toJson(),
        "ratings": ratings?.toJson(),
        "status": status,
        "featured": featured,
        "profile_picture": profilePicture?.toJson(),
        "services_provided": servicesProvided.map((x) => x).toList(),
        "verification_status": verificationStatus,
        "verification_details": verificationDetails?.toJson(),
        "experience": experience?.toJson(),
        "earnings": earnings?.toJson(),
        "bank_details": bankDetails?.toJson(),
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
    });

    final String? street;
    final String? city;
    final String? state;
    final String? zipcode;

    factory Address.fromJson(Map<String, dynamic> json){ 
        return Address(
            street: json["street"],
            city: json["city"],
            state: json["state"],
            zipcode: json["zipcode"],
        );
    }

    Map<String, dynamic> toJson() => {
        "street": street,
        "city": city,
        "state": state,
        "zipcode": zipcode,
    };

}

class AssociatedVendor {
    AssociatedVendor({
        required this.vendorId,
        required this.vendorName,
    });

    final String? vendorId;
    final String? vendorName;

    factory AssociatedVendor.fromJson(Map<String, dynamic> json){ 
        return AssociatedVendor(
            vendorId: json["vendor_id"],
            vendorName: json["vendor_name"],
        );
    }

    Map<String, dynamic> toJson() => {
        "vendor_id": vendorId,
        "vendor_name": vendorName,
    };

}

class Availability {
    Availability({
        required this.mon,
        required this.tue,
        required this.wed,
        required this.thu,
        required this.fri,
        required this.sat,
        required this.sun,
    });

    final List<String> mon;
    final List<String> tue;
    final List<String> wed;
    final List<String> thu;
    final List<String> fri;
    final List<String> sat;
    final List<dynamic> sun;

    factory Availability.fromJson(Map<String, dynamic> json){ 
        return Availability(
            mon: json["Mon"] == null ? [] : List<String>.from(json["Mon"]!.map((x) => x)),
            tue: json["Tue"] == null ? [] : List<String>.from(json["Tue"]!.map((x) => x)),
            wed: json["Wed"] == null ? [] : List<String>.from(json["Wed"]!.map((x) => x)),
            thu: json["Thu"] == null ? [] : List<String>.from(json["Thu"]!.map((x) => x)),
            fri: json["Fri"] == null ? [] : List<String>.from(json["Fri"]!.map((x) => x)),
            sat: json["Sat"] == null ? [] : List<String>.from(json["Sat"]!.map((x) => x)),
            sun: json["Sun"] == null ? [] : List<dynamic>.from(json["Sun"]!.map((x) => x)),
        );
    }

    Map<String, dynamic> toJson() => {
        "Mon": mon.map((x) => x).toList(),
        "Tue": tue.map((x) => x).toList(),
        "Wed": wed.map((x) => x).toList(),
        "Thu": thu.map((x) => x).toList(),
        "Fri": fri.map((x) => x).toList(),
        "Sat": sat.map((x) => x).toList(),
        "Sun": sun.map((x) => x).toList(),
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

class Earnings {
    Earnings({
        required this.totalEarnings,
        required this.currency,
    });

    final String? totalEarnings;
    final String? currency;

    factory Earnings.fromJson(Map<String, dynamic> json){ 
        return Earnings(
            totalEarnings: json["total_earnings"],
            currency: json["currency"],
        );
    }

    Map<String, dynamic> toJson() => {
        "total_earnings": totalEarnings,
        "currency": currency,
    };

}

class Experience {
    Experience({
        required this.yearsOfExperience,
        required this.certifications,
    });

    final String? yearsOfExperience;
    final List<Certification> certifications;

    factory Experience.fromJson(Map<String, dynamic> json){ 
        return Experience(
            yearsOfExperience: json["years_of_experience"],
            certifications: json["certifications"] == null ? [] : List<Certification>.from(json["certifications"]!.map((x) => Certification.fromJson(x))),
        );
    }

    Map<String, dynamic> toJson() => {
        "years_of_experience": yearsOfExperience,
        "certifications": certifications.map((x) => x.toJson()).toList(),
    };

}

class Certification {
    Certification({
        required this.name,
        required this.institution,
        required this.dateIssued,
    });

    final String? name;
    final String? institution;
    final String? dateIssued;

    factory Certification.fromJson(Map<String, dynamic> json){ 
        return Certification(
            name: json["name"],
            institution: json["institution"],
            dateIssued: json["date_issued"],
        );
    }

    Map<String, dynamic> toJson() => {
        "name": name,
        "institution": institution,
        "date_issued": dateIssued,
    };

}

class ProfilePicture {
    ProfilePicture({
        required this.url,
        required this.alternateText,
    });

    final String? url;
    final String? alternateText;

    factory ProfilePicture.fromJson(Map<String, dynamic> json){ 
        return ProfilePicture(
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

class ServiceArea {
    ServiceArea({
        required this.latitude,
        required this.longitude,
        required this.radiusInKm,
    });

    final String? latitude;
    final String? longitude;
    final String? radiusInKm;

    factory ServiceArea.fromJson(Map<String, dynamic> json){ 
        return ServiceArea(
            latitude: json["latitude"],
            longitude: json["longitude"],
            radiusInKm: json["radius_in_km"],
        );
    }

    Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "radius_in_km": radiusInKm,
    };

}

class VerificationDetails {
    VerificationDetails({
        required this.idProofType,
        required this.idProofNumber,
        required this.backgroundCheckStatus,
        required this.verifiedBy,
        required this.verificationDate,
    });

    final String? idProofType;
    final String? idProofNumber;
    final String? backgroundCheckStatus;
    final String? verifiedBy;
    final String? verificationDate;

    factory VerificationDetails.fromJson(Map<String, dynamic> json){ 
        return VerificationDetails(
            idProofType: json["id_proof_type"],
            idProofNumber: json["id_proof_number"],
            backgroundCheckStatus: json["background_check_status"],
            verifiedBy: json["verified_by"],
            verificationDate: json["verification_date"],
        );
    }

    Map<String, dynamic> toJson() => {
        "id_proof_type": idProofType,
        "id_proof_number": idProofNumber,
        "background_check_status": backgroundCheckStatus,
        "verified_by": verifiedBy,
        "verification_date": verificationDate,
    };

}
