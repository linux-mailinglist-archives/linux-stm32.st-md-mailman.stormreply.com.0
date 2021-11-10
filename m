Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 760C644C059
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Nov 2021 12:52:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31412C5EC6F;
	Wed, 10 Nov 2021 11:52:54 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C11A8C5EC6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Nov 2021 11:52:53 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1mkm9r-0004Z4-FQ; Wed, 10 Nov 2021 12:52:51 +0100
Received: from pza by lupine with local (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1mkm9n-000A1I-IA; Wed, 10 Nov 2021 12:52:47 +0100
Message-ID: <92389952d7072efafaf7da67acfce84fd5f3b932.camel@pengutronix.de>
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>
Date: Wed, 10 Nov 2021 12:52:47 +0100
In-Reply-To: <OS0PR01MB59224396F5796647A675D75486939@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211110083152.31144-1-biju.das.jz@bp.renesas.com>
 <20211110083152.31144-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdX+3TfX21HtuUcUQp1SZKJgZ0By8XFxzpxSED1H8_ua0w@mail.gmail.com>
 <d9f7b80e1abbd1323c5ec7fcdf57fb1a855929cd.camel@pengutronix.de>
 <OS0PR01MB59224396F5796647A675D75486939@OS0PR01MB5922.jpnprd01.prod.outlook.com>
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Biju Das <biju.das@bp.renesas.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Chris Brandt <Chris.Brandt@renesas.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 2/2] clocksource/drivers/renesas-ostm: Add
 RZ/G2L OSTM support
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

T24gV2VkLCAyMDIxLTExLTEwIGF0IDExOjM3ICswMDAwLCBCaWp1IERhcyB3cm90ZToKPiBIaSBQ
aGlsaXBwIGFuZCBHZWVydCwKPiAKPiBUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4KPiAKPiA+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggMi8yXSBjbG9ja3NvdXJjZS9kcml2ZXJzL3JlbmVzYXMtb3N0bTog
QWRkIFJaL0cyTCBPU1RNCj4gPiBzdXBwb3J0Cj4gPiAKPiA+IEhpIEdlZXJ0LCBCaWp1LAo+ID4g
Cj4gPiBPbiBXZWQsIDIwMjEtMTEtMTAgYXQgMTE6MjcgKzAxMDAsIEdlZXJ0IFV5dHRlcmhvZXZl
biB3cm90ZToKPiA+ID4gSGkgQmlqdSwKPiA+ID4gCj4gPiA+IE9uIFdlZCwgTm92IDEwLCAyMDIx
IGF0IDk6MzIgQU0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPgo+ID4gd3Jv
dGU6Cj4gPiA+ID4gUlovRzJMIFNvQyBoYXMgR2VuZXJpYyBUaW1lciBNb2R1bGUoYS5rLmEgT1NU
TSkgd2hpY2ggbmVlZHMgdG8KPiA+ID4gPiBkZWFzc2VydCB0aGUgcmVzZXQgbGluZSBiZWZvcmUg
YWNjZXNzaW5nIGFueSByZWdpc3RlcnMuCj4gPiA+ID4gCj4gPiA+ID4gVGhpcyBwYXRjaCBhZGRz
IGFuIGVudHJ5IHBvaW50IGZvciBSWi9HMkwgc28gdGhhdCB3ZSBjYW4gZGVhc3NlcnQKPiA+ID4g
PiB0aGUgcmVzZXQgbGluZSBpbiBwcm9iZSBjYWxsYmFjay4KPiA+ID4gPiAKPiA+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+Cj4gPiA+ID4g
UmV2aWV3ZWQtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5y
ZW5lc2FzLmNvbT4KPiA+ID4gCj4gPiA+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCEKPiA+ID4gCj4g
PiA+ID4gLS0tIGEvZHJpdmVycy9jbG9ja3NvdXJjZS9yZW5lc2FzLW9zdG0uYwo+ID4gPiA+ICsr
KyBiL2RyaXZlcnMvY2xvY2tzb3VyY2UvcmVuZXNhcy1vc3RtLmMKPiA+ID4gPiBAQCAtMjA5LDMg
KzIxMSwzOSBAQCBzdGF0aWMgaW50IF9faW5pdCBvc3RtX2luaXQoc3RydWN0IGRldmljZV9ub2Rl
Cj4gPiA+ID4gKm5wKQo+ID4gPiA+IMKgfQo+ID4gPiA+IAo+ID4gPiA+IMKgVElNRVJfT0ZfREVD
TEFSRShvc3RtLCAicmVuZXNhcyxvc3RtIiwgb3N0bV9pbml0KTsKPiA+ID4gCj4gPiA+IEJhY2tn
cm91bmQ6IHRoaXMgZHJpdmVyIHVzZXMgVElNRVJfT0ZfREVDTEFSRSgpIGJlY2F1c2UgdGhlIE9T
VE0gaXMKPiA+ID4gdGhlIHN5c3RlbSB0aW1lciBvbiBSWi9BIFNvQ3MsIHdoaWNoIGRvIG5vdCBo
YXZlIHRoZSBBUk0gYXJjaGl0ZWN0dXJlZAo+ID4gPiB0aW1lci4gIFJaL0cyTCBkb2VzIGhhdmUg
dGhlIEFSTSBhcmNoaXRlY3R1cmVkIHRpbWVyLgo+ID4gCj4gPiBUaGFua3MuCj4gPiAKPiA+ID4g
PiArCj4gPiA+ID4gKyNpZmRlZiBDT05GSUdfQVJDSF9SOUEwN0cwNDQKPiA+ID4gPiArc3RhdGlj
IGludCBfX2luaXQgb3N0bV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KSB7Cj4g
PiA+ID4gKyAgICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2Owo+ID4gPiA+ICsg
ICAgICAgc3RydWN0IHJlc2V0X2NvbnRyb2wgKnJzdGM7Cj4gPiA+ID4gKyAgICAgICBpbnQgcmV0
Owo+ID4gPiA+ICsKPiA+ID4gPiArICAgICAgIHJzdGMgPSBkZXZtX3Jlc2V0X2NvbnRyb2xfZ2V0
X2V4Y2x1c2l2ZShkZXYsIE5VTEwpOwo+ID4gPiA+ICsgICAgICAgaWYgKElTX0VSUihyc3RjKSkK
PiA+ID4gPiArICAgICAgICAgICAgICAgcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJS
KHJzdGMpLCAiZmFpbGVkIHRvCj4gPiA+ID4gKyBnZXQgcmVzZXQiKTsKPiA+ID4gPiArCj4gPiA+
ID4gKyAgICAgICByZXNldF9jb250cm9sX2RlYXNzZXJ0KHJzdGMpOwo+ID4gPiA+ICsKPiA+ID4g
PiArICAgICAgIHJldCA9IG9zdG1faW5pdChkZXYtPm9mX25vZGUpOwo+ID4gPiA+ICsgICAgICAg
aWYgKHJldCkgewo+ID4gPiA+ICsgICAgICAgICAgICAgICByZXNldF9jb250cm9sX2Fzc2VydChy
c3RjKTsKPiA+ID4gPiArICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiA+ID4gPiArICAgICAg
IH0KPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgICByZXR1cm4gMDsKPiA+ID4gPiArfQo+ID4gPiA+
ICsKPiA+ID4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgb3N0bV9vZl90YWJs
ZVtdID0gewo+ID4gPiA+ICsgICAgICAgeyAuY29tcGF0aWJsZSA9ICJyZW5lc2FzLHJ6ZzJsLW9z
dG0iLCB9LAo+ID4gPiAKPiA+ID4gSSBiZWxpZXZlIHRoZSBPU1RNIGJsb2NrIG9uIFJaL0cyTCBp
cyBpZGVudGljYWwgdG8gdGhlIG9uZSBvbiBSWi9BLAo+ID4gPiBhbmQgdGhlIHJlcXVpcmVtZW50
IHRvIGRlYXNzZXJ0IGl0cyBtb2R1bGUgcmVzZXQgaXMgYW4gU29DIGludGVncmF0aW9uCj4gPiA+
IGZlYXR1cmUgb24gUlovRzJMLiAgSGVuY2UgdGhlIGRyaXZlciBzaG91bGQgbWF0Y2ggb24gInJl
bmVzYXMsb3N0bSIKPiA+ID4gZm9yIGJvdGg/Cj4gPiAKPiA+IElmIHRoYXQgaXMgdGhlIGNhc2Us
IHRoZSByZXNldCBjb3VsZCBiZSBtYWRlIHJlcXVpcmVkIGZvcgo+ID4gwqDCoGNvbXBhdGlibGUg
PSAicmVuZXNhcyxyOWEwN2cwNDQtb3N0bSIsICJyZW5lc2FzLG9zdG0iOyBpbiB0aGUgLnlhbWwK
PiA+IGZpbGUuCj4gPiAKPiA+ID4gU28gbXkgc3VnZ2VzdGlvbiB3b3VsZCBiZSB0byBpbmNsdWRl
IHRoZSByZXNldCBoYW5kbGluZyBpbiBvc3RtX2luaXQoKQo+ID4gPiBpbnN0ZWFkLCBidXQgbWFr
ZSBpdCBvcHRpb25hbCwgYW5kIGVycm9yIG91dCBpbiBjYXNlIG9mIC1FUFJPQkVfREVGRVIuCj4g
PiA+IAo+ID4gPiBJbiBjYXNlIGluaXRpYWxpemF0aW9uIGZyb20gVElNRVJfT0ZfREVDTEFSRSgp
IGZhaWxlZCwgdGhlIHBsYXRmb3JtCj4gPiA+IGRyaXZlciBjYW4ga2ljayBpbiBsYXRlciBhbmQg
cmV0cnkuCj4gPiA+IAo+ID4gPiBIb3dldmVyLCBpdCBzZWVtcyBfX29mX3Jlc2V0X2NvbnRyb2xf
Z2V0KCkgaWdub3JlcyBhbGwgZXJyb3JzLAo+ID4gPiBpbmNsdWRpbmcgLUVQUk9CRV9ERUZFUiwg
aWYgb3B0aW9uYWwgaXMgdHJ1ZSwgc28gdGhpcyB3b24ndCB3b3JrPwo+ID4gPiAKPiA+ID4gUGhp
bGlwcDogaXMgdGhhdCBjb3JyZWN0PyBJZiB5ZXMsIG9zdG1faW5pdCgpIGhhcyB0byBjaGVjayB0
aGUKPiA+ID4gcHJlc2VuY2Ugb2YgYSByZXNldHMgcHJvcGVydHkgdG8gc2VlIGlmIHRoZSByZXNl
dCBpcyBvcHRpb25hbCBvcgo+ID4gcmVxdWlyZWQuCj4gPiAKPiA+IE5vLCBfX29mX3Jlc2V0X2Nv
bnRyb2xfZ2V0KCkgc2hvdWxkIG9ubHkgcmVwbGFjZSBpdHMgLUVOT0VOVCByZXR1cm4gdmFsdWUK
PiA+IGR1ZSB0byBlcnJvcnMgZnJvbSBvZl9wcm9wZXJ0eV9tYXRjaF9zdHJpbmcoKSBhbmQKPiA+
IG9mX3BhcnNlX3BoYW5kbGVfd2l0aF9hcmdzKCkgd2l0aCBOVUxMLiBBbnl0aGluZyBlbHNlIEkn
ZCBjb25zaWRlciBhIGJ1Zy4KPiA+IAo+ID4gU3BlY2lmaWNhbGx5LCAtRVBST0JFX0RFRkVSIGlz
IHN0aWxsIHJldHVybmVkIGlmIG5vIGV4aXN0aW5nIHJjZGV2IGlzCj4gPiBmb3VuZCBtYXRjaGlu
ZyB0aGUgc3VjY2Vzc2Z1bCAicmVzZXRzIiBwaGFuZGxlIGxvb2t1cC4gU28KPiA+IAo+ID4gCXJz
dGMgPSBkZXZtX3Jlc2V0X2NvbnRyb2xfZ2V0X29wdGlvbmFsX2V4Y2x1c2l2ZShkZXYsIE5VTEwp
Owo+IAo+IEluIHRoaXMgY2FzZSwgSG93IGRvIHdlIGdldCBkZXYgaGVyZSBmcm9tIGRldmljZV9u
b2RlLCBhcyBkZXZpY2UgaXMgbm90IGF2YWlsYWJsZSBhdCB0aGlzIHBvaW50PwoKT2gsIHJpZ2h0
LgpXZSBhcmUgbWlzc2luZyBhbiBvZl9yZXNldF9jb250cm9sX2dldF9vcHRpb25hbF9leGNsdXNp
dmUoKSBmb3IgdGhpczoKCnN0YXRpYyBpbmxpbmUgc3RydWN0IHJlc2V0X2NvbnRyb2wgKm9mX3Jl
c2V0X2NvbnRyb2xfZ2V0X29wdGlvbmFsX2V4Y2x1c2l2ZSgKCQlzdHJ1Y3QgZGV2aWNlX25vZGUg
Km5vZGUsIGNvbnN0IGNoYXIgKmlkKQp7CglyZXR1cm4gX19vZl9yZXNldF9jb250cm9sX2dldChu
b2RlLCBpZCwgMCwgZmFsc2UsIHRydWUsIHRydWUpOwp9CgpyZWdhcmRzClBoaWxpcHAKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
