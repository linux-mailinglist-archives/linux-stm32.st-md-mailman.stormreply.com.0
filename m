Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC8A2B5CF
	for <lists+linux-stm32@lfdr.de>; Mon, 27 May 2019 14:55:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84649C5B675
	for <lists+linux-stm32@lfdr.de>; Mon, 27 May 2019 12:55:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88F12C5B674
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 May 2019 12:55:04 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4RCkREG004574; Mon, 27 May 2019 14:54:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=sKrW0CioPqMIKO8cNXujdrTmMUPJlLJ5MTbTFhfNccQ=;
 b=nHYSdG55hwRAIl0JS0bL8PAPbQlQThN0XOM5pQzfYk61TA8xNH/voyoRIvkd9xhtwD/v
 /S1fAn93tpkCliT9se5ZYdLZafa9ckLQVpPIHaV02W5odIx8CY0CBCLe4tedvZzVFlwu
 lD64NAU0spMB4lwQaJilTyZ8hBlHAjxlcw+qAqZZJrTG1jJcViEQM6zeTwji7gQ3yikZ
 yqB8+Ab2UMWzBKPokDCOG+C8Pb69+iE8pp8vobsnR1lTqYZmUQO+JKBQH5uQQhzGAJFM
 9/tgJBnBYd7R+LMsRwiq3qpZUciYdbstWWkzs5UbFdKFiUnxBnbHau7VBp4qRtt5VdhV dw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2spvkgtv5m-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 27 May 2019 14:54:40 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 88A6238;
 Mon, 27 May 2019 12:54:37 +0000 (GMT)
Received: from Webmail-eu.st.com (gpxdag6node4.st.com [10.75.127.80])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 65A092ADC;
 Mon, 27 May 2019 12:54:37 +0000 (GMT)
Received: from GPXDAG6NODE6.st.com (10.75.127.82) by GPXDAG6NODE4.st.com
 (10.75.127.80) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 27 May
 2019 14:54:37 +0200
Received: from GPXDAG6NODE6.st.com ([fe80::57f:5f53:243f:cb11]) by
 GPXDAG6NODE6.st.com ([fe80::57f:5f53:243f:cb11%19]) with mapi id
 15.00.1473.003; Mon, 27 May 2019 14:54:37 +0200
From: Philippe CORNU <philippe.cornu@st.com>
To: Yannick FERTRE <yannick.fertre@st.com>, Andrzej Hajda
 <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Heiko
 Stuebner" <heiko@sntech.de>, Sam Ravnborg <sam@ravnborg.org>, Nickey Yang
 <nickey.yang@rock-chips.com>, Benjamin Gaignard
 <benjamin.gaignard@linaro.org>, Vincent ABRIOU <vincent.abriou@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre TORGUE
 <alexandre.torgue@st.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Thread-Topic: [PATCH v1 2/2] drm/stm: dsi: add power on/off phy ops
Thread-Index: AQHVFHX+VSs7HxnBmUmbgwP5oNYjkKZ+zDkA
Date: Mon, 27 May 2019 12:54:37 +0000
Message-ID: <24c1ee24-af80-8605-d042-76a43c985068@st.com>
References: <1558952499-15418-1-git-send-email-yannick.fertre@st.com>
 <1558952499-15418-3-git-send-email-yannick.fertre@st.com>
In-Reply-To: <1558952499-15418-3-git-send-email-yannick.fertre@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <738E4C142AF00C40B55910A8F5EDC6C4@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-27_07:, , signatures=0
Subject: Re: [Linux-stm32] [PATCH v1 2/2] drm/stm: dsi: add power on/off phy
	ops
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

SGkgWWFubmljaywNCmFuZCB0aGFuayB5b3UgZm9yIHlvdXIgcGF0Y2guDQoNClRlc3RlZCBzdWNj
ZXNzZnVsbHkgb24gc3RtMzJmIHRvby4NCg0KQWNrZWQtYnk6IFBoaWxpcHBlIENvcm51IDxwaGls
aXBwZS5jb3JudUBzdC5jb20+DQpUZXN0ZWQtYnk6IFBoaWxpcHBlIENvcm51IDxwaGlsaXBwZS5j
b3JudUBzdC5jb20+DQoNClBoaWxpcHBlIDotKQ0KDQpPbiA1LzI3LzE5IDEyOjIxIFBNLCBZYW5u
aWNrIEZlcnRyw6kgd3JvdGU6DQo+IFRoZXNlIG5ldyBwaHlzaWNhbCBvcGVyYXRpb25zIGFyZSBo
ZWxwZnVsIHRvIHBvd2VyX29uL29mZiB0aGUgZHNpDQo+IHdyYXBwZXIuIElmIHRoZSBkc2kgd3Jh
cHBlciBpcyBwb3dlcmVkIGluIHZpZGVvIG1vZGUsIHRoZSBkaXNwbGF5DQo+IGNvbnRyb2xsZXIg
KGx0ZGMpIHJlZ2lzdGVyIGFjY2VzcyB3aWxsIGhhbmcgd2hlbiBEU0kgZmlmb3MgYXJlIGZ1bGwu
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBZYW5uaWNrIEZlcnRyw6kgPHlhbm5pY2suZmVydHJlQHN0
LmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3N0bS9kd19taXBpX2RzaS1zdG0uYyB8
IDIxICsrKysrKysrKysrKysrKysrKysrLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3N0bS9kd19taXBpX2RzaS1zdG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vZHdfbWlwaV9kc2kt
c3RtLmMNCj4gaW5kZXggMDFkYjAyMC4uMGFiMzJmZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3N0bS9kd19taXBpX2RzaS1zdG0uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc3Rt
L2R3X21pcGlfZHNpLXN0bS5jDQo+IEBAIC0yMTAsMTAgKzIxMCwyNyBAQCBzdGF0aWMgaW50IGR3
X21pcGlfZHNpX3BoeV9pbml0KHZvaWQgKnByaXZfZGF0YSkNCj4gICAJaWYgKHJldCkNCj4gICAJ
CURSTV9ERUJVR19EUklWRVIoIiFUSU1FT1VUISB3YWl0aW5nIFBMTCwgbGV0J3MgY29udGludWVc
biIpOw0KPiAgIA0KPiArCXJldHVybiAwOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgdm9pZCBkd19t
aXBpX2RzaV9waHlfcG93ZXJfb24odm9pZCAqcHJpdl9kYXRhKQ0KPiArew0KPiArCXN0cnVjdCBk
d19taXBpX2RzaV9zdG0gKmRzaSA9IHByaXZfZGF0YTsNCj4gKw0KPiArCURSTV9ERUJVR19EUklW
RVIoIlxuIik7DQo+ICsNCj4gICAJLyogRW5hYmxlIHRoZSBEU0kgd3JhcHBlciAqLw0KPiAgIAlk
c2lfc2V0KGRzaSwgRFNJX1dDUiwgV0NSX0RTSUVOKTsNCj4gK30NCj4gICANCj4gLQlyZXR1cm4g
MDsNCj4gK3N0YXRpYyB2b2lkIGR3X21pcGlfZHNpX3BoeV9wb3dlcl9vZmYodm9pZCAqcHJpdl9k
YXRhKQ0KPiArew0KPiArCXN0cnVjdCBkd19taXBpX2RzaV9zdG0gKmRzaSA9IHByaXZfZGF0YTsN
Cj4gKw0KPiArCURSTV9ERUJVR19EUklWRVIoIlxuIik7DQo+ICsNCj4gKwkvKiBEaXNhYmxlIHRo
ZSBEU0kgd3JhcHBlciAqLw0KPiArCWRzaV9jbGVhcihkc2ksIERTSV9XQ1IsIFdDUl9EU0lFTik7
DQo+ICAgfQ0KPiAgIA0KPiAgIHN0YXRpYyBpbnQNCj4gQEAgLTI4Nyw2ICszMDQsOCBAQCBkd19t
aXBpX2RzaV9nZXRfbGFuZV9tYnBzKHZvaWQgKnByaXZfZGF0YSwgY29uc3Qgc3RydWN0IGRybV9k
aXNwbGF5X21vZGUgKm1vZGUsDQo+ICAgDQo+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBkd19taXBp
X2RzaV9waHlfb3BzIGR3X21pcGlfZHNpX3N0bV9waHlfb3BzID0gew0KPiAgIAkuaW5pdCA9IGR3
X21pcGlfZHNpX3BoeV9pbml0LA0KPiArCS5wb3dlcl9vbiA9IGR3X21pcGlfZHNpX3BoeV9wb3dl
cl9vbiwNCj4gKwkucG93ZXJfb2ZmID0gZHdfbWlwaV9kc2lfcGh5X3Bvd2VyX29mZiwNCj4gICAJ
LmdldF9sYW5lX21icHMgPSBkd19taXBpX2RzaV9nZXRfbGFuZV9tYnBzLA0KPiAgIH07DQo+ICAg
DQo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
