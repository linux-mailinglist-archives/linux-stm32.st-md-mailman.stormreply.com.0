Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2157762220E
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Nov 2022 03:44:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA519C6504B;
	Wed,  9 Nov 2022 02:44:06 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 200C2C65041
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Nov 2022 02:44:05 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id z18so25271583edb.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 08 Nov 2022 18:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZSs9bG/LbFf1fIR0eapTeL6P50DjYrAFt1f1UPagmkc=;
 b=fm3R7eHwEY7icgp5E36AR1x+G3iJ/B+gTC6qXXcb2VuX8T7PYbpIOMaEAEk+z5gP5C
 C30KcgR4lm806IYQfNeeuFx0cfGof3DpzdH786/cCDzuWrdeUNc7jFOrL5vMwTo9Vbtm
 dVxBVDI57pb7BVYvuH3eLaJ4JjrtQb9xL2MZ41TI7RBi2z65S87p9zWDePR0yCVz6VHw
 JOVSi+JRNqY3PBDz9qa44qLlWzFaPdXGRa4GRcfXuEi5nSYmnCJ6Zyk7dG4zjutSYT5H
 vN2MmXbmOeI+y4HkZpv6Bi0bN99D9Nar9mmN1KGg/88Sfc9R8fV6gzM/jPxbXATFIa/1
 F+hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZSs9bG/LbFf1fIR0eapTeL6P50DjYrAFt1f1UPagmkc=;
 b=bSR86knxsck7yNXZV8ukNVzh0BDSq3l4NXJ0IB3f/kDUa8D586MOU8HtH+LKGvII2Z
 krr78TMkeYk8qBLf+QsboBWqArMtQ6UdGSi1xv/UKBGdutAuvFdAfuplXU3Z8FgtrtbE
 IpeNdrgGWUUb+WeTmbHn8xFDCddjaKWVjdmEDae1wpfvar5Xs6+eIP6YdJMjTyI7Bgap
 VRSpxwaDl7Sddq5XWIqlv6VhExBO8EnHR21gYvCQbGA7YysA/p755Tk+XFLPQdZU5xrh
 XCZWaeAmmwrmFDtYZX+259LjwAztSEGMNDN+mc0taL4X6he+SHvgIlEBPXqURznmGmdN
 1QwQ==
X-Gm-Message-State: ACrzQf0Dd3ADms5xxGQe0Tzj5SBkVDjQEAxJqY+OnT+cmRQucL+NhAns
 PeCGlwwyuIrMWa9GdyNHgS0hdXQdGneceRC1q28=
X-Google-Smtp-Source: AMsMyM4o96Fp/fgGe8bWp9qyaCLc1d6jcauj7urZdaiQjIItG7q8RJuK4x04Dncd47Xu2Mogx93A97DsfgYY/BWPass=
X-Received: by 2002:a05:6402:3806:b0:450:bad8:8cd5 with SMTP id
 es6-20020a056402380600b00450bad88cd5mr59725933edb.305.1667961844484; Tue, 08
 Nov 2022 18:44:04 -0800 (PST)
MIME-Version: 1.0
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-58-f6736dec138e@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v2-58-f6736dec138e@cerno.tech>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Wed, 9 Nov 2022 10:43:26 +0800
Message-ID: <CAAfSe-t96pttpdLjLYntof5JCNcVHg0fMckk6zC7YHRRceDw+A@mail.gmail.com>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Paul Cercueil <paul@crapouillou.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-phy@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Abel Vesa <abelvesa@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Samuel Holland <samuel@sholland.org>, David Airlie <airlied@gmail.com>,
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
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-renesas-soc@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Lechner <david@lechnology.com>, Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Linux-stm32] [PATCH v2 58/65] clk: sprd: composite: Switch to
	determine_rate
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

On Fri, 4 Nov 2022 at 21:33, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The Spreadtrum composite clocks implements a mux with a set_parent
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
> The driver does implement round_rate() though, which means that we can
> change the rate of the clock, but we will never get to change the
> parent.
>
> However, It's hard to tell whether it's been done on purpose or not.
>
> Since we'll start mandating a determine_rate() implementation, let's
> convert the round_rate() implementation to a determine_rate(), which
> will also make the current behavior explicit. And if it was an
> oversight, the clock behaviour can be adjusted later on.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Chunyan Zhang <zhang.lyra@gmail.com>

Thanks,
Chunyan

> ---
>  drivers/clk/sprd/composite.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/clk/sprd/composite.c b/drivers/clk/sprd/composite.c
> index ebb644820b1e..d3a852720c07 100644
> --- a/drivers/clk/sprd/composite.c
> +++ b/drivers/clk/sprd/composite.c
> @@ -9,13 +9,19 @@
>
>  #include "composite.h"
>
> -static long sprd_comp_round_rate(struct clk_hw *hw, unsigned long rate,
> -                               unsigned long *parent_rate)
> +static int sprd_comp_determine_rate(struct clk_hw *hw,
> +                                   struct clk_rate_request *req)
>  {
>         struct sprd_comp *cc = hw_to_sprd_comp(hw);
> +       unsigned long rate;
>
> -       return sprd_div_helper_round_rate(&cc->common, &cc->div,
> -                                        rate, parent_rate);
> +       rate = sprd_div_helper_round_rate(&cc->common, &cc->div,
> +                                         req->rate, &req->best_parent_rate);
> +       if (rate < 0)
> +               return rate;
> +
> +       req->rate = rate;
> +       return 0;
>  }
>
>  static unsigned long sprd_comp_recalc_rate(struct clk_hw *hw,
> @@ -53,7 +59,7 @@ const struct clk_ops sprd_comp_ops = {
>         .get_parent     = sprd_comp_get_parent,
>         .set_parent     = sprd_comp_set_parent,
>
> -       .round_rate     = sprd_comp_round_rate,
> +       .determine_rate = sprd_comp_determine_rate,
>         .recalc_rate    = sprd_comp_recalc_rate,
>         .set_rate       = sprd_comp_set_rate,
>  };
>
> --
> b4 0.11.0-dev-99e3a
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
