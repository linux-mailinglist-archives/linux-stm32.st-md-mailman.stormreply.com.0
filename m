Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB7810EAD4
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Dec 2019 14:32:48 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5AA01C36B0B;
	Mon,  2 Dec 2019 13:32:48 +0000 (UTC)
Received: from huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6443C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Dec 2019 13:32:44 +0000 (UTC)
Received: from DGGEMM404-HUB.china.huawei.com (unknown [172.30.72.55])
 by Forcepoint Email with ESMTP id 9839ACB0AB60083E64B9;
 Mon,  2 Dec 2019 21:32:40 +0800 (CST)
Received: from DGGEMM421-HUB.china.huawei.com (10.1.198.38) by
 DGGEMM404-HUB.china.huawei.com (10.3.20.212) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 2 Dec 2019 21:32:40 +0800
Received: from DGGEMM527-MBX.china.huawei.com ([169.254.6.63]) by
 dggemm421-hub.china.huawei.com ([10.1.198.38]) with mapi id 14.03.0439.000;
 Mon, 2 Dec 2019 21:32:37 +0800
From: huangdaode <huangdaode@hisilicon.com>
To: Fabien DESSENNE <fabien.dessenne@st.com>, Marc Zyngier <maz@kernel.org>
Thread-Topic: [PATCH] irqchip/stm32: Fix "WARNING: invalid free of devm_
 allocated
Thread-Index: AQHVqRONo4g3fXJ0f0u7bwgldAUS36em11xw
Date: Mon, 2 Dec 2019 13:32:36 +0000
Message-ID: <E20AE017F0DBA04DA661272787510F9813DF2864@DGGEMM527-MBX.china.huawei.com>
References: <1574931880-168682-1-git-send-email-huangdaode@hisilicon.com>
 <8acaa494701c91b8a8acd60a2390d810@www.loen.fr>
 <028744c349410eb1f74b7e2b18590c75@www.loen.fr>
 <d7a90e49-b847-7fad-d11c-5969050e8d12@st.com>
In-Reply-To: <d7a90e49-b847-7fad-d11c-5969050e8d12@st.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.61.13.197]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Cc: "jason@lakedaemon.net" <jason@lakedaemon.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: [Linux-stm32] =?utf-8?b?562U5aSNOiBbUEFUQ0hdIGlycWNoaXAvc3RtMzI6?=
 =?utf-8?q?_Fix_=22WARNING=3A_invalid_free_of_devm=5F_allocated?=
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

WWVzLCBJIHdlbnQgdGhyb3VnaCB0aGUgY29kZSwgZm91bmQgaXQncyBhIHdyb25nIHBhdGNoLCBz
b3JyeSBmb3IgbWFraW5nIHRoZSBjb25mdXNpb24uIA0KDQpUaGFua3MuDQoNCi0tLS0t6YKu5Lu2
5Y6f5Lu2LS0tLS0NCuWPkeS7tuS6ujogRmFiaWVuIERFU1NFTk5FIFttYWlsdG86ZmFiaWVuLmRl
c3Nlbm5lQHN0LmNvbV0gDQrlj5HpgIHml7bpl7Q6IDIwMTnlubQxMuaciDLml6UgMjE6MjINCuaU
tuS7tuS6ujogTWFyYyBaeW5naWVyIDxtYXpAa2VybmVsLm9yZz47IGh1YW5nZGFvZGUgPGh1YW5n
ZGFvZGVAaGlzaWxpY29uLmNvbT4NCuaKhOmAgTogamFzb25AbGFrZWRhZW1vbi5uZXQ7IGxpbnV4
LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IG1jb3F1ZWxpbi5zdG0zMkBnbWFpbC5jb207IHRnbHhA
bGludXRyb25peC5kZTsgbGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbTsg
bGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBBbGV4YW5kcmUgVE9SR1VFIDxh
bGV4YW5kcmUudG9yZ3VlQHN0LmNvbT4NCuS4u+mimDogUmU6IFtQQVRDSF0gaXJxY2hpcC9zdG0z
MjogRml4ICJXQVJOSU5HOiBpbnZhbGlkIGZyZWUgb2YgZGV2bV8gYWxsb2NhdGVkDQoNCkhpIERh
b2RlLA0KDQoNCkkgY29uZmlybSB0aGF0IHRoaXMgcGF0Y2ggaXMgbm90IGEgZ29vZCBpZGVhLCBo
ZXJlIGFyZSBzb21lIGV4cGxhbmF0aW9ucy4NCg0KaXJxLXN0bTMyLWV4dGkuYyBkZWFscyB3aXRo
IHR3byBkaWZmZXJlbnQgcHVycG9zZXM6DQoNCi0gZWl0aGVyIGl0IGlzIHVzZWQgdG8gcHJvYmUg
dGhlICJzdCxzdG0zMm1wMS1leHRpIiBjb21wYXRpYmxlIGRldmljZS4gDQpJbiB0aGF0IGNhc2Ug
LnByb2JlKCkgaXMgaW52b2tlZCBhbmQgdXNlcyBkZXZtX2t6YWxsb2MoKSB0byBnZXQgbWVtb3J5
LiANCk5vIG5lZWQgdG8gZnJlZSBtZW1vcnkuDQoNCi1laXRoZXIgaXMgaXQgdXNlZCBmb3Igb3Ro
ZXIgc3RtMzIgZGV2aWNlcy4gSW4gdGhhdCBjYXNlLCB0aGVyZSBpcyBubyBwcm9iZSBmdW5jdGlv
biwgdGhlIGRyaXZlciBpcyAnanVzdCcgaW5pdCdlZC4gSW4gdGhhdCBjYXNlLA0KZGV2bV9remFs
bG9jKCkgaXMgbm90IHVzZWQgYW5kIGV4cGxpY2l0IGZyZWUgbWVtb3J5IGlzIHJlcXVpcmVkLg0K
DQpBcyBzYWlkIGJ5IE1hcmssIHlvdSBoYXZlIGp1c3QgbWl4ZWQgdGhlIHR3byBwYXRocy4NCg0K
RmFiaWVuDQoNCg0KDQpPbiAwMi8xMi8yMDE5IDE6NDAgUE0sIE1hcmMgWnluZ2llciB3cm90ZToN
Cj4gT24gMjAxOS0xMi0wMiAxMjoyOSwgTWFyYyBaeW5naWVyIHdyb3RlOg0KPj4gT24gMjAxOS0x
MS0yOCAwOTowNCwgRGFvZGUgSHVhbmcgd3JvdGU6DQo+Pj4gU2luY2UgZGV2bV8gYWxsb2NhdGVk
IGRhdGEgY2FuIGJlIGF1dG9tYWl0Y2FsbHkgcmVsZWFzZWQsIGl0J3Mgbm8gDQo+Pj4gbmVlZCB0
byBmcmVlIGl0IGFwcGFyZW50bHksIGp1c3QgcmVtb3ZlIGl0Lg0KPj4+DQo+Pj4gRml4ZXM6IGNm
YmY5ZTQ5NzA5NCAoImlycWNoaXAvc3RtMzI6IFVzZSBhIHBsYXRmb3JtIGRyaXZlciBmb3IgDQo+
Pj4gc3RtMzJtcDEtZXh0aSBkZXZpY2UiKQ0KPj4+IFNpZ25lZC1vZmYtYnk6IERhb2RlIEh1YW5n
IDxodWFuZ2Rhb2RlQGhpc2lsaWNvbi5jb20+DQo+Pj4gLS0tDQo+Pj4gwqBkcml2ZXJzL2lycWNo
aXAvaXJxLXN0bTMyLWV4dGkuYyB8IDIgLS0NCj4+PiDCoDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0
aW9ucygtKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtc3RtMzIt
ZXh0aS5jDQo+Pj4gYi9kcml2ZXJzL2lycWNoaXAvaXJxLXN0bTMyLWV4dGkuYw0KPj4+IGluZGV4
IGUwMGYyZmEuLjQ2ZWMwYWYgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9pcnFjaGlwL2lycS1z
dG0zMi1leHRpLmMNCj4+PiArKysgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXN0bTMyLWV4dGkuYw0K
Pj4+IEBAIC03NzksOCArNzc5LDYgQEAgc3RhdGljIGludCBfX2luaXQgc3RtMzJfZXh0aV9pbml0
KGNvbnN0IHN0cnVjdCANCj4+PiBzdG0zMl9leHRpX2Rydl9kYXRhICpkcnZfZGF0YSwNCj4+PiDC
oMKgwqDCoCBpcnFfZG9tYWluX3JlbW92ZShkb21haW4pOw0KPj4+IMKgb3V0X3VubWFwOg0KPj4+
IMKgwqDCoMKgIGlvdW5tYXAoaG9zdF9kYXRhLT5iYXNlKTsNCj4+PiAtwqDCoMKgIGtmcmVlKGhv
c3RfZGF0YS0+Y2hpcHNfZGF0YSk7DQo+Pj4gLcKgwqDCoCBrZnJlZShob3N0X2RhdGEpOw0KPj4+
IMKgwqDCoMKgIHJldHVybiByZXQ7DQo+Pj4gwqB9DQo+Pg0KPj4gQXBwbGllZCwgdGhhbmtzLg0K
Pg0KPiBTY3JhdGNoIHRoYXQuIFRoaXMgcGF0Y2ggaXMganVzdCB3cm9uZywgYW5kIGp1c3QgcmVh
ZGluZyB0aGUgY29kZSANCj4gbWFrZXMgaXQgb2J2aW91cy4gc3RtMzJfZXh0aV9pbml0KCkgaXMg
b25seSBjYWxsZWQgb24gcGF0aHMgdGhhdCANCj4gYWxsb2NhdGUgdGhlIG1lbW9yeSB3aXRoIGtt
YWxsb2MuDQo+DQo+IENsZWFybHkgeW91IGhhdmVuJ3QgdHJpZWQgdG8gdW5kZXJzdGFuZCB3aGF0
IGlzIGdvaW5nIG9uLg0KPg0KPiDCoMKgwqDCoMKgwqDCoCBNLg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
