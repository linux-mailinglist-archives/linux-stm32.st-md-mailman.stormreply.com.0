Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A93784753
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Aug 2023 18:26:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B332BC71285;
	Tue, 22 Aug 2023 16:26:14 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45079C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Aug 2023 08:10:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A4AEDC0006;
 Fri, 18 Aug 2023 08:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1692346210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wqOgD7ZoLrRwoPQ6qx0lOE1XYmfnede4CdcT9bV4Jsc=;
 b=DnB9JI4Ca7uwgiF0bvp+pcJaDAuqYCJFY4nlqFC5yPHpDNq3HQ4B2BO/O0jiugKRq+M5rS
 pHfQqN4xZ06WVRAIjE+lqx2jNgpH5a49WKKW/n+v2eHeZ+D7JBEoYxf3Y0EDEU4U89nTRV
 4YlnozEQRShzs8M472CrjUtXqqv/ns9UlZQhBoQEgM//jbhn+Hq3YhhfVzFahxMoKObu0w
 47MrHQXFEbxePXUDhEEvTjQvM9WvnWYk2mDmkCY7BiZ1PuPN+3yU9RgZWVp5g8Mnr+sg5S
 rEYfY8cWATOtHZFMNFs0jZUXnimcdlVD0joK56CH+QWcWbbm2jXtgFHq4AHd1Q==
Date: Fri, 18 Aug 2023 10:10:04 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Li Zetao <lizetao1@huawei.com>
Message-ID: <20230818101004.4f2cd343@xps-13>
In-Reply-To: <20230818074642.308166-3-lizetao1@huawei.com>
References: <20230817024509.3951629-1-lizetao1@huawei.com>
 <20230818074642.308166-1-lizetao1@huawei.com>
 <20230818074642.308166-3-lizetao1@huawei.com>
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
 dmitry.torokhov@gmail.com, nicolas.ferre@microchip.com, michael@walle.cc,
 mcoquelin.stm32@gmail.com, pratyush@kernel.org
Subject: Re: [Linux-stm32] [PATCH -next v2 02/12] mtd: rawnand: arasan: Use
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

SGkgTGksCgpsaXpldGFvMUBodWF3ZWkuY29tIHdyb3RlIG9uIEZyaSwgMTggQXVnIDIwMjMgMTU6
NDY6MzIgKzA4MDA6Cgo+IFNpbmNlIGNvbW1pdCA3ZWY5NjUxZTk3OTIgKCJjbGs6IFByb3ZpZGUg
bmV3IGRldm1fY2xrIGhlbHBlcnMgZm9yIHByZXBhcmVkCj4gYW5kIGVuYWJsZWQgY2xvY2tzIiks
IGRldm1fY2xrX2dldCgpIGFuZCBjbGtfcHJlcGFyZV9lbmFibGUoKSBjYW4gbm93IGJlCgo+IHJl
cGxhY2VkIGJ5IGRldm1fY2xrX2dldF9lbmFibGVkKCkgd2hlbiBkcml2ZXIgZW5hYmxlIChhbmQg
cG9zc2libHkKCkZvciBhbGwgdGhlIGNvbW1pdCBsb2dzOgkJICB0aGUgZHJpdmVyIGVuYWJsZXMg
KGFuZCBwb3NzaWJseSBwcmVwYXJlcykKCj4gcHJlcGFyZSkgdGhlIGNsb2NrcyBmb3IgdGhlIHdo
b2xlIGxpZmV0aW1lIG9mIHRoZSBkZXZpY2UuIE1vcmVvdmVyLCBpdCBpcwo+IG5vIGxvbmdlciBu
ZWNlc3NhcnkgdG8gdW5wcmVwYXJlIGFuZCBkaXNhYmxlIHRoZSBjbG9jayBleHBsaWNpdGx5LCBz
byBkcm9wCgpGb3IgYWxsIHRoZSBjb21taXQgbG9nczoJCSAgICAgICB0aGUgY2xvY2tzCgpUaGUg
IixzbyBkcm9wIHRoZSBsYWJlbCB4eHgiIGlzIG5vdCBuZWVkZWQgSSBiZWxpZXZlLgoKPiB0aGUg
bGFiZWwgImRpc2FibGVfYnVzX2NsayIgYW5kICJkaXNhYmxlX2NvbnRyb2xsZXJfY2xrIi4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBMaSBaZXRhbyA8bGl6ZXRhbzFAaHVhd2VpLmNvbT4KPiAtLS0KClRo
YW5rcywKTWlxdcOobApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
