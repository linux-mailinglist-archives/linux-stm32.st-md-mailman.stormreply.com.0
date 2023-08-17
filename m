Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69971784742
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Aug 2023 18:25:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2AEACC6DD86;
	Tue, 22 Aug 2023 16:25:22 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 65499C6A5EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 08:34:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D571740007;
 Thu, 17 Aug 2023 08:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1692261287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7BF6h8GPK1HKwPQblEC4BrTzenLHp9nKopnnC/7OFI4=;
 b=mkAXKPfGKRDmwH0jRlMeFRcGqW8gaHB2vsewulwhhhOYbDDuWvvqvuev/QIHWcCCyAL72h
 AxBg9ZnUkAZRqu5JYHlmD/5TqedBwuVgOyfdzGIujvUvFQNXgGSWAOje07NeEq1MDryuW/
 PYvUp92GBcxFqKiKL+9YkMTMSvBkDZDKVYzF7rE3AqU+KWNcV8WR3duI6YPL2XZjlB7Sno
 L3E1yyGsqN4Cm1jqbwKUoGGSzhKcHYFlLeXKMCq1kbakNDlSwF2iSLu6heqxZ4xMpq75cP
 FrKxphMkKl0kQmRUH0Mx8/HKTzh6vbw+HjPNgG1jgSi9KYq0fPW/ClmJkacCzQ==
Date: Thu, 17 Aug 2023 10:34:44 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Li Zetao <lizetao1@huawei.com>
Message-ID: <20230817103444.521d087f@xps-13>
In-Reply-To: <20230817024509.3951629-8-lizetao1@huawei.com>
References: <20230817024509.3951629-1-lizetao1@huawei.com>
 <20230817024509.3951629-8-lizetao1@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-Mailman-Approved-At: Tue, 22 Aug 2023 16:24:59 +0000
Cc: vigneshr@ti.com, geert+renesas@glider.be, stefan@agner.ch,
 paul@crapouillou.net, linux-mtd@lists.infradead.org,
 christophe.leroy@csgroup.eu, jinpu.wang@ionos.com,
 linux-stm32@st-md-mailman.stormreply.com, heiko@sntech.de, robh@kernel.org,
 samuel@sholland.org, richard@nod.at, wens@csie.org, jernej.skrabec@gmail.com,
 tudor.ambarus@linaro.org, u.kleine-koenig@pengutronix.de,
 linux-sunxi@lists.linux.dev, frank.li@vivo.com,
 martin.blumenstingl@googlemail.com, yangyingliang@huawei.com, vz@mleia.com,
 rogerq@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 michal.simek@amd.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com, philmd@linaro.org,
 dmitry.torokhov@gmail.com, nicolas.ferre@microchip.com, michael@walle.cc,
 mcoquelin.stm32@gmail.com, pratyush@kernel.org
Subject: Re: [Linux-stm32] [PATCH -next 07/11] mtd: rawnand: mtk: Use helper
 function devm_clk_get_enabled()
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

SGkgTGksCgpsaXpldGFvMUBodWF3ZWkuY29tIHdyb3RlIG9uIFRodSwgMTcgQXVnIDIwMjMgMTA6
NDU6MDUgKzA4MDA6Cgo+IEFmdGVyIHRoZSBjb21taXQgN2VmOTY1MWU5NzkyICgiY2xrOiBQcm92
aWRlIG5ldyBkZXZtX2NsayBoZWxwZXJzIGZvcgo+IHByZXBhcmVkIGFuZCBlbmFibGVkIGNsb2Nr
cyIpLCBpdCBjYW4gcmVwbGFjZSB0aGUgcGFpciBvZiBmdW5jdGlvbnMsCj4gZGV2bV9jbGtfZ2V0
KCkgYW5kIGNsa19wcmVwYXJlX2VuYWJsZSgpIHdpdGggYSBzaW5nbGUgaGVscGVyIGZ1bmN0aW9u
Cj4gZGV2bV9jbGtfZ2V0X2VuYWJsZWQoKS4gTW9yZW92ZXIsIHRoZSBkcml2ZXIgd2lsbCBrZWVw
cyBhIGNsb2NrIHByZXBhcmVkCj4gKG9yIGVuYWJsZWQpIGR1cmluZyB0aGUgd2hvbGUgbGlmZXRp
bWUgb2YgdGhlIGRyaXZlciwgaXQgaXMgdW5uZWNlc3NhcnkgdG8KPiB1bnByZXBhcmUgYW5kIGRp
c2FibGUgY2xvY2sgZXhwbGljaXRseSB3aGVuIHJlbW92ZSBkcml2ZXIgb3IgaW4gdGhlIGVycm9y
Cj4gaGFuZGxpbmcgcGF0aC4gVGhlIG10a19uZmNfZW5hYmxlX2NsaygpIGlzIGEgaGVscGVyIGZ1
bmN0aW9uIHRoYXQgZW5hYmxlcwo+IHRoZSAiY2xrLT5uZmlfY2xrIiBhbmQgImNsay0+cGFkX2Ns
ayIsIGl0IGNhbiBiZSBjb21iaW5lZCBpbnRvCj4gZGV2bV9jbGtfZ2V0X2VuYWJsZWQoKS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBMaSBaZXRhbyA8bGl6ZXRhbzFAaHVhd2VpLmNvbT4KPiAtLS0KPiAg
ZHJpdmVycy9tdGQvbmFuZC9yYXcvbXRrX25hbmQuYyB8IDIwICsrKysrKy0tLS0tLS0tLS0tLS0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tdGtfbmFuZC5jIGIvZHJpdmVycy9t
dGQvbmFuZC9yYXcvbXRrX25hbmQuYwo+IGluZGV4IGI2ZWI4Y2I2YjVlOS4uMGQxODVlNjUwYWFm
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L210a19uYW5kLmMKPiArKysgYi9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9tdGtfbmFuZC5jCj4gQEAgLTE1NDUsNDAgKzE1NDUsMzYgQEAg
c3RhdGljIGludCBtdGtfbmZjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4g
IAkJZ290byByZWxlYXNlX2VjYzsKPiAgCX0KPiAgCj4gLQluZmMtPmNsay5uZmlfY2xrID0gZGV2
bV9jbGtfZ2V0KGRldiwgIm5maV9jbGsiKTsKPiArCW5mYy0+Y2xrLm5maV9jbGsgPSBkZXZtX2Ns
a19nZXRfZW5hYmxlZChkZXYsICJuZmlfY2xrIik7Cj4gIAlpZiAoSVNfRVJSKG5mYy0+Y2xrLm5m
aV9jbGspKSB7Cj4gIAkJZGV2X2VycihkZXYsICJubyBjbGtcbiIpOwo+ICAJCXJldCA9IFBUUl9F
UlIobmZjLT5jbGsubmZpX2Nsayk7Cj4gIAkJZ290byByZWxlYXNlX2VjYzsKPiAgCX0KPiAgCj4g
LQluZmMtPmNsay5wYWRfY2xrID0gZGV2bV9jbGtfZ2V0KGRldiwgInBhZF9jbGsiKTsKPiArCW5m
Yy0+Y2xrLnBhZF9jbGsgPSBkZXZtX2Nsa19nZXRfZW5hYmxlZChkZXYsICJwYWRfY2xrIik7Cj4g
IAlpZiAoSVNfRVJSKG5mYy0+Y2xrLnBhZF9jbGspKSB7Cj4gIAkJZGV2X2VycihkZXYsICJubyBw
YWQgY2xrXG4iKTsKPiAgCQlyZXQgPSBQVFJfRVJSKG5mYy0+Y2xrLnBhZF9jbGspOwo+ICAJCWdv
dG8gcmVsZWFzZV9lY2M7Cj4gIAl9Cj4gIAo+IC0JcmV0ID0gbXRrX25mY19lbmFibGVfY2xrKGRl
diwgJm5mYy0+Y2xrKTsKPiAtCWlmIChyZXQpCj4gLQkJZ290byByZWxlYXNlX2VjYzsKPiAtCj4g
IAlpcnEgPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYsIDApOwo+ICAJaWYgKGlycSA8IDApIHsKPiAg
CQlyZXQgPSAtRUlOVkFMOwo+IC0JCWdvdG8gY2xrX2Rpc2FibGU7Cj4gKwkJZ290byByZWxlYXNl
X2VjYzsKPiAgCX0KPiAgCj4gIAlyZXQgPSBkZXZtX3JlcXVlc3RfaXJxKGRldiwgaXJxLCBtdGtf
bmZjX2lycSwgMHgwLCAibXRrLW5hbmQiLCBuZmMpOwo+ICAJaWYgKHJldCkgewo+ICAJCWRldl9l
cnIoZGV2LCAiZmFpbGVkIHRvIHJlcXVlc3QgbmZpIGlycVxuIik7Cj4gLQkJZ290byBjbGtfZGlz
YWJsZTsKPiArCQlnb3RvIHJlbGVhc2VfZWNjOwo+ICAJfQo+ICAKPiAgCXJldCA9IGRtYV9zZXRf
bWFzayhkZXYsIERNQV9CSVRfTUFTSygzMikpOwo+ICAJaWYgKHJldCkgewo+ICAJCWRldl9lcnIo
ZGV2LCAiZmFpbGVkIHRvIHNldCBkbWEgbWFza1xuIik7Cj4gLQkJZ290byBjbGtfZGlzYWJsZTsK
PiArCQlnb3RvIHJlbGVhc2VfZWNjOwo+ICAJfQo+ICAKPiAgCXBsYXRmb3JtX3NldF9kcnZkYXRh
KHBkZXYsIG5mYyk7Cj4gQEAgLTE1ODYsMTQgKzE1ODIsMTEgQEAgc3RhdGljIGludCBtdGtfbmZj
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAlyZXQgPSBtdGtfbmZjX25h
bmRfY2hpcHNfaW5pdChkZXYsIG5mYyk7Cj4gIAlpZiAocmV0KSB7Cj4gIAkJZGV2X2VycihkZXYs
ICJmYWlsZWQgdG8gaW5pdCBuYW5kIGNoaXBzXG4iKTsKPiAtCQlnb3RvIGNsa19kaXNhYmxlOwo+
ICsJCWdvdG8gcmVsZWFzZV9lY2M7Cj4gIAl9Cj4gIAo+ICAJcmV0dXJuIDA7Cj4gIAo+IC1jbGtf
ZGlzYWJsZToKPiAtCW10a19uZmNfZGlzYWJsZV9jbGsoJm5mYy0+Y2xrKTsKPiAtCj4gIHJlbGVh
c2VfZWNjOgo+ICAJbXRrX2VjY19yZWxlYXNlKG5mYy0+ZWNjKTsKPiAgCj4gQEAgLTE2MTgsNyAr
MTYxMSw2IEBAIHN0YXRpYyB2b2lkIG10a19uZmNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpCj4gIAl9Cj4gIAo+ICAJbXRrX2VjY19yZWxlYXNlKG5mYy0+ZWNjKTsKPiAtCW10
a19uZmNfZGlzYWJsZV9jbGsoJm5mYy0+Y2xrKTsKCm10a19uZmNfZGlzYWJsZV9jbGsoKSBub3cg
aGFzIGEgc2luZ2xlIHVzZXIsIHdoaWNoIGlzIHRoZSBzdXNwZW5kCmNhbGxiYWNrLiBUaGlzIGNh
bGxiYWNrIGRvZXMgbm90aGluZyBlbHNlIHRoYW4gY2FsbGluZwptdGtfbmZzX2Rpc2FibGVfY2xr
KCkuIENhbiB5b3UgcGxlYXNlIGRyb3AgdGhlIGhlbHBlciBhbmQganVzdCBtb3ZlIHRoZQp0d28g
bGluZXMgaW4gdGhlIHN1c3BlbmQgZnVuY3Rpb24/Cgo+ICB9Cj4gIAo+ICAjaWZkZWYgQ09ORklH
X1BNX1NMRUVQCgoKVGhhbmtzLApNaXF1w6hsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
