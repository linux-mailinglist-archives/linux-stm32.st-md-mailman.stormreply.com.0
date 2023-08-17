Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 57318784741
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Aug 2023 18:25:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1562BC6DD82;
	Tue, 22 Aug 2023 16:25:22 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB2C9C6B45F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 08:31:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6CCEE4000A;
 Thu, 17 Aug 2023 08:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1692261076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k2QxWcxDz8QQBaIieB3TDIKnaV/ESQiBsBWpBtPRVn4=;
 b=bdxpozFFU2fFnkkE/B1UBT1L01BP5ilQfq/KnE+ll1iBe/bzno0lYwYLgLmnJNgZl2sVSN
 Skfda1ztjNvDBOu6T7OZiwR89oxJNMTNwM7CNVP9ybRCDHoVlkf3jPzYl8FDRGPl3LRX4s
 a5D8NTXoQ6sSSGikstvoTUHuRHacCAOg464MHwIfYi3V4qsECjzeXKikZ0Po2DW6Kpuxrd
 gV3WmERdYPFr1PLqVZK5nK4RG2hh+ydk43QWDEzyEoqz60zM6DaeOyukH4w4l0n25b2VhS
 smob/G8UnizyJVXDGKl3DfwMenc4hpxZjwBljYoeb21ZIiDy9byizHu54mINbA==
Date: Thu, 17 Aug 2023 10:31:10 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Li Zetao <lizetao1@huawei.com>
Message-ID: <20230817103110.2042d4ff@xps-13>
In-Reply-To: <20230817024509.3951629-4-lizetao1@huawei.com>
References: <20230817024509.3951629-1-lizetao1@huawei.com>
 <20230817024509.3951629-4-lizetao1@huawei.com>
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
Subject: Re: [Linux-stm32] [PATCH -next 03/11] mtd: rawnand: fsmc: Use
 helper function devm_clk_get_enabled()
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
NDU6MDEgKzA4MDA6CgpBIGZldyBuaXRzIGZvciBhbGwgeW91ciBjb21taXQgbG9ncyBhc2lkZSBm
cm9tIGEgY29tbWVudCBiZWxvdzoKCj4gQWZ0ZXIgdGhlIGNvbW1pdCA3ZWY5NjUxZTk3OTIgKCJj
bGs6IFByb3ZpZGUgbmV3IGRldm1fY2xrIGhlbHBlcnMgZm9yCgogIFNpbmNlIGNvbW1pdAoKPiBw
cmVwYXJlZCBhbmQgZW5hYmxlZCBjbG9ja3MiKSwgaXQgY2FuIHJlcGxhY2UgdGhlIHBhaXIgb2Yg
ZnVuY3Rpb25zLAoKCQkJICAgICAgICwgZGV2bV9jbGtfZ2V0KCkgYW5kIGNsa19wcmVwYXJlX2Vu
YWJsZSgpIAogIGNhbiBub3cgYmUgcmVwbGFjZWQgYnkgZGV2bV9jbGtfZ2V0X2VuYWJsZWQoKSB3
aGVuIGRyaXZlciBlbmFibGUgKGFuZAogIHBvc3NpYmx5IHByZXBhcmUpIHRoZSBjbG9ja3MgZm9y
IHRoZSB3aG9sZSBsaWZldGltZSBvZiB0aGUgZGV2aWNlLgoKPiBkZXZtX2Nsa19nZXQoKSBhbmQg
Y2xrX3ByZXBhcmVfZW5hYmxlKCkgd2l0aCBhIHNpbmdsZSBoZWxwZXIgZnVuY3Rpb24KPiBkZXZt
X2Nsa19nZXRfZW5hYmxlZCgpLiBNb3Jlb3ZlciwgdGhlIGRyaXZlciB3aWxsIGtlZXBzIGEgY2xv
Y2sgcHJlcGFyZWQKPiAob3IgZW5hYmxlZCkgZHVyaW5nIHRoZSB3aG9sZSBsaWZldGltZSBvZiB0
aGUgZHJpdmVyLCBpdCBpcyB1bm5lY2Vzc2FyeSB0bwoKICBNb3Jlb3ZlciwgaXQgaXMgbm8gbG9u
Z2VyIG5lY2Vzc2FyeSB0byB1bnByZXBhcmUgYW5kIGRpc2FibGUgdGhlIGNsb2NrCiAgZXhwbGlj
aXRseS4KCj4gdW5wcmVwYXJlIGFuZCBkaXNhYmxlIGNsb2NrIGV4cGxpY2l0bHkgd2hlbiByZW1v
dmUgZHJpdmVyIG9yIGluIHRoZSBlcnJvcgo+IGhhbmRsaW5nIHBhdGguCj4gCj4gU2lnbmVkLW9m
Zi1ieTogTGkgWmV0YW8gPGxpemV0YW8xQGh1YXdlaS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbXRk
L25hbmQvcmF3L2ZzbWNfbmFuZC5jIHwgOCArLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDcgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRk
L25hbmQvcmF3L2ZzbWNfbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvZnNtY19uYW5kLmMK
PiBpbmRleCA3YjQ3NDI0MjBkZmMuLmFiMWI5YTVjOTNlOSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9mc21jX25hbmQuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2Zz
bWNfbmFuZC5jCgpbLi4uXQoKPiBAQCAtMTE1Nyw3ICsxMTUzLDYgQEAgc3RhdGljIGludCBfX2lu
aXQgZnNtY19uYW5kX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAkJZG1h
X3JlbGVhc2VfY2hhbm5lbChob3N0LT5yZWFkX2RtYV9jaGFuKTsKPiAgZGlzYWJsZV9jbGs6CgpU
aGlzIGxhYmVsIG5vIGxvbmdlciBtYWtlcyBzZW5zZSwgcGxlYXNlIHJlbmFtZSBpdCB0byAiZGlz
YWJsZV9mc21jIiBvcgpzb21ldGhpbmcgbGlrZSB0aGF0LgoKPiAgCWZzbWNfbmFuZF9kaXNhYmxl
KGhvc3QpOwo+IC0JY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGhvc3QtPmNsayk7Cj4gIAo+ICAJcmV0
dXJuIHJldDsKPiAgfQoKVGhhbmtzLApNaXF1w6hsCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
