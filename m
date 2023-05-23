Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 963EB70EF2D
	for <lists+linux-stm32@lfdr.de>; Wed, 24 May 2023 09:16:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30987C6A61E;
	Wed, 24 May 2023 07:16:34 +0000 (UTC)
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 002F2C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 May 2023 14:58:16 +0000 (UTC)
X-AuditID: ac14000a-923ff70000007ecb-d9-646cd488ae38
Received: from Diagnostix.phytec.de (Diagnostix.phytec.de [172.25.0.14])
 (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id A6.8F.32459.884DC646;
 Tue, 23 May 2023 16:58:16 +0200 (CEST)
Received: from Berlix.phytec.de (172.25.0.12) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 23 May
 2023 16:58:15 +0200
Received: from Berlix.phytec.de ([fe80::61cc:ebf0:7375:8768]) by
 berlix.phytec.de ([fe80::197e:d26b:2ca:c7b4%4]) with mapi id 15.01.2375.018;
 Tue, 23 May 2023 16:58:15 +0200
From: Christophe Parant <C.Parant@phytec.fr>
To: "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, "s.trumtrar@pengutronix.de"
 <s.trumtrar@pengutronix.de>
Thread-Topic: [PATCH v9 10/10] ARM: dts: stm32: add STM32MP1-based Phytec board
Thread-Index: AQHZjYZ7ReKcSf+hNU6XArRy/wB/9q9n0WyA
Date: Tue, 23 May 2023 14:58:15 +0000
Message-ID: <e5b4ef445160ac0ddbaa25f12118a253ad21542a.camel@phytec.fr>
References: <20230505060158.16516-1-s.trumtrar@pengutronix.de>
 <20230505060158.16516-11-s.trumtrar@pengutronix.de>
In-Reply-To: <20230505060158.16516-11-s.trumtrar@pengutronix.de>
Accept-Language: fr-FR, de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.0.11]
Content-ID: <55F2E19B66CA58468FE3935C4908944D@phytec.de>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRmVeSWpSXmKPExsWyRpKBT7fjSk6KwdLNXBY/X05jtJh/5Byr
 Rd+Lh8wWmx5fY7XouvaE1WLe37WsFp8+LmSx6H6n7sDh8bR/K7vHzll32T3uXNvD5rF5Sb1H
 f3cLq0f/XwOPg/sMPT5vkgvgiOKySUnNySxLLdK3S+DK+Nc4h7Vgj1bFiq0rWBoYN2h2MXJy
 SAiYSFxdv4a1i5GLQ0hgHZPE9Fl3GSGcJ4wS2959hcpsZJSYdWU7O0gLm4COxJ3jF5hBEiIC
 0xgllrYuYAJJMAtMYJaYMdsJxBYW8JP4OXsrC4gtIhAo0X9+ByOEbSRx+clSMJtFQFXiyuHr
 YDW8Am4SL2asZQOxhQRKJa78uAc2k1PAQWJP1yWwekYBFYnrL3exQOwSl9j07DsrxA8CEkv2
 nGeGsEUlXj7+BxWXlzhxaxrQHA6gek2J9bv0IVotJH696WaGsBUlpnQ/ZIc4QVDi5MwnLBMY
 xWch2TALoXsWku5ZSLpnIelewMi6ilEoNzM5O7UoM1uvIKOyJDVZLyV1EyMoskUYuHYw9s3x
 OMTIxMF4iFGCg1lJhPdEeXaKEG9KYmVValF+fFFpTmrxIUZpDhYlcd77PUyJQgLpiSWp2amp
 BalFMFkmDk6pBka1d26aZ5LXfnrxr2LT6VDu13xuLK16OzWEXZsP1d4+K7ZlG5uc6aOLJW9q
 u/+uOscf0fH2r+NF9Tf512+tvyb15UBxRYHa9C3fNTnfO55R6bBcGHFONP+3bFneRfNf36e8
 LtEqPHpL89UnSaG3Hgo5hw9/3fxYN1X6WKDx4f++V57XZbxf1x2mxFKckWioxVxUnAgANa+n
 StoCAAA=
X-Mailman-Approved-At: Wed, 24 May 2023 07:16:33 +0000
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "upstream@lists.phytec.de" <upstream@lists.phytec.de>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v9 10/10] ARM: dts: stm32: add
	STM32MP1-based Phytec board
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

SGkgU3RlZmZlbiwNCg0KVGhhbmsgeW91IGZvciB1cHN0cmVhbWluZyBvdXIgcGh5Qk9BUkQtU2Fy
Z2FzIGRldmljZSB0cmVlLiBXZSB3ZXJlIGFsc28NCnBsYW5pbmcgdG8gd29yayBvbiB0aGF0IHRv
by4NCklmIHRoaXMgcGF0Y2ggaXMgbm90IGFwcGxpZWQgdXBzdHJlYW0geWV0LCB3b3VsZCBpdCBi
ZSBwb3NzaWJsZSB0bw0KcmVuYW1lIHRoZSAuZHRzIGZpbGUgPw0KDQpJbiB0aGUgYmVnaW5uaW5n
LCB3ZSBuYW1lZCB0aGUgZHRzIGZpbGVzIGFmdGVyIG91ciBZb2N0byBtYWNoaW5lcywNCndoaWNo
IGlzIHByb2JhYmx5IHRoZSB2ZXJzaW9uIHlvdSBnb3QuIEJ1dCBub3cgd2UgcmVuYW1lZCB0aGVt
IGFmdGVyDQpvdXIgYmFzZWJvYXJkIG5hbWVzLCBsaWtlIHdpdGggb3VyIG90aGVyIHBsYXRmb3Jt
cy4NClNvIGl0IHdvdWxkIG1ha2Ugc2Vuc2UgdG8gaGF2ZSB0aGUgc3RtMzIgYmFzZWJvYXJkIG5h
bWVkIHRoZSBzYW1lIHdheSwNCmNoYW5naW5nICJzdG0zMm1wMTU3Yy1waHljb3JlLXN0bTMybXAx
LTMuZHRzIiB0byAic3RtMzJtcDE1N2MtcGh5Ym9hcmQtDQpzYXJnYXMtcmRrLWVtbWMuZHRzIi4N
Cg0KIm1vZGVsIiBhbmQgImNvbXBhdGlibGUiIGNhbiBhbHNvIGJlIG1vZGlmaWVkIHRoaXMgd2F5
IHdpdGggdGhpcyBuYW1pbmcNCmNvbnZlbnRpb24gOg0KDQovIHsNCiAgICBtb2RlbCA9ICJQSFlU
RUMgcGh5Qk9BUkQtU2FyZ2FzIFNUTTMyTVAxNTdDIHdpdGggZU1NQyI7DQogICAgY29tcGF0aWJs
ZSA9ICJwaHl0ZWMsc3RtMzJtcDE1N2MtcGh5Ym9hcmQtc2FyZ2FzLXJkay1lbW1jIiwNCiAgICAg
ICAgICAgICAicGh5dGVjLHN0bTMybXAxNTdjLXBoeWNvcmUtc29tIiwgInN0LHN0bTMybXAxNTci
Ow0KfTsNCg0KVGhhbmtzLg0KDQpCZXN0IHJlZ2FyZHMsDQpDaHJpc3RvcGhlIFBhcmFudA0KDQpM
ZSB2ZW5kcmVkaSAwNSBtYWkgMjAyMyDDoCAwODowMSArMDIwMCwgU3RlZmZlbiBUcnVtdHJhciBh
IMOpY3JpdMKgOg0KPiBBZGQgdGhlIFBoeXRlYyBTVE0zMk1QMS0zIERldiBib2FyZC4gVGhlIGRl
dmJvYXJkIHVzZXMgYSBQaHl0ZWMNCj4gc3RtMzJtMTU3Yy1zb20uDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBTdGVmZmVuIFRydW10cmFyIDxzLnRydW10cmFyQHBlbmd1dHJvbml4LmRlPg0KPiAtLS0N
Cj4gDQo+IE5vdGVzOg0KPiDCoMKgwqAgQ2hhbmdlcyBzaW5jZSB2NzoNCj4gwqDCoMKgwqDCoMKg
IC0gcmVtb3ZlIHNlY3VyZS1zdGF0dXMgZm9yIHNkbW1jDQo+IA0KPiDCoGFyY2gvYXJtL2Jvb3Qv
ZHRzL01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDMg
Ky0NCj4gwqAuLi4vZHRzL3N0bTMybXAxNTdjLXBoeWNvcmUtc3RtMzJtcDEtMy5kdHPCoMKgwqAg
fCA2MA0KPiArKysrKysrKysrKysrKysrKysrDQo+IMKgMiBmaWxlcyBjaGFuZ2VkLCA2MiBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJt
L2Jvb3QvZHRzL3N0bTMybXAxNTdjLXBoeWNvcmUtc3RtMzJtcDEtDQo+IDMuZHRzDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvTWFrZWZpbGUgYi9hcmNoL2FybS9ib290L2R0
cy9NYWtlZmlsZQ0KPiBpbmRleCBlZmU0MTUyZTU4NDYuLmRmYTlhNzQ3N2M4MiAxMDA2NDQNCj4g
LS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvTWFrZWZpbGUNCj4gKysrIGIvYXJjaC9hcm0vYm9vdC9k
dHMvTWFrZWZpbGUNCj4gQEAgLTEyNTIsNyArMTI1Miw4IEBAIGR0Yi0kKENPTkZJR19BUkNIX1NU
TTMyKSArPSBcDQo+IMKgwqDCoMKgwqDCoMKgwqBzdG0zMm1wMTU3Yy1ldjEuZHRiIFwNCj4gwqDC
oMKgwqDCoMKgwqDCoHN0bTMybXAxNTdjLWV2MS1zY21pLmR0YiBcDQo+IMKgwqDCoMKgwqDCoMKg
wqBzdG0zMm1wMTU3Yy1seGEtbWMxLmR0YiBcDQo+IC3CoMKgwqDCoMKgwqDCoHN0bTMybXAxNTdj
LW9keXNzZXkuZHRiDQo+ICvCoMKgwqDCoMKgwqDCoHN0bTMybXAxNTdjLW9keXNzZXkuZHRiIFwN
Cj4gK8KgwqDCoMKgwqDCoMKgc3RtMzJtcDE1N2MtcGh5Y29yZS1zdG0zMm1wMS0zLmR0Yg0KPiDC
oGR0Yi0kKENPTkZJR19NQUNIX1NVTjRJKSArPSBcDQo+IMKgwqDCoMKgwqDCoMKgwqBzdW40aS1h
MTAtYTEwMDAuZHRiIFwNCj4gwqDCoMKgwqDCoMKgwqDCoHN1bjRpLWExMC1iYTEwLXR2Ym94LmR0
YiBcDQo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1waHljb3Jl
LXN0bTMybXAxLTMuZHRzDQo+IGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2MtcGh5Y29y
ZS1zdG0zMm1wMS0zLmR0cw0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAw
MDAwMDAuLjI4ZDcyMDMyNjRjZQ0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL2FyY2gvYXJtL2Jv
b3QvZHRzL3N0bTMybXAxNTdjLXBoeWNvcmUtc3RtMzJtcDEtMy5kdHMNCj4gQEAgLTAsMCArMSw2
MCBAQA0KPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wKyBPUiBCU0QtMy1D
bGF1c2UpDQo+ICsvKg0KPiArICogQ29weXJpZ2h0IChDKSBQaHl0ZWMgR21iSCAyMDE5LTIwMjAg
LSBBbGwgUmlnaHRzIFJlc2VydmVkDQo+ICsgKiBBdXRob3I6IERvbSBWT1ZBUkQgPGRvbS52b3Zh
cmRAbGlucnQuY29tPi4NCj4gKyAqLw0KPiArDQo+ICsvZHRzLXYxLzsNCj4gKw0KPiArI2luY2x1
ZGUgPGR0LWJpbmRpbmdzL3BpbmN0cmwvc3RtMzItcGluZnVuYy5oPg0KPiArI2luY2x1ZGUgInN0
bTMybXAxNTcuZHRzaSINCj4gKyNpbmNsdWRlICJzdG0zMm1wMTV4Yy5kdHNpIg0KPiArI2luY2x1
ZGUgInN0bTMybXAxNXh4YWMtcGluY3RybC5kdHNpIg0KPiArI2luY2x1ZGUgInN0bTMybXAxNTdj
LXBoeWNvcmUtc3RtMzJtcDE1LXNvbS5kdHNpIg0KPiArDQo+ICsvIHsNCj4gK8KgwqDCoMKgwqDC
oMKgbW9kZWwgPSAiUEhZVEVDIHBoeUNPUkUtU1RNMzJNUDEtMyBEZXYgQm9hcmQiOw0KPiArwqDC
oMKgwqDCoMKgwqBjb21wYXRpYmxlID0gInBoeXRlYyxwaHljb3JlLXN0bTMybXAxLTMiLA0KPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgInBoeXRlYyxwaHljb3JlLXN0
bTMybXAxNTdjLXNvbSIsDQo+ICJzdCxzdG0zMm1wMTU3IjsNCj4gKw0KPiArwqDCoMKgwqDCoMKg
wqBhbGlhc2VzIHsNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoG1tYzAgPSAmc2Rt
bWMxOw0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbW1jMSA9ICZzZG1tYzI7DQo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBtbWMyID0gJnNkbW1jMzsNCj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHNlcmlhbDAgPSAmdWFydDQ7DQo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBzZXJpYWwxID0gJnVzYXJ0MzsNCj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHNlcmlhbDIgPSAmdXNhcnQxOw0KPiArwqDCoMKgwqDCoMKgwqB9Ow0K
PiArfTsNCj4gKw0KPiArJmNyeXAxIHsNCj4gK8KgwqDCoMKgwqDCoMKgc3RhdHVzID0gIm9rYXki
Ow0KPiArfTsNCj4gKw0KPiArJmR0cyB7DQo+ICvCoMKgwqDCoMKgwqDCoHN0YXR1cyA9ICJva2F5
IjsNCj4gK307DQo+ICsNCj4gKyZmbWMgew0KPiArwqDCoMKgwqDCoMKgwqBzdGF0dXMgPSAiZGlz
YWJsZWQiOw0KPiArfTsNCj4gKw0KPiArJmdwdSB7DQo+ICvCoMKgwqDCoMKgwqDCoHN0YXR1cyA9
ICJva2F5IjsNCj4gK307DQo+ICsNCj4gKyZpMmM0X2VlcHJvbSB7DQo+ICvCoMKgwqDCoMKgwqDC
oHN0YXR1cyA9ICJva2F5IjsNCj4gK307DQo+ICsNCj4gKyZpMmM0X3J0YyB7DQo+ICvCoMKgwqDC
oMKgwqDCoHN0YXR1cyA9ICJva2F5IjsNCj4gK307DQo+ICsNCj4gKyZxc3BpIHsNCj4gK8KgwqDC
oMKgwqDCoMKgc3RhdHVzID0gIm9rYXkiOw0KPiArfTsNCj4gKw0KPiArJnNkbW1jMiB7DQo+ICvC
oMKgwqDCoMKgwqDCoHN0YXR1cyA9ICJva2F5IjsNCj4gK307DQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
