Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F234A12AE2
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jan 2025 19:31:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E5BAC78F74;
	Wed, 15 Jan 2025 18:31:12 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F2D7C6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2025 18:31:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 420B0FF803;
 Wed, 15 Jan 2025 18:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1736965870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jLoWi3Wg0eiQh/tot5fchMc56NRkY1AedYStPaUs9Pk=;
 b=XVoQSRAsHPXADFu3jVGI7dBwCecPD+dviwtiINSG7gG2QTYI7ZKoCGbAlzsXnHawAhGKwl
 24LiXfzCQR3pIZBqvn9qb/WI76bBR/gYM5iK3v27XfrrihWyj6I9DuAIL0fsvT3vsw3I/q
 czvnLPptcYBnGEnhrm8GhgmQ8vCeUtjENVYUkzFUKo7lU8h2121ib4vf8mK5lggJa2imhw
 wuKxnh8Eev9ag9+Xsu7zpWrkt2h27deaKdBBBwhgImA9Rm+AwpotMeHj0kiG0/Az9PUc1t
 KHhtrdM1rJLw5PWkyTBKEJFeu2A3AfGxN8CmN6JVLXE0bXGUEx1cXfp5ava0qA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Sanjay R Mehta <sanju.mehta@amd.com>,
 Serge Semin <fancer.lancer@gmail.com>, Han Xu <han.xu@nxp.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Haibo Chen <haibo.chen@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>, Michal Simek <michal.simek@amd.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Raju Rangoju <Raju.Rangoju@amd.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 15 Jan 2025 19:31:02 +0100
Message-ID: <173696548250.435435.10416906996871126975.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250110-winbond-6-11-rc1-quad-support-v3-21-7ab4bd56cf6e@bootlin.com>
References: <20250110-winbond-6-11-rc1-quad-support-v3-0-7ab4bd56cf6e@bootlin.com>
 <20250110-winbond-6-11-rc1-quad-support-v3-21-7ab4bd56cf6e@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
Cc: imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Steam Lin <stlin2@winbond.com>, linux-spi@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Tudor Ambarus <tudor.ambarus@linaro.org>,
 linux-mediatek@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mtd@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 21/27] mtd: spinand: Create distinct
	fast and slow read from cache variants
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

T24gRnJpLCAxMCBKYW4gMjAyNSAxNTo0NToyMyArMDEwMCwgTWlxdWVsIFJheW5hbCB3cm90ZToK
PiBTbyBmYXIsIHRoZSBTUElOQU5EX1BBR0VfUkVBRF9GUk9NX0NBQ0hFX09QIG1hY3JvIHdhcyB0
YWtpbmcgYSBmaXJzdAo+IGFyZ3VtZW50LCAiZmFzdCIsIHdoaWNoIHdhcyBpbmR1Y2luZyB0aGUg
cG9zc2liaWxpdHkgdG8gc3VwcG9ydCBoaWdoZXIKPiBidXMgZnJlcXVlbmNpZXMgdGhhbiB3aXRo
IHRoZSBub3JtYWwgKHNsb3dlcikgcmVhZCBmcm9tIGNhY2hlCj4gYWx0ZXJuYXRpdmUuIEluIHBy
YWN0aWNlLCB3aXRob3V0IGZyZXF1ZW5jeSBjaGFuZ2Ugb24gdGhlIGJ1cywgdGhpcyB3YXMKPiBs
aWtlbHkgd2l0aG91dCBlZmZlY3QsIGJlc2lkZXMgcGVyaGFwcyBhbGxvd2luZyBhbm90aGVyIHZh
cmlhbnQgb2YgdGhlCj4gc2FtZSBjb21tYW5kLCB0aGF0IGNvdWxkIHJ1biBhdCB0aGUgZGVmYXVs
dCBoaWdoZXN0IHNwZWVkLiBJZiB3ZSB3YW50IHRvCj4gc3VwcG9ydCB0aGlzIGZ1bGx5LCB3ZSBu
ZWVkIHRvIGFkZCBhIGZyZXF1ZW5jeSBwYXJhbWV0ZXIgdG8gdGhlIHNsb3dlc3QKPiBjb21tYW5k
LiBCdXQgYmVmb3JlIHdlIGRvIHRoYXQsIGxldCdzIGRyb3AgdGhlICJmYXN0IiBib29sZWFuIGZy
b20gdGhlCj4gbWFjcm8gYW5kIGR1cGxpY2F0ZSBpdCwgdGhpcyB3aWxsIGZ1cnRoZXIgaGVscCBz
dXBwb3J0aW5nIGhhdmluZwo+IGRpZmZlcmVudCBmcmVxdWVuY2llcyBhbGxvd2VkIGZvciBlYWNo
IHZhcmlhbnQuCj4gCj4gWy4uLl0KClRoZSBmb2xsb3dpbmcgcGF0Y2hlcyBoYXZlIGJlZW4gYXBw
bGllZCB0byBuYW5kL25leHQ6CgpbMjEvMjddIG10ZDogc3BpbmFuZDogQ3JlYXRlIGRpc3RpbmN0
IGZhc3QgYW5kIHNsb3cgcmVhZCBmcm9tIGNhY2hlIHZhcmlhbnRzCiAgICAgICAgY29tbWl0OiAw
NDIwODcyNDc4MzVkYWQxZWM1ZTM5MDUyYWJmMDIyZmQxM2M2MzI2ClsyMi8yN10gbXRkOiBzcGlu
YW5kOiBBZGQgYW4gb3B0aW9uYWwgZnJlcXVlbmN5IHRvIHJlYWQgZnJvbSBjYWNoZSBtYWNyb3MK
ICAgICAgICBjb21taXQ6IDdjZTBkMTZkNTgwMmJmZGU0MjA5ZTUyZWU4YWQ2NDRjYTFlYWI0MjMK
WzIzLzI3XSBtdGQ6IHNwaW5hbmQ6IEVuaGFuY2UgdGhlIGxvZ2ljIHdoZW4gcGlja2luZyBhIHZh
cmlhbnQKICAgICAgICBjb21taXQ6IDY2NmMyOTliZTY5NmYwMmMzMzU0ZGExMDQyOTVmYjk0Yjhm
NjVkMjUKWzI0LzI3XSBtdGQ6IHNwaW5hbmQ6IEFkZCBzdXBwb3J0IGZvciByZWFkIERUUiBvcGVy
YXRpb25zCiAgICAgICAgY29tbWl0OiA4NTg2YmM4ZDk1NDg4ZGZhYWRiYzFhZjg5YmE1OTkwMGQy
YzM5MTE5ClsyNS8yN10gbXRkOiBzcGluYW5kOiB3aW5ib25kOiBVcGRhdGUgdGhlICpKVyBjaGlw
IGRlZmluaXRpb25zCiAgICAgICAgY29tbWl0OiAxZWE4MDhiNGQxNWI5YmRkYzQ4YWY3NWIwNjY4
YjgyMzY2YjViOTI3ClsyNi8yN10gbXRkOiBzcGluYW5kOiB3aW5ib25kOiBBZGQgY29tbWVudCBh
Ym91dCBuYW1pbmcKICAgICAgICBjb21taXQ6IDYxYzcxNTVlM2ZlOTM4ZDRkYTQ2NzFiMmY4NGUy
OWVhZjc5ZjVmNDYKWzI3LzI3XSBtdGQ6IHNwaW5hbmQ6IHdpbmJvbmQ6IEFkZCBzdXBwb3J0IGZv
ciBEVFIgb3BlcmF0aW9ucwogICAgICAgIGNvbW1pdDogYmU3YTA1ZGI0MjUyZWRiZmZiNDM0ODRi
MTQ3NTUwNDhmYjhkYjcxMAoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xp
bnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5v
IHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
