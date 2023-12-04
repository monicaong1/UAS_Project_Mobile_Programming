import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'product_detail_page_model.dart';
export 'product_detail_page_model.dart';

class ProductDetailPageWidget extends StatefulWidget {
  const ProductDetailPageWidget({
    Key? key,
    required this.productRefParameter,
    required this.productSelection,
  }) : super(key: key);

  final DocumentReference? productRefParameter;
  final ProductsRecord? productSelection;

  @override
  _ProductDetailPageWidgetState createState() =>
      _ProductDetailPageWidgetState();
}

class _ProductDetailPageWidgetState extends State<ProductDetailPageWidget>
    with TickerProviderStateMixin {
  late ProductDetailPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductDetailPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        iconTheme: IconThemeData(color: FlutterFlowTheme.of(context).primary),
        automaticallyImplyLeading: true,
        leading: FlutterFlowIconButton(
          buttonSize: 40.0,
          icon: Icon(
            Icons.arrow_back,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 24.0,
          ),
          onPressed: () async {
            context.safePop();
          },
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 7.0, 0.0),
            child: FlutterFlowIconButton(
              buttonSize: 51.0,
              icon: Icon(
                Icons.shopping_bag_outlined,
                color: FlutterFlowTheme.of(context).primary,
                size: 24.0,
              ),
              onPressed: () async {
                // Menuju bag page

                context.pushNamed('BagPage');
              },
            ),
          ),
        ],
        centerTitle: true,
        elevation: 4.0,
      ),
      body: StreamBuilder<ProductsRecord>(
        stream: ProductsRecord.getDocument(widget.productSelection!.reference),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            );
          }
          final columnProductsRecord = snapshot.data!;
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 500.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFDBE2E7),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Hero(
                                tag: widget.productSelection!.photoUrl,
                                transitionOnUserGestures: true,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: Image.network(
                                    widget.productSelection!.photoUrl,
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                    alignment: Alignment(0.00, -0.90),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 20.0, 24.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              valueOrDefault<String>(
                                widget.productSelection?.name,
                                'name',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Lato',
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 3.0, 0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  formatNumber(
                                    widget.productSelection?.price,
                                    formatType: FormatType.custom,
                                    currency: 'Rp',
                                    format: '',
                                    locale: '',
                                  ),
                                  'price',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Lato',
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 16.0, 24.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'DESCRIPTION',
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 4.0, 24.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 3.0, 0.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    widget.productSelection?.description,
                                    'desc',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 16.0, 24.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'SIZE',
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 15.0),
                        child: Wrap(
                          spacing: 0.0,
                          runSpacing: 0.0,
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          direction: Axis.horizontal,
                          runAlignment: WrapAlignment.start,
                          verticalDirection: VerticalDirection.down,
                          clipBehavior: Clip.none,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 32.0),
                              child: FlutterFlowChoiceChips(
                                options: [
                                  ChipData('Small'),
                                  ChipData('Medium'),
                                  ChipData('Large')
                                ],
                                onChanged: (val) => setState(
                                    () => _model.choiceChipsValue = val?.first),
                                selectedChipStyle: ChipStyle(
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).primary,
                                  textStyle:
                                      FlutterFlowTheme.of(context).titleSmall,
                                  iconColor: Colors.white,
                                  iconSize: 18.0,
                                  labelPadding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 4.0, 12.0, 4.0),
                                  elevation: 2.0,
                                ),
                                unselectedChipStyle: ChipStyle(
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  textStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  iconColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  iconSize: 18.0,
                                  labelPadding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 4.0, 12.0, 4.0),
                                  elevation: 0.0,
                                ),
                                chipSpacing: 12.0,
                                rowSpacing: 24.0,
                                multiselect: false,
                                alignment: WrapAlignment.start,
                                controller:
                                    _model.choiceChipsValueController ??=
                                        FormFieldController<List<String>>(
                                  [],
                                ),
                                wrapped: true,
                              ),
                            ),
                            Container(
                              width: 160.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                              ),
                              child: FlutterFlowCountController(
                                decrementIconBuilder: (enabled) => FaIcon(
                                  FontAwesomeIcons.minus,
                                  color: enabled
                                      ? FlutterFlowTheme.of(context)
                                          .secondaryText
                                      : FlutterFlowTheme.of(context).alternate,
                                  size: 20.0,
                                ),
                                incrementIconBuilder: (enabled) => FaIcon(
                                  FontAwesomeIcons.plus,
                                  color: enabled
                                      ? FlutterFlowTheme.of(context).primary
                                      : FlutterFlowTheme.of(context).alternate,
                                  size: 20.0,
                                ),
                                countBuilder: (count) => Text(
                                  count.toString(),
                                  style:
                                      FlutterFlowTheme.of(context).titleLarge,
                                ),
                                count: _model.countControllerValue ??= 0,
                                updateCount: (count) => setState(
                                    () => _model.countControllerValue = count),
                                stepSize: 1,
                                minimum: 0,
                                maximum: 50,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              StreamBuilder<List<CartsRecord>>(
                stream: queryCartsRecord(
                  parent: currentUserReference,
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 40.0,
                        height: 40.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    );
                  }
                  List<CartsRecord> bottomButtonAreaCartsRecordList =
                      snapshot.data!;
                  return Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4.0,
                          color: Color(0x55000000),
                          offset: Offset(0.0, 2.0),
                        )
                      ],
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 16.0, 16.0, 16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FFButtonWidget(
                            onPressed: (_model.choiceChipsValue == null ||
                                        _model.choiceChipsValue == '') ||
                                    (_model.countControllerValue == null)
                                ? null
                                : () async {
                                    var _shouldSetState = false;
                                    // cek apakah user sudah set size dan qty
                                    if ((_model.choiceChipsValue != null &&
                                            _model.choiceChipsValue != '') &&
                                        (_model.countControllerValue! > 0)) {
                                      _model.cartList =
                                          await queryCartsRecordOnce(
                                        parent: currentUserReference,
                                      );
                                      _shouldSetState = true;
                                      // Set conter jadi 0
                                      setState(() {
                                        FFAppState().counter = 0;
                                      });
                                      // Melakukan loop pada database cart
                                      while (FFAppState().counter <
                                          _model.cartList!.length) {
                                        // cek apakah produk sudah pernah masuk keranjang. tujuan untuk mengisi app state isCreated dengan true atau false
                                        if ((widget.productSelection
                                                    ?.reference ==
                                                bottomButtonAreaCartsRecordList[
                                                        FFAppState().counter]
                                                    .productRef) &&
                                            (bottomButtonAreaCartsRecordList[
                                                        FFAppState().counter]
                                                    .size ==
                                                _model.choiceChipsValue)) {
                                          // jika sudah pernah, variabel isCreated terisi true
                                          setState(() {
                                            FFAppState().isCreated = 'true';
                                          });
                                          break;
                                        } else if (!((widget.productSelection
                                                    ?.reference ==
                                                bottomButtonAreaCartsRecordList[
                                                        FFAppState().counter]
                                                    .productRef) &&
                                            (bottomButtonAreaCartsRecordList[
                                                        FFAppState().counter]
                                                    .size ==
                                                _model.choiceChipsValue))) {
                                          // jika pernah memasukan barang tapi ukuran tidak ada yang sama dengan daftar dalam cart
                                          setState(() {
                                            FFAppState().isCreated = 'false';
                                          });
                                          // IsCreated diisi false
                                          setState(() {
                                            FFAppState().counter =
                                                FFAppState().counter + 1;
                                          });
                                        } else {
                                          // jika belum pernah
                                          setState(() {
                                            FFAppState().isCreated = 'false';
                                          });
                                          // IsCreated diisi false
                                          setState(() {
                                            FFAppState().counter =
                                                FFAppState().counter + 1;
                                          });
                                        }
                                      }
                                      // cek apakah variabel isCreated sudah terisi atau belom. isCreated akan berisi true atau false.
                                      if (FFAppState().isCreated == 'true') {
                                        // Mengupdate quantity di firestore cart

                                        await _model
                                            .cartList![FFAppState().counter]
                                            .reference
                                            .update({
                                          ...mapToFirestore(
                                            {
                                              'quantity': FieldValue.increment(
                                                  _model.countControllerValue!),
                                            },
                                          ),
                                        });
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'add same items',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .tertiary,
                                          ),
                                        );
                                      } else {
                                        // Menambah record di firestore cart

                                        await CartsRecord.createDoc(
                                                currentUserReference!)
                                            .set(createCartsRecordData(
                                          productRef: widget
                                              .productSelection?.reference,
                                          size: _model.choiceChipsValue,
                                          quantity: _model.countControllerValue,
                                          name: widget.productSelection?.name,
                                          price: widget.productSelection?.price,
                                          photoUrl:
                                              widget.productSelection?.photoUrl,
                                        ));
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'add new items',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 2500),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .tertiary,
                                          ),
                                        );
                                      }

                                      // set value counter untul loop kembali menjadi 0
                                      setState(() {
                                        FFAppState().counter = 0;
                                      });
                                      // Set value zero menjadi 0. variabel app state ini dipakai untuk membuat nilai total sebelum function perhitungan harga total item di dalam cart menjadi 0.
                                      setState(() {
                                        FFAppState().zero = 0;
                                      });
                                      // set value sum menjadi 0
                                      setState(() {
                                        FFAppState().sum = 0.0;
                                      });
                                      _model.cartListTotalPrice =
                                          await queryCartsRecordOnce(
                                        parent: currentUserReference,
                                      );
                                      _shouldSetState = true;
                                      // loop untuk menghitung jumlah item di dalam cart
                                      while (FFAppState().counter <
                                          _model.cartListTotalPrice!.length) {
                                        // Function untuk menjumlah harga barang pada index record tertentu. Hasil dari function ini merupakan variabel total.
                                        //
                                        // total = (price * qty) + total;
                                        _model.total = await actions.totalPrice(
                                          _model
                                              .cartListTotalPrice![
                                                  FFAppState().counter]
                                              .price,
                                          _model
                                              .cartListTotalPrice![
                                                  FFAppState().counter]
                                              .quantity,
                                          FFAppState().zero.toDouble(),
                                        );
                                        _shouldSetState = true;
                                        // Memasukan dan increment nilai total ke dalam variabel sum
                                        setState(() {
                                          FFAppState().sum =
                                              FFAppState().sum + _model.total!;
                                        });
                                        // menambah counter loop +1
                                        setState(() {
                                          FFAppState().counter =
                                              FFAppState().counter + 1;
                                        });
                                      }
                                      setState(() {
                                        FFAppState().sum = FFAppState().sum;
                                      });
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'set size and quantity',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Lato',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .customColor4,
                                                  lineHeight: 1.5,
                                                ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 2000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .tertiary,
                                        ),
                                      );
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }

                                    if (_shouldSetState) setState(() {});
                                  },
                            text: 'Add to Bag',
                            options: FFButtonOptions(
                              width: 343.0,
                              height: 50.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.normal,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                              hoverColor: Color(0xFF3E3D3B),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
