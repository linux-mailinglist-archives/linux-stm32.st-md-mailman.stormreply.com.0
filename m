Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDD395F1DA
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Aug 2024 14:49:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 990A2C7801A;
	Mon, 26 Aug 2024 12:49:32 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7BFA7C6DD94
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Aug 2024 12:49:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5285CE000B;
 Mon, 26 Aug 2024 12:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1724676565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ObBjnqqW6wtbIZlueHVko8oEAEz7Tf+NNKHshQIvXFY=;
 b=TuaABYt9EaUhaVwvZITINhU5UiQfZ2Z9oVYPSxs7XRMU/+5Qf8lbMHGiCyxipeHJTx4nbz
 iP3xsCyCt+cFj94Nyhfnotj5mf2CM636QOs6kuy+Z9Hzwf6QaxRh6yjl9CejQhCH791++q
 TOrCicK0NHVf5/WiXth2qSIEKbJg86sK0R9wrTeu1jLIBxNhbX90++nbT/yvQZezJ+74b2
 MiM9oyZqJED6HqZ9tpvrVSNgTn/vSfMNYyNDATv3xq7OxZe39QpNawJO9+emxRJICcwL6M
 di90LueqY4p4LbFpYuo+aKl/PoZBGqtQrr3yvMruosHTsamtEY0jrJNIcK2MfQ==
Date: Mon, 26 Aug 2024 14:49:17 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <20240826144917.2c4e202d@xps-13>
In-Reply-To: <f7430f87-88d2-4c08-bc1e-6bb3da4e332c@kernel.org>
References: <20240826094328.2991664-1-ruanjinjie@huawei.com>
 <20240826115213.389acaef@xps-13>
 <f7430f87-88d2-4c08-bc1e-6bb3da4e332c@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
Cc: val@packett.cool, vigneshr@ti.com, kees@kernel.org,
 linux-kernel@vger.kernel.org, erick.archer@gmx.com, liang.yang@amlogic.com,
 linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 heiko@sntech.de, robh@kernel.org, samuel@sholland.org, richard@nod.at,
 Jinjie Ruan <ruanjinjie@huawei.com>, jernej.skrabec@gmail.com,
 linux-rockchip@lists.infradead.org, wens@csie.org,
 u.kleine-koenig@pengutronix.de, jbrunet@baylibre.com, linux@treblig.org,
 martin.blumenstingl@googlemail.com, christophe.jaillet@wanadoo.fr,
 matthias.bgg@gmail.com, linux-amlogic@lists.infradead.org,
 michal.simek@amd.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com, neil.armstrong@linaro.org,
 gustavoars@kernel.org, linux-renesas-soc@vger.kernel.org,
 mcoquelin.stm32@gmail.com, khilman@baylibre.com,
 linux-mediatek@lists.infradead.org, jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH -next RESEND 00/10] mtd: Use
 for_each_child_of_node_scoped()
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

SGkgS3J6eXN6dG9mLAoKa3J6a0BrZXJuZWwub3JnIHdyb3RlIG9uIE1vbiwgMjYgQXVnIDIwMjQg
MTI6MTk6MDcgKzAyMDA6Cgo+IE9uIDI2LzA4LzIwMjQgMTE6NTIsIE1pcXVlbCBSYXluYWwgd3Jv
dGU6Cj4gPiBIaSBKaW5qaWUsCj4gPiAKPiA+IHJ1YW5qaW5qaWVAaHVhd2VpLmNvbSB3cm90ZSBv
biBNb24sIDI2IEF1ZyAyMDI0IDE3OjQzOjE4ICswODAwOgo+ID4gICAKPiA+PiBVc2Ugc2NvcGVk
IGZvcl9lYWNoX2F2YWlsYWJsZV9jaGlsZF9vZl9ub2RlX3Njb3BlZCgpIHdoZW4gaXRlcmF0aW5n
IG92ZXIKPiA+PiBkZXZpY2Ugbm9kZXMgdG8gbWFrZSBjb2RlIGEgYml0IHNpbXBsZXIuICAKPiA+
IAo+ID4gV2h5IGlzIHRoaXMgYSByZXNlbmQgPyBEaWQgSSBtaXNzIGEgcHJldmlvdXMgaXRlcmF0
aW9uPyAgCj4gCj4gWW91IHdlcmUgbm90IGNjLWVkIG9uIHByZXZpb3VzIGl0ZXJhdGlvbi4gSSBh
c2tlZCBmb3IgcHJvcGVyIHNwbGl0Cj4gYmV0d2VlbiBzdWJzeXN0ZW1zIGFuZCBzZW5kaW5nIHRv
IG1haW50YWluZXJzLCB0aHVzIHRoaXMgcmVzZW5kLgoKT2suIE1ha2VzIHNlbnNlLCBhbmQgdGhl
IHBhdGNoc2V0IGxvb2tzIGZpbmUuCgpKaW5qaWUsIHBsZWFzZSBhbHdheXMgaW5jbHVkZSBhIGNo
YW5nZWxvZyB3aGVuIHlvdSBzZW5kIG5ldyB2ZXJzaW9ucywKYW5kIGV4cGxhbmF0aW9ucyBmb3Ig
YSBSRVNFTkQuCgpUaGFua3MsCk1pcXXDqGwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
