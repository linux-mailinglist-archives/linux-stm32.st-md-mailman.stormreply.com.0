Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABA0B26A9E
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Aug 2025 17:16:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0626FC35E2E;
	Thu, 14 Aug 2025 15:16:18 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DDBABC35E00
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Aug 2025 15:16:16 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 46e09a7af769-74381ff668cso507064a34.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Aug 2025 08:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755184575; x=1755789375;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nUx5rdSAym75bidV8LMMjvhD6atsKdb4p+2dl0DoyhU=;
 b=SKav8VF9qIIlKO0DWo35140nCtd7vwDhjehWUMbz54hCOEwO7fhdh26ZuZSuMqzrpE
 35n7h5IDK1+oYeQZCBZt7Lp+l+GsedIZrayzLdUZTh3aeeefZ3EGKj1v2Fzt100sghlI
 nL+M+I6APJdw671gtXpT4XoEvMRyVA1tvAmsapWarMWF6DKsCj3/ZQMCBryUD5WYHl8c
 dzVqZwCnFV5+S5nSTkSFHJ/f8V8t25gdh6APSfXEm7xB/C/yzw/IWiFDQCffQkr7MlQX
 XswAIcBsryvZkhjVweUJUbPurdKKkd6Qw5iqlnRGZqCB9eu3OCjs8MJGbjod+j6PTrea
 XIYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyIwnNeaRzxXju+tw6w7f8GG8ji9eeBKEUtW4ZurjyxrshxEKcAa81bo1jNMT44YLrtU/3xxi0Q5pDcQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzwHA/nNnbNeAAylQkbhGzMVdlXgnW7kNWzrRQSjmbCVzuGAIZL
 SHB25WeqD3oM42dp3yfL1M+twQpnXzU0JN7iezOh88/cLVz+yDwMYk1CzUx3231J
X-Gm-Gg: ASbGncv526fz58TpA+TLaVkS5xGEjsoxY7v0QZW2j40zChEAQPbtyd8AHgO5+v+TCaw
 2rG0BVzHYnznJHP3msnCj2LzPPgH8ShTbjdF0bAbdEvYcbPkYiB/X7E+MJpusC1s9qfJIs+07Yq
 3LFL1ssV/7rk2cnCeoW8gmu9tLTz1TOulAxMRET1G+i2w/cnsVKUrTLcBff0EmcmJHf0SOqhK7H
 XBrFzsbrdS7gECav4ZNps8MJGjKsM6NqQzMvtX8iT4ournf5a58wdZp5GT7k7GdEufqHr9mtN5n
 tgOiTdTfW0mmBtVCs+y57121mYe2tBBSmKOXOEQIMm88aRqvduL4fQPOnLsoakLx+XbzvGf2A6C
 ic28u2EF5f2ciTiZ0pLbNKUMaBFeyJ4Wjcn/AtSWVSOR16Ob/7IhW42Z0OAGU
X-Google-Smtp-Source: AGHT+IFUKRjWfaPgI2TFOvQYTbCUSpjAzPMqGcu95rIZNVjU9b6sFTBwe0jSSmzzRfdLHzBQ5jFPhg==
X-Received: by 2002:a05:6808:1828:b0:434:12a9:db07 with SMTP id
 5614622812f47-435df81edddmr1832295b6e.38.1755184575205; 
 Thu, 14 Aug 2025 08:16:15 -0700 (PDT)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com.
 [209.85.161.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-435ce87f33fsm1120471b6e.27.2025.08.14.08.16.14
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 08:16:14 -0700 (PDT)
Received: by mail-oo1-f49.google.com with SMTP id
 006d021491bc7-61bd4a379d3so519931eaf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Aug 2025 08:16:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXlz10IM9nhHoGEQWYUkFANn5/udie43AtnZigxBpBtgHCGrfkesqKptUeV0zV3JWDtuB1XB7KDeZCTug==@st-md-mailman.stormreply.com
X-Received: by 2002:a05:6102:e09:b0:4fc:b033:cdc5 with SMTP id
 ada2fe7eead31-50fe9974df5mr1305485137.22.1755184225208; Thu, 14 Aug 2025
 08:10:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-111-b3bf97b038dc@redhat.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-111-b3bf97b038dc@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Aug 2025 17:10:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXnN+4B1=RhOOHZ9mCN4e4WnfjtY_HO1t+176=dSs26Qw@mail.gmail.com>
X-Gm-Features: Ac12FXz03sJgdAZuxBhvZVUnciJ_u8JIfA74KaWnv048j9en2I4ZzU7p0Ef3ecQ
Message-ID: <CAMuHMdXnN+4B1=RhOOHZ9mCN4e4WnfjtY_HO1t+176=dSs26Qw@mail.gmail.com>
To: bmasney@redhat.com
Cc: Andrew Lunn <andrew@lunn.ch>, Heiko Stuebner <heiko@sntech.de>,
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
 Manivannan Sadhasivam <mani@kernel.org>,
 Takao Orito <orito.takao@socionext.com>, linux-mediatek@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrea della Porta <andrea.porta@suse.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yixun Lan <dlan@gentoo.org>, Taichi Sugaya <sugaya.taichi@socionext.com>,
 patches@opensource.cirrus.com, Bjorn Andersson <andersson@kernel.org>,
 linux-mips@vger.kernel.org, Chunyan Zhang <zhang.lyra@gmail.com>
Subject: Re: [Linux-stm32] [PATCH 111/114] clk: divider: remove round_rate()
	in favor of determine_rate()
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

On Mon, 11 Aug 2025 at 17:19, Brian Masney via B4 Relay
<devnull+bmasney.redhat.com@kernel.org> wrote:
> From: Brian Masney <bmasney@redhat.com>
>
> This driver implements both the determine_rate() and round_rate() clk
> ops, and the round_rate() clk ops is deprecated. When both are defined,
> clk_core_determine_round_nolock() from the clk core will only use the
> determine_rate() clk ops. Also all clk drivers that directly calls
> divider's round_rate() have been migrated over to determine_rate(). So
> let's remove the round_rate() clk ops.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
