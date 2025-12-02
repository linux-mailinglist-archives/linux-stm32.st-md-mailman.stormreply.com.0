Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90255C99BC4
	for <lists+linux-stm32@lfdr.de>; Tue, 02 Dec 2025 02:25:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 421BDC628D0;
	Tue,  2 Dec 2025 01:25:55 +0000 (UTC)
Received: from mail03.siengine.com (mail03.siengine.com [43.240.192.165])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 047E8C1A977
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Dec 2025 01:25:52 +0000 (UTC)
Received: from dsgsiengine01.siengine.com ([10.8.1.61])
 by mail03.siengine.com with ESMTPS id 5B21OaiF029191
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 2 Dec 2025 09:24:36 +0800 (+08)
 (envelope-from hailong.fan@siengine.com)
Received: from SEEXMB03-2019.siengine.com (SEEXMB03-2019.siengine.com
 [10.8.1.33])
 by dsgsiengine01.siengine.com (SkyGuard) with ESMTPS id 4dL31G0TrJz5pX1;
 Tue,  2 Dec 2025 09:22:58 +0800 (CST)
Received: from SEEXMB03-2019.siengine.com (10.8.1.33) by
 SEEXMB03-2019.siengine.com (10.8.1.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1748.39; Tue, 2 Dec 2025 09:24:35 +0800
Received: from SEEXMB03-2019.siengine.com ([fe80::23e0:1bbb:3ec9:73fe]) by
 SEEXMB03-2019.siengine.com ([fe80::23e0:1bbb:3ec9:73fe%16]) with mapi id
 15.02.1748.039; Tue, 2 Dec 2025 09:24:35 +0800
From: =?utf-8?B?RmFuIEhhaWxvbmcv6IyD5rW36b6Z?= <hailong.fan@siengine.com>
To: Eric Dumazet <edumazet@google.com>, "2694439648@qq.com" <2694439648@qq.com>
Thread-Topic: [PATCH] net: stmmac: Modify the judgment condition of "tx_avail"
 from 1 to 2
Thread-Index: AQHcYm4w5U5uVlzf+UqD24zBtjcj6LUMLvyAgAFf1+A=
Date: Tue, 2 Dec 2025 01:24:35 +0000
Message-ID: <addd14c84f164e4e90e35e8dc4121dd4@siengine.com>
References: <tencent_22959DC8315158E23D77C14B9B33C97EA60A@qq.com>
 <CANn89iLW+68YE9s9dChEcQYbmwXSBzWRPzFH50+--Kw3XNZXEQ@mail.gmail.com>
In-Reply-To: <CANn89iLW+68YE9s9dChEcQYbmwXSBzWRPzFH50+--Kw3XNZXEQ@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.10.20.38]
MIME-Version: 1.0
X-DKIM-Results: [10.8.1.61]; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL: mail03.siengine.com 5B21OaiF029191
Cc: "inux-kernel@vger.kernel.org" <inux-kernel@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: [Linux-stm32] =?utf-8?b?5Zue5aSNOiBbUEFUQ0hdIG5ldDogc3RtbWFjOiBN?=
 =?utf-8?q?odify_the_judgment_condition_of_=22tx=5Favail=22_from_1_to_2?=
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

SGkgRXJpYw0KDQpZb3UgYXJlIHJpZ2h0LCBJIHdpbGwgZm9sbG93IHlvdXIgYWR2aWNlIHRvIG1v
ZGlmeSB0aGUgcmVsZXZhbnQgY29kZS4NCg0KUmVnYXJkcw0KSGFpbG9uZw0KDQoNCi0tLS0t6YKu
5Lu25Y6f5Lu2LS0tLS0NCuWPkeS7tuS6ujogRXJpYyBEdW1hemV0IDxlZHVtYXpldEBnb29nbGUu
Y29tPiANCuWPkemAgeaXtumXtDogMjAyNeW5tDEy5pyIMeaXpSAyMDoyMQ0K5pS25Lu25Lq6OiAy
Njk0NDM5NjQ4QHFxLmNvbQ0K5oqE6YCBOiBhbmRyZXcrbmV0ZGV2QGx1bm4uY2g7IGRhdmVtQGRh
dmVtbG9mdC5uZXQ7IGt1YmFAa2VybmVsLm9yZzsgcGFiZW5pQHJlZGhhdC5jb207IG1jb3F1ZWxp
bi5zdG0zMkBnbWFpbC5jb207IGFsZXhhbmRyZS50b3JndWVAZm9zcy5zdC5jb207IEZhbiBIYWls
b25nL+iMg+a1t+m+mSA8aGFpbG9uZy5mYW5Ac2llbmdpbmUuY29tPjsgbmV0ZGV2QHZnZXIua2Vy
bmVsLm9yZzsgbGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbTsgbGludXgt
YXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmcNCuS4u+mimDogUmU6IFtQQVRDSF0gbmV0OiBzdG1tYWM6IE1vZGlmeSB0aGUganVkZ21lbnQg
Y29uZGl0aW9uIG9mICJ0eF9hdmFpbCIgZnJvbSAxIHRvIDINCg0KT24gU3VuLCBOb3YgMzAsIDIw
MjUgYXQgNjo1N+KAr1BNIDwyNjk0NDM5NjQ4QHFxLmNvbT4gd3JvdGU6DQo+DQo+IEZyb206ICJo
YWlsb25nLmZhbiIgPGhhaWxvbmcuZmFuQHNpZW5naW5lLmNvbT4NCj4NCj4gICAgIFVuZGVyIGNl
cnRhaW4gY29uZGl0aW9ucywgYSBXQVJOX09OIHdpbGwgYmUgdHJpZ2dlcmVkDQo+ICAgICBpZiBh
dmFpbCBlcXVhbHMgMS4NCj4NCj4gICAgIEZvciBleGFtcGxlLCB3aGVuIGEgVkxBTiBwYWNrZXQg
aXMgdG8gc2VuZCwNCj4gICAgIHN0bW1hY192bGFuX2luc2VydCBjb25zdW1lcyBvbmUgdW5pdCBv
ZiBzcGFjZSwNCj4gICAgIGFuZCB0aGUgZGF0YSBpdHNlbGYgY29uc3VtZXMgYW5vdGhlci4NCj4g
ICAgIGFjdHVhbGx5IHJlcXVpcmluZyAyIHVuaXRzIG9mIHNwYWNlIGluIHRvdGFsLg0KPg0KPiBT
aWduZWQtb2ZmLWJ5OiBoYWlsb25nLmZhbiA8aGFpbG9uZy5mYW5Ac2llbmdpbmUuY29tPg0KPiAt
LS0NCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMg
fCAyICstDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkN
Cj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0
bW1hY19tYWluLmMgDQo+IGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3Rt
bWFjX21haW4uYw0KPiBpbmRleCA3YjkwZWNkM2EuLmI1NzUzODRjZCAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYw0KPiArKysg
Yi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5jDQo+IEBA
IC00NTI5LDcgKzQ1MjksNyBAQCBzdGF0aWMgbmV0ZGV2X3R4X3Qgc3RtbWFjX3htaXQoc3RydWN0
IHNrX2J1ZmYgKnNrYiwgc3RydWN0IG5ldF9kZXZpY2UgKmRldikNCj4gICAgICAgICAgICAgICAg
IH0NCj4gICAgICAgICB9DQo+DQo+IC0gICAgICAgaWYgKHVubGlrZWx5KHN0bW1hY190eF9hdmFp
bChwcml2LCBxdWV1ZSkgPCBuZnJhZ3MgKyAxKSkgew0KPiArICAgICAgIGlmICh1bmxpa2VseShz
dG1tYWNfdHhfYXZhaWwocHJpdiwgcXVldWUpIDwgbmZyYWdzICsgMikpIHsNCj4gICAgICAgICAg
ICAgICAgIGlmICghbmV0aWZfdHhfcXVldWVfc3RvcHBlZChuZXRkZXZfZ2V0X3R4X3F1ZXVlKGRl
diwgcXVldWUpKSkgew0KPiAgICAgICAgICAgICAgICAgICAgICAgICBuZXRpZl90eF9zdG9wX3F1
ZXVlKG5ldGRldl9nZXRfdHhfcXVldWUocHJpdi0+ZGV2LA0KPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgDQo+IHF1ZXVlKSk7
DQoNCkRyaXZlcnMgc2hvdWxkIHN0b3AgdGhlaXIgcXVldWVzIGVhcmxpZXIuDQoNCk5FVERFVl9U
WF9CVVNZIGlzIGFsbW9zdCBhbHdheXMgd3JvbmcuDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL25l
dC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5jDQpiL2RyaXZlcnMvbmV0L2V0
aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMNCmluZGV4IDdiOTBlY2QzYTU1ZTYw
MDQ1OGIwYzg3ZDYxMjU4MzE2MjZmNDY4M2QuLjZkY2M3Yjg0YTg3NTk3NjNiNjQ3MWE0OGE2Yzgw
YjFmMTdjZDkzN2MNCjEwMDY0NA0KLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9z
dG1tYWMvc3RtbWFjX21haW4uYw0KKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9z
dG1tYWMvc3RtbWFjX21haW4uYw0KQEAgLTQ2NzUsNyArNDY3NSw3IEBAIHN0YXRpYyBuZXRkZXZf
dHhfdCBzdG1tYWNfeG1pdChzdHJ1Y3Qgc2tfYnVmZiAqc2tiLCBzdHJ1Y3QgbmV0X2RldmljZSAq
ZGV2KQ0KICAgICAgICAgICAgICAgIHByaW50X3BrdChza2ItPmRhdGEsIHNrYi0+bGVuKTsNCiAg
ICAgICAgfQ0KDQotICAgICAgIGlmICh1bmxpa2VseShzdG1tYWNfdHhfYXZhaWwocHJpdiwgcXVl
dWUpIDw9IChNQVhfU0tCX0ZSQUdTICsgMSkpKSB7DQorICAgICAgIGlmICh1bmxpa2VseShzdG1t
YWNfdHhfYXZhaWwocHJpdiwgcXVldWUpIDw9IChNQVhfU0tCX0ZSQUdTICsgDQorIDIpKSkgew0K
ICAgICAgICAgICAgICAgIG5ldGlmX2RiZyhwcml2LCBodywgcHJpdi0+ZGV2LCAiJXM6IHN0b3Ag
dHJhbnNtaXR0ZWQgcGFja2V0c1xuIiwNCiAgICAgICAgICAgICAgICAgICAgICAgICAgX19mdW5j
X18pOw0KICAgICAgICAgICAgICAgIG5ldGlmX3R4X3N0b3BfcXVldWUobmV0ZGV2X2dldF90eF9x
dWV1ZShwcml2LT5kZXYsIHF1ZXVlKSk7DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
