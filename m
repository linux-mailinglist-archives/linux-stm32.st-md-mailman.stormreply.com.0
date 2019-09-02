Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0D8A5309
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Sep 2019 11:41:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C26EC35E01;
	Mon,  2 Sep 2019 09:41:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 756B6C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Sep 2019 09:41:29 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x829aShX002477; Mon, 2 Sep 2019 11:41:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=k4XLct6ml4ZJyCzK/W4Oqc4vom88qBwlUIHqJmE7NVU=;
 b=WExV3yo0UPyis40W1IocHx2q9xWZZSLIfCVI7UUkJwCObFD46QEF9IUtRIJuOBrfYnxq
 6czmU8hNIPLA7XGX1KQrvp7cX7iVKSt52MN51pq4wKmaC5oTGAth/pHgHokuv4sXoyel
 IXZ/Un1qARFnrDe9lVVpwZUL1ua43s7NrMoWgTmHGrhxnZ7W8BO+zdG35NOyhq638FTC
 iKLEGDkFQqo76Bldg1xhNjlF4LUTq5m4ilYBT9wF2qCyd3mbVk1FTAhOtp0HMJSRAFRs
 f3Jgeyx8HkSxwBxk0eu8fYwOXfKCm4omgG79+HklgbA5up1cHxqf2IZlPsmncu9YQPQg gw== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com with ESMTP id 2uqec2ksbf-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 02 Sep 2019 11:41:19 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A781524;
 Mon,  2 Sep 2019 09:41:15 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 084022D43A1;
 Mon,  2 Sep 2019 11:41:15 +0200 (CEST)
Received: from SFHDAG5NODE1.st.com (10.75.127.13) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 2 Sep
 2019 11:41:14 +0200
Received: from SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6]) by
 SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6%20]) with mapi id
 15.00.1473.003; Mon, 2 Sep 2019 11:41:14 +0200
From: Hugues FRUCHET <hugues.fruchet@st.com>
To: Markus Elfring <Markus.Elfring@web.de>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Alexandre TORGUE
 <alexandre.torgue@st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>
Thread-Topic: [PATCH] media: stm32-dcmi: Delete an unnecessary of_node_put()
 call in dcmi_probe()
Thread-Index: AQHVXOEYzuD2okWKlEeO39Kr8stWpKcYCdSA
Date: Mon, 2 Sep 2019 09:41:14 +0000
Message-ID: <58d7d520-ba18-a822-4920-2bedb0d01203@st.com>
References: <129a4933-2171-7ed9-c84c-8e56b6d05270@web.de>
In-Reply-To: <129a4933-2171-7ed9-c84c-8e56b6d05270@web.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <4915444CEE91B947B1778506854F085B@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-02_03:2019-08-29,2019-09-02 signatures=0
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH] media: stm32-dcmi: Delete an unnecessary
 of_node_put() call in dcmi_probe()
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

QWNrZWQtYnk6IEh1Z3VlcyBGcnVjaGV0IDxodWd1ZXMuZnJ1Y2hldEBzdC5jb20+DQoNCk9uIDgv
MjcvMTkgNDowOSBQTSwgTWFya3VzIEVsZnJpbmcgd3JvdGU6DQo+IEZyb206IE1hcmt1cyBFbGZy
aW5nIDxlbGZyaW5nQHVzZXJzLnNvdXJjZWZvcmdlLm5ldD4NCj4gRGF0ZTogVHVlLCAyNyBBdWcg
MjAxOSAxNjowMDoxMyArMDIwMA0KPiANCj4gQSBudWxsIHBvaW50ZXIgd291bGQgYmUgcGFzc2Vk
IHRvIGEgY2FsbCBvZiB0aGUgZnVuY3Rpb24g4oCcb2Zfbm9kZV9wdXTigJ0NCj4gaW1tZWRpYXRl
bHkgYWZ0ZXIgYSBjYWxsIG9mIHRoZSBmdW5jdGlvbiDigJxvZl9ncmFwaF9nZXRfbmV4dF9lbmRw
b2ludOKAnQ0KPiBmYWlsZWQgYXQgb25lIHBsYWNlLg0KPiBSZW1vdmUgdGhpcyBzdXBlcmZsdW91
cyBmdW5jdGlvbiBjYWxsLg0KPiANCj4gVGhpcyBpc3N1ZSB3YXMgZGV0ZWN0ZWQgYnkgdXNpbmcg
dGhlIENvY2NpbmVsbGUgc29mdHdhcmUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNYXJrdXMgRWxm
cmluZyA8ZWxmcmluZ0B1c2Vycy5zb3VyY2Vmb3JnZS5uZXQ+DQo+IC0tLQ0KPiAgIGRyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vc3RtMzIvc3RtMzItZGNtaS5jIHwgMSAtDQo+ICAgMSBmaWxlIGNoYW5n
ZWQsIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRm
b3JtL3N0bTMyL3N0bTMyLWRjbWkuYyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vc3RtMzIvc3Rt
MzItZGNtaS5jDQo+IGluZGV4IGNiMWRhZjgyMTdmZi4uOTM5MmUzNDA5ZmJhIDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3N0bTMyL3N0bTMyLWRjbWkuYw0KPiArKysgYi9k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL3N0bTMyL3N0bTMyLWRjbWkuYw0KPiBAQCAtMTg2MSw3ICsx
ODYxLDYgQEAgc3RhdGljIGludCBkY21pX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpDQo+ICAgCW5wID0gb2ZfZ3JhcGhfZ2V0X25leHRfZW5kcG9pbnQobnAsIE5VTEwpOw0KPiAg
IAlpZiAoIW5wKSB7DQo+ICAgCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJDb3VsZCBub3QgZmluZCB0
aGUgZW5kcG9pbnRcbiIpOw0KPiAtCQlvZl9ub2RlX3B1dChucCk7DQo+ICAgCQlyZXR1cm4gLUVO
T0RFVjsNCj4gICAJfQ0KPiANCj4gLS0NCj4gMi4yMy4wDQo+IApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
