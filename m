Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC5063DA10
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Nov 2022 16:58:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3174C6507B;
	Wed, 30 Nov 2022 15:58:53 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00974C03FC8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Nov 2022 15:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=HFssHLJMcOmruKkunXBVz4Mvi5+OSTccuRyBV5QXx+g=; b=OQ
 q2644ZjJ5z5DGVT84EDRKZ9M4Xp1yJ2Hw8pTxDEir29xcZ0b6fIa56wxAPRNzNjx432snbUYOhhk/
 tfN9lBv0QjZBrGnR45AjZS0cuf1IFCADbWupRUdyHiNYFfa8xUrYmoh0H5OpVg0zvZnvbj5oplX40
 X2+wHKmTsXtK5XM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1p0PR9-003yFA-Is; Wed, 30 Nov 2022 16:55:51 +0100
Date: Wed, 30 Nov 2022 16:55:51 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Message-ID: <Y4d9B7VSHvqJn0iS@lunn.ch>
References: <20221130141040.32447-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221130141040.32447-1-arinc.unal@arinc9.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heiko Stuebner <heiko@sntech.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Tim Harvey <tharvey@gateworks.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Stefan Agner <stefan@agner.ch>,
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Oleksij Rempel <linux@rempel-privat.de>, Fabio Estevam <festevam@gmail.com>,
 Peng Fan <peng.fan@nxp.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Gregory Clement <gregory.clement@bootlin.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>, Ray Jui <rjui@broadcom.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Frank Wunderlich <frank-w@public-files.de>, Hauke Mehrtens <hauke@hauke-m.de>,
 Hans Ulli Kroll <ulli.kroll@googlemail.com>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-mips@vger.kernel.org,
 linux-rockchip@lists.infradead.org, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Scott Branden <sbranden@broadcom.com>, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 "David S. Miller" <davem@davemloft.net>, linux-renesas-soc@vger.kernel.org,
 linux-sunxi@lists.linux.dev,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>,
 Michael Riesch <michael.riesch@wolfvision.net>
Subject: Re: [Linux-stm32] [PATCH 0/5] remove label = "cpu" from DSA
	dt-binding
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

T24gV2VkLCBOb3YgMzAsIDIwMjIgYXQgMDU6MTA6MzVQTSArMDMwMCwgQXLEsW7DpyDDnE5BTCB3
cm90ZToKPiBIZWxsbyBmb2xrcywKPiAKPiBXaXRoIHRoaXMgcGF0Y2ggc2VyaWVzLCB3ZSdyZSBj
b21wbGV0ZWx5IGdldHRpbmcgcmlkIG9mICdsYWJlbCA9ICJjcHUiOycKPiB3aGljaCBpcyBub3Qg
dXNlZCBieSB0aGUgRFNBIGR0LWJpbmRpbmcgYXQgYWxsLgo+IAo+IEluZm9ybWF0aW9uIGZvciB0
YWtpbmcgdGhlIHBhdGNoZXMgZm9yIG1haW50YWluZXJzOgo+IFBhdGNoIDE6IG5ldGRldiBtYWlu
dGFpbmVycyAoYmFzZWQgb2ZmIG5ldGRldi9uZXQtbmV4dC5naXQgbWFpbikKPiBQYXRjaCAyLTM6
IFNvQyBtYWludGFpbmVycyAoYmFzZWQgb2ZmIHNvYy9zb2MuZ2l0IHNvYy9kdCkKPiBQYXRjaCA0
OiBNSVBTIG1haW50YWluZXJzIChiYXNlZCBvZmYgbWlwcy9saW51eC5naXQgbWlwcy1uZXh0KQo+
IFBhdGNoIDU6IFBvd2VyUEMgbWFpbnRhaW5lcnMgKGJhc2VkIG9mZiBwb3dlcnBjL2xpbnV4Lmdp
dCBuZXh0LXRlc3QpCgpIaSBBcsSxbsOnCgpTbyB5b3VyIHBsYW4gaXMgdGhhdCBlYWNoIGFyY2hp
dGVjdHVyZSBtYWludGFpbmVyIG1lcmdlcyBvbmUgcGF0Y2g/CgpUaGF0IGlzIGZpbmUsIGJ1dCBp
dCBpcyBnb29kIHRvIGJlIGV4cGxpY2l0LCBvdGhlcndpc2UgcGF0Y2hlcyB3aWxsCmZhbGwgdGhy
b3VnaCB0aGUgY3JhY2tzIGJlY2F1c2Ugbm9ib2R5IHBpY2tzIHRoZW0gdXAuIEkgZ2VuZXJhbGx5
IHVzZQpUbzogdG8gaW5kaWNhdGUgd2hvIGkgZXhwZWN0IHRvIG1lcmdlIGEgcGF0Y2gsIGFuZCBl
dmVyeWJvZHkgZWxzZSBpbgp0aGUgQ2M6CgpSZXZpZXdlZC1ieTogQW5kcmV3IEx1bm4gPGFuZHJl
d0BsdW5uLmNoPgoKICAgIEFuZHJldwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
