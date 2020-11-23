Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B72F2C016F
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Nov 2020 09:33:53 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 452FDC56632;
	Mon, 23 Nov 2020 08:33:53 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8FAB9C56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Nov 2020 08:33:51 +0000 (UTC)
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 98158240006;
 Mon, 23 Nov 2020 08:33:48 +0000 (UTC)
Date: Mon, 23 Nov 2020 09:33:47 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Message-ID: <20201123093347.719a77cf@xps13>
In-Reply-To: <299d044a69b59eff2c733543b927aa608282a9a8.1605896060.git.gustavoars@kernel.org>
References: <cover.1605896059.git.gustavoars@kernel.org>
 <299d044a69b59eff2c733543b927aa608282a9a8.1605896060.git.gustavoars@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-hardening@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 104/141] mtd: rawnand: stm32_fmc2: Fix
 fall-through warnings for Clang
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

SGkgR3VzdGF2bywKCiJHdXN0YXZvIEEuIFIuIFNpbHZhIiA8Z3VzdGF2b2Fyc0BrZXJuZWwub3Jn
PiB3cm90ZSBvbiBGcmksIDIwIE5vdiAyMDIwCjEyOjM3OjQ4IC0wNjAwOgoKPiBJbiBwcmVwYXJh
dGlvbiB0byBlbmFibGUgLVdpbXBsaWNpdC1mYWxsdGhyb3VnaCBmb3IgQ2xhbmcsIGZpeCBhIGNv
dXBsZQo+IG9mIHdhcm5pbmdzIGJ5IGV4cGxpY2l0bHkgYWRkaW5nIGEgY291cGxlIG9mIGZhbGx0
aHJvdWdoIHBzZXVkby1rZXl3b3Jkcwo+IGluc3RlYWQgb2YgbGV0dGluZyB0aGUgY29kZSBmYWxs
IHRocm91Z2ggdG8gdGhlIG5leHQgY2FzZS4KPiAKPiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20v
S1NQUC9saW51eC9pc3N1ZXMvMTE1Cj4gU2lnbmVkLW9mZi1ieTogR3VzdGF2byBBLiBSLiBTaWx2
YSA8Z3VzdGF2b2Fyc0BrZXJuZWwub3JnPgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9z
dG0zMl9mbWMyX25hbmQuYyB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQu
YyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3N0bTMyX2ZtYzJfbmFuZC5jCj4gaW5kZXggNTUwYmRh
NGQxNDE1Li4wMDJmYTUyMTAzNmYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcv
c3RtMzJfZm1jMl9uYW5kLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMy
X25hbmQuYwo+IEBAIC01MzEsNiArNTMxLDcgQEAgc3RhdGljIGludCBzdG0zMl9mbWMyX25mY19o
YW1fY29ycmVjdChzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCB1OCAqZGF0LAo+ICAJCXN3aXRjaCAo
YiAlIDQpIHsKPiAgCQljYXNlIDI6Cj4gIAkJCWJpdF9wb3NpdGlvbiArPSBzaGlmdGluZzsKPiAr
CQkJZmFsbHRocm91Z2g7CgpJbiBwYXRjaCAxMDAsIDEwMSwgMTAyLCAxMDMgeW91ICdicmVhaycg
aW4gdGhpcyBjYXNlICh3aGVuIHRoZQpzdGF0ZW1lbnQgZmFsbHMgaW50byB0aGUgZW1wdHkgZm9s
bG93aW5nIHN0YXRlbWVudCB3aGljaCBpdHNlbGYKYnJlYWtzKS4gUGxlYXNlIG1ha2UgaXQgY29u
c2lzdGVudCBhbmQgdXNlIGJyZWFrIGhlcmUsIGJlbG93LCBhbmQgaW4KcGF0Y2ggMTMyLgoKTEdU
TSBvdGhlcndpc2UuCgo+ICAJCWNhc2UgMToKPiAgCQkJYnJlYWs7Cj4gIAkJZGVmYXVsdDoKPiBA
QCAtNTQ2LDYgKzU0Nyw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfZm1jMl9uZmNfaGFtX2NvcnJlY3Qo
c3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgdTggKmRhdCwKPiAgCQlzd2l0Y2ggKGIgJSA0KSB7Cj4g
IAkJY2FzZSAyOgo+ICAJCQlieXRlX2FkZHIgKz0gc2hpZnRpbmc7Cj4gKwkJCWZhbGx0aHJvdWdo
Owo+ICAJCWNhc2UgMToKPiAgCQkJYnJlYWs7Cj4gIAkJZGVmYXVsdDoKClRoYW5rcywKTWlxdcOo
bApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1z
dG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zdG0zMgo=
