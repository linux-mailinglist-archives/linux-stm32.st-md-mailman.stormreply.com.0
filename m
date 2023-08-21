Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8D078476B
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Aug 2023 18:26:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7FE33C7801E;
	Tue, 22 Aug 2023 16:26:17 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F910C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 07:38:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 792C92000D;
 Mon, 21 Aug 2023 07:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1692603510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QK3U5LxVPsGAtMpHf99XsK3RWiIrIgeXRCnQNtREf94=;
 b=IyoUAE5wemosA3+nhqaCdLSyUqJGm03o6EPOIsUaupaO3ylJcHnZcxVlzE28kcX6ITK8ps
 Q0GeWeku+SYHd79w95phK1UTiaNVU5WOXmzxa42AxM2sDqj+vQR4l1ZEyzOf6jjcIR0M08
 OMrHgLhJRxvMnne+/++Yzq9UhGGGXrwdAccc2BP7u8Xf/Jq0aE/YP2t8XNsBODbHvlZav5
 K4sbqPdJrty/sW4PyokWyo5vxNckSq8L9myGxdqKFLmPAdj4obA3kUGVKwMoXMSglds/3w
 NUOaYoMwyelaAgmYJxInrAKqam37BJWfbQ9zq3ghDmRcbt/a7EojbJOW77vC8w==
Date: Mon, 21 Aug 2023 09:38:25 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Li Zetao <lizetao1@huawei.com>
Message-ID: <20230821093825.22280e33@xps-13>
In-Reply-To: <20230821031737.1973183-12-lizetao1@huawei.com>
References: <20230818101004.4f2cd343@xps-13>
 <20230821031737.1973183-1-lizetao1@huawei.com>
 <20230821031737.1973183-12-lizetao1@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-Mailman-Approved-At: Tue, 22 Aug 2023 16:24:59 +0000
Cc: heiko@sntech.de, geert+renesas@glider.be, stefan@agner.ch,
 paul@crapouillou.net, linux-mtd@lists.infradead.org, jernej.skrabec@gmail.com,
 jinpu.wang@ionos.com, linux-stm32@st-md-mailman.stormreply.com,
 vigneshr@ti.com, robh@kernel.org, samuel@sholland.org, richard@nod.at,
 wens@csie.org, christophe.leroy@csgroup.eu, tudor.ambarus@linaro.org,
 u.kleine-koenig@pengutronix.de, linux-sunxi@lists.linux.dev, frank.li@vivo.com,
 martin.blumenstingl@googlemail.com, yangyingliang@huawei.com, vz@mleia.com,
 rogerq@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 michal.simek@amd.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com, philmd@linaro.org,
 dmitry.torokhov@gmail.com, michael@walle.cc, mcoquelin.stm32@gmail.com,
 pratyush@kernel.org
Subject: Re: [Linux-stm32] [PATCH -next v3 11/12] mtd: spi-nor: nxp-spifi:
 Use helper function devm_clk_get_enabled()
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

SGkgVHVkb3IsCgpsaXpldGFvMUBodWF3ZWkuY29tIHdyb3RlIG9uIE1vbiwgMjEgQXVnIDIwMjMg
MTE6MTc6MzYgKzA4MDA6Cgo+IFNpbmNlIGNvbW1pdCA3ZWY5NjUxZTk3OTIgKCJjbGs6IFByb3Zp
ZGUgbmV3IGRldm1fY2xrIGhlbHBlcnMgZm9yIHByZXBhcmVkCj4gYW5kIGVuYWJsZWQgY2xvY2tz
IiksIGRldm1fY2xrX2dldCgpIGFuZCBjbGtfcHJlcGFyZV9lbmFibGUoKSBjYW4gbm93IGJlCj4g
cmVwbGFjZWQgYnkgZGV2bV9jbGtfZ2V0X2VuYWJsZWQoKSB3aGVuIGRyaXZlciBlbmFibGVzIChh
bmQgcG9zc2libHkKPiBwcmVwYXJlcykgdGhlIGNsb2NrcyBmb3IgdGhlIHdob2xlIGxpZmV0aW1l
IG9mIHRoZSBkZXZpY2UuIE1vcmVvdmVyLCBpdCBpcwo+IG5vIGxvbmdlciBuZWNlc3NhcnkgdG8g
dW5wcmVwYXJlIGFuZCBkaXNhYmxlIHRoZSBjbG9ja3MgZXhwbGljaXRseSwgc28gZHJvcAo+IHRo
ZSBsYWJlbCAiZGlzX2Nsa3MiIGFuZCAiZGlzX2Nsa19yZWciLgoKVGhpcyBwYXRjaCBzZWVtcyB2
ZXJ5IHNpbXBsZSwgZG8geW91IG1pbmQgaWYgSSBhcHBseSBpdCBkaXJlY3RseSBpbnRvCm10ZC9u
ZXh0IGZvciB0aGUgbmV4dCBQUj8KClRoYW5rcywKTWlxdcOobAoKPiBSZXZpZXdlZC1ieTogTWlx
dWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBM
aSBaZXRhbyA8bGl6ZXRhbzFAaHVhd2VpLmNvbT4KPiAtLS0KPiB2MiAtPiB2MzogTW9kaWZ5IHRo
ZSBzeW50YXggZXJyb3IgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLgo+IHYyOiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9hbGwvMjAyMzA4MTgwNzQ2NDIuMzA4MTY2LTEyLWxpemV0YW8xQGh1YXdlaS5j
b20vCj4gdjEgLT4gdjI6IE1vZGlmeSBjb21taXQgbWVzc2FnZS4KPiB2MTogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvYWxsLzIwMjMwODE3MDI0NTA5LjM5NTE2MjktMTItbGl6ZXRhbzFAaHVhd2Vp
LmNvbS8KPiAKPiAgZHJpdmVycy9tdGQvc3BpLW5vci9jb250cm9sbGVycy9ueHAtc3BpZmkuYyB8
IDMzICsrKystLS0tLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspLCAyNyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5v
ci9jb250cm9sbGVycy9ueHAtc3BpZmkuYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29udHJvbGxl
cnMvbnhwLXNwaWZpLmMKPiBpbmRleCAzMzdlODNiZjMzNjIuLjVkOGY0N2FiMTQ2ZiAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL2NvbnRyb2xsZXJzL254cC1zcGlmaS5jCj4gKysr
IGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb250cm9sbGVycy9ueHAtc3BpZmkuYwo+IEBAIC0zOTQs
MzAgKzM5NCwxOCBAQCBzdGF0aWMgaW50IG54cF9zcGlmaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQo+ICAJaWYgKElTX0VSUihzcGlmaS0+Zmxhc2hfYmFzZSkpCj4gIAkJcmV0
dXJuIFBUUl9FUlIoc3BpZmktPmZsYXNoX2Jhc2UpOwo+ICAKPiAtCXNwaWZpLT5jbGtfc3BpZmkg
PSBkZXZtX2Nsa19nZXQoJnBkZXYtPmRldiwgInNwaWZpIik7Cj4gKwlzcGlmaS0+Y2xrX3NwaWZp
ID0gZGV2bV9jbGtfZ2V0X2VuYWJsZWQoJnBkZXYtPmRldiwgInNwaWZpIik7Cj4gIAlpZiAoSVNf
RVJSKHNwaWZpLT5jbGtfc3BpZmkpKSB7Cj4gLQkJZGV2X2VycigmcGRldi0+ZGV2LCAic3BpZmkg
Y2xvY2sgbm90IGZvdW5kXG4iKTsKPiArCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJzcGlmaSBjbG9j
ayBub3QgZm91bmQgb3IgdW5hYmxlIHRvIGVuYWJsZVxuIik7Cj4gIAkJcmV0dXJuIFBUUl9FUlIo
c3BpZmktPmNsa19zcGlmaSk7Cj4gIAl9Cj4gIAo+IC0Jc3BpZmktPmNsa19yZWcgPSBkZXZtX2Ns
a19nZXQoJnBkZXYtPmRldiwgInJlZyIpOwo+ICsJc3BpZmktPmNsa19yZWcgPSBkZXZtX2Nsa19n
ZXRfZW5hYmxlZCgmcGRldi0+ZGV2LCAicmVnIik7Cj4gIAlpZiAoSVNfRVJSKHNwaWZpLT5jbGtf
cmVnKSkgewo+IC0JCWRldl9lcnIoJnBkZXYtPmRldiwgInJlZyBjbG9jayBub3QgZm91bmRcbiIp
Owo+ICsJCWRldl9lcnIoJnBkZXYtPmRldiwgInJlZyBjbG9jayBub3QgZm91bmQgb3IgdW5hYmxl
IHRvIGVuYWJsZVxuIik7Cj4gIAkJcmV0dXJuIFBUUl9FUlIoc3BpZmktPmNsa19yZWcpOwo+ICAJ
fQo+ICAKPiAtCXJldCA9IGNsa19wcmVwYXJlX2VuYWJsZShzcGlmaS0+Y2xrX3JlZyk7Cj4gLQlp
ZiAocmV0KSB7Cj4gLQkJZGV2X2VycigmcGRldi0+ZGV2LCAidW5hYmxlIHRvIGVuYWJsZSByZWcg
Y2xvY2tcbiIpOwo+IC0JCXJldHVybiByZXQ7Cj4gLQl9Cj4gLQo+IC0JcmV0ID0gY2xrX3ByZXBh
cmVfZW5hYmxlKHNwaWZpLT5jbGtfc3BpZmkpOwo+IC0JaWYgKHJldCkgewo+IC0JCWRldl9lcnIo
JnBkZXYtPmRldiwgInVuYWJsZSB0byBlbmFibGUgc3BpZmkgY2xvY2tcbiIpOwo+IC0JCWdvdG8g
ZGlzX2Nsa19yZWc7Cj4gLQl9Cj4gLQo+ICAJc3BpZmktPmRldiA9ICZwZGV2LT5kZXY7Cj4gIAlw
bGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBzcGlmaSk7Cj4gIAo+IEBAIC00MzAsMjQgKzQxOCwx
NyBAQCBzdGF0aWMgaW50IG54cF9zcGlmaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQo+ICAJZmxhc2hfbnAgPSBvZl9nZXRfbmV4dF9hdmFpbGFibGVfY2hpbGQocGRldi0+ZGV2
Lm9mX25vZGUsIE5VTEwpOwo+ICAJaWYgKCFmbGFzaF9ucCkgewo+ICAJCWRldl9lcnIoJnBkZXYt
PmRldiwgIm5vIFNQSSBmbGFzaCBkZXZpY2UgdG8gY29uZmlndXJlXG4iKTsKPiAtCQlyZXQgPSAt
RU5PREVWOwo+IC0JCWdvdG8gZGlzX2Nsa3M7Cj4gKwkJcmV0dXJuIC1FTk9ERVY7Cj4gIAl9Cj4g
IAo+ICAJcmV0ID0gbnhwX3NwaWZpX3NldHVwX2ZsYXNoKHNwaWZpLCBmbGFzaF9ucCk7Cj4gIAlv
Zl9ub2RlX3B1dChmbGFzaF9ucCk7Cj4gIAlpZiAocmV0KSB7Cj4gIAkJZGV2X2VycigmcGRldi0+
ZGV2LCAidW5hYmxlIHRvIHNldHVwIGZsYXNoIGNoaXBcbiIpOwo+IC0JCWdvdG8gZGlzX2Nsa3M7
Cj4gKwkJcmV0dXJuIHJldDsKPiAgCX0KPiAgCj4gIAlyZXR1cm4gMDsKPiAtCj4gLWRpc19jbGtz
Ogo+IC0JY2xrX2Rpc2FibGVfdW5wcmVwYXJlKHNwaWZpLT5jbGtfc3BpZmkpOwo+IC1kaXNfY2xr
X3JlZzoKPiAtCWNsa19kaXNhYmxlX3VucHJlcGFyZShzcGlmaS0+Y2xrX3JlZyk7Cj4gLQlyZXR1
cm4gcmV0Owo+ICB9Cj4gIAo+ICBzdGF0aWMgaW50IG54cF9zcGlmaV9yZW1vdmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikKPiBAQCAtNDU1LDggKzQzNiw2IEBAIHN0YXRpYyBpbnQgbnhw
X3NwaWZpX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJc3RydWN0IG54
cF9zcGlmaSAqc3BpZmkgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsKPiAgCj4gIAltdGRf
ZGV2aWNlX3VucmVnaXN0ZXIoJnNwaWZpLT5ub3IubXRkKTsKPiAtCWNsa19kaXNhYmxlX3VucHJl
cGFyZShzcGlmaS0+Y2xrX3NwaWZpKTsKPiAtCWNsa19kaXNhYmxlX3VucHJlcGFyZShzcGlmaS0+
Y2xrX3JlZyk7Cj4gIAo+ICAJcmV0dXJuIDA7Cj4gIH0KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
