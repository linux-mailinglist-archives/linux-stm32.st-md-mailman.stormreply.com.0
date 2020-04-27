Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0675B1BAECA
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Apr 2020 22:08:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46F2FC36B0C;
	Mon, 27 Apr 2020 20:08:13 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1DE7C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Apr 2020 20:08:11 +0000 (UTC)
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id E1666100003;
 Mon, 27 Apr 2020 20:08:07 +0000 (UTC)
Date: Mon, 27 Apr 2020 22:08:06 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Marek Vasut <marex@denx.de>
Message-ID: <20200427220806.13741ec0@xps13>
In-Reply-To: <3527f3b8-225d-6e5a-dd8a-0421d475f70b@denx.de>
References: <1586966256-29548-1-git-send-email-christophe.kerello@st.com>
 <1586966256-29548-5-git-send-email-christophe.kerello@st.com>
 <20200427194747.224a2402@xps13>
 <40a9bac7-9ed4-b781-f2c2-2d90b4e82749@denx.de>
 <20200427200848.722f4c56@xps13>
 <3527f3b8-225d-6e5a-dd8a-0421d475f70b@denx.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, vigneshr@ti.com,
 tony@atomide.com, richard@nod.at, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org, lee.jones@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 04/12] mtd: rawnand: stm32_fmc2: manage
 all errors cases at probe time
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

SGkgTWFyZWssCgpNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4gd3JvdGUgb24gTW9uLCAyNyBB
cHIgMjAyMCAyMTo0Njo0NCArMDIwMDoKCj4gT24gNC8yNy8yMCA4OjA4IFBNLCBNaXF1ZWwgUmF5
bmFsIHdyb3RlOgo+IFsuLi5dCj4gPj4+PiAgCS8qIEZNQzIgaW5pdCByb3V0aW5lICovCj4gPj4+
PiAgCXN0bTMyX2ZtYzJfaW5pdChmbWMyKTsKPiA+Pj4+IEBAIC0xOTk3LDcgKzIwMDEsNyBAQCBz
dGF0aWMgaW50IHN0bTMyX2ZtYzJfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikK
PiA+Pj4+ICAJLyogU2NhbiB0byBmaW5kIGV4aXN0ZW5jZSBvZiB0aGUgZGV2aWNlICovCj4gPj4+
PiAgCXJldCA9IG5hbmRfc2NhbihjaGlwLCBuYW5kLT5uY3MpOwo+ID4+Pj4gIAlpZiAocmV0KQo+
ID4+Pj4gLQkJZ290byBlcnJfc2NhbjsKPiA+Pj4+ICsJCWdvdG8gZXJyX2RtYV9zZXR1cDsKPiA+
Pj4+ICAKPiA+Pj4+ICAJcmV0ID0gbXRkX2RldmljZV9yZWdpc3RlcihtdGQsIE5VTEwsIDApOwo+
ID4+Pj4gIAlpZiAocmV0KQo+ID4+Pj4gQEAgLTIwMTAsNyArMjAxNCw3IEBAIHN0YXRpYyBpbnQg
c3RtMzJfZm1jMl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4+Pj4gIGVy
cl9kZXZpY2VfcmVnaXN0ZXI6Cj4gPj4+PiAgCW5hbmRfY2xlYW51cChjaGlwKTsKPiA+Pj4+ICAK
PiA+Pj4+IC1lcnJfc2NhbjoKPiA+Pj4+ICtlcnJfZG1hX3NldHVwOgo+ID4+Pj4gIAlpZiAoZm1j
Mi0+ZG1hX2VjY19jaCkKPiA+Pj4+ICAJCWRtYV9yZWxlYXNlX2NoYW5uZWwoZm1jMi0+ZG1hX2Vj
Y19jaCk7Cj4gPj4+PiAgCWlmIChmbWMyLT5kbWFfdHhfY2gpCj4gPj4+PiBAQCAtMjAyMSw2ICsy
MDI1LDcgQEAgc3RhdGljIGludCBzdG0zMl9mbWMyX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpCj4gPj4+PiAgCXNnX2ZyZWVfdGFibGUoJmZtYzItPmRtYV9kYXRhX3NnKTsKPiA+
Pj4+ICAJc2dfZnJlZV90YWJsZSgmZm1jMi0+ZG1hX2VjY19zZyk7Cj4gPj4+PiAgCj4gPj4+PiAr
ZXJyX2Nsa19kaXNhYmxlOgo+ID4+Pj4gIAljbGtfZGlzYWJsZV91bnByZXBhcmUoZm1jMi0+Y2xr
KTsKPiA+Pj4+ICAKPiA+Pj4+ICAJcmV0dXJuIHJldDsgICAgCj4gPj4+Cj4gPj4+IEkgZGlkbid0
IHNwb3QgaXQgZHVyaW5nIG15IGVhcmxpZXIgcmV2aWV3cyBidXQgSSByZWFsbHkgcHJlZmVyIHVz
aW5nCj4gPj4+IGxhYmVscyBleHBsYWluaW5nIHdoYXQgeW91IGRvIHRoYW4gaGF2aW5nIHRoZSBz
YW1lIG5hbWUgb2YgdGhlIGZ1bmN0aW9uCj4gPj4+IHdoaWNoIGZhaWxlZC4gVGhpcyB3YXkgeW91
IGRvbid0IGhhdmUgdG8gcmV3b3JrIHRoZSBlcnJvciBwYXRoIHdoZW4KPiA+Pj4geW91IGhhbmRs
ZSBhbiBhZGRpdGlvbmFsIGVycm9yLgo+ID4+Pgo+ID4+PiBTbywgd291bGQgeW91IG1pbmQgZG9p
bmcgdGhpcyBpbiB0d28gc3RlcHM6Cj4gPj4+Cj4gPj4+IDEvCj4gPj4+IFJlcGxhY2UKPiA+Pj4K
PiA+Pj4gICAgIGVycl9zY2FuOgo+ID4+Pgo+ID4+PiB3aXRoLCBlZy4KPiA+Pj4KPiA+Pj4gICAg
IHJlbGVhc2VfZG1hX29ianM6ICAgIAo+ID4+Cj4gPj4gVGhlIF5lcnJfIHByZWZpeCBpbiBmYWls
cGF0aCBsYWJlbHMgaXMgdXNlZnVsLCBzaW5jZSBpdCdzIGVhc2lseQo+ID4+IHBvc3NpYmxlIHRv
IG1hdGNoIG9uIGl0IHdpdGggcmVnZXhlcyA7IG5vdCBzbyBtdWNoIG9uIGFyYml0cmFyeSBsYWJl
bCBuYW1lLiAgCj4gPiAKPiA+IEkgZ3Vlc3Mgc28sIGJ1dCBpcyBpdCBhY3R1YWxseSB1c2VmdWwg
dG8gY2F0Y2ggbGFiZWxzIGluIGEgcmVnZXg/IChyZWFsCj4gPiBxdWVzdGlvbikgIAo+IAo+IEkg
ZmluZCBpdCB1c2VmdWwgdG8gaGF2ZSBhIHVuaWZpZWQgd2F5IHRvIGZpbmQgdGhvc2UgbGFiZWxz
LCBlLmcuCj4gZXJyX2JlY2F1c2VfZm9vOgo+IGVycl9iZWNhdXNlX2JhcjoKPiBlcnJfbGFzdF9v
bmU6Cj4gaXMgbXVjaCBuaWNlciB0aGFuOgo+IGZvb19mYWlsZWQ6Cj4gYmFyX2Fsc29fZmFpbGVk
Ogo+IGl0c190b3RhbF9yYW5kb21uZXNzOgoKTXkgcG9pbnQgYmVpbmcsIENocmlzdG9waGUsIHlv
dSBjYW4gdXNlIGVycl8gYXMgYSBwcmVmaXggYnV0IEkgdGhpbmsKaXQncyBiZXR0ZXIgdG8gdXNl
OgoKICAgIGVycl9kb190aGlzX2NsZWFudXAKCnRoYW4KCiAgIGVycl90aGlzX2ZhaWxlZAoKPiAK
PiA+IEFueSB3YXkgSSBzdXBwb3NlIGNhdGNoaW5nICI6XG4iIGlzIGFscmVhZHkgYSBnb29kIGFw
cHJveGltYXRpb24gdG8KPiA+IGZpbmQgbGFiZWxzPyAgCj4gCj4gTm90IHZlcnkgcHJhY3RpY2Fs
IHdpdGggZ2l0IGdyZXAgKF5lcnIuKjogd29ya3MgbmljZWx5IHRob3VnaCkKCkkgc3VwcG9zZSBe
Lio6JCB3b3VsZCB3b3JrIHRoZSBzYW1lIDspCgo+IAo+ID4+IGJ0dyB3b3VsZCBpdCBtYWtlIHNl
bnNlIHRvIHNwbGl0IHRoZSBmaXJzdCB0aHJlZSBwYXRjaGVzIG9mIHRoaXMgc2VyaWVzCj4gPj4g
aW50byBhIHNlcGFyYXRlIHNlcmllcyA/IFRoaXMgcmF3bmFuZCBwYXJ0IHNlZW1zIG1vcmUgbGlr
ZSBhbiB1bnJlbGF0ZWQKPiA+PiBjbGVhbnVwLiAgCj4gPiAKPiA+IEFzIGl0IHNlZW1zIHRoYXQg
dGhlIE1GRCBkaXNjdXNzaW9uIGNhbiB0YWtlIGxvbmdlciwgdGhlbiBJIHdvdWxkIHNheQo+ID4g
eWVzLCBhdCBsZWFzdCBmb3IgdGhlIGNsZWFudXAvbWlzYyBjaGFuZ2VzIHBhcnQuICAKPiBSaWdo
dAo+IAoKQ2hlZXJzLApNaXF1w6hsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
