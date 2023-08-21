Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D221E78476C
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Aug 2023 18:26:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A594C78021;
	Tue, 22 Aug 2023 16:26:17 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8D70C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 07:54:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7635840005;
 Mon, 21 Aug 2023 07:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1692604463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i+g2kGOBzDKIkQEMz+5a35V4YETSzQ5TABcO8d37tkY=;
 b=e6TJ8JFxedqGlPsXUusWjKkr3z72B+pv1khOZOKYpRv1ROEOVD3qqAc+rJt/vHqikAAa4U
 TkcBiBN5tg9aQtzGapIkSvUjOA2s0Q5rdj/vUIOKVnzm+k7RPK0UNDjtDxV14NhbW1triP
 a7l0o6bGyOGT65J9F9/kJz/rZbJbAkSTrO1XUeXm/ioQ9fbbiwfnR24fmqEJxdK4kxHW+X
 wqMbFeEViqDukrDtclTwjLKrRFwQKMG5jNMrERk6wHkaIY66YDu8fZ/j6Wkj60uIgo9ShA
 cy7K3K5aaXJEpZc+7VtCmaQrXjGCu56nkVVZJ+7DpFww7QmRAO9rBx6Za4L6SA==
Date: Mon, 21 Aug 2023 09:54:17 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Li Zetao <lizetao1@huawei.com>
Message-ID: <20230821095417.121990be@xps-13>
In-Reply-To: <20230821093825.22280e33@xps-13>
References: <20230818101004.4f2cd343@xps-13>
 <20230821031737.1973183-1-lizetao1@huawei.com>
 <20230821031737.1973183-12-lizetao1@huawei.com>
 <20230821093825.22280e33@xps-13>
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

SGkgYWdhaW4sCgptaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tIHdyb3RlIG9uIE1vbiwgMjEgQXVn
IDIwMjMgMDk6Mzg6MjUgKzAyMDA6Cgo+IEhpIFR1ZG9yLAo+IAo+IGxpemV0YW8xQGh1YXdlaS5j
b20gd3JvdGUgb24gTW9uLCAyMSBBdWcgMjAyMyAxMToxNzozNiArMDgwMDoKPiAKPiA+IFNpbmNl
IGNvbW1pdCA3ZWY5NjUxZTk3OTIgKCJjbGs6IFByb3ZpZGUgbmV3IGRldm1fY2xrIGhlbHBlcnMg
Zm9yIHByZXBhcmVkCj4gPiBhbmQgZW5hYmxlZCBjbG9ja3MiKSwgZGV2bV9jbGtfZ2V0KCkgYW5k
IGNsa19wcmVwYXJlX2VuYWJsZSgpIGNhbiBub3cgYmUKPiA+IHJlcGxhY2VkIGJ5IGRldm1fY2xr
X2dldF9lbmFibGVkKCkgd2hlbiBkcml2ZXIgZW5hYmxlcyAoYW5kIHBvc3NpYmx5Cj4gPiBwcmVw
YXJlcykgdGhlIGNsb2NrcyBmb3IgdGhlIHdob2xlIGxpZmV0aW1lIG9mIHRoZSBkZXZpY2UuIE1v
cmVvdmVyLCBpdCBpcwo+ID4gbm8gbG9uZ2VyIG5lY2Vzc2FyeSB0byB1bnByZXBhcmUgYW5kIGRp
c2FibGUgdGhlIGNsb2NrcyBleHBsaWNpdGx5LCBzbyBkcm9wCj4gPiB0aGUgbGFiZWwgImRpc19j
bGtzIiBhbmQgImRpc19jbGtfcmVnIi4gIAo+IAo+IFRoaXMgcGF0Y2ggc2VlbXMgdmVyeSBzaW1w
bGUsIGRvIHlvdSBtaW5kIGlmIEkgYXBwbHkgaXQgZGlyZWN0bHkgaW50bwo+IG10ZC9uZXh0IGZv
ciB0aGUgbmV4dCBQUj8KCkkgc2VlIHlvdSBhbHJlYWR5IHRvb2sgdGhhdCBvbmUsIHBlcmZlY3Qg
Oy0pIFNvcnJ5IGZvciB0aGUgbm9pc2UuCgpUaGFua3MsCk1pcXXDqGwKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
