Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C269D63DBDC
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Nov 2022 18:23:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B940C6507B;
	Wed, 30 Nov 2022 17:23:31 +0000 (UTC)
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com
 [136.143.188.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C83D6C63326
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Nov 2022 17:23:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1669828953; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=S/tfmU/bGGwQvtztH48Ct75lrbtqrXhXhFaZ/qxNerqJ91kUiHyxbc1jZgMG+4D0FKKkKH/4VQ3BLtqRTavpPoP0qk/GhDBztMZabk/SDYZC/2nEdVUnHFj4lt4oCEoZYdqNVJlYpWtQohH7Xk7iafENArs6IvnxKDn4lbCO+NY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1669828953;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=NbXEpZ0aVb9mBV+yGpUjXQNqRrz9CwkBfjyCJADEE7w=; 
 b=C23QGjP6pvzkPw8IT2Uuj+OI28I1OxDdVDda3ZHxJKaLJwmEtBXvApFXi3zZ/mEx84iI22v9FKFVcEQyP1mwTeNAA8c8CIyncscoEw3nyF5RjPbZJoaHJj5B5pIq3hX61yGE+U4Eyaav9m6qghMn5BR1/svu5KRcXCc4bCqS2NY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=arinc9.com;
 spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
 dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1669828952; 
 s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=NbXEpZ0aVb9mBV+yGpUjXQNqRrz9CwkBfjyCJADEE7w=;
 b=fgVncX7MMGMyEBfpkO8jiLauPmhaMoiVDaHCHtIu1b+XSbYbH5rq3QxvQ66+UjGq
 V03JuP9AIYknMLnVMBa8W3NqAG1KZGS1eLpr23f5DQnweBY5641jnmU3F92tMwbCwcF
 9EJMyICQRP12neK7zmEutFcDRBKbw0f9SP1sI86M=
Received: from [10.10.10.3] (37.120.152.236 [37.120.152.236]) by
 mx.zohomail.com with SMTPS id 1669828951728942.0277054948851;
 Wed, 30 Nov 2022 09:22:31 -0800 (PST)
Message-ID: <32638470-b074-3b14-bfb2-10b49307b9e3@arinc9.com>
Date: Wed, 30 Nov 2022 20:22:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
To: Andrew Lunn <andrew@lunn.ch>
References: <20221130141040.32447-1-arinc.unal@arinc9.com>
 <Y4d9B7VSHvqJn0iS@lunn.ch>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <Y4d9B7VSHvqJn0iS@lunn.ch>
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
 Samuel Holland <samuel@sholland.org>, Michael Ellerman <mpe@ellerman.id.au>,
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gMzAuMTEuMjAyMiAxODo1NSwgQW5kcmV3IEx1bm4gd3JvdGU6Cj4gT24gV2VkLCBOb3YgMzAs
IDIwMjIgYXQgMDU6MTA6MzVQTSArMDMwMCwgQXLEsW7DpyDDnE5BTCB3cm90ZToKPj4gSGVsbG8g
Zm9sa3MsCj4+Cj4+IFdpdGggdGhpcyBwYXRjaCBzZXJpZXMsIHdlJ3JlIGNvbXBsZXRlbHkgZ2V0
dGluZyByaWQgb2YgJ2xhYmVsID0gImNwdSI7Jwo+PiB3aGljaCBpcyBub3QgdXNlZCBieSB0aGUg
RFNBIGR0LWJpbmRpbmcgYXQgYWxsLgo+Pgo+PiBJbmZvcm1hdGlvbiBmb3IgdGFraW5nIHRoZSBw
YXRjaGVzIGZvciBtYWludGFpbmVyczoKPj4gUGF0Y2ggMTogbmV0ZGV2IG1haW50YWluZXJzIChi
YXNlZCBvZmYgbmV0ZGV2L25ldC1uZXh0LmdpdCBtYWluKQo+PiBQYXRjaCAyLTM6IFNvQyBtYWlu
dGFpbmVycyAoYmFzZWQgb2ZmIHNvYy9zb2MuZ2l0IHNvYy9kdCkKPj4gUGF0Y2ggNDogTUlQUyBt
YWludGFpbmVycyAoYmFzZWQgb2ZmIG1pcHMvbGludXguZ2l0IG1pcHMtbmV4dCkKPj4gUGF0Y2gg
NTogUG93ZXJQQyBtYWludGFpbmVycyAoYmFzZWQgb2ZmIHBvd2VycGMvbGludXguZ2l0IG5leHQt
dGVzdCkKPiAKPiBIaSBBcsSxbsOnCj4gCj4gU28geW91ciBwbGFuIGlzIHRoYXQgZWFjaCBhcmNo
aXRlY3R1cmUgbWFpbnRhaW5lciBtZXJnZXMgb25lIHBhdGNoPwoKSW5pdGlhbGx5LCBJIHNlbnQg
dGhpcyBzZXJpZXMgdG8gc29jQGtlcm5lbC5vcmcgdG8gdGFrZSBpdCBhbGwgYnV0IFJvYiAKc2Fp
ZCBpdCBtdXN0IGJlIHRoaXMgd2F5IGluc3RlYWQuCgo+IAo+IFRoYXQgaXMgZmluZSwgYnV0IGl0
IGlzIGdvb2QgdG8gYmUgZXhwbGljaXQsIG90aGVyd2lzZSBwYXRjaGVzIHdpbGwKPiBmYWxsIHRo
cm91Z2ggdGhlIGNyYWNrcyBiZWNhdXNlIG5vYm9keSBwaWNrcyB0aGVtIHVwLiBJIGdlbmVyYWxs
eSB1c2UKPiBUbzogdG8gaW5kaWNhdGUgd2hvIGkgZXhwZWN0IHRvIG1lcmdlIGEgcGF0Y2gsIGFu
ZCBldmVyeWJvZHkgZWxzZSBpbgo+IHRoZSBDYzoKClRoYW5rcyBmb3IgdGhpcywgSSdsbCBmb2xs
b3cgc3VpdCBpZiBJIGRvbid0IHNlZSBhbnkgYWN0aXZpdHkgZm9yIGEgZmV3IAp3ZWVrcy4KCj4g
Cj4gUmV2aWV3ZWQtYnk6IEFuZHJldyBMdW5uIDxhbmRyZXdAbHVubi5jaD4KPiAKPiAgICAgIEFu
ZHJldwoKQXLEsW7DpwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
