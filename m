Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE6861EC71
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Nov 2022 08:52:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A925DC64101;
	Mon,  7 Nov 2022 07:52:23 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4949CC5EC6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Nov 2022 07:52:22 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 p8-20020a056830130800b0066bb73cf3bcso6062031otq.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 06 Nov 2022 23:52:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hLKOOl0yo7YI7pAdrLyTR/NQWG7rhWdAq87I8wp+XOk=;
 b=LlLB+87QvlTjApjgCT8ARbt+k25ZTxj4hCraJQUhNiYTBrgeB88TKUG8a8+mEVKuPS
 JoSxs1mXMATF4+a2Jp/ugt4R8VBWym5BmsKx/A6PMCSGfzw4vsdJ2ho657ua/GjDPFWW
 JxuakAbrhRSe4YMgFWmThbTIg4mDKTbe+U6K2eCXiAmvYShb68jBjEv4IMWE0kKKRBB1
 dYZEY8gvY7wIaJoiG+4pd54WAwKmlwGTWkSxs4rEAMsZDVEyp6iIfzAjcLvna2GH43Fl
 MSKY3PVbCNSu6fulnFaWsjE6Q0N6hiVNdk2o2aGsQItmLZvt+JzxQkDHz+uReSUp10E5
 2jrg==
X-Gm-Message-State: ACrzQf3pBc0FqdL94JBqrub3COBnlJFn9u0vjkIoQyAcuXlijArJOh3N
 EhoDsqCQx/ompitoPzPw0tfQtClsa7Es4A==
X-Google-Smtp-Source: AMsMyM5fZuVo3jio+nD6GX4TFXZTSbgfMoiwPDu0ZY+eRr0NfqZQM8XQBXw2BufIpEemyE+qq4QzGA==
X-Received: by 2002:a05:6830:6611:b0:662:2725:d309 with SMTP id
 cp17-20020a056830661100b006622725d309mr22809914otb.293.1667807540910; 
 Sun, 06 Nov 2022 23:52:20 -0800 (PST)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com.
 [209.85.210.49]) by smtp.gmail.com with ESMTPSA id
 b206-20020acab2d7000000b0035a64076e0bsm2132206oif.37.2022.11.06.23.52.20
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Nov 2022 23:52:20 -0800 (PST)
Received: by mail-ot1-f49.google.com with SMTP id
 l42-20020a9d1b2d000000b0066c6366fbc3so6075644otl.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 06 Nov 2022 23:52:20 -0800 (PST)
X-Received: by 2002:a81:9c49:0:b0:34a:de:97b8 with SMTP id
 n9-20020a819c49000000b0034a00de97b8mr45959924ywa.384.1667807529144; 
 Sun, 06 Nov 2022 23:52:09 -0800 (PST)
MIME-Version: 1.0
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-28-f6736dec138e@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v2-28-f6736dec138e@cerno.tech>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Nov 2022 08:51:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXee3Xf8G53anCq-4qfenHhgnMiyC1KhKo8Uv6-UV_jrw@mail.gmail.com>
Message-ID: <CAMuHMdXee3Xf8G53anCq-4qfenHhgnMiyC1KhKo8Uv6-UV_jrw@mail.gmail.com>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Paul Cercueil <paul@crapouillou.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-phy@lists.infradead.org,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Abel Vesa <abelvesa@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Samuel Holland <samuel@sholland.org>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, linux-tegra@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 NXP Linux Team <linux-imx@nxp.com>, Orson Zhai <orsonzhai@gmail.com>,
 linux-mips@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-rtc@vger.kernel.org,
 linux-clk@vger.kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Daniel Vetter <daniel@ffwll.ch>, alsa-devel@alsa-project.org,
 Manivannan Sadhasivam <mani@kernel.org>, linux-kernel@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-actions@lists.infradead.org,
 Gareth Williams <gareth.williams.jx@renesas.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alessandro Zummo <a.zummo@towertech.it>, linux-sunxi@lists.linux.dev,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 linux-renesas-soc@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Lechner <david@lechnology.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH v2 28/65] clk: renesas: r9a06g032: Add a
	determine_rate hook
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

CC Gareth

On Fri, Nov 4, 2022 at 2:18 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> The Renesas r9a06g032 bitselect clock implements a mux with a set_parent
> hook, but doesn't provide a determine_rate implementation.
>
> This is a bit odd, since set_parent() is there to, as its name implies,
> change the parent of a clock. However, the most likely candidate to
> trigger that parent change is a call to clk_set_rate(), with
> determine_rate() figuring out which parent is the best suited for a
> given rate.
>
> The other trigger would be a call to clk_set_parent(), but it's far less
> used, and it doesn't look like there's any obvious user for that clock.
>
> So, the set_parent hook is effectively unused, possibly because of an
> oversight. However, it could also be an explicit decision by the
> original author to avoid any reparenting but through an explicit call to
> clk_set_parent().
>
> The latter case would be equivalent to setting the flag
> CLK_SET_RATE_NO_REPARENT, together with setting our determine_rate hook
> to __clk_mux_determine_rate(). Indeed, if no determine_rate
> implementation is provided, clk_round_rate() (through
> clk_core_round_rate_nolock()) will call itself on the parent if
> CLK_SET_RATE_PARENT is set, and will not change the clock rate
> otherwise. __clk_mux_determine_rate() has the exact same behavior when
> CLK_SET_RATE_NO_REPARENT is set.
>
> And if it was an oversight, then we are at least explicit about our
> behavior now and it can be further refined down the line.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/clk/renesas/r9a06g032-clocks.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
> index 983faa5707b9..70c37097ca6e 100644
> --- a/drivers/clk/renesas/r9a06g032-clocks.c
> +++ b/drivers/clk/renesas/r9a06g032-clocks.c
> @@ -773,6 +773,7 @@ static int r9a06g032_clk_mux_set_parent(struct clk_hw *hw, u8 index)
>  }
>
>  static const struct clk_ops clk_bitselect_ops = {
> +       .determine_rate = __clk_mux_determine_rate,
>         .get_parent = r9a06g032_clk_mux_get_parent,
>         .set_parent = r9a06g032_clk_mux_set_parent,
>  };
> @@ -797,7 +798,7 @@ r9a06g032_register_bitsel(struct r9a06g032_priv *clocks,
>
>         init.name = desc->name;
>         init.ops = &clk_bitselect_ops;
> -       init.flags = CLK_SET_RATE_PARENT;
> +       init.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT;
>         init.parent_names = names;
>         init.num_parents = 2;
>
>
> --
> b4 0.11.0-dev-99e3a
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
