Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB24B222A3
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Aug 2025 11:16:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4013AC3087A;
	Tue, 12 Aug 2025 09:16:48 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com
 [209.85.161.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0F75C32EB5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Aug 2025 09:16:46 +0000 (UTC)
Received: by mail-oo1-f47.google.com with SMTP id
 006d021491bc7-61b932f2c0eso369259eaf.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Aug 2025 02:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754990205; x=1755595005;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rOGKCteFZMAy3LeuWf1j/2F5b+EEOJ9yxzrgy674/8c=;
 b=Tsh7wHVNZkeyYAc88Eiv0lm87X1CD/KqntyChOrs25E8Yofvy19UD+LjRSyMas25j1
 dzhqAmYiHckW9w+ppXa4VK05X24L6e82nsgmYdJWxpBFz59qW64xiApu3eciG8CKZ7EM
 Gv8id93HI5l4lEHAEfwEpfv3kF7T6q2jmII8GOkeW9Jb6SPD4o9eF73Tq4i9WEwoby50
 eif5EPyVmGhjsjecVfdANaQyH5ZhdZIJqCt/xBGWq6BQm3aBQhS2agSE9FjGiN6nek1O
 Wik8yLgV9D5qTnh0sNt/rc7zAHhIDBhb6BxtI4rjdRAqOQqyKCNuyBx/Bc500w5Gps9a
 ar5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754990205; x=1755595005;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rOGKCteFZMAy3LeuWf1j/2F5b+EEOJ9yxzrgy674/8c=;
 b=o+3HSzlMGO+tNuJkHztph+Ib2beBwze6xCRogQCNtMw0Ys4jK/5QEhA+B2TK9cc0Dd
 cCMgaddUghujLjmnAlTH4I6PF2LGEoyBejCFxb7cvxjvHkRxmySZ5kkS/ypaH2x5UyAl
 jO10vVYEgutJ4N9KZvIbmzfhuX9/dhUc83qBPEZUEtWg+N4ritjDwgeX0GZcAQLop7rI
 xtViJeyDa+JWhAsz4oW3Z86SfEC2MWKjzwXeydM2SoBbPcspkm5WusywC7IYED3oDYDN
 y1tuB6QPqwNOmWs4Geeno0irP+qj0nOq4i7Jb4yLdSO+AusGekvk6Pgg+CpHB1TrSPHd
 6MKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqypRR8gs+gfvg4nOWZZ4Tuo0vTgXZr7j8GUTIcHuwgu9xuUl8GZYNvPRkP1JU38TKlV6hp0RhbSoJGQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzC+BD+8zKmfByAZzvBnhnDkLarxmxW6UtHxR0b813mmqGQXLBT
 rXlFAqBnIORnRDLyv+Cuf3Y+iyQKwVcJ5h24eHSWYX4yvWeSOKGDMPSK+6WSZU0QRnYo4B7ah3Y
 dLd14qu7L3Ls1/Y6H+NN1O16eWnP0SJA=
X-Gm-Gg: ASbGncsDOhvBMCzd/FLuJpPJiAxDbLXZnyvHel51GXBIi8tECVO73lU1l0VU/KqWrJS
 7/AEjQwmtFaHA7OxEv97U3KEmnay9U38BwHC9qKpCwulqB1/eV7qzY0VGK9agZj/UWT++G1zhDM
 wL5UAvIB5vAOdD/adQd3XyvIT6mVTDRPP/oggF1trtNHzO+0sJ03AvWiSPW2Mu0tQdD27btz00i
 /Eu4A==
X-Google-Smtp-Source: AGHT+IETTIJEQRSUprmEW/PZ43+7aaIWslt+bYkWZi3Waoz2cOUzGNm7S8/l4wJRhakmB2sfTn3K3AA6daLwKG1Ea8M=
X-Received: by 2002:a05:6808:181a:b0:433:fd1b:73f1 with SMTP id
 5614622812f47-435c90f0e8fmr1519318b6e.6.1754990205351; Tue, 12 Aug 2025
 02:16:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-54-b3bf97b038dc@redhat.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-54-b3bf97b038dc@redhat.com>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Tue, 12 Aug 2025 17:16:09 +0800
X-Gm-Features: Ac12FXzs0-qDCA0x0Aw1aZmy8texiIAG_F4IY6MycSoBtAjQ1ujDKaGaSXI8gxQ
Message-ID: <CAAfSe-u-YkkwKyS4+6EU+-zg5ghemk-4VJVE8p4Sky1-e4Y13g@mail.gmail.com>
To: bmasney@redhat.com
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
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Liviu Dudau <liviu.dudau@arm.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Paul Cercueil <paul@crapouillou.net>, Shan-Chun Hung <schung@nuvoton.com>,
 linux-riscv@lists.infradead.org, Janne Grunau <j@jannau.net>,
 Chen Wang <unicorn_wang@outlook.com>, arm-scmi@vger.kernel.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-mediatek@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrea della Porta <andrea.porta@suse.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yixun Lan <dlan@gentoo.org>, Taichi Sugaya <sugaya.taichi@socionext.com>,
 patches@opensource.cirrus.com, Bjorn Andersson <andersson@kernel.org>,
 linux-mips@vger.kernel.org, Takao Orito <orito.takao@socionext.com>
Subject: Re: [Linux-stm32] [PATCH 054/114] clk: sprd: pll: convert from
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Mon, 11 Aug 2025 at 23:18, Brian Masney via B4 Relay
<devnull+bmasney.redhat.com@kernel.org> wrote:
>
> From: Brian Masney <bmasney@redhat.com>
>
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Chunyan Zhang <zhang.lyra@gmail.com>

> ---
>  drivers/clk/sprd/pll.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/clk/sprd/pll.c b/drivers/clk/sprd/pll.c
> index 13a322b2535ac37ecb17f2c39d17d2c03532cfcb..bc6610d5fcb72faa7406ea78dca4cd9b848e9392 100644
> --- a/drivers/clk/sprd/pll.c
> +++ b/drivers/clk/sprd/pll.c
> @@ -254,16 +254,16 @@ static int sprd_pll_clk_prepare(struct clk_hw *hw)
>         return 0;
>  }
>
> -static long sprd_pll_round_rate(struct clk_hw *hw, unsigned long rate,
> -                               unsigned long *prate)
> +static int sprd_pll_determine_rate(struct clk_hw *hw,
> +                                  struct clk_rate_request *req)
>  {
> -       return rate;
> +       return 0;
>  }
>
>  const struct clk_ops sprd_pll_ops = {
>         .prepare = sprd_pll_clk_prepare,
>         .recalc_rate = sprd_pll_recalc_rate,
> -       .round_rate = sprd_pll_round_rate,
> +       .determine_rate = sprd_pll_determine_rate,
>         .set_rate = sprd_pll_set_rate,
>  };
>  EXPORT_SYMBOL_GPL(sprd_pll_ops);
>
> --
> 2.50.1
>
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
