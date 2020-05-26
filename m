Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B61341BD855
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Apr 2020 11:35:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78759C36B10;
	Wed, 29 Apr 2020 09:35:34 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A6D0C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Apr 2020 09:35:34 +0000 (UTC)
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 26FB2240016;
 Wed, 29 Apr 2020 09:35:30 +0000 (UTC)
Date: Wed, 29 Apr 2020 11:35:29 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <20200429113529.5ddc3ad9@xps13>
In-Reply-To: <0e2c9a6a-aa21-7814-9af8-629de6568fab@st.com>
References: <1586966256-29548-1-git-send-email-christophe.kerello@st.com>
 <1586966256-29548-7-git-send-email-christophe.kerello@st.com>
 <20200427202212.0235d987@xps13>
 <0e2c9a6a-aa21-7814-9af8-629de6568fab@st.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, marex@denx.de,
 vigneshr@ti.com, tony@atomide.com, richard@nod.at,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, lee.jones@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 06/12] mtd: rawnand: stm32_fmc2: use
 FMC2_TIMEOUT_MS for timeouts
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

SGkgQ2hyaXN0b3BoZSwKCkNocmlzdG9waGUgS2VyZWxsbyA8Y2hyaXN0b3BoZS5rZXJlbGxvQHN0
LmNvbT4gd3JvdGUgb24gV2VkLCAyOSBBcHIKMjAyMCAxMToyNzo0MyArMDIwMDoKCj4gSGkgTWlx
dcOobCwKPiAKPiBPbiA0LzI3LzIwIDg6MjIgUE0sIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBI
aSBDaHJpc3RvcGhlLAo+ID4gCj4gPiBDaHJpc3RvcGhlIEtlcmVsbG8gPGNocmlzdG9waGUua2Vy
ZWxsb0BzdC5jb20+IHdyb3RlIG9uIFdlZCwgMTUgQXByCj4gPiAyMDIwIDE3OjU3OjMwICswMjAw
Ogo+ID4gICAKPiA+PiBUaGlzIHBhdGNoIHJlbW92ZXMgdGhlIGNvbnN0YW50IEZNQzJfVElNRU9V
VF9VUy4KPiA+PiBGTUMyX1RJTUVPVVRfTVMgaXMgc2V0IHRvIDUgc2Vjb25kcyBhbmQgdGhpcyBj
b25zdGFudCBpcyB1c2VkCj4gPj4gZWFjaCB0aW1lIHRoYXQgd2UgbmVlZCB0byB3YWl0IChleGNl
cHQgd2hlbiB0aGUgdGltZW91dCB2YWx1ZQo+ID4+IGlzIHNldCBieSB0aGUgZnJhbWV3b3JrKQo+
ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBLZXJlbGxvIDxjaHJpc3RvcGhlLmtl
cmVsbG9Ac3QuY29tPgo+ID4+IC0tLQo+ID4+ICAgZHJpdmVycy9tdGQvbmFuZC9yYXcvc3RtMzJf
Zm1jMl9uYW5kLmMgfCAxMSArKysrKy0tLS0tLQo+ID4+ICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3N0
bTMyX2ZtYzJfbmFuZC5jCj4gPj4gaW5kZXggYWI1MzMxNC4uZjE1OWMzOSAxMDA2NDQKPiA+PiAt
LS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYwo+ID4+ICsrKyBiL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L3N0bTMyX2ZtYzJfbmFuZC5jCj4gPj4gQEAgLTM3LDggKzM3LDcg
QEAKPiA+PiAgIC8qIE1heCBFQ0MgYnVmZmVyIGxlbmd0aCAqLwo+ID4+ICAgI2RlZmluZSBGTUMy
X01BWF9FQ0NfQlVGX0xFTgkJKEZNQzJfQkNIRFNSU19MRU4gKiBGTUMyX01BWF9TRykgIAo+ID4+
ICAgPj4gLSNkZWZpbmUgRk1DMl9USU1FT1VUX1VTCQkJMTAwMCAgCj4gPj4gLSNkZWZpbmUgRk1D
Ml9USU1FT1VUX01TCQkJMTAwMAo+ID4+ICsjZGVmaW5lIEZNQzJfVElNRU9VVF9NUwkJCTUwMDAg
IAo+ID4+ICAgPj4gICAvKiBUaW1pbmdzICovICAKPiA+PiAgICNkZWZpbmUgRk1DMl9USElaCQkJ
MQo+ID4+IEBAIC01MjUsOSArNTI0LDkgQEAgc3RhdGljIGludCBzdG0zMl9mbWMyX2hhbV9jYWxj
dWxhdGUoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgY29uc3QgdTggKmRhdGEsCj4gPj4gICAJdTMy
IHNyLCBoZWNjcjsKPiA+PiAgIAlpbnQgcmV0OyAgCj4gPj4gICA+PiAtCXJldCA9IHJlYWRsX3Jl
bGF4ZWRfcG9sbF90aW1lb3V0KGZtYzItPmlvX2Jhc2UgKyBGTUMyX1NSLCAgCj4gPj4gLQkJCQkJ
IHNyLCBzciAmIEZNQzJfU1JfTldSRiwgMTAsCj4gPj4gLQkJCQkJIEZNQzJfVElNRU9VVF9NUyk7
Cj4gPj4gKwlyZXQgPSByZWFkbF9yZWxheGVkX3BvbGxfdGltZW91dF9hdG9taWMoZm1jMi0+aW9f
YmFzZSArIEZNQzJfU1IsCj4gPj4gKwkJCQkJCXNyLCBzciAmIEZNQzJfU1JfTldSRiwgMSwKPiA+
PiArCQkJCQkJMTAwMCAqIEZNQzJfVElNRU9VVF9NUyk7ICAKPiA+IAo+ID4gSXMgdGhlIF9hdG9t
aWMgc3VmZml4IG5lZWRlZCBoZXJlPyBJZiB5ZXMgaXQgd291bGQgZGVzZXJ2ZSBhIHNlcGFyYXRl
Cj4gPiBwYXRjaCB3aXRoIEZpeGVzL1N0YWJsZSB0YWdzLgo+ID4gICAKPiAKPiBJIGhhdmUgY3Vy
cmVudGx5IG5vdCBzZWVuIGFueSBpc3N1ZXMuIFNvLCBJIHdpbGwgcmVtb3ZlIHRoaXMgbW9kaWZp
Y2F0aW9uIGFzIHdlIHdpbGwgbW92ZSB0byByZWdtYXBfcmVhZF9wb2xsX3RpbWVvdXQgaW4gcGF0
Y2ggMTAuCj4gCj4gPj4gICAJaWYgKHJldCkgewo+ID4+ICAgCQlkZXZfZXJyKGZtYzItPmRldiwg
ImhhbSB0aW1lb3V0XG4iKTsKPiA+PiAgIAkJcmV0dXJuIHJldDsKPiA+PiBAQCAtMTMxNSw3ICsx
MzE0LDcgQEAgc3RhdGljIGludCBzdG0zMl9mbWMyX3dhaXRyZHkoc3RydWN0IG5hbmRfY2hpcCAq
Y2hpcCwgdW5zaWduZWQgbG9uZyB0aW1lb3V0X21zKQo+ID4+ICAgCS8qIENoZWNrIGlmIHRoZXJl
IGlzIG5vIHBlbmRpbmcgcmVxdWVzdHMgdG8gdGhlIE5BTkQgZmxhc2ggKi8KPiA+PiAgIAlpZiAo
cmVhZGxfcmVsYXhlZF9wb2xsX3RpbWVvdXRfYXRvbWljKGZtYzItPmlvX2Jhc2UgKyBGTUMyX1NS
LCBzciwKPiA+PiAgIAkJCQkJICAgICAgc3IgJiBGTUMyX1NSX05XUkYsIDEsCj4gPj4gLQkJCQkJ
ICAgICAgRk1DMl9USU1FT1VUX1VTKSkKPiA+PiArCQkJCQkgICAgICAxMDAwICogRk1DMl9USU1F
T1VUX01TKSkKPiA+PiAgIAkJZGV2X3dhcm4oZm1jMi0+ZGV2LCAiV2FpdHJkeSB0aW1lb3V0XG4i
KTsgIAo+ID4+ICAgPj4gICAJLyogV2FpdCB0V0IgYmVmb3JlIFIvQiMgc2lnbmFsIGlzIGxvdyAq
LyAgCj4gPiAKPiA+IFlvdSBjaGFuZ2UgdGhlIHRpbWVvdXRzIGZyb20gMW1zIHRvIDVzLgo+ID4g
Cj4gPiBNYXliZSA1cyBpcyBhIGxpdHRsZSBiaXQgdG9vIG11Y2ggSU1ITyBidXQgd2UgZG9uJ3Qg
cmVhbGx5IGNhcmUgYXMgdGhpcwo+ID4gaXMgYSB0aW1lb3V0LiBIb3dldmVyIDFtcyBpcyB0aWdo
dC4gSWYgeW91IGFyZSBjaGFuZ2luZyB0aGlzIHZhbHVlCj4gPiBiZWNhdXNlIGl0IHRyaWdnZXJz
IGVycm9yIChlZy4gd2hlbiB0aGUgbWFjaGluZSBpcyBsb2FkZWQpLCB0aGVuIGl0IGlzCj4gPiBh
IGZpeCBhbmQgc2hvdWxkIGFwcGVhciBsaWtlIGl0Lgo+ID4gCj4gPiBUaGFua3MsCj4gPiBNaXF1
w6hsCj4gPiAgIAo+IAo+IE5vIGVycm9ycyBjdXJyZW50bHkgaGFwcGVucy4KPiBEdXJpbmcgb3Vy
IHN0cmVzcyB0ZXN0cywgaW4gYSBvdmVybG9hZGVkIHN5c3RlbSwgd2UgaGF2ZSBzZWVuIHRoYXQg
d2UgY291bGQgYmUgY2xvc2UgdG8gMSBzZWNvbmQsIGV2ZW4gaWYgd2UgbmV2ZXIgbWV0IHRoaXMg
dmFsdWUuCj4gU28sIHRvIGJlIHNhZmUsIEkgaGF2ZSBzZXQgdGhpcyB0aW1lb3V0IHRvIDUgc2Vj
b25kcy4KPiBBcyBpdCBpcyBqdXN0IGEgdGltZW91dCB2YWx1ZSwgSSBoYXZlIG5vdCBzZWVuIGFu
eSBzaWRlIGVmZmVjdC4KPiBJIGFtIHVzaW5nIHRoZSBzYW1lIHRpbWVvdXQgY29uc3RhbnQgdG8g
YXZvaWQgdG8gaGF2ZSBvbmUgdGltZW91dCBwZXIgY2FzZXMuCgpTb21ldGhpbmcgaXMgd3Jvbmcg
aW4gbXkgbWluZDoKWW91IHNheSB5b3Ugb2JzZXJ2ZSBkZWxheXMgb2YgYWxtb3N0IHVwIHRvIDEg
c2Vjb25kLCBidXQgdGhlIHBvbGxpbmcKY3VycmVudGx5IGhhcHBlbnMgb24gMTAwMCB1cyA9IDFt
cywgZWl0aGVyIHlvdSBoYWQgdGltZW91dHMgb3IgSQptaXNyZWFkIHNvbWV0aGluZz8KClRoYW5r
cywKTWlxdcOobApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
