Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5121AB2BDDA
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Aug 2025 11:47:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 114F9C3F949;
	Tue, 19 Aug 2025 09:47:35 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B020C3F945
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Aug 2025 09:47:34 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-333f91526bcso36960721fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Aug 2025 02:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755596853; x=1756201653;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RdTVW2acL3x4TY+q3fiwzcKJmZ14PXDkj8EpJokxAbo=;
 b=V04cjOg24krxqTgOjYlCoMnz1DEMcIWBNnieqqkTASeSYuNl/G2+YtQY5oDA4wzRuZ
 WkWaHrxtb9Iv2fAZLoODxPKm97cQOlnNIRJpeULZ/OU/zhHZ52eKTTGiq6rSWiaoQnDq
 o9heYWPvp9RVa2D6LOUnVTQRhXuisW37qck7fPwgkOZqkmjDPK6E7Ksp81dk+kk6xWgO
 qGtjSEHwTiVnp+CM0nlBV+tBYaiVoYeECBtmHWm7p9qc/1Y5Tasvf52o4H8DLXiEqIX3
 lephBPWVBdSDV4vhPXFaKSSrX1Yw6pmieICQARqOv++o9YMh51KBzA8/bTyY/UoAbC0/
 bKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755596853; x=1756201653;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RdTVW2acL3x4TY+q3fiwzcKJmZ14PXDkj8EpJokxAbo=;
 b=L/gzzl4ioMjGz7OZplY1kIeORb2wRuUC2Q3RfL1NrTcbWycunPABkQSfma0qZnelbP
 B3ulJLCWw0yyl45izlhfY3G2K6Myj5y6/mM394U/mnZp2i8k1E+uAKpKK+2tjKB7VTYL
 9PIKioSEZf8S11ypXSmIreMn1G0uZEPJ0nYNTmje4664bGyUukImQ+o06f2ky6drLK59
 GPj16VUkg6nc34FrSIk2mSDk54+wTWqk7NUHiEY9mZsGiNv/a16vdJ15FL0ZxksjC+0B
 97gbcROdsQLc5LIVGMsDhX7bFBuh6YuLTKHPOh7unET5AqTsOlvoh77Tap0XukMlpGdy
 uzSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPfQg59lMVFyfZDsd/mXJBAuvgcpsK6V+GBHkn75MuE9tiFnLbRBwwCRzUoNO9QVv8p2P3to9hPU69Dg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw5EyebHapNvcnXA8WE6SjugioWIUiQV5L7AOrVCfw8VJb5XoQ9
 DvyFrdUOEuQMlJ8DSRq0fZG+ZaPHZENvZe/Ig8Xm/RssVbEAybYQRtm4b47WTOXfFVv+liFXOiI
 CZmKISivdqXr7IZfpJdPN0bKwrEiGiG4mfJG0uSlRJw==
X-Gm-Gg: ASbGncsXMlcvdZoIh7JBtyoPgB+hQ353yS5r/pMY2/VRBg5g1MDhYzzYHs8bQsb+x9C
 sK6fbYMQOrX4ia9uC2PAOJaSqJHeNjyM2xEMkud65NOQOvlw4hTydU6w/mnofo/yMSZjXEItpJo
 qeN+h1sKFL7yZpQxGp0Oj9R6lIZc0LIfA5MDEg50U1Wzo2wwRXih6vnsL4NCx/O6h8o1zoCkcxs
 0MDtCEw3Hfw
X-Google-Smtp-Source: AGHT+IFaAkF1r4GWgj+j3Xeyk0sBgHgQuFXAyBRPToaJvqEtDi6Qt1cFt8RtILv6l5mltG8+0huqL2sCrZ81MI3EBAM=
X-Received: by 2002:a05:651c:b2c:b0:333:ad0c:a44e with SMTP id
 38308e7fff4ca-335305347dbmr5252501fa.7.1755596852940; Tue, 19 Aug 2025
 02:47:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-105-b3bf97b038dc@redhat.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-105-b3bf97b038dc@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 11:47:21 +0200
X-Gm-Features: Ac12FXwQ8ZNlahHw5FRReJn3coSNBp0waFbtb0dR-jKWl_cQ9vhC2BCpFgBry0M
Message-ID: <CACRpkdZ3M65bKzaHcKPRhEFCy+TvHUq8bZ-8Zr_7HSRKsk_TWQ@mail.gmail.com>
To: bmasney@redhat.com
Cc: Andrew Lunn <andrew@lunn.ch>, Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
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
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Liviu Dudau <liviu.dudau@arm.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Paul Cercueil <paul@crapouillou.net>, Shan-Chun Hung <schung@nuvoton.com>,
 linux-riscv@lists.infradead.org, Janne Grunau <j@jannau.net>,
 Chen Wang <unicorn_wang@outlook.com>, arm-scmi@vger.kernel.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Takao Orito <orito.takao@socionext.com>, linux-mediatek@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrea della Porta <andrea.porta@suse.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yixun Lan <dlan@gentoo.org>, Taichi Sugaya <sugaya.taichi@socionext.com>,
 patches@opensource.cirrus.com, Bjorn Andersson <andersson@kernel.org>,
 linux-mips@vger.kernel.org, Chunyan Zhang <zhang.lyra@gmail.com>
Subject: Re: [Linux-stm32] [PATCH 105/114] clk: ux500: prcmu: convert from
	round_rate() to determine_rate()
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

T24gTW9uLCBBdWcgMTEsIDIwMjUgYXQgNToxOeKAr1BNIEJyaWFuIE1hc25leSB2aWEgQjQgUmVs
YXkKPGRldm51bGwrYm1hc25leS5yZWRoYXQuY29tQGtlcm5lbC5vcmc+IHdyb3RlOgoKPiBGcm9t
OiBCcmlhbiBNYXNuZXkgPGJtYXNuZXlAcmVkaGF0LmNvbT4KPgo+IFRoZSByb3VuZF9yYXRlKCkg
Y2xrIG9wcyBpcyBkZXByZWNhdGVkLCBzbyBtaWdyYXRlIHRoaXMgZHJpdmVyIGZyb20KPiByb3Vu
ZF9yYXRlKCkgdG8gZGV0ZXJtaW5lX3JhdGUoKSB1c2luZyB0aGUgQ29jY2luZWxsZSBzZW1hbnRp
YyBwYXRjaAo+IG9uIHRoZSBjb3ZlciBsZXR0ZXIgb2YgdGhpcyBzZXJpZXMuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBCcmlhbiBNYXNuZXkgPGJtYXNuZXlAcmVkaGF0LmNvbT4KClJldmlld2VkLWJ5OiBM
aW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+CgpZb3VycywKTGludXMgV2Fs
bGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
