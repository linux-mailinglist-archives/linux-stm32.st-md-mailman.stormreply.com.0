Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A91784755
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Aug 2023 18:26:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0505C71288;
	Tue, 22 Aug 2023 16:26:15 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A8CEC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Aug 2023 08:12:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E2973FF803;
 Fri, 18 Aug 2023 08:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1692346367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mzCVM+bK0VlZhouGuHfDfVW0KdhBecM197MixCtRvfQ=;
 b=Jmp83XkDTC2MO6piwR/S+JMNYHW0Y17nyiWqjHmyKqLeJqK0dnwSYn4/4EZ8nhuwB95D6l
 DK6mzVDiQeV2or5bZ/qCdESjI+eJ0d5I35Y4K+n1kp7aV0dBDct1+0GnUjTinv72HIAIuJ
 GXIKPdqOkWIdD19loGNKnSoo5AKAzWMX+58BKdjhkYcEZeQI9RFkgdggJNxO8z27J43LKK
 ztYe9QtVJymUiC+HoooqV10fY6+WTU0F2yUV3rd5jWJpzak1WbkF1rSa4beE/zB0TIv1ad
 +StZn7GOnXF/njiTIb/fCXUqwnHVKZyH3c7ML+WKoXdBACeSHBlBedQMaOaVMw==
Date: Fri, 18 Aug 2023 10:12:42 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Li Zetao <lizetao1@huawei.com>
Message-ID: <20230818101242.12f54b5d@xps-13>
In-Reply-To: <20230818101004.4f2cd343@xps-13>
References: <20230817024509.3951629-1-lizetao1@huawei.com>
 <20230818074642.308166-1-lizetao1@huawei.com>
 <20230818074642.308166-3-lizetao1@huawei.com>
 <20230818101004.4f2cd343@xps-13>
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

Cm1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20gd3JvdGUgb24gRnJpLCAxOCBBdWcgMjAyMyAxMDox
MDowNCArMDIwMDoKCj4gSGkgTGksCj4gCj4gbGl6ZXRhbzFAaHVhd2VpLmNvbSB3cm90ZSBvbiBG
cmksIDE4IEF1ZyAyMDIzIDE1OjQ2OjMyICswODAwOgo+IAo+ID4gU2luY2UgY29tbWl0IDdlZjk2
NTFlOTc5MiAoImNsazogUHJvdmlkZSBuZXcgZGV2bV9jbGsgaGVscGVycyBmb3IgcHJlcGFyZWQK
PiA+IGFuZCBlbmFibGVkIGNsb2NrcyIpLCBkZXZtX2Nsa19nZXQoKSBhbmQgY2xrX3ByZXBhcmVf
ZW5hYmxlKCkgY2FuIG5vdyBiZSAgCj4gCj4gPiByZXBsYWNlZCBieSBkZXZtX2Nsa19nZXRfZW5h
YmxlZCgpIHdoZW4gZHJpdmVyIGVuYWJsZSAoYW5kIHBvc3NpYmx5ICAKPiAKPiBGb3IgYWxsIHRo
ZSBjb21taXQgbG9nczoJCSAgdGhlIGRyaXZlciBlbmFibGVzIChhbmQgcG9zc2libHkgcHJlcGFy
ZXMpCj4gCj4gPiBwcmVwYXJlKSB0aGUgY2xvY2tzIGZvciB0aGUgd2hvbGUgbGlmZXRpbWUgb2Yg
dGhlIGRldmljZS4gTW9yZW92ZXIsIGl0IGlzCj4gPiBubyBsb25nZXIgbmVjZXNzYXJ5IHRvIHVu
cHJlcGFyZSBhbmQgZGlzYWJsZSB0aGUgY2xvY2sgZXhwbGljaXRseSwgc28gZHJvcCAgCj4gCj4g
Rm9yIGFsbCB0aGUgY29tbWl0IGxvZ3M6CQkgICAgICAgdGhlIGNsb2Nrcwo+IAo+IFRoZSAiLHNv
IGRyb3AgdGhlIGxhYmVsIHh4eCIgaXMgbm90IG5lZWRlZCBJIGJlbGlldmUuCj4gCj4gPiB0aGUg
bGFiZWwgImRpc2FibGVfYnVzX2NsayIgYW5kICJkaXNhYmxlX2NvbnRyb2xsZXJfY2xrIi4KCkFj
dHVhbGx5IGl0IGRvZXMgbm90IGJvdGhlciwganVzdCBrZWVwIGl0LgoKPiA+IFNpZ25lZC1vZmYt
Ynk6IExpIFpldGFvIDxsaXpldGFvMUBodWF3ZWkuY29tPgo+ID4gLS0tICAKPiAKPiBUaGFua3Ms
Cj4gTWlxdcOobAoKClRoYW5rcywKTWlxdcOobApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
