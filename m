Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A66784754
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Aug 2023 18:26:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BFED0C71288;
	Tue, 22 Aug 2023 16:26:14 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D52F4C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Aug 2023 08:11:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2F8D1E0003;
 Fri, 18 Aug 2023 08:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1692346277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=20wNMj8fVoVyKhboSQHfoKHw647G9BheWqVVEyUS5uM=;
 b=E1kP1jnX29Q4qu4glrInautWz/RFHmzs5BNl+IerHY5vYL3V689QYZSLwGU3EW/Kj8mcTa
 MY+D3fgMG+MK5C1j4+xNmHyEgANAJi1Na5Syh9v4yUsJj71FyBGTcgDjSlynxglSMkgrhk
 QSq+PLzMOiHWIs8s4nI6ofe1I5XX0eZuv7nGJVhRniU+3RhgWwxSQESkuqPh9S8jkwHKMU
 fEZlgnpP5gP+gWcqvXHpywClkvqh8XMuNDsemLABP9mFuz+FOwuh/QuU/Fz2e8It0nhUF3
 /vwUryhfRLuFEHBth5h38xGCZ5eIWq8Uu70+nwW0kLYDz2hiF0Ttkun/IsrPDg==
Date: Fri, 18 Aug 2023 10:11:10 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Li Zetao <lizetao1@huawei.com>
Message-ID: <20230818101110.23fad57d@xps-13>
In-Reply-To: <20230818074642.308166-4-lizetao1@huawei.com>
References: <20230817024509.3951629-1-lizetao1@huawei.com>
 <20230818074642.308166-1-lizetao1@huawei.com>
 <20230818074642.308166-4-lizetao1@huawei.com>
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
Subject: Re: [Linux-stm32] [PATCH -next v2 03/12] mtd: rawnand: fsmc: Use
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
NDY6MzMgKzA4MDA6Cgo+IFNpbmNlIGNvbW1pdCA3ZWY5NjUxZTk3OTIgKCJjbGs6IFByb3ZpZGUg
bmV3IGRldm1fY2xrIGhlbHBlcnMgZm9yIHByZXBhcmVkCj4gYW5kIGVuYWJsZWQgY2xvY2tzIiks
IGRldm1fY2xrX2dldCgpIGFuZCBjbGtfcHJlcGFyZV9lbmFibGUoKSBjYW4gbm93IGJlCj4gcmVw
bGFjZWQgYnkgZGV2bV9jbGtfZ2V0X2VuYWJsZWQoKSB3aGVuIGRyaXZlciBlbmFibGUgKGFuZCBw
b3NzaWJseQo+IHByZXBhcmUpIHRoZSBjbG9ja3MgZm9yIHRoZSB3aG9sZSBsaWZldGltZSBvZiB0
aGUgZGV2aWNlLiBNb3Jlb3ZlciwgaXQgaXMKPiBubyBsb25nZXIgbmVjZXNzYXJ5IHRvIHVucHJl
cGFyZSBhbmQgZGlzYWJsZSB0aGUgY2xvY2sgZXhwbGljaXRseS4gVGhlCj4gbGFiZWwgImRpc2Fi
bGVfY2xrIiBubyBsb25nZXIgbWFrZXMgc2Vuc2UsIHJlbmFtZSBpdCB0byAiZGlzYWJsZV9mc21j
Ii4KClllcCwgcGxlYXNlIGtlZXAgdGhpcyBsYXN0IHNlbnRlbmNlIGhlcmUsIGl0IGlzIHVzZWZ1
bC4KCj4gUmV2aWV3ZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5j
b20+Cj4gU2lnbmVkLW9mZi1ieTogTGkgWmV0YW8gPGxpemV0YW8xQGh1YXdlaS5jb20+Cj4gLS0t
CgpUaGFua3MsCk1pcXXDqGwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
