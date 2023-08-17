Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FC5784743
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Aug 2023 18:25:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3AFC5C6DD89;
	Tue, 22 Aug 2023 16:25:22 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8BF0DC6A5EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 08:38:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 361EE1C0009;
 Thu, 17 Aug 2023 08:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1692261484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GFrTZexqLjQTWDNUsvnncrD9kb8WfaN/zu8FiMtEY4A=;
 b=lCDxw3lXC0rdW6d/sfAkKUVKB76hkI6rZgcTaNM6U7Qx6Izl1d2tvqTk7UV0Z/DOruFrMq
 e1mI0T6e/MO5/fuk6FvcsuoE4e1pdfLL3zH3dSYMf5+noGzZb2FQ5wFH3B4I66yfAGGgEd
 hVlneit7lZSNTujY0iVpbt91htI1D52CZAy5G2jOmtbs68gtApOnwZ65SN05jjoUOOYa0/
 fe0eJ7FjgBTvGTT9fL+OAMondBlTiidxhLbU+qHh7tQ/iqCMKYKGeRCRxV/hfmH5kIJD12
 HbQVMNi/JV61f4tUoUKKg03ZRWhrZ5xcDw+AYzgocORVBX/3CWpctKyyed8BpQ==
Date: Thu, 17 Aug 2023 10:37:59 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Li Zetao <lizetao1@huawei.com>
Message-ID: <20230817103759.3b8934a7@xps-13>
In-Reply-To: <20230817024509.3951629-12-lizetao1@huawei.com>
References: <20230817024509.3951629-1-lizetao1@huawei.com>
 <20230817024509.3951629-12-lizetao1@huawei.com>
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
Subject: Re: [Linux-stm32] [PATCH -next 11/11] mtd: spi-nor: Use helper
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
NDU6MDkgKzA4MDA6Cgo+IEFmdGVyIHRoZSBjb21taXQgN2VmOTY1MWU5NzkyICgiY2xrOiBQcm92
aWRlIG5ldyBkZXZtX2NsayBoZWxwZXJzIGZvcgo+IHByZXBhcmVkIGFuZCBlbmFibGVkIGNsb2Nr
cyIpLCBpdCBjYW4gcmVwbGFjZSB0aGUgcGFpciBvZiBmdW5jdGlvbnMsCj4gZGV2bV9jbGtfZ2V0
KCkgYW5kIGNsa19wcmVwYXJlX2VuYWJsZSgpIHdpdGggYSBzaW5nbGUgaGVscGVyIGZ1bmN0aW9u
Cj4gZGV2bV9jbGtfZ2V0X2VuYWJsZWQoKS4gTW9yZW92ZXIsIHRoZSBkcml2ZXIgd2lsbCBrZWVw
cyBhIGNsb2NrIHByZXBhcmVkCj4gKG9yIGVuYWJsZWQpIGR1cmluZyB0aGUgd2hvbGUgbGlmZXRp
bWUgb2YgdGhlIGRyaXZlciwgaXQgaXMgdW5uZWNlc3NhcnkgdG8KPiB1bnByZXBhcmUgYW5kIGRp
c2FibGUgY2xvY2sgZXhwbGljaXRseSB3aGVuIHJlbW92ZSBkcml2ZXIgb3IgaW4gdGhlIGVycm9y
Cj4gaGFuZGxpbmcgcGF0aC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBMaSBaZXRhbyA8bGl6ZXRhbzFA
aHVhd2VpLmNvbT4KCldpdGggdGhlIGNvbW1pdCBsb2cgY29ycmVjdGVkIGFzIHN1Z2dlc3RlZCBp
biBhbm90aGVyIGFuc3dlciwKClJldmlld2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5
bmFsQGJvb3RsaW4uY29tPgoKVGhhbmtzLApNaXF1w6hsCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
