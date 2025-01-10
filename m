Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEA5A094A8
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jan 2025 16:06:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB3C4C78F6F;
	Fri, 10 Jan 2025 15:06:56 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3009BC78F6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jan 2025 15:06:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4CD1D1BF205;
 Fri, 10 Jan 2025 15:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1736521608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q8hqtpx7uSmFFCBt4R+XArsWuILvupPoqhgNSuXM+dY=;
 b=bM3aHv2eZDPIEogkHXuaz90KY+89c/SS6D88M5Wwse/oE9y22gsGc/f1A8uC8lhyczxePx
 Rb00zNoRl/Jqt4Rnx2w8AcwTkm4UgnSaR/HS4gHDeSMDpQTBSITwMoxgl5bMwlfDR7/2Ex
 4678QsL8tSDo270hZROIzDvS4dvPmSaDeww2Q2qXcyFoH/YdmcJiq6OWaXl/7F2wYSL727
 yhpchOJrpNEM7J52JVcWYn19Jz67QyEwTI9gquIRwE3+7wGP8GWRfXVZ+CnsGH511T/Ug0
 dK1IpVJOGgF/Nc85wZftpbWnToLYHGKcXdNY97F3DTjah4672ArjZoy9pk9bKQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <c9043531-c733-4153-a814-79aab387883e@sirena.org.uk> (Mark
 Brown's message of "Fri, 10 Jan 2025 14:52:29 +0000")
References: <20241224-winbond-6-11-rc1-quad-support-v2-0-ad218dbc406f@bootlin.com>
 <20241224-winbond-6-11-rc1-quad-support-v2-20-ad218dbc406f@bootlin.com>
 <ca317e2c-cd09-4884-b9eb-9cf23ae88078@sirena.org.uk>
 <87tta6ag5b.fsf@bootlin.com>
 <c9043531-c733-4153-a814-79aab387883e@sirena.org.uk>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 10 Jan 2025 16:06:42 +0100
Message-ID: <87y0zi908t.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
Cc: imx@lists.linux.dev, Heiko Stuebner <heiko@sntech.de>,
 linux-aspeed@lists.ozlabs.org, Steam Lin <stlin2@winbond.com>,
 Tali Perry <tali.perry1@gmail.com>, Conor Dooley <conor.dooley@microchip.com>,
 linux-mtd@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Shan-Chun Hung <schung@nuvoton.com>, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Vignesh Raghavendra <vigneshr@ti.com>, Raju Rangoju <Raju.Rangoju@amd.com>,
 Benjamin Fair <benjaminfair@google.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Haibo Chen <haibo.chen@nxp.com>,
 Nancy Yuen <yuenn@google.com>, Joel Stanley <joel@jms.id.au>,
 linux-rockchip@lists.infradead.org,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Jacky Huang <ychuang3@nuvoton.com>, Sanjay R Mehta <sanju.mehta@amd.com>,
 linux-mediatek@lists.infradead.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Han Xu <han.xu@nxp.com>,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, openbmc@lists.ozlabs.org
Subject: Re: [Linux-stm32] [PATCH v2 20/27] spi: spi-mem: Estimate the time
 taken by operations
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

T24gMTAvMDEvMjAyNSBhdCAxNDo1MjoyOSBHTVQsIE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVs
Lm9yZz4gd3JvdGU6Cgo+IE9uIEZyaSwgSmFuIDEwLCAyMDI1IGF0IDAzOjM3OjUyUE0gKzAxMDAs
IE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+IE9uIDEwLzAxLzIwMjUgYXQgMTI6NDI6NDcgR01ULCBN
YXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4+ID4gVGhpcyBicmVha3Mg
dGhlIGJ1aWxkOgo+Cj4+ID4gL2J1aWxkL3N0YWdlL2xpbnV4L2RyaXZlcnMvc3BpL3NwaS1tZW0u
Yzo1ODA6NTogZXJyb3I6IGNvbmZsaWN0aW5nIHR5cGVzIGZvciDigJhzcGlfbWVtX2NhbGNfb3Bf
ZHVyYXRpb27igJk7IGhhdmUg4oCYdTY0KHN0cnVjdCBzcGlfbWVtX29wICop4oCZIHtha2Eg4oCY
bG9uZyBsb25nIHVuc2lnbmVkIGludChzdHJ1Y3Qgc3BpX21lbV9vcCAqKeKAmX0KPj4gPiAgIDU4
MCB8IHU2NCBzcGlfbWVtX2NhbGNfb3BfZHVyYXRpb24oc3RydWN0IHNwaV9tZW1fb3AgKm9wKQo+
Cj4+IENyYXAsIHRoYXQncyBhIGZpeHVwIHRoYXQgbGFuZGVkIGluIHRoZSB3cm9uZyBjb21taXQg
KG10ZDogc3BpbmFuZDoKPj4gRW5oYW5jZSB0aGUgbG9naWMgd2hlbiBwaWNraW5nIGEgdmFyaWFu
dCkuIEknbGwgZml4IGl0Lgo+Cj4gUGxlYXNlIG9ubHkgcmVzZW5kIHRoYXQgcGF0Y2ggLSB0aGUg
cmVzdCBidWlsZHMgYW5kIHRlc3RzIGZpbmUgaW4gbXkgQ0ksCj4gSSdtIGp1c3QgY2hlY2tpbmcg
YSBtZXJnZSBmaXh1cC4KCkFoLCBvb3BzLCBkaWRuJ3Qgc2VlIHRoaXMgaW4gdGltZSBhbmQgcnVz
aGVkIHYzLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
