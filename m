Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9D9CBB86
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Oct 2019 15:21:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28708C36B0B;
	Fri,  4 Oct 2019 13:21:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5B291C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Oct 2019 13:21:19 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x94DBlJE007922; Fri, 4 Oct 2019 15:21:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=zPT5XSsvq3IZ+80vg/tNiZbBVy6TRNZhxTZhUzlTBYQ=;
 b=PlvxkLcVKtYfOaYygeygBhn+dt/bRebUse7Kccj58eYXut5B6PkpBJyvgoLCJ6BaKc0f
 Ug4UtR1GLv7Z0RzVxgh+w64a8Qe7rVV1Jnsq4BewhzfaigMSn+L/bd13YlYg18dfPFFy
 btsLqIm6+U82GR2uLVuRSxChIjrebxADN2NY0oetXavrAK+FWuzer72W5HlbIUeCYLHr
 zsBXg88hBIpiWCzckNZb8i710kH6u25F1UxvEhjPadcKwyTMT7mx7K0OeAtEquzHKLET
 NYmVGnZr2BR2Okj9NRhlEip/W6pU6YCO32DI6/kNdiMfSBxnUYeUvDD/cnHTP5Py5UdM ZA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2v9xdhau3u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Oct 2019 15:21:06 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6FDC810002A;
 Fri,  4 Oct 2019 15:21:05 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 582952C434C;
 Fri,  4 Oct 2019 15:21:05 +0200 (CEST)
Received: from SFHDAG6NODE1.st.com (10.75.127.16) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 4 Oct
 2019 15:21:05 +0200
Received: from SFHDAG6NODE1.st.com ([fe80::8d96:4406:44e3:eb27]) by
 SFHDAG6NODE1.st.com ([fe80::8d96:4406:44e3:eb27%20]) with mapi id
 15.00.1473.003; Fri, 4 Oct 2019 15:21:04 +0200
From: Yannick FERTRE <yannick.fertre@st.com>
To: Alexandre TORGUE <alexandre.torgue@st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>,
 Benjamin GAIGNARD <benjamin.gaignard@st.com>,
 Philippe CORNU <philippe.cornu@st.com>, Fabrice GASNIER
 <fabrice.gasnier@st.com>
Thread-Topic: [PATCH] ARM: dts: stm32: add focaltech touchscreen on
 stm32mp157c-dk2 board
Thread-Index: AQHVd53CIB3DqxmynEav+OSBcf3IRqdIm3SAgAHA7gA=
Date: Fri, 4 Oct 2019 13:21:04 +0000
Message-ID: <c0d6de33-38fa-b55e-20cb-e5b680a35dfb@st.com>
References: <1569854751-22337-1-git-send-email-yannick.fertre@st.com>
 <09ad1310-ebc5-7a41-7af6-cdef79f20802@st.com>
In-Reply-To: <09ad1310-ebc5-7a41-7af6-cdef79f20802@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-ID: <E1C14224D31F7F4CB405055AA2070060@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-04_06:2019-10-03,2019-10-04 signatures=0
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: add focaltech
 touchscreen on stm32mp157c-dk2 board
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

SGkgQWxleCwNCg0Kb2ssIGknbGwgcHVzaCBvbmx5IHRoZSBkdCBwYXRjaCBsaW5rIHRvIHRoZSBs
YXN0IHZlcnNpb24gb2YgZHJpdmVyIA0KdG91Y2hzY3JlZW4gb24gZGlzcGxheSBib2FyZCBNQjE0
MDcuDQoNCkJSDQoNCllhbm5pY2sgRmVydHLDqQ0KDQoNCk9uIDEwLzMvMTkgMTI6MzQgUE0sIEFs
ZXhhbmRyZSBUb3JndWUgd3JvdGU6DQo+IEhpIFlhbm5pY2sNCj4NCj4gT24gOS8zMC8xOSA0OjQ1
IFBNLCBZYW5uaWNrIEZlcnRyw6kgd3JvdGU6DQo+PiBFbmFibGUgZm9jYWx0ZWNoIGZ0NjIzNiB0
b3VjaHNjcmVlbiBvbiBTVE0zMk1QMTU3Qy1ESzIgYm9hcmQuDQo+PiBUaGlzIGRldmljZSBzdXBw
b3J0cyAyIGRpZmZlcmVudCBhZGRyZXNzZXMgKDB4MmEgYW5kIDB4MzgpDQo+PiBkZXBlbmRpbmcg
b24gdGhlIGRpc3BsYXnCoCBib2FyZCB2ZXJzaW9uIChNQjE0MDcpLg0KPj4NCj4+IFNpZ25lZC1v
ZmYtYnk6IFlhbm5pY2sgRmVydHLDqSA8eWFubmljay5mZXJ0cmVAc3QuY29tPg0KPj4gLS0tDQo+
PiDCoCBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1kazIuZHRzIHwgMjMgKysrKysrKysr
KysrKysrKysrKysrKysNCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspDQo+
Pg0KPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdjLWRrMi5kdHMg
DQo+PiBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdjLWRrMi5kdHMNCj4+IGluZGV4IDIw
ZWE2MDEuLjUyN2JiNzUgMTAwNjQ0DQo+PiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1w
MTU3Yy1kazIuZHRzDQo+PiArKysgYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1kazIu
ZHRzDQo+PiBAQCAtNjEsNiArNjEsMjkgQEANCj4+IMKgwqDCoMKgwqAgfTsNCj4+IMKgIH07DQo+
PiDCoCArJmkyYzEgew0KPj4gK8KgwqDCoCB0b3VjaHNjcmVlbkAyYSB7DQo+PiArwqDCoMKgwqDC
oMKgwqAgY29tcGF0aWJsZSA9ICJmb2NhbHRlY2gsZnQ2MjM2IjsNCj4+ICvCoMKgwqDCoMKgwqDC
oCByZWcgPSA8MHgyYT47DQo+PiArwqDCoMKgwqDCoMKgwqAgaW50ZXJydXB0cyA9IDwyIDI+Ow0K
Pj4gK8KgwqDCoMKgwqDCoMKgIGludGVycnVwdC1wYXJlbnQgPSA8JmdwaW9mPjsNCj4+ICvCoMKg
wqDCoMKgwqDCoCBpbnRlcnJ1cHQtY29udHJvbGxlcjsNCj4+ICvCoMKgwqDCoMKgwqDCoCB0b3Vj
aHNjcmVlbi1zaXplLXggPSA8NDgwPjsNCj4+ICvCoMKgwqDCoMKgwqDCoCB0b3VjaHNjcmVlbi1z
aXplLXkgPSA8ODAwPjsNCj4+ICvCoMKgwqDCoMKgwqDCoCBzdGF0dXMgPSAib2theSI7DQo+PiAr
wqDCoMKgIH07DQo+PiArwqDCoMKgIHRvdWNoc2NyZWVuQDM4IHsNCj4+ICvCoMKgwqDCoMKgwqDC
oCBjb21wYXRpYmxlID0gImZvY2FsdGVjaCxmdDYyMzYiOw0KPj4gK8KgwqDCoMKgwqDCoMKgIHJl
ZyA9IDwweDM4PjsNCj4+ICvCoMKgwqDCoMKgwqDCoCBpbnRlcnJ1cHRzID0gPDIgMj47DQo+PiAr
wqDCoMKgwqDCoMKgwqAgaW50ZXJydXB0LXBhcmVudCA9IDwmZ3Bpb2Y+Ow0KPj4gK8KgwqDCoMKg
wqDCoMKgIGludGVycnVwdC1jb250cm9sbGVyOw0KPj4gK8KgwqDCoMKgwqDCoMKgIHRvdWNoc2Ny
ZWVuLXNpemUteCA9IDw0ODA+Ow0KPj4gK8KgwqDCoMKgwqDCoMKgIHRvdWNoc2NyZWVuLXNpemUt
eSA9IDw4MDA+Ow0KPj4gK8KgwqDCoMKgwqDCoMKgIHN0YXR1cyA9ICJva2F5IjsNCj4+ICvCoMKg
wqAgfTsNCj4+ICt9Ow0KPg0KPiBJJ20gbm90IGNvbmZpZGVudCBieSB0aGlzIGR1cGxpY2F0aW9u
LiBXZSBzaG91bGQgb25seSBzdXBwb3J0IHRoZSANCj4gbGF0ZXN0IHJldmlzaW9uIG9mIHRoZSBN
QjE0MDcuIEkgdW5kZXJzdGFuZCB0aGUgbmVlZCBidXQgbXkgZmVhciBpcyB0byANCj4gZHVwbGlj
YXRlIHRoaXMgbm9kZSBlYWNoIHRpbWUgd2UgaGF2ZSBhIG5ldyByZXZpc2lvbiAoYW5kIGltYWdp
bmUgaWYgDQo+IHdlIGRvIHRoYXQgZm9yIGFsbCBpMmMgZGV2aWNlcykuDQo+DQo+IHJlZ2FyZHMN
Cj4gYWxleA0KPg0KPg0KPj4gwqAgJmx0ZGMgew0KPj4gwqDCoMKgwqDCoCBzdGF0dXMgPSAib2th
eSI7IA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
