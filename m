Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C190629FF8A
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Oct 2020 09:19:11 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79B1FC3FAD5;
	Fri, 30 Oct 2020 08:19:11 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B570C36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Oct 2020 08:19:10 +0000 (UTC)
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 1A09D200005;
 Fri, 30 Oct 2020 08:19:07 +0000 (UTC)
Date: Fri, 30 Oct 2020 09:19:05 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <20201030091905.111aa7a4@xps13>
In-Reply-To: <1603989492-6670-1-git-send-email-christophe.kerello@st.com>
References: <1603989492-6670-1-git-send-email-christophe.kerello@st.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: richard@nod.at, linux-stm32@st-md-mailman.stormreply.com,
 linux-mtd@lists.infradead.org, vigneshr@ti.com, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] mtd: rawnand: stm32_fmc2: fix broken ECC
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
LmNvbT4gd3JvdGUgb24gVGh1LCAyOSBPY3QKMjAyMCAxNzozODoxMiArMDEwMDoKCj4gU2luY2Ug
Y29tbWl0IGQ3MTU3ZmY0OWE1YiAoIm10ZDogcmF3bmFuZDogVXNlIHRoZSBFQ0MgZnJhbWV3b3Jr
IHVzZXIKPiBpbnB1dCBwYXJzaW5nIGJpdHMiKSwgRUNDIGFyZSBicm9rZW4gaW4gRk1DMiBkcml2
ZXIgaW4gY2FzZSBvZgo+IG5hbmQtZWNjLXN0ZXAtc2l6ZSBhbmQgbmFuZC1lY2Mtc3RyZW5ndGgg
YXJlIG5vdCBzZXQgaW4gdGhlIGRldmljZSB0cmVlLgo+IFRoZSBkZWZhdWx0IHVzZXIgY29uZmln
dXJhdGlvbiBzZXQgaW4gRk1DMiBkcml2ZXIgaXMgbG9zdCB3aGVuCj4gcmF3bmFuZF9kdF9pbml0
IGZ1bmN0aW9uIGlzIGNhbGxlZC4gVG8gYXZvaWQgdG8gbG9zZSB0aGUgZGVmYXVsdCB1c2VyCj4g
Y29uZmlndXJhdGlvbiwgaXQgaXMgbmVlZGVkIHRvIG1vdmUgaXQgaW4gdGhlIG5ldyB1c2VyX2Nv
bmYgc3RydWN0dXJlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgS2VyZWxsbyA8Y2hy
aXN0b3BoZS5rZXJlbGxvQHN0LmNvbT4KPiBGaXhlczogZDcxNTdmZjQ5YTViICgibXRkOiByYXdu
YW5kOiBVc2UgdGhlIEVDQyBmcmFtZXdvcmsgdXNlciBpbnB1dCBwYXJzaW5nIGJpdHMiKQo+IC0t
LQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYyB8IDggKysrKystLS0K
PiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvc3RtMzJfZm1jMl9uYW5kLmMgYi9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYwo+IGluZGV4IGIzMWE1ODEuLmRjODZh
YzkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvc3RtMzJfZm1jMl9uYW5kLmMK
PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYwo+IEBAIC0xODQ2
LDYgKzE4NDYsNyBAQCBzdGF0aWMgaW50IHN0bTMyX2ZtYzJfbmZjX3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAlzdHJ1Y3QgcmVzb3VyY2UgKnJlczsKPiAgCXN0cnVjdCBt
dGRfaW5mbyAqbXRkOwo+ICAJc3RydWN0IG5hbmRfY2hpcCAqY2hpcDsKPiArCXN0cnVjdCBuYW5k
X2RldmljZSAqbmFuZGRldjsKPiAgCXN0cnVjdCByZXNvdXJjZSBjcmVzOwo+ICAJaW50IGNoaXBf
Y3MsIG1lbV9yZWdpb24sIHJldCwgaXJxOwo+ICAJaW50IHN0YXJ0X3JlZ2lvbiA9IDA7Cj4gQEAg
LTE5NTIsMTAgKzE5NTMsMTEgQEAgc3RhdGljIGludCBzdG0zMl9mbWMyX25mY19wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJY2hpcC0+b3B0aW9ucyB8PSBOQU5EX0JVU1dJ
RFRIX0FVVE8gfCBOQU5EX05PX1NVQlBBR0VfV1JJVEUgfAo+ICAJCQkgTkFORF9VU0VTX0RNQTsK
PiAgCj4gLQkvKiBEZWZhdWx0IEVDQyBzZXR0aW5ncyAqLwo+ICsJLyogRGVmYXVsdCBFQ0MgdXNl
ciBzZXR0aW5ncyAqLwo+ICAJY2hpcC0+ZWNjLmVuZ2luZV90eXBlID0gTkFORF9FQ0NfRU5HSU5F
X1RZUEVfT05fSE9TVDsKPiAtCWNoaXAtPmVjYy5zaXplID0gRk1DMl9FQ0NfU1RFUF9TSVpFOwo+
IC0JY2hpcC0+ZWNjLnN0cmVuZ3RoID0gRk1DMl9FQ0NfQkNIODsKPiArCW5hbmRkZXYgPSBtdGRf
dG9fbmFuZGRldihtdGQpOwo+ICsJbmFuZGRldi0+ZWNjLnVzZXJfY29uZi5zdGVwX3NpemUgPSBG
TUMyX0VDQ19TVEVQX1NJWkU7Cj4gKwluYW5kZGV2LT5lY2MudXNlcl9jb25mLnN0cmVuZ3RoID0g
Rk1DMl9FQ0NfQkNIODsKPiAgCj4gIAkvKiBTY2FuIHRvIGZpbmQgZXhpc3RlbmNlIG9mIHRoZSBk
ZXZpY2UgKi8KPiAgCXJldCA9IG5hbmRfc2NhbihjaGlwLCBuYW5kLT5uY3MpOwoKU29ycnkgZm9y
IGJyZWFraW5nIHRoZSBkcml2ZXIgd2l0aCB0aGlzIGNoYW5nZSwgYnV0IG5vdyBJIHRoaW5rIHdl
CnNob3VsZCBoYXZlIGFsbCBFQ0MgcmVsYXRlZCBiaXRzIGluIC0+YXR0YWNoKCkgaW5zdGVhZCBv
ZiAtPnByb2JlKCkuClRoZSAtPmF0dGFjaCgpIGhvb2sgaXMgY2FsbGVkIGR1cmluZyB0aGUgbmFu
ZF9zY2FuKCkgb3BlcmF0aW9uIGFuZCBhdAp0aGlzIHBvaW50IHRoZSBjaGlwJ3MgcmVxdWlyZW1l
bnRzL2xheW91dCBhcmUga25vd24gKG5vdCBiZWZvcmUpLiBJCmtub3cgdGhhdCBjZXJ0YWluIGNv
bnRyb2xsZXJzIGRvbid0IHJlYWxseSBjYXJlIGFib3V0IHRoYXQsIGhlcmUgeW91cgpzaW1wbHkg
aGFyZGNvZGUgdGhlc2UgdHdvIGZpZWxkcyBhbmQgeW91IGRvbid0IG5lZWQgdG8ga25vdyBhbnl0
aGluZwphYm91dCB0aGUgY2hpcCdzIHByb3BlcnRpZXMuIEJ1dCBhcyBhIGJpZCB0byBoYXJtb25p
emUgYWxsIGRyaXZlcnMgd2l0aAp0aGUgdGFyZ2V0IG9mIGEgZ2VuZXJpYyBFQ0MgZW5naW5lIGlu
IG1pbmQsIEkgdGhpbmsgaXQncyBub3cgdGltZSB0bwptb3ZlIHRoZXNlIHRocmVlIGxpbmVzIChj
aGlwLT5lY2MuKiA9IC4uLikgYXQgdGhlIHRvcCBvZiAtPmF0dGFjaCgpLgpBbHNvLCB0aGVzZSBm
aWVsZHMgc2hvdWxkIGhhdmUgYmVlbiBwb3B1bGF0ZWQgYnkgdGhlIGNvcmUgc28gcGVyaGFwcwp0
aGUgYmVzdCBhcHByb2FjaCBpcyB0byBjaGVjayBpZiB0aGUgdXNlciByZXF1aXJlbWVudHMgYXJl
IHN5bmNlZCB3aXRoCnRoZSBjb250cm9sbGVyJ3MgY2FwYWJpbGl0aWVzIGFuZCBlcnJvciBvdXQg
b3RoZXJ3aXNlPwoKV2UgcGxhbiB0byBzZW5kIGEgZml4ZXMgUFIgZm9yIC1yYzIsIGlmIHRoZSB2
MiBhcnJpdmVzIHRvZGF5IEknbGwKaW50ZWdyYXRlIGl0LgoKVGhhbmtzLApNaXF1w6hsCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
