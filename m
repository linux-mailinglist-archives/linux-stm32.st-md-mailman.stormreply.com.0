Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 008D463EF9A
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Dec 2022 12:39:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D2E0C65E59;
	Thu,  1 Dec 2022 11:39:03 +0000 (UTC)
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com
 [136.143.188.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1D92C63326
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Dec 2022 11:39:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1669894669; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=QTQmm9pOeLgmKb8bWo/bk1tmntAG21CY8mqL5Y7GzMv84vMVC3VrVna9NzX1hngi7eK1jcFyuiSXXvVA9bOp7v2JNs+2P/yWem+qMtXkZfdIeULvLO4Rfg8yQmTObIt1kyNHO2k94mTkgHZvRKbMyIMAcRvOxm9qMfK6qb3t88g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1669894669;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=dfOEXnlaPDTQyh5hwojKntKZbR0Ct6BYQNOU/3518PU=; 
 b=OYF7SwvD1mv3O+HAFCbq9CfMSGf7fvV73aJ926EunEgVq/bUTdRUCCmRrZD9+8rTw9wNG3PDjimgO76TJJ6VPC/P/vttun+Obu5Dzyp0sS31x9L5iYLvG+rdO6kZvZ2wtK6Gn86PgqwwiOO9sfMtbOWsOMExVMcejf44MYA+nAo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=arinc9.com;
 spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
 dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1669894669; 
 s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=dfOEXnlaPDTQyh5hwojKntKZbR0Ct6BYQNOU/3518PU=;
 b=Sxoe6pf0viFvg95RBI3wMeoXYd0syHO9a0cEcwxKEbUeNP5X1PyRVz24a8qLfztM
 cNOs3+XlOAmEYW4Cspyrx9xPr6rdVmINXwU/r6bTSOpPefuylQ7S/DIWSUhazWPCj3l
 ohbSEg1Td2+qDT3JhrnQZaDjIZ9aCibjEQyIlKI4=
Received: from [10.10.10.3] (37.120.152.236 [37.120.152.236]) by
 mx.zohomail.com with SMTPS id 1669894667415837.5294444284028;
 Thu, 1 Dec 2022 03:37:47 -0800 (PST)
Message-ID: <83ed1490-4d87-98c5-2616-54b5f1ab64b7@arinc9.com>
Date: Thu, 1 Dec 2022 14:37:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
To: Michael Ellerman <mpe@ellerman.id.au>, Andrew Lunn <andrew@lunn.ch>
References: <20221130141040.32447-1-arinc.unal@arinc9.com>
 <Y4d9B7VSHvqJn0iS@lunn.ch> <32638470-b074-3b14-bfb2-10b49307b9e3@arinc9.com>
 <877czbs8w7.fsf@mpe.ellerman.id.au>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <877czbs8w7.fsf@mpe.ellerman.id.au>
X-ZohoMailClient: External
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
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gMS4xMi4yMDIyIDEzOjQyLCBNaWNoYWVsIEVsbGVybWFuIHdyb3RlOgo+IEFyxLFuw6cgw5xO
QUwgPGFyaW5jLnVuYWxAYXJpbmM5LmNvbT4gd3JpdGVzOgo+PiBPbiAzMC4xMS4yMDIyIDE4OjU1
LCBBbmRyZXcgTHVubiB3cm90ZToKPj4+IE9uIFdlZCwgTm92IDMwLCAyMDIyIGF0IDA1OjEwOjM1
UE0gKzAzMDAsIEFyxLFuw6cgw5xOQUwgd3JvdGU6Cj4+Pj4gSGVsbG8gZm9sa3MsCj4+Pj4KPj4+
PiBXaXRoIHRoaXMgcGF0Y2ggc2VyaWVzLCB3ZSdyZSBjb21wbGV0ZWx5IGdldHRpbmcgcmlkIG9m
ICdsYWJlbCA9ICJjcHUiOycKPj4+PiB3aGljaCBpcyBub3QgdXNlZCBieSB0aGUgRFNBIGR0LWJp
bmRpbmcgYXQgYWxsLgo+Pj4+Cj4+Pj4gSW5mb3JtYXRpb24gZm9yIHRha2luZyB0aGUgcGF0Y2hl
cyBmb3IgbWFpbnRhaW5lcnM6Cj4+Pj4gUGF0Y2ggMTogbmV0ZGV2IG1haW50YWluZXJzIChiYXNl
ZCBvZmYgbmV0ZGV2L25ldC1uZXh0LmdpdCBtYWluKQo+Pj4+IFBhdGNoIDItMzogU29DIG1haW50
YWluZXJzIChiYXNlZCBvZmYgc29jL3NvYy5naXQgc29jL2R0KQo+Pj4+IFBhdGNoIDQ6IE1JUFMg
bWFpbnRhaW5lcnMgKGJhc2VkIG9mZiBtaXBzL2xpbnV4LmdpdCBtaXBzLW5leHQpCj4+Pj4gUGF0
Y2ggNTogUG93ZXJQQyBtYWludGFpbmVycyAoYmFzZWQgb2ZmIHBvd2VycGMvbGludXguZ2l0IG5l
eHQtdGVzdCkKPj4+Cj4+PiBIaSBBcsSxbsOnCj4+Pgo+Pj4gU28geW91ciBwbGFuIGlzIHRoYXQg
ZWFjaCBhcmNoaXRlY3R1cmUgbWFpbnRhaW5lciBtZXJnZXMgb25lIHBhdGNoPwo+Pgo+PiBJbml0
aWFsbHksIEkgc2VudCB0aGlzIHNlcmllcyB0byBzb2NAa2VybmVsLm9yZyB0byB0YWtlIGl0IGFs
bCBidXQgUm9iCj4+IHNhaWQgaXQgbXVzdCBiZSB0aGlzIHdheSBpbnN0ZWFkLgo+Pgo+Pj4KPj4+
IFRoYXQgaXMgZmluZSwgYnV0IGl0IGlzIGdvb2QgdG8gYmUgZXhwbGljaXQsIG90aGVyd2lzZSBw
YXRjaGVzIHdpbGwKPj4+IGZhbGwgdGhyb3VnaCB0aGUgY3JhY2tzIGJlY2F1c2Ugbm9ib2R5IHBp
Y2tzIHRoZW0gdXAuIEkgZ2VuZXJhbGx5IHVzZQo+Pj4gVG86IHRvIGluZGljYXRlIHdobyBpIGV4
cGVjdCB0byBtZXJnZSBhIHBhdGNoLCBhbmQgZXZlcnlib2R5IGVsc2UgaW4KPj4+IHRoZSBDYzoK
Pj4KPj4gVGhhbmtzIGZvciB0aGlzLCBJJ2xsIGZvbGxvdyBzdWl0IGlmIEkgZG9uJ3Qgc2VlIGFu
eSBhY3Rpdml0eSBmb3IgYSBmZXcKPj4gd2Vla3MuCj4gCj4gSU1ITyB0aGUgYmVzdCBzb2x1dGlv
biBpZiB0aGUgcGF0Y2hlcyBhcmUgdHJ1bHkgaW5kZXBlbmRlbnQgaXMgdG8gc2VuZAo+IHRoZW0g
aW5kZXBlbmRhbnRseSB0byBlYWNoIG1haW50YWluZXIuIFRoYXQgd2F5IHRoZXJlJ3Mgbm8gY29u
ZnVzaW9uCj4gYWJvdXQgd2hldGhlciBzb21lb25lIGVsc2Ugd2lsbCB0YWtlIHRoZSBzZXJpZXMu
Cj4gCj4gSXQncyBhbHNvIHNpbXBsZXIgZm9yIG1haW50YWluZXJzIHRvIGFwcGx5IGEgc2luZ2xl
IHN0YW5kYWxvbmUgcGF0Y2ggdnMKPiBwaWNrIGEgc2luZ2xlIHBhdGNoIGZyb20gYSBsYXJnZXIg
c2VyaWVzLgoKSSBhZ3JlZS4gSSdsbCBkbyB0aGF0IG5leHQgdGltZS4KCkNoZWVycy4KQXLEsW7D
pwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1z
dG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zdG0zMgo=
