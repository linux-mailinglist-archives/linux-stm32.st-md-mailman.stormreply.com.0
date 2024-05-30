Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF048D48EF
	for <lists+linux-stm32@lfdr.de>; Thu, 30 May 2024 11:51:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C32B8C6C859;
	Thu, 30 May 2024 09:51:11 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88B76C030CA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 May 2024 09:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1717062629; x=1717667429; i=markus.elfring@web.de;
 bh=uGMwHJfbR6KN66cOCzvPakSNZMqVFdC7Cgpk+vCA7NU=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=FlSR5xpj0FwtI8Z4GKDMQU3Nhu5ZfvJviwuRU8NZndL5/xWt0EE2dTOJdBGoeSDo
 LB7FZoTWJXrEgfmN6lHYotmaShyHS/ociG83v0mF5eXtFriEQ3POTCzGiKudrKhPo
 UglvM56WR2wXW7zcO4NR3tY6YikitMWPs1WYbmktUQkMWRPg+dAHhiXXLdorNb0Pw
 Un4Roya5qOhFSsPRtQuYIonTvM7PDyH/rzErBGgKSwzIemOhWiI/1QKEDdX4FylQL
 S/aV+YfRStP55LLDYAed37kyu53eguzgV3FaO8YjmKBgzV/acf2sSBNZ2P75pX1xe
 AlTy4xk7JBLUJAIiuQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M7Nmq-1s78Fk3P7U-007qlG; Thu, 30
 May 2024 11:50:29 +0200
Message-ID: <1f40d455-556e-4ba8-96dd-40b49f8cc3b7@web.de>
Date: Thu, 30 May 2024 11:50:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peng Fan <peng.fan@nxp.com>, "soc@kernel.org" <soc@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chester Lin <chester62515@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Damien Le Moal <dlemoal@kernel.org>, Dan Carpenter
 <dan.carpenter@linaro.org>, Aisheng Dong <aisheng.dong@nxp.com>,
 Dvorkin Dmitry <dvorkin@tibbo.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "Ghennadi Procopciuc (OSS)" <ghennadi.procopciuc@oss.nxp.com>,
 Hal Feng <hal.feng@starfivetech.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Jacky Bai <ping.bai@nxp.com>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Joel Stanley <joel@jms.id.au>, Jonathan Hunter <jonathanh@nvidia.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Orson Zhai
 <orsonzhai@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sean Wang <sean.wang@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 Stephen Warren <swarren@wwwdotorg.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Viresh Kumar <vireshk@kernel.org>, Wells Lu <wellslutw@gmail.com>
References: <20240504-pinctrl-cleanup-v2-18-26c5f2dc1181@nxp.com>
 <aa58efd3-b502-4bed-8c84-e5d78da23fbe@web.de>
 <DU0PR04MB941783DEB48C73844CD3FDBF88F32@DU0PR04MB9417.eurprd04.prod.outlook.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <DU0PR04MB941783DEB48C73844CD3FDBF88F32@DU0PR04MB9417.eurprd04.prod.outlook.com>
X-Provags-ID: V03:K1:+9Sp/meKw0sduwAvDpnilsXgvJB1VMszgePIGFouh74/8BPNPek
 PjdNmsNPyDIWLfKqIeJp80WBjOJ/GbIPBtZvK5DVSrAiydESz/tNusBgmD1eCCt+0wj2/g3
 bLAlYWJFLgxwtXUegWBLf4w8TAl+SErBcYs5UybkzZDCd+YCQICjCbGRmQ3ndcbJaK/+Zja
 dXgiIgA5yXHJDlsq5zxhg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0o0nmcb2n00=;0b+JEcSPacD3BoJZi33agACUzf+
 Y1yzW3rrPdLmejQWpOdqOmdJ2D62kKb+BZJi3OwiI+VsRTqFk+kBMl156D/0a4aulIHNuPylZ
 V29wMrssOvOtouKSK7eGs4Di/N5G2OR+LdJZLZV1D5PDDXa8XKSuH/dfGRWz0BL2vZ7xUkKzt
 srsyJEYZNLhovnf3nCBTJSumyBBhD/JYrLx4HCV9oP52veU/Vnx4ZAouhqduUkF124TRneb6s
 rIP4S6X96+Erw1tqQ3Rfy+vHCsZgE5dL1cmVEyPSicByBTSTtJQ1mILqcXk7SYawW0zqXR0K1
 lW2SGjYoHB1N6paa90lUc7ROZqsjYEc4qzfEVwfvpxCsnCKTpePmHVYSGblrUPMvsLu6EKV4Q
 aOvRNsJ9lbvR5QW6nbqLwZsEs63A/OxFA08BAxP7nfCFqIem0q8FtGmSkOTB5CUwDf0eiBEw0
 527B96/6A0qPpbARQop1FuiGqZT3wfMhMSjgmWv92s38TdOsVCEd1G9nb4kyORkGE7wZ23iZ2
 RZw9HZufC/cqdnzza+ONPRo/ipdOVcVG+tQhCdJCUzl1/Czg7MMSxfkBZIXxP84+iHBYeSqk7
 4J7E65IezrupJRW/fELUsOeJBideLezZz2hBU/PSzqRxF45znS2nKPyybjuHWi0m915ZBKt1p
 ZmBLNgKBOV0wC/danVuQd+fTH6Day0zltu/bbwg0Q0Jt/AK3CFRRcksTsHWgvdXYAVq6a5lAr
 pBRY8wYzwo0PzUbqeVdNjxC18B7392fNByYo7H89FcB9OXFskRbLiQujR88/6kDWCBHlZnGwA
 WNJcLkxVjBqulzo1dQBwqHG3+yPBubmiiTgeFAoeJgpQ0=
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "Peng Fan \(OSS\)" <peng.fan@oss.nxp.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [v2 18/20] pinctrl: freescale: mxs: Fix refcount
	of child
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

Pj4gSG93IGRvIHlvdSB0aGluayBhYm91dCB0byB1c2UgdGhlIHN1bW1hcnkgcGhyYXNlIOKAnEZp
eCByZWZlcmVuY2UgY291bnRpbmcKPj4gZm9yIGNoaWxkcmVuIGluIG14c19waW5jdHJsX3Byb2Jl
X2R0KCnigJ0/Cj4KPiBUaGFua3MgZm9yIHJldmlld2luZy4gSSBoYXZlIG5vIHBsYW4gdG8gcmV3
b3JrIHRoaXMgc2VyaWVzIGZvciBub24tYWNjZXB0ZWQgcGF0Y2hlcy4K4oCmCgpXaWxsIGRldmVs
b3BtZW50IGludGVyZXN0cyBncm93IHRvIHRha2UgcGF0Y2ggcmV2aWV3IGNvbmNlcm5zIGJldHRl
ciBpbnRvIGFjY291bnQKc28gdGhhdCBjb21taXQgbWVzc2FnZXMgY2FuIGJlIGltcHJvdmVkIGFu
b3RoZXIgYml0PwoKUmVnYXJkcywKTWFya3VzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
