Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A266E9A5F84
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Oct 2024 10:55:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F962C78035;
	Mon, 21 Oct 2024 08:55:03 +0000 (UTC)
Received: from mail03.siengine.com (mail03.siengine.com [43.240.192.165])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32005C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Oct 2024 01:16:52 +0000 (UTC)
Received: from dsgsiengine01.siengine.com ([10.8.1.61])
 by mail03.siengine.com with ESMTPS id 49I1FVqT006042
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 18 Oct 2024 09:15:31 +0800 (+08)
 (envelope-from hailong.fan@siengine.com)
Received: from SEEXMB03-2019.siengine.com (SEEXMB03-2019.siengine.com
 [10.8.1.33])
 by dsgsiengine01.siengine.com (SkyGuard) with ESMTPS id 4XV6Ft0KLLz7ZMv9;
 Fri, 18 Oct 2024 09:15:30 +0800 (CST)
Received: from SEEXMB03-2019.siengine.com (10.8.1.33) by
 SEEXMB03-2019.siengine.com (10.8.1.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.11; Fri, 18 Oct 2024 09:15:30 +0800
Received: from SEEXMB03-2019.siengine.com ([fe80::23e0:1bbb:3ec9:73fe]) by
 SEEXMB03-2019.siengine.com ([fe80::23e0:1bbb:3ec9:73fe%16]) with mapi id
 15.02.1544.011; Fri, 18 Oct 2024 09:15:30 +0800
From: =?gb2312?B?RmFuIEhhaWxvbmcvt7a6o8H6?= <hailong.fan@siengine.com>
To: Simon Horman <horms@kernel.org>, "2694439648@qq.com" <2694439648@qq.com>
Thread-Topic: [PATCH] net: stmmac: enable MAC after MTL configuring
Thread-Index: AQHbHfwmUFDRUPAmP0Op3UD8MH3slLKKOd6AgAF8NlA=
Date: Fri, 18 Oct 2024 01:15:30 +0000
Message-ID: <bd7a1be5cec348dab22f7d0c2552967d@siengine.com>
References: <tencent_6BF819F333D995B4D3932826194B9B671207@qq.com>
 <20241017101857.GE1697@kernel.org>
In-Reply-To: <20241017101857.GE1697@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.10.20.38]
MIME-Version: 1.0
X-DKIM-Results: [10.8.1.61]; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL: mail03.siengine.com 49I1FVqT006042
X-Mailman-Approved-At: Mon, 21 Oct 2024 08:55:02 +0000
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "edumazet@google.com" <edumazet@google.com>,
 "joabreu@synopsys.com" <joabreu@synopsys.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: [Linux-stm32] =?gb2312?b?u9i4tDogW1BBVENIXSBuZXQ6IHN0bW1hYzogZW5h?=
 =?gb2312?b?YmxlIE1BQyBhZnRlciBNVEwgY29uZmlndXJpbmc=?=
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
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

SGkNCg0KRm9yIGV4YW1wbGUsIEVUSCBpcyBkaXJlY3RseSBjb25uZWN0ZWQgdG8gdGhlIHN3aXRj
aCwgd2hpY2ggbmV2ZXIgcG93ZXIgZG93biBhbmQgc2VuZHMgYnJvYWRjYXN0IHBhY2tldHMgYXQg
cmVndWxhciBpbnRlcnZhbHMuIA0KRHVyaW5nIHRoZSBwcm9jZXNzIG9mIG9wZW5pbmcgRVRILCBk
YXRhIG1heSBmbG93IGludG8gdGhlIE1UTCBGSUZPLCBvbmNlIE1BQyBSWCBpcyBlbmFibGVkLg0K
YW5kIHRoZW4sIE1UTCB3aWxsIGJlIHNldCwgc3VjaCBhcyBGSUZPIHNpemUuIA0KT25jZSBlbmFi
bGUgRE1BLCBUaGVyZSBpcyBhIGNlcnRhaW4gcHJvYmFiaWxpdHkgdGhhdCBETUEgd2lsbCByZWFk
IGluY29ycmVjdCBkYXRhIGZyb20gTVRMIEZJRk8sIGNhdXNpbmcgRE1BIHRvIGhhbmcgdXAuIA0K
QnkgcmVhZCBETUFfRGVidWdfU3RhdHVzLCB5b3UgY2FuIGJlIG9ic2VydmVkIHRoYXQgdGhlIFJQ
UyByZW1haW5zIGF0IGEgY2VydGFpbiB2YWx1ZSBmb3JldmVyLiANClRoZSBjb3JyZWN0IHByb2Nl
c3Mgc2hvdWxkIGJlIHRvIGNvbmZpZ3VyZSBNQUMvTVRML0RNQSBiZWZvcmUgZW5hYmxpbmcgRE1B
L01BQw0KDQpzdG1tYWNfc3RhcnRfcngvdHggYW5kIHN0bW1hY19zdG9wX3J4L3R4IHNob3VsZCBv
bmx5IGhhbmRsZSB0aGUgRE1BIG1vZHVsZSB0byBhdm9pZCBjb25mdXNpb24NCg0KDQoNCi0tLS0t
08q8/tStvP4tLS0tLQ0Kt6K8/sjLOiBTaW1vbiBIb3JtYW4gPGhvcm1zQGtlcm5lbC5vcmc+IA0K
t6LLzcqxvOQ6IDIwMjTE6jEw1MIxN8jVIDE4OjE5DQrK1bz+yMs6IDI2OTQ0Mzk2NDhAcXEuY29t
DQqzrcvNOiBhbGV4YW5kcmUudG9yZ3VlQGZvc3Muc3QuY29tOyBqb2FicmV1QHN5bm9wc3lzLmNv
bTsgZGF2ZW1AZGF2ZW1sb2Z0Lm5ldDsgZWR1bWF6ZXRAZ29vZ2xlLmNvbTsga3ViYUBrZXJuZWwu
b3JnOyBwYWJlbmlAcmVkaGF0LmNvbTsgbWNvcXVlbGluLnN0bTMyQGdtYWlsLmNvbTsgbmV0ZGV2
QHZnZXIua2VybmVsLm9yZzsgbGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bTsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC1rZXJuZWxAdmdl
ci5rZXJuZWwub3JnOyBGYW4gSGFpbG9uZy+3trqjwfogPGhhaWxvbmcuZmFuQHNpZW5naW5lLmNv
bT4NCtb3zOI6IFJlOiBbUEFUQ0hdIG5ldDogc3RtbWFjOiBlbmFibGUgTUFDIGFmdGVyIE1UTCBj
b25maWd1cmluZw0KDQpPbiBNb24sIE9jdCAxNCwgMjAyNCBhdCAwMTo0NDowM1BNICswODAwLCAy
Njk0NDM5NjQ4QHFxLmNvbSB3cm90ZToNCj4gRnJvbTogImhhaWxvbmcuZmFuIiA8aGFpbG9uZy5m
YW5Ac2llbmdpbmUuY29tPg0KPiANCj4gRE1BIG1heWJlIGJsb2NrIHdoaWxlIEVUSCBpcyBvcGVu
aW5nLA0KPiBBZGp1c3QgdGhlIGVuYWJsZSBzZXF1ZW5jZSwgcHV0IHRoZSBNQUMgZW5hYmxlIGxh
c3QNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IGhhaWxvbmcuZmFuIDxoYWlsb25nLmZhbkBzaWVuZ2lu
ZS5jb20+DQoNCkhpLA0KDQpJIHRoaW5rIHRoYXQgc29tZSBtb3JlIGV4cGxhbmF0aW9uIG9mIHRo
aXMgaXMgcmVxdWlyZWQuDQpJbmNsdWRpbmcgaWYgYSBwcm9ibGVtIGhhcyBiZWVuIG9ic2VydmVk
LCBhbmQgaWYgc28gdW5kZXIgd2hhdCBjb25kaXRpb25zLiBPciwgaWYgbm90LCBzb21lIGJhY2tn
cm91bmQgaW5mb3JtYXRpb24gb24gd2h5IHRoaXMgYWRqdXN0bWVudCBpcyBjb3JyZWN0Lg0KDQpJ
IGFsc28gdGhpbmsgc29tZSBleHBsYW5hdGlvbiBpcyByZXF1aXJlZCBvZiB0aGUgcmVsYXRpb25z
aGlwIGJldHdlZW4gdGhlIGNoYW5nZXMgdGhpcyBwYXRjaCBtYWtlcyB0byBzZXR1cCwgYW5kIHRo
ZSBjaGFuZ2VzIGl0IG1ha2VzIHRvIHN0YXJ0IGFuZCBzdG9wLg0KDQouLi4NCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
