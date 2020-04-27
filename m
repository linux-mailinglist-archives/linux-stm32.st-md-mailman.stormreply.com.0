Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C371BAC06
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Apr 2020 20:08:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D233C36B0C;
	Mon, 27 Apr 2020 18:08:54 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27AB1C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Apr 2020 18:08:52 +0000 (UTC)
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 621E0FF80C;
 Mon, 27 Apr 2020 18:08:49 +0000 (UTC)
Date: Mon, 27 Apr 2020 20:08:48 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Marek Vasut <marex@denx.de>
Message-ID: <20200427200848.722f4c56@xps13>
In-Reply-To: <40a9bac7-9ed4-b781-f2c2-2d90b4e82749@denx.de>
References: <1586966256-29548-1-git-send-email-christophe.kerello@st.com>
 <1586966256-29548-5-git-send-email-christophe.kerello@st.com>
 <20200427194747.224a2402@xps13>
 <40a9bac7-9ed4-b781-f2c2-2d90b4e82749@denx.de>
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
cHIgMjAyMCAxOTo1OTozNCArMDIwMDoKCj4gT24gNC8yNy8yMCA3OjQ3IFBNLCBNaXF1ZWwgUmF5
bmFsIHdyb3RlOgo+ID4gSGkgQ2hyaXN0b3BoZSwKPiA+IAo+ID4gQ2hyaXN0b3BoZSBLZXJlbGxv
IDxjaHJpc3RvcGhlLmtlcmVsbG9Ac3QuY29tPiB3cm90ZSBvbiBXZWQsIDE1IEFwcgo+ID4gMjAy
MCAxNzo1NzoyOCArMDIwMDoKPiA+ICAgCj4gPj4gVGhpcyBwYXRjaCBkZWZlcnMgaXRzIHByb2Jl
IHdoZW4gdGhlIGV4cGVjdGVkIHJlc2V0IGNvbnRyb2wgaXMgbm90Cj4gPj4geWV0IHJlYWR5LiBU
aGlzIHBhdGNoIGFsc28gaGFuZGxlcyBwcm9wZXJseSBhbGwgZXJyb3JzIGNhc2VzIGF0IHByb2Jl
Cj4gPj4gdGltZS4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgS2VyZWxsbyA8
Y2hyaXN0b3BoZS5rZXJlbGxvQHN0LmNvbT4KPiA+PiAtLS0KPiA+PiAgZHJpdmVycy9tdGQvbmFu
ZC9yYXcvc3RtMzJfZm1jMl9uYW5kLmMgfCAxMyArKysrKysrKystLS0tCj4gPj4gIDEgZmlsZSBj
aGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gPj4KPiA+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvc3RtMzJfZm1jMl9uYW5kLmMgYi9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYwo+ID4+IGluZGV4IGI2ZDQ1Y2QuLjBhOTY3OTcg
MTAwNjQ0Cj4gPj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvc3RtMzJfZm1jMl9uYW5kLmMK
PiA+PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYwo+ID4+IEBA
IC0xOTY3LDcgKzE5NjcsMTEgQEAgc3RhdGljIGludCBzdG0zMl9mbWMyX3Byb2JlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPj4gIAl9Cj4gPj4gIAo+ID4+ICAJcnN0YyA9IGRldm1f
cmVzZXRfY29udHJvbF9nZXQoZGV2LCBOVUxMKTsKPiA+PiAtCWlmICghSVNfRVJSKHJzdGMpKSB7
Cj4gPj4gKwlpZiAoSVNfRVJSKHJzdGMpKSB7Cj4gPj4gKwkJcmV0ID0gUFRSX0VSUihyc3RjKTsK
PiA+PiArCQlpZiAocmV0ID09IC1FUFJPQkVfREVGRVIpCj4gPj4gKwkJCWdvdG8gZXJyX2Nsa19k
aXNhYmxlOwo+ID4+ICsJfSBlbHNlIHsKPiA+PiAgCQlyZXNldF9jb250cm9sX2Fzc2VydChyc3Rj
KTsKPiA+PiAgCQlyZXNldF9jb250cm9sX2RlYXNzZXJ0KHJzdGMpOwo+ID4+ICAJfQo+ID4+IEBA
IC0xOTc1LDcgKzE5NzksNyBAQCBzdGF0aWMgaW50IHN0bTMyX2ZtYzJfcHJvYmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikKPiA+PiAgCS8qIERNQSBzZXR1cCAqLwo+ID4+ICAJcmV0ID0g
c3RtMzJfZm1jMl9kbWFfc2V0dXAoZm1jMik7Cj4gPj4gIAlpZiAocmV0KQo+ID4+IC0JCXJldHVy
biByZXQ7Cj4gPj4gKwkJZ290byBlcnJfZG1hX3NldHVwOwo+ID4+ICAKPiA+PiAgCS8qIEZNQzIg
aW5pdCByb3V0aW5lICovCj4gPj4gIAlzdG0zMl9mbWMyX2luaXQoZm1jMik7Cj4gPj4gQEAgLTE5
OTcsNyArMjAwMSw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfZm1jMl9wcm9iZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQo+ID4+ICAJLyogU2NhbiB0byBmaW5kIGV4aXN0ZW5jZSBvZiB0aGUg
ZGV2aWNlICovCj4gPj4gIAlyZXQgPSBuYW5kX3NjYW4oY2hpcCwgbmFuZC0+bmNzKTsKPiA+PiAg
CWlmIChyZXQpCj4gPj4gLQkJZ290byBlcnJfc2NhbjsKPiA+PiArCQlnb3RvIGVycl9kbWFfc2V0
dXA7Cj4gPj4gIAo+ID4+ICAJcmV0ID0gbXRkX2RldmljZV9yZWdpc3RlcihtdGQsIE5VTEwsIDAp
Owo+ID4+ICAJaWYgKHJldCkKPiA+PiBAQCAtMjAxMCw3ICsyMDE0LDcgQEAgc3RhdGljIGludCBz
dG0zMl9mbWMyX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPj4gIGVycl9k
ZXZpY2VfcmVnaXN0ZXI6Cj4gPj4gIAluYW5kX2NsZWFudXAoY2hpcCk7Cj4gPj4gIAo+ID4+IC1l
cnJfc2NhbjoKPiA+PiArZXJyX2RtYV9zZXR1cDoKPiA+PiAgCWlmIChmbWMyLT5kbWFfZWNjX2No
KQo+ID4+ICAJCWRtYV9yZWxlYXNlX2NoYW5uZWwoZm1jMi0+ZG1hX2VjY19jaCk7Cj4gPj4gIAlp
ZiAoZm1jMi0+ZG1hX3R4X2NoKQo+ID4+IEBAIC0yMDIxLDYgKzIwMjUsNyBAQCBzdGF0aWMgaW50
IHN0bTMyX2ZtYzJfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiA+PiAgCXNn
X2ZyZWVfdGFibGUoJmZtYzItPmRtYV9kYXRhX3NnKTsKPiA+PiAgCXNnX2ZyZWVfdGFibGUoJmZt
YzItPmRtYV9lY2Nfc2cpOwo+ID4+ICAKPiA+PiArZXJyX2Nsa19kaXNhYmxlOgo+ID4+ICAJY2xr
X2Rpc2FibGVfdW5wcmVwYXJlKGZtYzItPmNsayk7Cj4gPj4gIAo+ID4+ICAJcmV0dXJuIHJldDsg
IAo+ID4gCj4gPiBJIGRpZG4ndCBzcG90IGl0IGR1cmluZyBteSBlYXJsaWVyIHJldmlld3MgYnV0
IEkgcmVhbGx5IHByZWZlciB1c2luZwo+ID4gbGFiZWxzIGV4cGxhaW5pbmcgd2hhdCB5b3UgZG8g
dGhhbiBoYXZpbmcgdGhlIHNhbWUgbmFtZSBvZiB0aGUgZnVuY3Rpb24KPiA+IHdoaWNoIGZhaWxl
ZC4gVGhpcyB3YXkgeW91IGRvbid0IGhhdmUgdG8gcmV3b3JrIHRoZSBlcnJvciBwYXRoIHdoZW4K
PiA+IHlvdSBoYW5kbGUgYW4gYWRkaXRpb25hbCBlcnJvci4KPiA+IAo+ID4gU28sIHdvdWxkIHlv
dSBtaW5kIGRvaW5nIHRoaXMgaW4gdHdvIHN0ZXBzOgo+ID4gCj4gPiAxLwo+ID4gUmVwbGFjZQo+
ID4gCj4gPiAgICAgZXJyX3NjYW46Cj4gPiAKPiA+IHdpdGgsIGVnLgo+ID4gCj4gPiAgICAgcmVs
ZWFzZV9kbWFfb2JqczogIAo+IAo+IFRoZSBeZXJyXyBwcmVmaXggaW4gZmFpbHBhdGggbGFiZWxz
IGlzIHVzZWZ1bCwgc2luY2UgaXQncyBlYXNpbHkKPiBwb3NzaWJsZSB0byBtYXRjaCBvbiBpdCB3
aXRoIHJlZ2V4ZXMgOyBub3Qgc28gbXVjaCBvbiBhcmJpdHJhcnkgbGFiZWwgbmFtZS4KCkkgZ3Vl
c3Mgc28sIGJ1dCBpcyBpdCBhY3R1YWxseSB1c2VmdWwgdG8gY2F0Y2ggbGFiZWxzIGluIGEgcmVn
ZXg/IChyZWFsCnF1ZXN0aW9uKQoKQW55IHdheSBJIHN1cHBvc2UgY2F0Y2hpbmcgIjpcbiIgaXMg
YWxyZWFkeSBhIGdvb2QgYXBwcm94aW1hdGlvbiB0bwpmaW5kIGxhYmVscz8KCj4gCj4gYnR3IHdv
dWxkIGl0IG1ha2Ugc2Vuc2UgdG8gc3BsaXQgdGhlIGZpcnN0IHRocmVlIHBhdGNoZXMgb2YgdGhp
cyBzZXJpZXMKPiBpbnRvIGEgc2VwYXJhdGUgc2VyaWVzID8gVGhpcyByYXduYW5kIHBhcnQgc2Vl
bXMgbW9yZSBsaWtlIGFuIHVucmVsYXRlZAo+IGNsZWFudXAuCgpBcyBpdCBzZWVtcyB0aGF0IHRo
ZSBNRkQgZGlzY3Vzc2lvbiBjYW4gdGFrZSBsb25nZXIsIHRoZW4gSSB3b3VsZCBzYXkKeWVzLCBh
dCBsZWFzdCBmb3IgdGhlIGNsZWFudXAvbWlzYyBjaGFuZ2VzIHBhcnQuCgoKVGhhbmtzLApNaXF1
w6hsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
