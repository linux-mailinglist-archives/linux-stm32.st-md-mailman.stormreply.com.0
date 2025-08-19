Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FA7B2BDF4
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Aug 2025 11:49:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 656C8C3F949;
	Tue, 19 Aug 2025 09:49:51 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91AFEC3F945
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Aug 2025 09:49:50 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-55ce510b4ceso5792329e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Aug 2025 02:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755596990; x=1756201790;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tV6Flkuo2P/+55L7Kh0T7daOZ9uv2yK47XAxZBt9LOQ=;
 b=N4YqZQGXLrMUin2owCUmC2Vj6Izwd9838EZ0qRFJO6Ks/bnrH1N+oxQhXGK5JoOR4R
 pAPmQWQZKKd8YVB5nKYo8ntlPWqHZ3gZTeY9rvLXwt//YMJKVCUH2egxn+zdiyxs/TYh
 N718EwFkS0uSFs3Ihxj0QQF607sgOlYj6f4Vi7jxAl9nJcWj7M351jQowj/xNVrHBjKH
 wlUQ79S2R4eyUqk/2BDcZPtMMYkinIoi1/6cJCNdAw1ewTceIGXEjJaWNPQj+oRp3tWN
 eX5HE5Ctdj1kQvikBvyc55esbSIoBsECf0VYsggVqQJ21n/biGvEsu7DlVu0LDkr+Edw
 T8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755596990; x=1756201790;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tV6Flkuo2P/+55L7Kh0T7daOZ9uv2yK47XAxZBt9LOQ=;
 b=e6zAyuGrXIO1id/ov9Ejcg08CPx1GL4l/TLvVORM118PeI4bJh86vnShlTwNZIlzYh
 FgYZSAd1lrFP6uxjZIzIZXeNO66XY6igsfSiNEklF0Z3bxyx/e1omXoh752xk6i23jQG
 PzbhJh4/v5pEY3npbSOCJ/ipmqPkdp8OgULGmHVXLLun5kVLQh2vgTjNuRbnENiAmR+J
 uam7CDlTQO+bjM1JDSGGiDVlq/ot5YWWoAkWpjxh9hLUMoiF08GMlhLgvEcIFFUUiav2
 Bq3JFjIp9rL/yR20WWbsts05qE9TtPFg9BqPaZK9oQBASJh/StrkTz6LPd3Y1GTqJyGG
 rKZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNpa/VVuPaxtIP7zvuH6c1d40y+qOk12AEsk106dqrqRi4dOWb4fS5U2TvvVce6nYtsdE4prBdxWml6w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwNz6CU5jbS0tlz+YQp1dXnGTBSQeu1yPYJbx/13Jl+qVtB5Ov1
 9JNmi9MgxQiC1hqD3w1xZeVNgUoAkBVy2D+h24n6ug2quVhHYCqR551mKzQ8yEeixlQvZl0dUHV
 3Hf24lNQuT/bS9Io+5BmGIXVKX2hoqdkC4zqsL45GGg==
X-Gm-Gg: ASbGncvSc3hLqwusNspHoKaNmb7w9RoGoiohIGGKGw0fnk9LaRr9NfKvW5aG77Bz7xB
 mhHYh5pDtTd/UzENMyS9pAO0oAwfz8YbKlVJ9ygT7/o82uLT3ZeQllJv+X27/sYUTcI7wtpll/J
 NspBNmHRE2/nwZQZj11c7YJS9P6E7zcL+0rBebjSqd+SLYPm/me6cYwPbXE0WXOqglsIoDplCAF
 mW5cCeXd4bM
X-Google-Smtp-Source: AGHT+IEt8RlqWWvwC2uqrmb7EU75OBtpQ0q0kJ1zr3PFW1jsKW7QqgA/pBKXOLyxKfth/q0XXJuPhRlLhC58Y7ZaIjE=
X-Received: by 2002:a05:6512:ac9:b0:553:51a2:4405 with SMTP id
 2adb3069b0e04-55e00850835mr590681e87.45.1755596989499; Tue, 19 Aug 2025
 02:49:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-109-b3bf97b038dc@redhat.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-109-b3bf97b038dc@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 11:49:38 +0200
X-Gm-Features: Ac12FXyEOw7KCbkbFT2OqCP4TngpQPKLbvy9M6n90z-zmlM7tVP9PQNq8vVGJnI
Message-ID: <CACRpkdaW=f7xm+rsD8XUUx-qhuh8sk1mCU-erve-_9S4uUpHbA@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH 109/114] clk: versatile: vexpress-osc:
 convert from round_rate() to determine_rate()
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

T24gTW9uLCBBdWcgMTEsIDIwMjUgYXQgNToyMeKAr1BNIEJyaWFuIE1hc25leSB2aWEgQjQgUmVs
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
