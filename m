Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8CA624165
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Nov 2022 12:29:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24F76C6505C;
	Thu, 10 Nov 2022 11:29:22 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3550BC65056
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Nov 2022 11:29:20 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id b62so1565656pgc.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Nov 2022 03:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dZWp2kHBH7BxTK24vYMYaWuh8ES61v4HZQKkOxWH97c=;
 b=nm5AzPUP/c5SxnOWRF0E8OOs8vIUdOgDjB6wYkEQYpfYDRuGKSxS+CBIeuds7UEokj
 CAc3O4M3Lzp0CmH9uvJ+chSuCz2e7UtgkMxDMXFmH0EFBdC81NQcL56cIa/e5fTzyvWS
 kSegvkcOyKB6FEauX3mSzkzzDIAUq5r5SATzN3WmVSBqg1jyg/gg0kYs06KdBSG3zxV/
 fvTxGa1dt18Ruz+5BEtQasGBTHQrEp0wpReAHWWGdK+pWMVHzmdtTwn3mkonTWk309ZV
 x5RN6EKVnoWzvPKijsEeJPqRTGi+5rLHTCBxYP1D5lgzLbOuhL8arV0ezTVKJRNayIhr
 L9Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dZWp2kHBH7BxTK24vYMYaWuh8ES61v4HZQKkOxWH97c=;
 b=IdQtS5D/7EAlrJz+iGsDbslWS8ybMq+XLCkJl0tXtpNr+cey7CnMDeteiswhp2j9N1
 RzzJKA0UEhI0UQjAjjlKayZO6bxoLChcbdPsZHe+AI0tA9GEjk5M0D/iv3Ln5RL9YSTj
 cVn0LdHH7L1jxSacuM/AWRW+452YimH0dk45YkYKfhuNr2D98Sh3qvBjxSeMu6ZIjOA/
 /jyU1nSmISJDnkhf0x4cjKGjei/vtH6ZOj0N7OVFr6ynHsCP5NPzI82vLktfg0tlhzaW
 xm2WlHpkDEC19Zp1pcd+wdAGJ2DjOXa0JgkGGSZ+i4+jNdc/bynbRDyGx8uKk1yWMhQ5
 hNAQ==
X-Gm-Message-State: ACrzQf1rtsfu+iTT7Xsm4Dpc/uFkZJRuREDhzTCRpTtbcWgDcHy9Ienz
 saizkxyndRl5y5kDef1WOirmZsN1dZJiD3KVOsQFRg==
X-Google-Smtp-Source: AMsMyM4cuzpOD/TX9hqFyYyupcC8P3vPeFAFlSRm0wZ2MgnRUbZnV+cRg9A/mVHt7wBrkUdmfz48YahbcXukazUMnzc=
X-Received: by 2002:a63:4204:0:b0:442:ee11:4894 with SMTP id
 p4-20020a634204000000b00442ee114894mr2372631pga.595.1668079758533; Thu, 10
 Nov 2022 03:29:18 -0800 (PST)
MIME-Version: 1.0
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-35-f6736dec138e@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v2-35-f6736dec138e@cerno.tech>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 10 Nov 2022 12:28:41 +0100
Message-ID: <CAPDyKFoycVedCJMy0=UK+q5SiPQHqje_8bSN-gdkpBa6KhFfkg@mail.gmail.com>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Paul Cercueil <paul@crapouillou.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-phy@lists.infradead.org,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Abel Vesa <abelvesa@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
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
Subject: Re: [Linux-stm32] [PATCH v2 35/65] clk: ux500: sysctrl: Add a
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

On Fri, 4 Nov 2022 at 14:32, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The UX500 sysctrl "set_parent" clocks implement a mux with a set_parent
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

If I recall correctly, that is the use case we did target for these
types of clocks. See sound/soc/ux500/ux500_ab85xx.c, for example.

Maybe there are some additional pieces missing from the old down
stream kernel, I don't have full picture, sorry.

Anyway, if I am not wrong, this was about supporting a low-power audio
use case, which requires us to switch the parent clock (to avoid
wasting energy).

>
> So, the set_parent hook is effectively unused, possibly because of an
> oversight. However, it could also be an explicit decision by the
> original author to avoid any reparenting but through an explicit call to
> clk_set_parent().

Yes, this was the reason.

As a matter of fact, I don't even recall that re-parenting was
possible through clk_set_rate() when this clock driver was introduced.
But, I might be wrong, it's quite a while ago.

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

Seems reasonable to me!

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  drivers/clk/ux500/clk-sysctrl.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/ux500/clk-sysctrl.c b/drivers/clk/ux500/clk-sysctrl.c
> index 702f2f8b43fa..d36336665b6d 100644
> --- a/drivers/clk/ux500/clk-sysctrl.c
> +++ b/drivers/clk/ux500/clk-sysctrl.c
> @@ -110,6 +110,7 @@ static const struct clk_ops clk_sysctrl_gate_fixed_rate_ops = {
>  };
>
>  static const struct clk_ops clk_sysctrl_set_parent_ops = {
> +       .determine_rate = __clk_mux_determine_rate,
>         .set_parent = clk_sysctrl_set_parent,
>         .get_parent = clk_sysctrl_get_parent,
>  };
> @@ -220,6 +221,7 @@ struct clk *clk_reg_sysctrl_set_parent(struct device *dev,
>                                 unsigned long flags)
>  {
>         return clk_reg_sysctrl(dev, name, parent_names, num_parents,
> -                       reg_sel, reg_mask, reg_bits, 0, 0, flags,
> +                       reg_sel, reg_mask, reg_bits, 0, 0,
> +                       flags | CLK_SET_RATE_NO_REPARENT,
>                         &clk_sysctrl_set_parent_ops);
>  }
>
> --
> b4 0.11.0-dev-99e3a
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
