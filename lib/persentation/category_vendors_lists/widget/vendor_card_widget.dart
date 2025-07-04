import 'package:flutter/material.dart';
import 'package:foodzy/domain/category_vendors_list/models/vendors_model.dart';

////
///
///
///
///
///
///              Vendor Cards Widget that uses to show the vendors in the category page
class VendorCard extends StatelessWidget {
  final VendorModel vendor;
  final void Function()? onTap;

  const VendorCard({required this.vendor, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.white,
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  vendor.mediaurls?.images?.first.default_ ?? '',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                  errorBuilder: (BuildContext context, Object error,
                      StackTrace? stackTrace) {
                    return Container(
                      width: 100,
                      height: 100,
                      color: Colors.grey[200],
                      child: Center(
                          child: Icon(Icons.broken_image,
                              size: 40, color: Colors.grey[400])),
                    );
                  },
                ),
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      vendor.name ?? 'No Name',
                      style: const TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      '${vendor.address}',
                      style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4.0),
                    Row(
                      children: <Widget>[
                        Text(
                          vendor.address ?? 'No Address',
                          style: TextStyle(
                              fontSize: 14.0, color: Colors.grey[600]),
                        ),
                        const Text(' • ', style: TextStyle(color: Colors.grey)),
                        Text(
                          '${vendor.distance?.toStringAsFixed(2)} km Away',
                          style: TextStyle(
                              fontSize: 14.0, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4.0),
                          decoration: BoxDecoration(
                            color: Colors.green[100],
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.star,
                                  color: Colors.green[600], size: 18),
                              const SizedBox(width: 4.0),
                              Text(
                                vendor.ratings?.toStringAsFixed(0) ?? '0',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.green[600],
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 4.0),
                        Text(
                          '${vendor.ratingsCount} rated',
                          style: TextStyle(
                              fontSize: 14.0, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
