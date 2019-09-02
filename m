Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 48646A5220
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Sep 2019 10:47:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3CA6AC35E01;
	Mon,  2 Sep 2019 08:47:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D386C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Sep 2019 08:47:28 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x828f2Xe016143; Mon, 2 Sep 2019 10:47:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=qokvXzr61p2XU2kdQZOpEXGEWSsRk5+uMplPu6Iv04c=;
 b=l14ryxWUveKQ+Ns43szE6fUAms/hyaed6FJKY1VyRAG3fh/b5KkRjpxDMwQBrCATwXEF
 cSjM8qO5NJGNIv/Ssz/smgLE4idvKBFTeX9fHjEI5J9xLGbVYPO0Iv5pQkA7/dz32sPC
 URO0ASXD8d2Nkd0UAM/ZjaFeFWv+otAa3VBuDaZr+0pKgopzMgBPF7z8No7+AuKLmck8
 sfB0AP31ZPN8tUgL/5NrTc07i/4I7OycIOUa6nvsUMZHqCUug3uz+dhzQ+uOVoaamLhE
 qiSAr7eMdwHrz8Qshef+A7ZsODfDV+o5QD5wi8kcfGgtC9//xuCtrp7RX36mcvo3VICT lg== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx08-00178001.pphosted.com with ESMTP id 2uqe19bsex-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 02 Sep 2019 10:47:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8E4E85A;
 Mon,  2 Sep 2019 08:47:07 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E45182C9CF0;
 Mon,  2 Sep 2019 10:47:06 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 2 Sep
 2019 10:47:06 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 2 Sep 2019 10:47:06 +0200
From: Philippe CORNU <philippe.cornu@st.com>
To: Yannick FERTRE <yannick.fertre@st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>,
 "Rob Herring" <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>,
 Benjamin GAIGNARD <benjamin.gaignard@st.com>,
 Fabrice GASNIER <fabrice.gasnier@st.com>
Thread-Topic: [PATCH] drm/stm: ltdc: add pinctrl for DPI encoder mode
Thread-Index: AQHVSUFBPsK65Gcc8kKhrvIT+ZtHF6cYIfSA
Date: Mon, 2 Sep 2019 08:47:06 +0000
Message-ID: <ada48bc2-ac6a-8732-9aa6-03ef1c104abf@st.com>
References: <1564757262-6166-1-git-send-email-yannick.fertre@st.com>
In-Reply-To: <1564757262-6166-1-git-send-email-yannick.fertre@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <8400DF40637355459F46929D8BCFF92C@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-02_02:2019-08-29,2019-09-02 signatures=0
Subject: Re: [Linux-stm32] [PATCH] drm/stm: ltdc: add pinctrl for DPI
	encoder mode
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

SGkgWWFubmljaywNCg0KT24gOC8yLzE5IDQ6NDcgUE0sIFlhbm5pY2sgRmVydHLDqSB3cm90ZToN
Cj4gVGhlIGltcGxlbWVudGF0aW9uIG9mIGZ1bmN0aW9ucyBlbmNvZGVyX2VuYWJsZSBhbmQgZW5j
b2Rlcl9kaXNhYmxlDQo+IG1ha2UgcG9zc2libGUgdG8gY29udHJvbCB0aGUgcGluY3RybCBhY2Nv
cmRpbmcgdG8gdGhlIGVuY29kZXIgdHlwZS4NCj4gVGhlIHBpbmN0cmwgbXVzdCBiZSBhY3RpdmF0
ZWQgb25seSBpZiB0aGUgZW5jb2RlciB0eXBlIGlzIERQSS4NCj4gVGhpcyBoZWxwcyB0byBtb3Zl
IHRoZSBEUEktcmVsYXRlZCBwaW5jdHJsIGNvbmZpZ3VyYXRpb24gZnJvbQ0KPiBhbGwgdGhlIHBh
bmVsIG9yIGJyaWRnZSB0byB0aGUgTFREQyBkdCBub2RlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTog
WWFubmljayBGZXJ0csOpIDx5YW5uaWNrLmZlcnRyZUBzdC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZl
cnMvZ3B1L2RybS9zdG0vbHRkYy5jIHwgMzUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9s
dGRjLmMNCj4gaW5kZXggM2FiNGZiZi4uMWM0ZmRlMCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3N0bS9sdGRjLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMNCj4g
QEAgLTE1LDYgKzE1LDcgQEANCj4gICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQo+ICAgI2lu
Y2x1ZGUgPGxpbnV4L29mX2FkZHJlc3MuaD4NCj4gICAjaW5jbHVkZSA8bGludXgvb2ZfZ3JhcGgu
aD4NCj4gKyNpbmNsdWRlIDxsaW51eC9waW5jdHJsL2NvbnN1bWVyLmg+DQo+ICAgI2luY2x1ZGUg
PGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPg0KPiAgICNpbmNsdWRlIDxsaW51eC9wbV9ydW50aW1l
Lmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L3Jlc2V0Lmg+DQo+IEBAIC0xMDQwLDYgKzEwNDEsMzYg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZW5jb2Rlcl9mdW5jcyBsdGRjX2VuY29kZXJfZnVu
Y3MgPSB7DQo+ICAgCS5kZXN0cm95ID0gZHJtX2VuY29kZXJfY2xlYW51cCwNCj4gICB9Ow0KPiAg
IA0KPiArc3RhdGljIHZvaWQgbHRkY19lbmNvZGVyX2Rpc2FibGUoc3RydWN0IGRybV9lbmNvZGVy
ICplbmNvZGVyKQ0KPiArew0KPiArCXN0cnVjdCBkcm1fZGV2aWNlICpkZGV2ID0gZW5jb2Rlci0+
ZGV2Ow0KPiArDQo+ICsJRFJNX0RFQlVHX0RSSVZFUigiXG4iKTsNCj4gKw0KPiArCS8qIFNldCB0
byBzbGVlcCBzdGF0ZSB0aGUgcGluY3RybCB3aGF0ZXZlciB0eXBlIG9mIGVuY29kZXIgKi8NCj4g
KwlwaW5jdHJsX3BtX3NlbGVjdF9zbGVlcF9zdGF0ZShkZGV2LT5kZXYpOw0KPiArfQ0KPiArDQo+
ICtzdGF0aWMgdm9pZCBsdGRjX2VuY29kZXJfZW5hYmxlKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5j
b2RlcikNCj4gK3sNCj4gKwlzdHJ1Y3QgZHJtX2RldmljZSAqZGRldiA9IGVuY29kZXItPmRldjsN
Cj4gKw0KPiArCURSTV9ERUJVR19EUklWRVIoIlxuIik7DQo+ICsNCj4gKwkvKg0KPiArCSAqIFNl
dCB0byBkZWZhdWx0IHN0YXRlIHRoZSBwaW5jdHJsIG9ubHkgd2l0aCBEUEkgdHlwZS4NCj4gKwkg
KiBPdGhlcnMgdHlwZXMgbGlrZSBEU0ksIGRvbid0IG5lZWQgcGluY3RybCBkdWUgdG8NCj4gKwkg
KiBpbnRlcm5hbCBicmlkZ2UgKHRoZSBzaWduYWxzIGRvIG5vdCBjb21lIG91dCBvZiB0aGUgY2hp
cHNldCkuDQo+ICsJICovDQo+ICsJaWYgKGVuY29kZXItPmVuY29kZXJfdHlwZSA9PSBEUk1fTU9E
RV9FTkNPREVSX0RQSSkNCj4gKwkJcGluY3RybF9wbV9zZWxlY3RfZGVmYXVsdF9zdGF0ZShkZGV2
LT5kZXYpOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9lbmNvZGVyX2hl
bHBlcl9mdW5jcyBsdGRjX2VuY29kZXJfaGVscGVyX2Z1bmNzID0gew0KPiArCS5kaXNhYmxlID0g
bHRkY19lbmNvZGVyX2Rpc2FibGUsDQo+ICsJLmVuYWJsZSA9IGx0ZGNfZW5jb2Rlcl9lbmFibGUs
DQo+ICt9Ow0KPiArDQo+ICAgc3RhdGljIGludCBsdGRjX2VuY29kZXJfaW5pdChzdHJ1Y3QgZHJt
X2RldmljZSAqZGRldiwgc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkNCj4gICB7DQo+ICAgCXN0
cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcjsNCj4gQEAgLTEwNTUsNiArMTA4Niw4IEBAIHN0YXRp
YyBpbnQgbHRkY19lbmNvZGVyX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRkZXYsIHN0cnVjdCBk
cm1fYnJpZGdlICpicmlkZ2UpDQo+ICAgCWRybV9lbmNvZGVyX2luaXQoZGRldiwgZW5jb2Rlciwg
Jmx0ZGNfZW5jb2Rlcl9mdW5jcywNCj4gICAJCQkgRFJNX01PREVfRU5DT0RFUl9EUEksIE5VTEwp
Ow0KPiAgIA0KPiArCWRybV9lbmNvZGVyX2hlbHBlcl9hZGQoZW5jb2RlciwgJmx0ZGNfZW5jb2Rl
cl9oZWxwZXJfZnVuY3MpOw0KPiArDQo+ICAgCXJldCA9IGRybV9icmlkZ2VfYXR0YWNoKGVuY29k
ZXIsIGJyaWRnZSwgTlVMTCk7DQo+ICAgCWlmIChyZXQpIHsNCj4gICAJCWRybV9lbmNvZGVyX2Ns
ZWFudXAoZW5jb2Rlcik7DQo+IEBAIC0xMjgwLDYgKzEzMTMsOCBAQCBpbnQgbHRkY19sb2FkKHN0
cnVjdCBkcm1fZGV2aWNlICpkZGV2KQ0KPiAgIA0KPiAgIAljbGtfZGlzYWJsZV91bnByZXBhcmUo
bGRldi0+cGl4ZWxfY2xrKTsNCj4gICANCj4gKwlwaW5jdHJsX3BtX3NlbGVjdF9zbGVlcF9zdGF0
ZShkZGV2LT5kZXYpOw0KPiArDQoNClJldmlld2VkLWJ5OiBQaGlsaXBwZSBDb3JudSA8cGhpbGlw
cGUuY29ybnVAc3QuY29tPg0KDQpUaGFua3MNClBoaWxpcHBlIDopDQoNCj4gICAJcG1fcnVudGlt
ZV9lbmFibGUoZGRldi0+ZGV2KTsNCj4gICANCj4gICAJcmV0dXJuIDA7DQo+IApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
