Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B26D144C015
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Nov 2021 12:21:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F8F3C5EC6F;
	Wed, 10 Nov 2021 11:21:36 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A31B3C5EC6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Nov 2021 11:21:35 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1mklfZ-0001gu-5v; Wed, 10 Nov 2021 12:21:33 +0100
Received: from pza by lupine with local (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1mklfV-0008rn-Sl; Wed, 10 Nov 2021 12:21:29 +0100
Message-ID: <d9f7b80e1abbd1323c5ec7fcdf57fb1a855929cd.camel@pengutronix.de>
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Biju Das
 <biju.das.jz@bp.renesas.com>
Date: Wed, 10 Nov 2021 12:21:29 +0100
In-Reply-To: <CAMuHMdX+3TfX21HtuUcUQp1SZKJgZ0By8XFxzpxSED1H8_ua0w@mail.gmail.com>
References: <20211110083152.31144-1-biju.das.jz@bp.renesas.com>
 <20211110083152.31144-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdX+3TfX21HtuUcUQp1SZKJgZ0By8XFxzpxSED1H8_ua0w@mail.gmail.com>
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
 Chris Brandt <chris.brandt@renesas.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-stm32@st-md-mailman.stormreply.com,
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

SGkgR2VlcnQsIEJpanUsCgpPbiBXZWQsIDIwMjEtMTEtMTAgYXQgMTE6MjcgKzAxMDAsIEdlZXJ0
IFV5dHRlcmhvZXZlbiB3cm90ZToKPiBIaSBCaWp1LAo+IAo+IE9uIFdlZCwgTm92IDEwLCAyMDIx
IGF0IDk6MzIgQU0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToK
PiA+IFJaL0cyTCBTb0MgaGFzIEdlbmVyaWMgVGltZXIgTW9kdWxlKGEuay5hIE9TVE0pIHdoaWNo
IG5lZWRzIHRvCj4gPiBkZWFzc2VydCB0aGUgcmVzZXQgbGluZSBiZWZvcmUgYWNjZXNzaW5nIGFu
eSByZWdpc3RlcnMuCj4gPiAKPiA+IFRoaXMgcGF0Y2ggYWRkcyBhbiBlbnRyeSBwb2ludCBmb3Ig
UlovRzJMIHNvIHRoYXQgd2UgY2FuIGRlYXNzZXJ0Cj4gPiB0aGUgcmVzZXQgbGluZSBpbiBwcm9i
ZSBjYWxsYmFjay4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6
QGJwLnJlbmVzYXMuY29tPgo+ID4gUmV2aWV3ZWQtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWth
ci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPiAKPiBUaGFua3MgZm9yIHlvdXIgcGF0
Y2ghCj4gCj4gPiAtLS0gYS9kcml2ZXJzL2Nsb2Nrc291cmNlL3JlbmVzYXMtb3N0bS5jCj4gPiAr
KysgYi9kcml2ZXJzL2Nsb2Nrc291cmNlL3JlbmVzYXMtb3N0bS5jCj4gPiBAQCAtMjA5LDMgKzIx
MSwzOSBAQCBzdGF0aWMgaW50IF9faW5pdCBvc3RtX2luaXQoc3RydWN0IGRldmljZV9ub2RlICpu
cCkKPiA+IMKgfQo+ID4gCj4gPiDCoFRJTUVSX09GX0RFQ0xBUkUob3N0bSwgInJlbmVzYXMsb3N0
bSIsIG9zdG1faW5pdCk7Cj4gCj4gQmFja2dyb3VuZDogdGhpcyBkcml2ZXIgdXNlcyBUSU1FUl9P
Rl9ERUNMQVJFKCkgYmVjYXVzZSB0aGUgT1NUTQo+IGlzIHRoZSBzeXN0ZW0gdGltZXIgb24gUlov
QSBTb0NzLCB3aGljaCBkbyBub3QgaGF2ZSB0aGUgQVJNIGFyY2hpdGVjdHVyZWQKPiB0aW1lci4g
IFJaL0cyTCBkb2VzIGhhdmUgdGhlIEFSTSBhcmNoaXRlY3R1cmVkIHRpbWVyLgoKVGhhbmtzLgoK
PiA+ICsKPiA+ICsjaWZkZWYgQ09ORklHX0FSQ0hfUjlBMDdHMDQ0Cj4gPiArc3RhdGljIGludCBf
X2luaXQgb3N0bV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4gK3sKPiA+
ICsgICAgICAgc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsKPiA+ICsgICAgICAgc3Ry
dWN0IHJlc2V0X2NvbnRyb2wgKnJzdGM7Cj4gPiArICAgICAgIGludCByZXQ7Cj4gPiArCj4gPiAr
ICAgICAgIHJzdGMgPSBkZXZtX3Jlc2V0X2NvbnRyb2xfZ2V0X2V4Y2x1c2l2ZShkZXYsIE5VTEwp
Owo+ID4gKyAgICAgICBpZiAoSVNfRVJSKHJzdGMpKQo+ID4gKyAgICAgICAgICAgICAgIHJldHVy
biBkZXZfZXJyX3Byb2JlKGRldiwgUFRSX0VSUihyc3RjKSwgImZhaWxlZCB0byBnZXQgcmVzZXQi
KTsKPiA+ICsKPiA+ICsgICAgICAgcmVzZXRfY29udHJvbF9kZWFzc2VydChyc3RjKTsKPiA+ICsK
PiA+ICsgICAgICAgcmV0ID0gb3N0bV9pbml0KGRldi0+b2Zfbm9kZSk7Cj4gPiArICAgICAgIGlm
IChyZXQpIHsKPiA+ICsgICAgICAgICAgICAgICByZXNldF9jb250cm9sX2Fzc2VydChyc3RjKTsK
PiA+ICsgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4gKyAgICAgICB9Cj4gPiArCj4gPiAr
ICAgICAgIHJldHVybiAwOwo+ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG9m
X2RldmljZV9pZCBvc3RtX29mX3RhYmxlW10gPSB7Cj4gPiArICAgICAgIHsgLmNvbXBhdGlibGUg
PSAicmVuZXNhcyxyemcybC1vc3RtIiwgfSwKPiAKPiBJIGJlbGlldmUgdGhlIE9TVE0gYmxvY2sg
b24gUlovRzJMIGlzIGlkZW50aWNhbCB0byB0aGUgb25lIG9uIFJaL0EsCj4gYW5kIHRoZSByZXF1
aXJlbWVudCB0byBkZWFzc2VydCBpdHMgbW9kdWxlIHJlc2V0IGlzIGFuIFNvQyBpbnRlZ3JhdGlv
bgo+IGZlYXR1cmUgb24gUlovRzJMLiAgSGVuY2UgdGhlIGRyaXZlciBzaG91bGQgbWF0Y2ggb24g
InJlbmVzYXMsb3N0bSIKPiBmb3IgYm90aD8KCklmIHRoYXQgaXMgdGhlIGNhc2UsIHRoZSByZXNl
dCBjb3VsZCBiZSBtYWRlIHJlcXVpcmVkIGZvcgogIGNvbXBhdGlibGUgPSAicmVuZXNhcyxyOWEw
N2cwNDQtb3N0bSIsICJyZW5lc2FzLG9zdG0iOwppbiB0aGUgLnlhbWwgZmlsZS4KCj4gU28gbXkg
c3VnZ2VzdGlvbiB3b3VsZCBiZSB0byBpbmNsdWRlIHRoZSByZXNldCBoYW5kbGluZyBpbiBvc3Rt
X2luaXQoKQo+IGluc3RlYWQsIGJ1dCBtYWtlIGl0IG9wdGlvbmFsLCBhbmQgZXJyb3Igb3V0IGlu
IGNhc2Ugb2YgLUVQUk9CRV9ERUZFUi4KPgo+IEluIGNhc2UgaW5pdGlhbGl6YXRpb24gZnJvbSBU
SU1FUl9PRl9ERUNMQVJFKCkgZmFpbGVkLCB0aGUgcGxhdGZvcm0KPiBkcml2ZXIgY2FuIGtpY2sg
aW4gbGF0ZXIgYW5kIHJldHJ5Lgo+IAo+IEhvd2V2ZXIsIGl0IHNlZW1zIF9fb2ZfcmVzZXRfY29u
dHJvbF9nZXQoKSBpZ25vcmVzIGFsbCBlcnJvcnMsCj4gaW5jbHVkaW5nIC1FUFJPQkVfREVGRVIs
IGlmIG9wdGlvbmFsIGlzIHRydWUsIHNvIHRoaXMgd29uJ3Qgd29yaz8KPgo+IFBoaWxpcHA6IGlz
IHRoYXQgY29ycmVjdD8gSWYgeWVzLCBvc3RtX2luaXQoKSBoYXMgdG8gY2hlY2sgdGhlIHByZXNl
bmNlCj4gb2YgYSByZXNldHMgcHJvcGVydHkgdG8gc2VlIGlmIHRoZSByZXNldCBpcyBvcHRpb25h
bCBvciByZXF1aXJlZC4KCk5vLCBfX29mX3Jlc2V0X2NvbnRyb2xfZ2V0KCkgc2hvdWxkIG9ubHkg
cmVwbGFjZSBpdHMgLUVOT0VOVCByZXR1cm4KdmFsdWUgZHVlIHRvIGVycm9ycyBmcm9tIG9mX3By
b3BlcnR5X21hdGNoX3N0cmluZygpIGFuZApvZl9wYXJzZV9waGFuZGxlX3dpdGhfYXJncygpIHdp
dGggTlVMTC4gQW55dGhpbmcgZWxzZSBJJ2QgY29uc2lkZXIgYQpidWcuCgpTcGVjaWZpY2FsbHks
IC1FUFJPQkVfREVGRVIgaXMgc3RpbGwgcmV0dXJuZWQgaWYgbm8gZXhpc3RpbmcgcmNkZXYgaXMK
Zm91bmQgbWF0Y2hpbmcgdGhlIHN1Y2Nlc3NmdWwgInJlc2V0cyIgcGhhbmRsZSBsb29rdXAuIFNv
CgoJcnN0YyA9IGRldm1fcmVzZXRfY29udHJvbF9nZXRfb3B0aW9uYWxfZXhjbHVzaXZlKGRldiwg
TlVMTCk7CglpZiAoSVNfRVJSKHJzdGMpKQoJCXJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgUFRS
X0VSUihyc3RjKSwgImZhaWxlZCB0byBnZXQgcmVzZXQiKTsKCglyZXNldF9jb250cm9sX2RlYXNz
ZXJ0KHJzdGMpOwoKYWRkZWQgdG8gb3N0bV9pbml0KCkgc2hvdWxkIHdvcmsuIE5vdGUgdGhhdCBw
bGF0Zm9ybV9wcm9iZSgpIHdpbGwgdGhyb3cKYW4gYWRkaXRpb25hbCB3YXJuaW5nIGlmIC1FUFJP
QkVfREVGRVIgaXMgcmV0dXJuZWQgZnJvbSBub24taG90cGx1Z2dhYmxlCmRyaXZlcnMgKGFuZCB0
dXJuIGl0IGludG8gLUVOWElPKS4KCnJlZ2FyZHMKUGhpbGlwcApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
