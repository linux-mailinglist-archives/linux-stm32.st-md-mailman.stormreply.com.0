Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCA144DFAE
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Nov 2021 02:22:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10ABBC5EC72;
	Fri, 12 Nov 2021 01:22:57 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7E9BC5660B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Nov 2021 01:22:55 +0000 (UTC)
X-UUID: 8d362d5021e548f182ca0bafda93cf03-20211112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=TtsxtXZ5jRLUQ4PRm4V/CvWh/SoHbjgXn3ntlYhdugA=; 
 b=QZUULZPMPnjJkhdhSfGfPNNnGzIFxsVOpmfm75ZzlDf6w4r5upmSGRDJb+3u/+8ez+1zvTVHnvUkxLocUZbK3UVlidN7BX7fcR8al9WjXk1dbB23EIzer0rpBI4HwhS/beNF89lTmk9s8dm4SSZXsfUN56S1Yf95LohSs4ukYh0=;
X-UUID: 8d362d5021e548f182ca0bafda93cf03-20211112
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1707439807; Fri, 12 Nov 2021 09:22:49 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 12 Nov 2021 09:22:48 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 12 Nov 2021 09:22:47 +0800
Message-ID: <52eeec07d0b909f652716e24ab360de353480484.camel@mediatek.com>
From: Biao Huang <biao.huang@mediatek.com>
To: Denis Kirjanov <dkirjanov@suse.de>, <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>
Date: Fri, 12 Nov 2021 09:22:47 +0800
In-Reply-To: <c2d3c746-ab32-eb99-0408-1409f43248cd@suse.de>
References: <20211111071214.21027-1-biao.huang@mediatek.com>
 <c2d3c746-ab32-eb99-0408-1409f43248cd@suse.de>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 netdev@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-kernel@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>,
 linux-mediatek@lists.infradead.org, macpaul.lin@mediatek.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 0/5] MediaTek Ethernet Patches on MT8195
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

RGVhciBEZW5pcywNCglUaGFua3MgZm9yIHlvdXIgY29tbWVudHN+DQoNCk9uIFRodSwgMjAyMS0x
MS0xMSBhdCAxNDozNSArMDMwMCwgRGVuaXMgS2lyamFub3Ygd3JvdGU6DQo+IA0KPiAxMS8xMS8y
MSAxMDoxMiBBTSwgQmlhbyBIdWFuZyDQv9C40YjQtdGCOg0KPiA+IENoYW5nZXMgaW4gdjI6DQo+
ID4gMS4gZml4IGVycm9ycy93YXJuaW5ncyBpbiBtZWRpYXRlay1kd21hYy55YW1sIHdpdGggdXBn
cmFkZWQNCj4gPiBkdHNjaGVtYSB0b29scw0KPiA+IA0KPiA+IFRoaXMgc2VyaWVzIGluY2x1ZGUg
NSBwYXRjaGVzOg0KPiA+IDEuIGFkZCBwbGF0Zm9ybSBsZXZlbCBjbG9ja3MgbWFuYWdlbWVudCBm
b3IgZHdtYWMtbWVkaWF0ZWsNCj4gPiAyLiByZXN1ZSBtb3JlIGNvbW1vbiBmZWF0dXJlcyBkZWZp
bmVkIGluIHN0bW1hY19wbGF0Zm9ybS5jDQo+ID4gMy4gYWRkIGV0aGVybmV0IGVudHJ5IGZvciBt
dDgxOTUNCj4gPiA0LiBjb252ZXJ0IG1lZGlhdGVrLWR3bWFjLnR4dCB0byBtZWRpYXRlay1kd21h
Yy55YW1sDQo+ID4gNS4gYWRkIGV0aGVybmV0IGRldmljZSBub2RlIGZvciBtdDgxOTUNCj4gDQo+
IGFsbCBuZXcgZmVhdHVyZSBzaG91bGQgYmUgc2VudCBwcmVmaXhlZCB3aXRoIG5ldC1uZXh0DQpP
SywgSSdsbCBmaXggaXQgaW4gbmV4dCB2ZXJzaW9uLg0KPiA+IA0KPiA+IEJpYW8gSHVhbmcgKDUp
Og0KPiA+ICAgIG5ldDogc3RtbWFjOiBkd21hYy1tZWRpYXRlazogYWRkIHBsYXRmb3JtIGxldmVs
IGNsb2Nrcw0KPiA+IG1hbmFnZW1lbnQNCj4gPiAgICBuZXQ6IHN0bW1hYzogZHdtYWMtbWVkaWF0
ZWs6IFJldXNlIG1vcmUgY29tbW9uIGZlYXR1cmVzDQo+ID4gICAgbmV0OiBzdG1tYWM6IGR3bWFj
LW1lZGlhdGVrOiBhZGQgc3VwcG9ydCBmb3IgbXQ4MTk1DQo+ID4gICAgZHQtYmluZGluZ3M6IG5l
dDogZHdtYWM6IENvbnZlcnQgbWVkaWF0ZWstZHdtYWMgdG8gRFQgc2NoZW1hDQo+ID4gICAgYXJt
NjQ6IGR0czogbXQ4MTk1OiBhZGQgZXRoZXJuZXQgZGV2aWNlIG5vZGUNCj4gPiANCj4gPiAgIC4u
Li9iaW5kaW5ncy9uZXQvbWVkaWF0ZWstZHdtYWMudHh0ICAgICAgICAgICB8ICA5MSAtLS0tLQ0K
PiA+ICAgLi4uL2JpbmRpbmdzL25ldC9tZWRpYXRlay1kd21hYy55YW1sICAgICAgICAgIHwgMjEx
ICsrKysrKysrKysrKw0KPiA+ICAgYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTUt
ZXZiLmR0cyAgIHwgIDkyICsrKysrDQo+ID4gICBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVr
L210ODE5NS5kdHNpICAgICAgfCAgNzAgKysrKw0KPiA+ICAgLi4uL2V0aGVybmV0L3N0bWljcm8v
c3RtbWFjL2R3bWFjLW1lZGlhdGVrLmMgIHwgMzEzDQo+ID4gKysrKysrKysrKysrKysrKy0tDQo+
ID4gICA1IGZpbGVzIGNoYW5nZWQsIDY2NCBpbnNlcnRpb25zKCspLCAxMTMgZGVsZXRpb25zKC0p
DQo+ID4gICBkZWxldGUgbW9kZSAxMDA2NDQNCj4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbmV0L21lZGlhdGVrLWR3bWFjLnR4dA0KPiA+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0
DQo+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9tZWRpYXRlay1kd21h
Yy55YW1sDQo+ID4gDQo+ID4gLS0NCj4gPiAyLjE4LjANCj4gPiANCj4gPiANCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
