Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF09CB222AC
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Aug 2025 11:17:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A66EC3089F;
	Tue, 12 Aug 2025 09:17:40 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E13D8C3087A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Aug 2025 09:17:38 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id
 46e09a7af769-742f96d9288so2821711a34.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Aug 2025 02:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754990258; x=1755595058;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OsZfh7jnCZM1qIdbyzshEpg7lU806F0f1eIeVxq5DZ4=;
 b=KtWe/AFkW17xFN6xcHBUzj3W5WkkvrkGH0cP6vD9I8Ejx50W5RlUC4McwC0gtXw4WM
 EXFiGkW6lqqHaEr5dxdDbTj8nfAwlvihOSOqpid+2XupRZN2vKU7PSOfHHBeVhM4trDZ
 ytBxHvnjGspwSL3hhg+LgwSGnb3o+4lnMqfthnOwEoMiB/Z00GOhDbudCQBEd4/g9gp/
 OAJpCERUrc3u06Rt9xs0P0i73RVudmltP71PZ9Tb9ANGkhITW0vuOcf0Vg6BpTiRD7RT
 rEW3FIKNkotfhHlelpDEF2/6Q5nUWuRdtgxRpDu1KU5SHzrd1kVKGOCVQm34UophkpvM
 ynQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754990258; x=1755595058;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OsZfh7jnCZM1qIdbyzshEpg7lU806F0f1eIeVxq5DZ4=;
 b=FwLz52kJcpVRNEldA9XZ8qN6rx9vkaajBvH/A/P+Zued5Iwr9ztLvj1NxMkXBntl6R
 ET1YHnHCge7XM5wSH6j5zVu0UoqAEuOqU9S2oDqIrz3Xf31ahObgNwTcAnYtgg4IXQq1
 Ka4/3Tt6gEmsJ0KDkrS/AAzzCqXZh6+o55UHg60cICTqKeWfgMammbkV66X15NWkoS+j
 BDRiPY8AADemV2X5iSWhPjwW8HLKoCdw4V0+igddVfnwSo8E0sctZEA3O/7q8Fbfw9FW
 ZyL0U7Iwx1RnvwGIFL/22yqvK1hsKWz++eZJcAX/cuaq1xz65bAbLv1c41lPIUW61u6B
 IBVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3q5dcrWyl6Ox7GYJB2+i9nFj8cN4Nnstvz2hBJA9dbU0h9/hbTP68GVyUeB9xUDuHUl91wp09L4nJ9w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz9qIlSbj09xLSlMa54vEryNY5Miak5lc5ZPKhXT5Pvlky/eVUX
 EXX+WXAvpYMCxZNBKBm8yXScc8K4XQR8cMFXclHDOYnj6YKpGK3t4tjNHbb/MGjjmarWKOQBcW3
 DaG5kW+Z9DZSBb6wJyULWnyA797FTDuk=
X-Gm-Gg: ASbGncvWLVd6GOHxjugj2DKaVUOGoeECs1FyTNlchcWo9ng0K8sN/ZAGADq3uFGfz15
 6RUUsyz2pYnr7jCK3I4e43MQVbmiMlAb3V7oL9+OARAx1c8GyLtdUnxgMg63FzI1oCP4lhz0WaQ
 nwtWcCbSB81GPM+HQsY4eI4Q6RohSWfrlK8LfZX3tOcWVJSfihXynUaE0r8nDoImHcGvmnrKCHU
 iL9O9bEN9Huqek+kPFvrQ==
X-Google-Smtp-Source: AGHT+IGeKg+1AsHT8OzWJRaAIn4nQ5un+51PPsEFZqXXG7zkpSAAOASU4iUV34U5Po600E/i/8biPwPW0aGpB8iXi3U=
X-Received: by 2002:a05:6808:30a4:b0:433:fd1b:73f3 with SMTP id
 5614622812f47-43597b3b9d0mr10072751b6e.5.1754990257436; Tue, 12 Aug 2025
 02:17:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-53-b3bf97b038dc@redhat.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-53-b3bf97b038dc@redhat.com>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Tue, 12 Aug 2025 17:17:01 +0800
X-Gm-Features: Ac12FXwWvkLhtiiPhiHwQqmN1cgPTqDfCjN_x0Nmsu9rzni9NmKJK-aaPD6k1MI
Message-ID: <CAAfSe-spVF480JyBwxFN=KH82CdKNR0oY87oR6fsR+-CUH356Q@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH 053/114] clk: sprd: div: convert from
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
>  drivers/clk/sprd/div.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/clk/sprd/div.c b/drivers/clk/sprd/div.c
> index 936782c241271832c0a1957c99cbecc287351d1b..013423881968002d29c4e9536e7cd7b944779196 100644
> --- a/drivers/clk/sprd/div.c
> +++ b/drivers/clk/sprd/div.c
> @@ -9,13 +9,16 @@
>
>  #include "div.h"
>
> -static long sprd_div_round_rate(struct clk_hw *hw, unsigned long rate,
> -                               unsigned long *parent_rate)
> +static int sprd_div_determine_rate(struct clk_hw *hw,
> +                                  struct clk_rate_request *req)
>  {
>         struct sprd_div *cd = hw_to_sprd_div(hw);
>
> -       return divider_round_rate(&cd->common.hw, rate, parent_rate, NULL,
> -                                 cd->div.width, 0);
> +       req->rate = divider_round_rate(&cd->common.hw, req->rate,
> +                                      &req->best_parent_rate,
> +                                      NULL, cd->div.width, 0);
> +
> +       return 0;
>  }
>
>  unsigned long sprd_div_helper_recalc_rate(struct sprd_clk_common *common,
> @@ -75,7 +78,7 @@ static int sprd_div_set_rate(struct clk_hw *hw, unsigned long rate,
>
>  const struct clk_ops sprd_div_ops = {
>         .recalc_rate = sprd_div_recalc_rate,
> -       .round_rate = sprd_div_round_rate,
> +       .determine_rate = sprd_div_determine_rate,
>         .set_rate = sprd_div_set_rate,
>  };
>  EXPORT_SYMBOL_GPL(sprd_div_ops);
>
> --
> 2.50.1
>
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
