Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BEF63F06C
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Dec 2022 13:25:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 918AEC65E63;
	Thu,  1 Dec 2022 12:25:38 +0000 (UTC)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 387C3C64112
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Dec 2022 10:42:18 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4NNCLc4QCXz4xFy;
 Thu,  1 Dec 2022 21:42:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1669891334;
 bh=4hif7EODqPU9RIQoNSM7f4kViT96m8PqRMy1FOSRqmw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=XMDViV6CFDY+O8nTTE8IlEWWvY7H8YPqwD0Tn3KS84kUAblouGGNC2+Nia8sW2MYv
 qiQITUGJnoNf2rF8FqcIgIFTtKJlyIpcKBWiNrEakO5NLQ+ickTPEjtr01+GlyanLx
 mzZ9YX/t1jp5UON6rpZmvdKzHLeuceJXW2c99G//FjEB6EQyCPN8TlRw5ClPGntYn1
 1lstUDxUIwXt5rogz0qwgKe9XH3/+5CPLNT6DZ3ksaq4/yXNeIe6xOWsdnc3/9h44G
 yfuCxdwdv4chZHzuDDmEcJxiTEJT36pr3DPrHlRrFjnXSjff4fqmP4a9zPs8OfNA43
 pIMyXosyZ93DA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, Andrew Lunn
 <andrew@lunn.ch>
In-Reply-To: <32638470-b074-3b14-bfb2-10b49307b9e3@arinc9.com>
References: <20221130141040.32447-1-arinc.unal@arinc9.com>
 <Y4d9B7VSHvqJn0iS@lunn.ch>
 <32638470-b074-3b14-bfb2-10b49307b9e3@arinc9.com>
Date: Thu, 01 Dec 2022 21:42:00 +1100
Message-ID: <877czbs8w7.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 01 Dec 2022 12:25:36 +0000
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
 Samuel Holland <samuel@sholland.org>, linux-rockchip@lists.infradead.org,
 Gregory Clement <gregory.clement@bootlin.com>,
 =?utf-8?Q?Rafa?= =?utf-8?Q?=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>,
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
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
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

QXLEsW7DpyDDnE5BTCA8YXJpbmMudW5hbEBhcmluYzkuY29tPiB3cml0ZXM6Cj4gT24gMzAuMTEu
MjAyMiAxODo1NSwgQW5kcmV3IEx1bm4gd3JvdGU6Cj4+IE9uIFdlZCwgTm92IDMwLCAyMDIyIGF0
IDA1OjEwOjM1UE0gKzAzMDAsIEFyxLFuw6cgw5xOQUwgd3JvdGU6Cj4+PiBIZWxsbyBmb2xrcywK
Pj4+Cj4+PiBXaXRoIHRoaXMgcGF0Y2ggc2VyaWVzLCB3ZSdyZSBjb21wbGV0ZWx5IGdldHRpbmcg
cmlkIG9mICdsYWJlbCA9ICJjcHUiOycKPj4+IHdoaWNoIGlzIG5vdCB1c2VkIGJ5IHRoZSBEU0Eg
ZHQtYmluZGluZyBhdCBhbGwuCj4+Pgo+Pj4gSW5mb3JtYXRpb24gZm9yIHRha2luZyB0aGUgcGF0
Y2hlcyBmb3IgbWFpbnRhaW5lcnM6Cj4+PiBQYXRjaCAxOiBuZXRkZXYgbWFpbnRhaW5lcnMgKGJh
c2VkIG9mZiBuZXRkZXYvbmV0LW5leHQuZ2l0IG1haW4pCj4+PiBQYXRjaCAyLTM6IFNvQyBtYWlu
dGFpbmVycyAoYmFzZWQgb2ZmIHNvYy9zb2MuZ2l0IHNvYy9kdCkKPj4+IFBhdGNoIDQ6IE1JUFMg
bWFpbnRhaW5lcnMgKGJhc2VkIG9mZiBtaXBzL2xpbnV4LmdpdCBtaXBzLW5leHQpCj4+PiBQYXRj
aCA1OiBQb3dlclBDIG1haW50YWluZXJzIChiYXNlZCBvZmYgcG93ZXJwYy9saW51eC5naXQgbmV4
dC10ZXN0KQo+PiAKPj4gSGkgQXLEsW7Dpwo+PiAKPj4gU28geW91ciBwbGFuIGlzIHRoYXQgZWFj
aCBhcmNoaXRlY3R1cmUgbWFpbnRhaW5lciBtZXJnZXMgb25lIHBhdGNoPwo+Cj4gSW5pdGlhbGx5
LCBJIHNlbnQgdGhpcyBzZXJpZXMgdG8gc29jQGtlcm5lbC5vcmcgdG8gdGFrZSBpdCBhbGwgYnV0
IFJvYiAKPiBzYWlkIGl0IG11c3QgYmUgdGhpcyB3YXkgaW5zdGVhZC4KPgo+PiAKPj4gVGhhdCBp
cyBmaW5lLCBidXQgaXQgaXMgZ29vZCB0byBiZSBleHBsaWNpdCwgb3RoZXJ3aXNlIHBhdGNoZXMg
d2lsbAo+PiBmYWxsIHRocm91Z2ggdGhlIGNyYWNrcyBiZWNhdXNlIG5vYm9keSBwaWNrcyB0aGVt
IHVwLiBJIGdlbmVyYWxseSB1c2UKPj4gVG86IHRvIGluZGljYXRlIHdobyBpIGV4cGVjdCB0byBt
ZXJnZSBhIHBhdGNoLCBhbmQgZXZlcnlib2R5IGVsc2UgaW4KPj4gdGhlIENjOgo+Cj4gVGhhbmtz
IGZvciB0aGlzLCBJJ2xsIGZvbGxvdyBzdWl0IGlmIEkgZG9uJ3Qgc2VlIGFueSBhY3Rpdml0eSBm
b3IgYSBmZXcgCj4gd2Vla3MuCgpJTUhPIHRoZSBiZXN0IHNvbHV0aW9uIGlmIHRoZSBwYXRjaGVz
IGFyZSB0cnVseSBpbmRlcGVuZGVudCBpcyB0byBzZW5kCnRoZW0gaW5kZXBlbmRhbnRseSB0byBl
YWNoIG1haW50YWluZXIuIFRoYXQgd2F5IHRoZXJlJ3Mgbm8gY29uZnVzaW9uCmFib3V0IHdoZXRo
ZXIgc29tZW9uZSBlbHNlIHdpbGwgdGFrZSB0aGUgc2VyaWVzLgoKSXQncyBhbHNvIHNpbXBsZXIg
Zm9yIG1haW50YWluZXJzIHRvIGFwcGx5IGEgc2luZ2xlIHN0YW5kYWxvbmUgcGF0Y2ggdnMKcGlj
ayBhIHNpbmdsZSBwYXRjaCBmcm9tIGEgbGFyZ2VyIHNlcmllcy4KCmNoZWVycwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
