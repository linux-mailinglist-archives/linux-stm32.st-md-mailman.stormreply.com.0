Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2783E8D47E2
	for <lists+linux-stm32@lfdr.de>; Thu, 30 May 2024 11:02:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD8E6C6C855;
	Thu, 30 May 2024 09:02:29 +0000 (UTC)
Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi
 [62.142.5.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74160C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 May 2024 09:02:23 +0000 (UTC)
Received: from localhost (88-113-26-230.elisa-laajakaista.fi [88.113.26.230])
 by fgw23.mail.saunalahti.fi (Halon) with ESMTP
 id 51e6d162-1e63-11ef-80c8-005056bdfda7;
 Thu, 30 May 2024 12:02:22 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 30 May 2024 12:02:19 +0300
To: Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <ZlhAm-giX6jNaUKr@surfacebook.localdomain>
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <20240504-pinctrl-cleanup-v2-7-26c5f2dc1181@nxp.com>
 <CAMuHMdUD=1rpns_mLF2rMM-x5EnOK7TExaJxoJVkbXjVz1H8uQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdUD=1rpns_mLF2rMM-x5EnOK7TExaJxoJVkbXjVz1H8uQ@mail.gmail.com>
Cc: imx@lists.linux.dev, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Peng Fan <peng.fan@nxp.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Tony Lindgren <tony@atomide.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Hal Feng <hal.feng@starfivetech.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>, linux-samsung-soc@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, Chunyan Zhang <zhang.lyra@gmail.com>,
 openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Jacky Bai <ping.bai@nxp.com>, Joel Stanley <joel@jms.id.au>,
 Orson Zhai <orsonzhai@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Chester Lin <chester62515@gmail.com>,
 "Peng Fan \(OSS\)" <peng.fan@oss.nxp.com>,
 Stephen Warren <swarren@wwwdotorg.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-gpio@vger.kernel.org, soc@kernel.org,
 Damien Le Moal <dlemoal@kernel.org>, linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Dong Aisheng <aisheng.dong@nxp.com>, Matthias Brugger <mbrugger@suse.com>,
 Dvorkin Dmitry <dvorkin@tibbo.com>, Sean Wang <sean.wang@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 linux-riscv@lists.infradead.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Viresh Kumar <vireshk@kernel.org>, Wells Lu <wellslutw@gmail.com>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v2 07/20] pinctrl: renesas: Use scope
 based of_node_put() cleanups
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

TW9uLCBNYXkgMTMsIDIwMjQgYXQgMDE6NTk6MDNQTSArMDIwMCwgR2VlcnQgVXl0dGVyaG9ldmVu
IGtpcmpvaXR0aToKPiBPbiBTYXQsIE1heSA0LCAyMDI0IGF0IDM6MTTigK9QTSBQZW5nIEZhbiAo
T1NTKSA8cGVuZy5mYW5Ab3NzLm54cC5jb20+IHdyb3RlOgoKLi4uCgo+IFlvdSBtaXNzZWQgb25l
IHRyaXZpYWwgY29udmVyc2lvbiwgcHJlc3VtYWJseSBiZWNhdXNlIG5vIGVycm9yIGhhbmRsaW5n
Cj4gYW5kIHRodXMgbm8gb2Zfbm9kZV9wdXQoKSBpcyBpbnZvbHZlZD8KCk5vdGhpbmcgaXMgbWlz
c2VkLiBUaGUgYmVsb3cgaXMgYSByZWR1bmRhbnQgY2hhbmdlLgoKLi4uCgo+IC0gICAgICAgZm9y
X2VhY2hfY2hpbGRfb2Zfbm9kZShucCwgY2hpbGQpIHsKPiArICAgICAgIGZvcl9lYWNoX2NoaWxk
X29mX25vZGVfc2NvcGVkKG5wLCBjaGlsZCkgewo+ICAgICAgICAgICAgICAgICBpZiAob2ZfcHJv
cGVydHlfY291bnRfdTMyX2VsZW1zKGNoaWxkLCBSWk4xX1BJTlNfUFJPUCkgPiAwKQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgIGNvdW50Kys7Cj4gICAgICAgICB9Cj4gCj4gSWYgeW91IHByZWZl
ciBub3QgdG8gaW5jbHVkZSB0aGlzCgpJIHByZWZlciB0aGlzIG5vdCB0byBiZSBpbmNsdWRlZCBh
cyBpdCB3aWxsIGdpdmUgYSBtaXNsZWFkaW5nIHNpZ25hbHMgdG8gdGhlCnVzZSBvZiB0aGUgb3Jp
Z2luYWwgQVBJKHMpLgoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28KCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0z
MiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1zdG0zMgo=
