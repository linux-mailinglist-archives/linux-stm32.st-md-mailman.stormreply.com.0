Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD3BDA829
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Oct 2019 11:20:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 514BDC36B0B;
	Thu, 17 Oct 2019 09:20:25 +0000 (UTC)
Received: from huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7037EC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2019 09:20:21 +0000 (UTC)
Received: from DGGEMM405-HUB.china.huawei.com (unknown [172.30.72.57])
 by Forcepoint Email with ESMTP id 7866E25CA36B01519D37;
 Thu, 17 Oct 2019 17:20:16 +0800 (CST)
Received: from DGGEMM423-HUB.china.huawei.com (10.1.198.40) by
 DGGEMM405-HUB.china.huawei.com (10.3.20.213) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 17 Oct 2019 17:20:16 +0800
Received: from DGGEMM527-MBX.china.huawei.com ([169.254.6.34]) by
 dggemm423-hub.china.huawei.com ([10.1.198.40]) with mapi id 14.03.0439.000;
 Thu, 17 Oct 2019 17:20:10 +0800
From: huangdaode <huangdaode@hisilicon.com>
To: Marc Zyngier <maz@kernel.org>
Thread-Topic: [PATCH] use devm_platform_ioremap_resource() for irqchip drivers
Thread-Index: AQHVhLrhTEOo/fABek625E0pBMISbadd+MMAgACSrxA=
Date: Thu, 17 Oct 2019 09:20:10 +0000
Message-ID: <E20AE017F0DBA04DA661272787510F9813D297B0@DGGEMM527-MBX.china.huawei.com>
References: <1571296423-208359-1-git-send-email-huangdaode@hisilicon.com>
 <9bbcce19c777583815c92ce3c2ff2586@www.loen.fr>
In-Reply-To: <9bbcce19c777583815c92ce3c2ff2586@www.loen.fr>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.61.13.197]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Cc: "nm@ti.com" <nm@ti.com>, "andrew@lunn.ch" <andrew@lunn.ch>,
 "jason@lakedaemon.net" <jason@lakedaemon.net>,
 "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "t-kristo@ti.com" <t-kristo@ti.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "ssantosh@kernel.org" <ssantosh@kernel.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>
Subject: [Linux-stm32] =?utf-8?b?562U5aSNOiBbUEFUQ0hdIHVzZSBkZXZtX3BsYXRm?=
 =?utf-8?q?orm=5Fioremap=5Fresource=28=29_for_irqchip_drivers?=
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

SGkgTWFyYw0KSSBhbSBqdXN0IGRvaW5nIHRoZSBjb2NjaWNoZWNrIHVzaW5nIHRoZSBjb21tYW5k
ICJtYWtlIGNvY2NpY2hlY2sgTT1kcml2ZXJzL2lycWNoaXAvIiwgYW5kIGl0IHJlcG9ydCANCiQg
bWFrZSBjb2NjaWNoZWNrIE09ZHJpdmVycy9pcnFjaGlwLw0KLi4uLi4uLg0KZHJpdmVycy9pcnFj
aGlwLy9pcnEtbXZlYnUtaWN1LmM6MzYxOjEtMTA6IFdBUk5JTkc6IFVzZSBkZXZtX3BsYXRmb3Jt
X2lvcmVtYXBfcmVzb3VyY2UgZm9yIGljdSAtPiBiYXNlDQpkcml2ZXJzL2lycWNoaXAvL2lycS10
czQ4MDAuYzoxMDU6MS0xMTogV0FSTklORzogVXNlIGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNv
dXJjZSBmb3IgZGF0YSAtPiBiYXNlDQpkcml2ZXJzL2lycWNoaXAvL2lycS1tdmVidS1waWMuYzox
MzQ6MS0xMDogV0FSTklORzogVXNlIGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZSBmb3Ig
cGljIC0+IGJhc2UNCmRyaXZlcnMvaXJxY2hpcC8vaXJxLXRpLXNjaS1pbnRhLmM6NTcxOjEtMTE6
IFdBUk5JTkc6IFVzZSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UgZm9yIGludGEgLT4g
YmFzZQ0KZHJpdmVycy9pcnFjaGlwLy9pcnEtc3RtMzItZXh0aS5jOjg1MzoxLTE2OiBXQVJOSU5H
OiBVc2UgZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlIGZvciBob3N0X2RhdGEgLT4gYmFz
ZQ0KDQpzbyBqdXN0IGZpeCB0aGUgV0FSTklORy4gDQoNCkFuZCBhZnRlciAgYXBwbHkgdGhlIHBh
dGNoLCBJIGRvIHRoZSBjb21waWxlLCBpdCdzIE9LLCBidXQgSSBsYWNrIG9mIGhhcmR3YXJlIHRv
IHRlc3QgaXQuIA0KVGhhdCdzIHRoZSBjYXNlLiANCg0KTUJSLg0KVGhhbmtzDQoNCi0tLS0t6YKu
5Lu25Y6f5Lu2LS0tLS0NCuWPkeS7tuS6ujogTWFyYyBaeW5naWVyIFttYWlsdG86bWF6QGtlcm5l
bC5vcmddIA0K5Y+R6YCB5pe26Ze0OiAyMDE55bm0MTDmnIgxN+aXpSAxNjoyNA0K5pS25Lu25Lq6
OiBodWFuZ2Rhb2RlIDxodWFuZ2Rhb2RlQGhpc2lsaWNvbi5jb20+DQrmioTpgIE6IGphc29uQGxh
a2VkYWVtb24ubmV0OyBhbmRyZXdAbHVubi5jaDsgZ3JlZ29yeS5jbGVtZW50QGJvb3RsaW4uY29t
OyBzZWJhc3RpYW4uaGVzc2VsYmFydGhAZ21haWwuY29tOyB0Z2x4QGxpbnV0cm9uaXguZGU7IG1j
b3F1ZWxpbi5zdG0zMkBnbWFpbC5jb207IGFsZXhhbmRyZS50b3JndWVAc3QuY29tOyBubUB0aS5j
b207IHQta3Jpc3RvQHRpLmNvbTsgc3NhbnRvc2hAa2VybmVsLm9yZzsgbGludXgtYXJtLWtlcm5l
bEBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tDQrkuLvpopg6IFJlOiBbUEFUQ0hd
IHVzZSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UoKSBmb3IgaXJxY2hpcCBkcml2ZXJz
DQoNCk9uIDIwMTktMTAtMTcgMDg6MTMsIERhb2RlIEh1YW5nIHdyb3RlOg0KPiBGcm9tOiBEYW9k
ZSBIdWFuZyA8aHVhbmdkYW9kZUBoaXNsaWNvbi5jb20+DQo+DQo+IFVzZSB0aGUgbmV3IGhlbHBl
ciB0aGF0IHdyYXBzIHRoZSBjYWxscyB0byBwbGF0Zm9ybV9nZXRfcmVzb3VyY2UoKSBhbmQgDQo+
IGRldm1faW9yZW1hcF9yZXNvdXJjZSgpIHRvZ2V0aGVyDQo+DQo+IFNpZ25lZC1vZmYtYnk6IERh
b2RlIEh1YW5nIDxodWFuZ2Rhb2RlQGhpc2xpY29uLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2ly
cWNoaXAvaXJxLW12ZWJ1LWljdS5jICAgfCAzICstLQ0KPiAgZHJpdmVycy9pcnFjaGlwL2lycS1t
dmVidS1waWMuYyAgIHwgMyArLS0NCj4gIGRyaXZlcnMvaXJxY2hpcC9pcnEtc3RtMzItZXh0aS5j
ICB8IDMgKy0tICANCj4gZHJpdmVycy9pcnFjaGlwL2lycS10aS1zY2ktaW50YS5jIHwgMyArLS0N
Cj4gIGRyaXZlcnMvaXJxY2hpcC9pcnEtdHM0ODAwLmMgICAgICB8IDMgKy0tDQo+ICA1IGZpbGVz
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2lycWNoaXAvaXJxLW12ZWJ1LWljdS5jIA0KPiBiL2RyaXZlcnMvaXJxY2hp
cC9pcnEtbXZlYnUtaWN1LmMgaW5kZXggNTQ3MDQ1ZC4uZGRmOWIwZCAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9pcnFjaGlwL2lycS1tdmVidS1pY3UuYw0KPiArKysgYi9kcml2ZXJzL2lycWNoaXAv
aXJxLW12ZWJ1LWljdS5jDQo+IEBAIC0zNTcsOCArMzU3LDcgQEAgc3RhdGljIGludCBtdmVidV9p
Y3VfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZQ0KPiAqcGRldikNCj4NCj4gIAlpY3UtPmRl
diA9ICZwZGV2LT5kZXY7DQo+DQo+IC0JcmVzID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNlKHBkZXYs
IElPUkVTT1VSQ0VfTUVNLCAwKTsNCj4gLQlpY3UtPmJhc2UgPSBkZXZtX2lvcmVtYXBfcmVzb3Vy
Y2UoJnBkZXYtPmRldiwgcmVzKTsNCj4gKwlpY3UtPmJhc2UgPSBkZXZtX3BsYXRmb3JtX2lvcmVt
YXBfcmVzb3VyY2UocGRldiwgcmVzKTsNCg0Kdm9pZCBfX2lvbWVtICpkZXZtX3BsYXRmb3JtX2lv
cmVtYXBfcmVzb3VyY2Uoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwNCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgaW5kZXgpDQoN
CldoYXQgY291bGQgcG9zc2libHkgZ28gd3Jvbmc/IEknZCBzdWdnZXN0IHlvdSBzdGFydCBjb21w
aWxpbmcgKGFuZCBwb3NzaWJseQ0KdGVzdGluZykgdGhlIGNvZGUgeW91IGNoYW5nZSBiZWZvcmUg
c2VuZGluZyBwYXRjaGVzLi4uDQoNCiAgICAgICAgIE0uDQotLQ0KSmF6eiBpcyBub3QgZGVhZC4g
SXQganVzdCBzbWVsbHMgZnVubnkuLi4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
