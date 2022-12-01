Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC1B63E9A6
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Dec 2022 07:14:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9869FC65073;
	Thu,  1 Dec 2022 06:14:16 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5206CC63326
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Dec 2022 06:14:15 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1p0cot-0005vD-4h; Thu, 01 Dec 2022 07:13:15 +0100
Received: from ore by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1p0coe-0002BZ-Us; Thu, 01 Dec 2022 07:13:00 +0100
Date: Thu, 1 Dec 2022 07:13:00 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Message-ID: <20221201061300.GD19642@pengutronix.de>
References: <20221130141040.32447-1-arinc.unal@arinc9.com>
 <20221130141040.32447-2-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221130141040.32447-2-arinc.unal@arinc9.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Andrew Lunn <andrew@lunn.ch>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
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
Subject: Re: [Linux-stm32] [PATCH 1/5] dt-bindings: net: qca,
 ar71xx: remove label = "cpu" from examples
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

T24gV2VkLCBOb3YgMzAsIDIwMjIgYXQgMDU6MTA6MzZQTSArMDMwMCwgQXLEsW7DpyDDnE5BTCB3
cm90ZToKPiBUaGlzIGlzIG5vdCB1c2VkIGJ5IHRoZSBEU0EgZHQtYmluZGluZywgc28gcmVtb3Zl
IGl0IGZyb20gdGhlIGV4YW1wbGVzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFyxLFuw6cgw5xOQUwg
PGFyaW5jLnVuYWxAYXJpbmM5LmNvbT4KClJldmlld2VkLWJ5OiBPbGVrc2lqIFJlbXBlbCA8by5y
ZW1wZWxAcGVuZ3V0cm9uaXguZGU+CgpUaHghCgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbmV0L3FjYSxhcjcxeHgueWFtbCB8IDEgLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbmV0L3FjYSxhcjcxeHgueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9uZXQvcWNhLGFyNzF4eC55YW1sCj4gaW5kZXggMWViZjllOGM4YTFkLi44OWY5
NGIzMWI1NDYgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L25ldC9xY2EsYXI3MXh4LnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbmV0L3FjYSxhcjcxeHgueWFtbAo+IEBAIC0xMjMsNyArMTIzLDYgQEAgZXhhbXBsZXM6
Cj4gIAo+ICAgICAgICAgICAgICAgICAgICAgIHN3aXRjaF9wb3J0MDogcG9ydEAwIHsKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MD47Cj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgIGxhYmVsID0gImNwdSI7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgIGV0aGVybmV0ID0g
PCZldGgxPjsKPiAgCj4gICAgICAgICAgICAgICAgICAgICAgICAgIHBoeS1tb2RlID0gImdtaWki
Owo+IC0tIAo+IDIuMzQuMQo+IAo+IAoKLS0gClBlbmd1dHJvbml4IGUuSy4gICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ClN0ZXVlcndhbGRl
ciBTdHIuIDIxICAgICAgICAgICAgICAgICAgICAgICB8IGh0dHA6Ly93d3cucGVuZ3V0cm9uaXgu
ZGUvICB8CjMxMTM3IEhpbGRlc2hlaW0sIEdlcm1hbnkgICAgICAgICAgICAgICAgICB8IFBob25l
OiArNDktNTEyMS0yMDY5MTctMCAgICB8CkFtdHNnZXJpY2h0IEhpbGRlc2hlaW0sIEhSQSAyNjg2
ICAgICAgICAgICB8IEZheDogICArNDktNTEyMS0yMDY5MTctNTU1NSB8Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
