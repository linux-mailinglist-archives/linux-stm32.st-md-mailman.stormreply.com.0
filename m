Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B054150E61B
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Apr 2022 18:45:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73AE9C62D4F;
	Mon, 25 Apr 2022 16:45:10 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77BADC5F1EB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Apr 2022 10:30:46 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <r.czerwinski@pengutronix.de>)
 id 1nivzH-0005Ci-Ci; Mon, 25 Apr 2022 12:30:35 +0200
Message-ID: <72c1f0b80e76b7f4ab1c59f09e6edeffe892fbdc.camel@pengutronix.de>
From: Rouven Czerwinski <r.czerwinski@pengutronix.de>
To: Marek Vasut <marex@denx.de>, Etienne CARRIERE <etienne.carriere@st.com>,
 Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>, "arnd@arndb.de"
 <arnd@arndb.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>,  Krzysztof
 Kozlowski <krzk+dt@kernel.org>, "soc@kernel.org" <soc@kernel.org>, Stephen
 Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Date: Mon, 25 Apr 2022 12:30:32 +0200
In-Reply-To: <71c0dd94-8cd3-9ca0-f06d-ee13ad063618@denx.de>
References: <20220422150952.20587-1-alexandre.torgue@foss.st.com>
 <20220422150952.20587-7-alexandre.torgue@foss.st.com>
 <174bea56-3e99-e01c-4133-f1350d34448d@denx.de>
 <PAXPR10MB4687B8C3DF485E814AE8158BFDF89@PAXPR10MB4687.EURPRD10.PROD.OUTLOOK.COM>
 <71c0dd94-8cd3-9ca0-f06d-ee13ad063618@denx.de>
Organization: Pengutronix e.K.
User-Agent: Evolution 3.44.0 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: r.czerwinski@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Approved-At: Mon, 25 Apr 2022 16:45:09 +0000
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH 6/8] ARM: dts: stm32: enable optee
 firmware and SCMI support on STM32MP15
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

SGksCgpPbiBNb24sIDIwMjItMDQtMjUgYXQgMTI6MjUgKzAyMDAsIE1hcmVrIFZhc3V0IHdyb3Rl
Ogo+IE9uIDQvMjUvMjIgMTI6MTksIEV0aWVubmUgQ0FSUklFUkUgd3JvdGU6Cj4gPiBIZWxsbyBN
YXJlaywKPiAKPiBIaSwKPiAKPiA+ID4gRnJvbTogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+
Cj4gPiA+IAo+ID4gPiA+IE9uIDQvMjIvMjIgMTc6MDksIEFsZXhhbmRyZSBUb3JndWUgd3JvdGU6
Cj4gPiA+ID4gRW5hYmxlIG9wdGVlIGFuZCBTQ01JIGNsb2Nrcy9yZXNldCBwcm90b2NvbHMgc3Vw
cG9ydC4KPiA+ID4gPiAKPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgVG9yZ3VlIDxh
bGV4YW5kcmUudG9yZ3VlQGZvc3Muc3QuY29tPgo+ID4gPiA+IAo+ID4gPiA+IGRpZmYgLS1naXQg
YS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTUxLmR0c2kKPiA+ID4gPiBiL2FyY2gvYXJtL2Jv
b3QvZHRzL3N0bTMybXAxNTEuZHRzaQo+ID4gPiA+IGluZGV4IDdmZGMzMjRiM2NmOS4uMWIyZmQz
NDI2YTgxIDEwMDY0NAo+ID4gPiA+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTEu
ZHRzaQo+ID4gPiA+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTEuZHRzaQo+ID4g
PiA+IEBAIC0xMTUsNiArMTE1LDMzIEBACj4gPiA+ID4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBzdGF0dXMgPSAiZGlzYWJsZWQiOwo+ID4gPiA+ICDCoMKgwqDCoMKgwqDCoCB9Owo+
ID4gPiA+ICAgICAKPiA+ID4gPiArwqDCoMKgwqAgZmlybXdhcmUgewo+ID4gPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgb3B0ZWU6IG9wdGVlIHsKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0gImxpbmFybyxvcHRlZS10eiI7
Cj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWV0aG9k
ID0gInNtYyI7Cj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgc3RhdHVzID0gImRpc2FibGVkIjsKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IH07Cj4gPiA+IAo+ID4gPiBEb2Vzbid0IHRoaXMgVEVFIG5vZGUgZ2V0IGF1dG9tYXRpY2FsbHkg
Z2VuZXJhdGVkIGFuZCBwYXRjaGVkIGludG8gRFQgYnkKPiA+ID4gdGhlIFRFRSA/IEkgdGhpbmsg
T3BUZWUtT1MgZG9lcyB0aGF0Lgo+ID4gCj4gPiBPUC1URUUgT1MgZG9lcyB0aGF0IGlmIGl0IGdl
dHMgcGFzc2VkIHRoZSBEVCBmcm9tIGVhcmx5IGJvb3Qgc3RhZ2Ugd2hpY2ggaXMgbm90IGFsd2F5
cyB0aGUgY2FzZS4KPiAKPiBTaG91bGRuJ3QgdGhhdCBiZSBzb21ldGhpbmcgdG8gZml4ID8KPiAK
PiBJIHRoaW5rIFItQ2FyMyBkb2VzIHRoYXQgYWxyZWFkeS4KCkZXSVcgaXQncyBhbHNvIHBvc3Np
YmxlIGZvciBPUC1URUUgdG8gZ2VuZXJhdGUgYSBkZXZpY2UgdHJlZSBvdmVybGF5CndoaWNoIGNh
biBiZSBhcHBsaWVkIGJ5IGxhdGVyIGJvb3Qgc3RhZ2VzLgoKRHJhd2JhY2sgaXMgdGhhdCB5b3Ug
ZWl0aGVyIG5lZWQgYW4gYWRkaXRpb25hbCBwYXJhbWV0ZXIgdG8gcGFzcwpiZXR3ZWVuIGJvb3Qg
c3RhZ2VzIChhZGRyZXNzIG9mIHRoZSBEVCBvdmVybGF5KSBvciBpdCBuZWVkcyB0byBiZQpoYXJk
Y29kZWQuIEhhcmRjb2RpbmcgaGFzIGl0J3Mgb3duIGJhZyBvZiBkcmF3YmFja3MsIGJ1dCBpdCdz
IHdoYXQgd2UKZG8gZm9yIHNvbWUgaS5NWDYgcGxhdGZvcm1zIHdpdGhpbiBiYXJlYm94LiBIb3dl
dmVyIHRoZXJlIGlzIG5vIFRGLUEKdGhlcmUsIHNvIG9ubHkgT1AtVEVFIGFuZCBCYXJlYm94IG5l
ZWQgdG8gYWdyZWUgb24gdGhlIGZpeGVkIGxvY2F0aW9uCmJlZm9yZWhhbmQuCgpCZXN0IHJlZ2Fy
ZHMsClJvdXZlbiBDemVyd2luc2tpCgotLSAKUGVuZ3V0cm9uaXggZS5LLiAgICAgICAgICAgfCBS
b3V2ZW4gQ3plcndpbnNraSAgICAgICAgICB8ClN0ZXVlcndhbGRlciBTdHIuIDIxICAgICAgIHwg
aHR0cDovL3d3dy5wZW5ndXRyb25peC5kZS8gfAozMTEzNyBIaWxkZXNoZWltLCBHZXJtYW55ICB8
IFBob25lOiArNDktNTEyMS0yMDY5MTctMCAgIHwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
