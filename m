Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D65F1F547E
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Jun 2020 14:21:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29A85C36B21;
	Wed, 10 Jun 2020 12:21:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 57328C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jun 2020 12:21:51 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05ACH41L019631; Wed, 10 Jun 2020 14:21:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=wdNUieu9A089aQd0HEz5EhKDKxn34H42CAxYbJ7QwFs=;
 b=NJPUNg7L53ZDKjAJlV+SZkHakI7R36uVTGQR7dNk+1FqYPswKLlU+JX1NSAgTptMvZb7
 cGJ6R58SG5bofMUj3tJ2y9d8xcD2HFB00cE5SFCOtFfgQGsGm331Y9hkxUwv0X5Sy/Sp
 2dn6BK5Bk9mUObKA30wkOU8svLwT1qLm7CkzJ/kGq2qEX56WhlyGfBqVVLV3ykIVe4mG
 y+U0F0DzK2r/0gs1oESssPRf5xKP8l/SkR+jqbYtEvdm/0qPaYRIrixDnlpIJp8Lz9Sb
 oRsJ30koP74J+T0OipR4cJWJO9993TJozYmcFBgHIyhUhzsWtBnkfqH/QHfheqUfbwtH VQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31g21g4tj2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jun 2020 14:21:33 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4556710002A;
 Wed, 10 Jun 2020 14:21:33 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 34BFB2BC7DA;
 Wed, 10 Jun 2020 14:21:33 +0200 (CEST)
Received: from SFHDAG6NODE1.st.com (10.75.127.16) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 10 Jun
 2020 14:21:32 +0200
Received: from SFHDAG6NODE1.st.com ([fe80::8d96:4406:44e3:eb27]) by
 SFHDAG6NODE1.st.com ([fe80::8d96:4406:44e3:eb27%20]) with mapi id
 15.00.1473.003; Wed, 10 Jun 2020 14:21:32 +0200
From: Yannick FERTRE <yannick.fertre@st.com>
To: Adrian Ratiu <adrian.ratiu@collabora.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-rockchip@lists.infradead.org"
 <linux-rockchip@lists.infradead.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>
Thread-Topic: [PATCH v9 04/11] drm: bridge: dw_mipi_dsi: remove bind/unbind API
Thread-Index: AQHWPoYzuKgG813G20ml4dGnJRUGOKjRpMMA
Date: Wed, 10 Jun 2020 12:21:32 +0000
Message-ID: <9c291445-ae15-2ff5-4d24-489a2128b9ba@st.com>
References: <20200609174959.955926-1-adrian.ratiu@collabora.com>
 <20200609174959.955926-5-adrian.ratiu@collabora.com>
In-Reply-To: <20200609174959.955926-5-adrian.ratiu@collabora.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <524C672CA460194DA6D668FE23951048@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-10_07:2020-06-10,
 2020-06-10 signatures=0
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Heiko
 Stuebner <heiko@sntech.de>, Jonas Karlman <jonas@kwiboo.se>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>, "linux-imx@nxp.com" <linux-imx@nxp.com>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH v9 04/11] drm: bridge: dw_mipi_dsi: remove
	bind/unbind API
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

SGkgQWRyaWFuLA0KDQp0aGFua3MgZm9yIHRoZSBwYWNoOiB0ZXN0ZWQgb24gc3RtMzJtcDEuDQoN
ClRlc3RlZC1ieTogWWFubmljayBGZXJ0csOpIDx5YW5uaWNrLmZlcnRyZUBzdC5jb20+DQoNCk9u
IDYvOS8yMCA3OjQ5IFBNLCBBZHJpYW4gUmF0aXUgd3JvdGU6DQo+IFRoZSBEVyBtaXBpLWRzaSBi
aW5kL3VuYmluZCBBUEkgd2FzIG9ubHkgdXNlZCB0byBhdHRhY2ggdGhlIGJyaWRnZSB0bw0KPiB0
aGUgZW5jb2RlciBpbiB0aGUgUm9ja2NoaXAgZHJpdmVyLCBidXQgd2l0aCB0aGUgYWRkaXRpb24g
b2YgaS5NWDYgaXQNCj4gZ2V0cyBtb3JlIGNvbXBsaWNhdGVkIGJlY2F1c2UgdGhlIGkuTVg2IHBh
cnQgb2YgdGhlIGJyaWRnZSBpcyBhbm90aGVyDQo+IGJyaWRnZSBpbiBpdHNlbGYgd2hpY2ggbmVl
ZHMgdG8gZGFpc3kgY2hhaW4gdG8gdGhlIGR3LW1pcGktZHNpIGNvcmUuDQo+DQo+IFNvLCBpbnN0
ZWFkIG9mIGV4dGVuZGluZyB0aGlzIEFQSSB0byBhbGxvdyBkYWlzeS1jaGFpbmluZyBicmlkZ2Vz
IGFuZA0KPiByaXNrIGhhdmluZyB0cm91YmxlIHdpdGggbXVsdGlwbGUgY29ubmVjdG9ycyBhZGRl
ZCBieSB2YXJpb3VzIGJyaWRnZXMNCj4ganVzdCBkZWxldGUgaXQgYW5kIGxldCB0aGUgRFcgY29y
ZSBicmlkZ2UgYmUgYWNjZXNlZCBieSBTb0Mtc3BlY2lmaWMNCj4gcGFydHMgdmlhIHRoZSBvZl9k
cm1fZmluZF9icmlkZ2UoKSBBUEkuDQo+DQo+IFRoaXMganVzdCBmaXhlcyB0aGUgUm9ja2NoaXAg
ZHJpdmVyIGZvciB0aGUgYmluZCgpIGRlcHJlY2F0aW9uLCBpdA0KPiBkb2Vzbid0IGNvbnZlcnQg
aXQgdG8gYSBwcm9wZXIgYnJpZGdlIGRhaXN5LWNoYWluIHdpdGggc2ltcGxlIGVuY29kZXINCj4g
YW5kIGJyaWRnZSAuYXR0YWNoIGNhbGwtYmFja3MsIHRoYXQgcmVmYWN0b3Jpbmcgd29yayBzaG91
bGQgYmUgZG9uZQ0KPiBzZXBhcmF0ZWx5IChhbmQgdGhlIGkuTVg2IGRyaXZlciBjYW4gYmUgdXNl
ZCBhcyByZWZlcmVuY2UpLg0KPg0KPiBTdWdnZXN0ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxh
dXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogQWRyaWFu
IFJhdGl1IDxhZHJpYW4ucmF0aXVAY29sbGFib3JhLmNvbT4NCj4gLS0tDQo+IE5ldyBpbiB2OS4N
Cj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1taXBpLWRzaS5j
IHwgMjIgLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgIC4uLi9ncHUvZHJtL3JvY2tjaGlwL2R3LW1p
cGktZHNpLXJvY2tjaGlwLmMgICB8ICA3ICsrKy0tLQ0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAyNiBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctbWlwaS1kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2Uvc3lub3BzeXMvZHctbWlwaS1kc2kuYw0KPiBpbmRleCAxNmZkODcwNTVlN2I3Li43MGRm
MDU3OGNiZTdiIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lz
L2R3LW1pcGktZHNpLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9k
dy1taXBpLWRzaS5jDQo+IEBAIC0xNDUzLDI4ICsxNDUzLDYgQEAgdm9pZCBkd19taXBpX2RzaV9y
ZW1vdmUoc3RydWN0IGR3X21pcGlfZHNpICpkc2kpDQo+ICAgfQ0KPiAgIEVYUE9SVF9TWU1CT0xf
R1BMKGR3X21pcGlfZHNpX3JlbW92ZSk7DQo+ICAgDQo+IC0vKg0KPiAtICogQmluZC91bmJpbmQg
QVBJLCB1c2VkIGZyb20gcGxhdGZvcm1zIGJhc2VkIG9uIHRoZSBjb21wb25lbnQgZnJhbWV3b3Jr
Lg0KPiAtICovDQo+IC1pbnQgZHdfbWlwaV9kc2lfYmluZChzdHJ1Y3QgZHdfbWlwaV9kc2kgKmRz
aSwgc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyKQ0KPiAtew0KPiAtCWludCByZXQ7DQo+IC0N
Cj4gLQlyZXQgPSBkcm1fYnJpZGdlX2F0dGFjaChlbmNvZGVyLCAmZHNpLT5icmlkZ2UsIE5VTEws
IDApOw0KPiAtCWlmIChyZXQpIHsNCj4gLQkJRFJNX0VSUk9SKCJGYWlsZWQgdG8gaW5pdGlhbGl6
ZSBicmlkZ2Ugd2l0aCBkcm1cbiIpOw0KPiAtCQlyZXR1cm4gcmV0Ow0KPiAtCX0NCj4gLQ0KPiAt
CXJldHVybiByZXQ7DQo+IC19DQo+IC1FWFBPUlRfU1lNQk9MX0dQTChkd19taXBpX2RzaV9iaW5k
KTsNCj4gLQ0KPiAtdm9pZCBkd19taXBpX2RzaV91bmJpbmQoc3RydWN0IGR3X21pcGlfZHNpICpk
c2kpDQo+IC17DQo+IC19DQo+IC1FWFBPUlRfU1lNQk9MX0dQTChkd19taXBpX2RzaV91bmJpbmQp
Ow0KPiAtDQo+ICAgTU9EVUxFX0FVVEhPUigiQ2hyaXMgWmhvbmcgPHp5d0Byb2NrLWNoaXBzLmNv
bT4iKTsNCj4gICBNT0RVTEVfQVVUSE9SKCJQaGlsaXBwZSBDb3JudSA8cGhpbGlwcGUuY29ybnVA
c3QuY29tPiIpOw0KPiAgIE1PRFVMRV9ERVNDUklQVElPTigiRFcgTUlQSSBEU0kgaG9zdCBjb250
cm9sbGVyIGRyaXZlciIpOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlw
L2R3LW1pcGktZHNpLXJvY2tjaGlwLmMgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvZHctbWlw
aS1kc2ktcm9ja2NoaXAuYw0KPiBpbmRleCAzZmVmZjBjNDViM2Y3Li44NmY4N2M3ZWEwM2NmIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvZHctbWlwaS1kc2ktcm9ja2No
aXAuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvZHctbWlwaS1kc2ktcm9ja2No
aXAuYw0KPiBAQCAtODc2LDYgKzg3Niw3IEBAIHN0YXRpYyBpbnQgZHdfbWlwaV9kc2lfcm9ja2No
aXBfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+ICAgew0KPiAgIAlzdHJ1Y3QgZHdfbWlwaV9k
c2lfcm9ja2NoaXAgKmRzaSA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOw0KPiAgIAlzdHJ1Y3QgZHJt
X2RldmljZSAqZHJtX2RldiA9IGRhdGE7DQo+ICsJc3RydWN0IGRybV9icmlkZ2UgKmR3X2JyaWRn
ZSA9IG9mX2RybV9maW5kX2JyaWRnZShkZXYtPm9mX25vZGUpOw0KPiAgIAlzdHJ1Y3QgZGV2aWNl
ICpzZWNvbmQ7DQo+ICAgCWJvb2wgbWFzdGVyMSwgbWFzdGVyMjsNCj4gICAJaW50IHJldDsNCj4g
QEAgLTkyOSw5ICs5MzAsOSBAQCBzdGF0aWMgaW50IGR3X21pcGlfZHNpX3JvY2tjaGlwX2JpbmQo
c3RydWN0IGRldmljZSAqZGV2LA0KPiAgIAkJcmV0dXJuIHJldDsNCj4gICAJfQ0KPiAgIA0KPiAt
CXJldCA9IGR3X21pcGlfZHNpX2JpbmQoZHNpLT5kbWQsICZkc2ktPmVuY29kZXIpOw0KPiArCXJl
dCA9IGRybV9icmlkZ2VfYXR0YWNoKCZkc2ktPmVuY29kZXIsIGR3X2JyaWRnZSwgTlVMTCwgMCk7
DQo+ICAgCWlmIChyZXQpIHsNCj4gLQkJRFJNX0RFVl9FUlJPUihkZXYsICJGYWlsZWQgdG8gYmlu
ZDogJWRcbiIsIHJldCk7DQo+ICsJCURSTV9ERVZfRVJST1IoZGV2LCAiRmFpbGVkIHRvIGF0dGFj
aCBEVyBEU0kgYnJpZGdlOiAlZFxuIiwgcmV0KTsNCj4gICAJCXJldHVybiByZXQ7DQo+ICAgCX0N
Cj4gICANCj4gQEAgLTk0Nyw4ICs5NDgsNiBAQCBzdGF0aWMgdm9pZCBkd19taXBpX2RzaV9yb2Nr
Y2hpcF91bmJpbmQoc3RydWN0IGRldmljZSAqZGV2LA0KPiAgIAlpZiAoZHNpLT5pc19zbGF2ZSkN
Cj4gICAJCXJldHVybjsNCj4gICANCj4gLQlkd19taXBpX2RzaV91bmJpbmQoZHNpLT5kbWQpOw0K
PiAtDQo+ICAgCWNsa19kaXNhYmxlX3VucHJlcGFyZShkc2ktPnBsbHJlZl9jbGspOw0KPiAgIH0N
Cj4gICANCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
