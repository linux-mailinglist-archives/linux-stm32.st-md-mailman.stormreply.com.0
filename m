Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 66016B2109D
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Aug 2025 18:01:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25E26C32E8E;
	Mon, 11 Aug 2025 16:01:05 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43ED3C32E8D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 16:01:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0CE01459BC;
 Mon, 11 Aug 2025 16:01:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16A6AC4CEED;
 Mon, 11 Aug 2025 16:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754928062;
 bh=Mt5Z9iaxEJqunSSWFhe3foZePTxEE32AzKMZx3Qr8RQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MyiP+pGKfJHAHSCkg/AuFQl20aYOw9VY+sW09ZDqrRnXl3qhO6kW3xwjReBD5Z32U
 rc5u4QiD9di8rs5Y26pPKqgz3ObtPPTdetcOMRnY4L3JBnCvV8biR9qNn6DSikeOF7
 VhE5sUJSpEKSYYri6ra4/Vt6YfnG4ukgWhyQSV/dITF7k1RhjSrtVsfcRLEij9Eys6
 q9OGM68dgjgR0McTiVcrG5fpKLeSFSRz3ApxW9cooonoB2N5qjQ2mVUArcBqG3wBQ8
 ehA3INw6J09SgYdPezVfIC1CQjP1rhvwV1/tDG6KwuSpPtIw0jol1Ml6Et91NjCKhR
 E8uC2ag7Nqdxw==
Date: Mon, 11 Aug 2025 21:30:30 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: bmasney@redhat.com
Message-ID: <3rhp73jjlpcoutaj56pjhrjtjxugf2nghiygax6s3n47biwfr7@pdk5zorat5dh>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Daniel Machon <daniel.machon@microchip.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, sophgo@lists.linux.dev,
 Alex Helms <alexander.helms.jy@renesas.com>, Sven Peter <sven@kernel.org>,
 Qin Jian <qinjian@cqplus1.com>, Scott Branden <sbranden@broadcom.com>,
 linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Inochi Amaoto <inochiama@gmail.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Daniel Palmer <daniel@thingy.jp>, soc@lists.linux.dev,
 Viresh Kumar <vireshk@kernel.org>,
 Gregory Clement <gregory.clement@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org, Neal Gompa <neal@gompa.dev>,
 Stephen Boyd <sboyd@kernel.org>, UNGLinuxDriver@microchip.com,
 linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 imx@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Fabio Estevam <festevam@gmail.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Orson Zhai <orsonzhai@gmail.com>, Keguang Zhang <keguang.zhang@gmail.com>,
 Jacky Huang <ychuang3@nuvoton.com>, Ray Jui <rjui@broadcom.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 spacemit@lists.linux.dev, Cristian Marussi <cristian.marussi@arm.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, asahi@lists.linux.dev,
 Sudeep Holla <sudeep.holla@arm.com>, Romain Perier <romain.perier@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
 Liviu Dudau <liviu.dudau@arm.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Paul Cercueil <paul@crapouillou.net>, Shan-Chun Hung <schung@nuvoton.com>,
 linux-riscv@lists.infradead.org, Janne Grunau <j@jannau.net>,
 Chen Wang <unicorn_wang@outlook.com>, arm-scmi@vger.kernel.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Takao Orito <orito.takao@socionext.com>, linux-mediatek@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrea della Porta <andrea.porta@suse.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yixun Lan <dlan@gentoo.org>, Taichi Sugaya <sugaya.taichi@socionext.com>,
 patches@opensource.cirrus.com, Bjorn Andersson <andersson@kernel.org>,
 linux-mips@vger.kernel.org, Chunyan Zhang <zhang.lyra@gmail.com>
Subject: Re: [Linux-stm32] [PATCH 000/114] clk: convert drivers from
 deprecated round_rate() to determine_rate()
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

T24gTW9uLCBBdWcgMTEsIDIwMjUgYXQgMTE6MTc6NTJBTSBHTVQsIEJyaWFuIE1hc25leSB2aWEg
QjQgUmVsYXkgd3JvdGU6Cj4gVGhlIHJvdW5kX3JhdGUoKSBjbGsgb3BzIGlzIGRlcHJlY2F0ZWQg
aW4gdGhlIGNsayBmcmFtZXdvcmsgaW4gZmF2b3IKPiBvZiB0aGUgZGV0ZXJtaW5lX3JhdGUoKSBj
bGsgb3BzLCBzbyBsZXQncyBnbyBhaGVhZCBhbmQgY29udmVydCB0aGUKPiB2YXJpb3VzIGNsayBk
cml2ZXJzIHVzaW5nIHRoZSBDb2NjaW5lbGxlIHNlbWFudGljIHBhdGNoIHBvc3RlZCBiZWxvdy4K
PiBJIGRpZCBhIGZldyBtaW5vciBjb3NtZXRpYyBjbGVhbnVwcyBvZiB0aGUgY29kZSBpbiBhIGZl
dyBjYXNlcy4KPiAKPiBUaGlzIHNlcmllcyBpcyBicm9rZW4gdXAgaW50byBzZXZlcmFsIGNhdGVn
b3JpZXM6Cj4gCj4gLSBQYXRjaCAxIHRvIGNsay9hdDkxL3BlcmlwaGVyYWwgaXMgYSBidWcgZml4
IGZvciBhIHJldHVybiB2YWx1ZS4KPiAKPiAtIFBhdGNoIDIgdG8gY2xrL2F0OTEvcGVyaXBoZXJh
bCB3YXNuJ3Qgc3RyYWlnaHQgZm9yd2FyZCBsaWtlIHRoZSBvdGhlcgo+ICAgZHJpdmVycywgc28g
SSdtIGV4cGxpY2l0bHkgY2FsbGluZyB0aGlzIG9uZSBvdXQgc2VwYXJhdGVseS4KPiAKPiAtIFBh
dGNoIDMgYWRkcyBhIGRldGVybWluZV9yYXRlKCkgb3AgYW5kIGtlZXBzIHRoZSByb3VuZF9yYXRl
KCkgaW4gcGxhY2UKPiAgIHNpbmNlIHRoaXMgaXMgbmVlZGVkIGJ5IGRyaXZlcnMvY2xrL2FjdGlv
bnMvb3dsLWNvbXBvc2l0ZS5jIGFuZCBrZWVwcwo+ICAgdGhlIHRyZWUgYmlzZWN0YWJsZS4gVGhl
IGRlcHJlY2F0ZWQgcm91bmRfcmF0ZSgpIG9wIGlzIGRyb3BwZWQgaW4gcGF0Y2gKPiAgIDExMy4K
PiAKPiAtIFBhdGNoZXMgNC03MCBhcmUgZm9yIGRyaXZlcnMgd2hlcmUgdGhlcmUgaXMgbm8gY2xr
IHN1Ym1haW50YWluZXIKPiAgIGxpc3RlZCBpbiB0aGUgTUFJTlRBSU5FUlMgZmlsZS4gUGF0Y2gg
MTkgaW5jbHVkZXMgYSBtaW5vciBmaXggc28gdGhhdAo+ICAgQ29jY2luZWxsZSBjYW4gYmUgcmFu
IGFnYWluc3QgYSBwYXJ0aWN1bGFyIHNvdXJjZSBmaWxlLgo+IAo+IC0gUGF0Y2hlcyA3MS0xMTAg
YXJlIGZvciBkcml2ZXJzIHdoZXJlIHRoaXMgaXMgYW4gZW50cnkgaW4gTUFJTlRBSU5FUlMKPiAg
IGZvciB0aGUgZHJpdmVyLgo+IAo+IC0gUGF0Y2hlcyAxMTEtMTE0IGFyZSBmb3IgZHJpdmVycyB0
aGF0IGltcGxlbWVudCBib3RoIHJvdW5kX3JhdGUoKSBhbmQKPiAgIGRldGVybWluZV9yYXRlKCks
IHNvIHRoZSByb3VuZF9yYXRlKCkgaW1wbGVtZW50YXRpb24gaXMgZHJvcHBlZC4KPiAKPiBPbmNl
IGFsbCBvZiBteSBjb252ZXJzaW9uIHBhdGNoZXMgYWNyb3NzIHRoZSB2YXJpb3VzIHRyZWVzIGlu
IHRoZSBrZXJuZWwKPiBoYXZlIGJlZW4gbWVyZ2VkLCBJIHdpbGwgcG9zdCBhIHNtYWxsIHNlcmll
cyB0aGF0IHJlbW92ZXMgdGhlCj4gcm91bmRfcmF0ZSgpIG9wIGZyb20gdGhlIGNsayBjb3JlIGFu
ZCB0aGUgZG9jdW1lbnRhdGlvbi4gSGVyZSdzIHRoZQo+IG90aGVyIHBhdGNoIHNlcmllcyB0aGF0
IGFyZSBjdXJyZW50bHkgaW4gZmxpZ2h0IHRoYXQgbmVlZCB0byBiZSBtZXJnZWQKPiBiZWZvcmUg
d2UgY2FuIHJlbW92ZSByb3VuZF9yYXRlKCkgZnJvbSB0aGUgY29yZS4KPiAKClBsZWFzZSBkbyBu
b3QgQ0MgYWxsIHJldmlld2Vycy9tYWludGFpbmVycyBvZiBpbmRpdmlkdWFsIGNsb2NrIGNvbnRy
b2xsZXIKZHJpdmVycyB0byBhbGwgcGF0Y2hlcywgYnV0IG9ubHkgdG8gdGhlIHJlc3BlY3RpdmUg
Y2xvY2sgY29udHJvbGxlciBwYXRjaGVzLgpJdCBqdXN0IHNwYW1zIG91ciBpbmJveC4gQ0Npbmcg
YWxsIG9mIHVzIGluIHRoZSBjb3ZlciBsZXR0ZXIgaXMgZmluZSB0aG91Z2guCgotIE1hbmkKCi0t
IArgrq7grqPgrr/grrXgrqPgr43grqPgrqngr40g4K6a4K6k4K6+4K6a4K6/4K614K6u4K+NCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
