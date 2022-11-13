Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 823F962763D
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Nov 2022 08:07:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28F69C640EE;
	Mon, 14 Nov 2022 07:07:25 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2DED0C6334A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 13 Nov 2022 22:35:52 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id a27so5902958qtw.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 13 Nov 2022 14:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2UWIwxNMt9Li5DI9V3Ue/+A2ETbpfwK4uJjlNth28Ps=;
 b=cxos6M6SEMWjz70hcYfwJn7Qy9x3ScQZdWjcWHcTUuPDd6QIkxHfs4TdC7er0cgTfw
 Zecl1ammtXTh3CRumNopuCdrO/B9HdufOATVFx7LmHWfcuepu8nGRPAXZimVwU33NdJY
 fSpdh/6V9x/8s+acnZlcPXnCq3SzIgJYAOJ+MdHag7DONXMIur05Qu2T29C+PPj+G5FS
 51vaHNJTqtvQKEh0MKIsH8wIeeMtk/77Zn6zHSFYDKwwTYJrTvxOcJz1pI56sykta8ez
 ucf+QXApfLU7u3dxQYz1YwJFVAwCWBLrNvZsrMdMSVYHA3yVHW95iD4uAWPO1ebw8AQZ
 l5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2UWIwxNMt9Li5DI9V3Ue/+A2ETbpfwK4uJjlNth28Ps=;
 b=30ftj25KlnUCSWnL6cVcaBYgYoRZA7tqc3cwFN0LI9TopflCAsX1jtZFdxxXyThmeO
 k+2GR2qcPRBbSU4J4sw8qzKWGeGsGoCxeuia6AsGxXMKnpVkJm+2o+mnXfuYgUKTFVt+
 tKclvdig8H6JR85HhuZvYxE+OaieRqOcSUwHW1ZrooS5H/Z0d3ta3VQCFtgb4j/jZBup
 SPPrZ9T00T+vH6AQSt/SqC2BJi+QPLdQb/uzUlVs7rT8o9Vrmz+4Ei1kR1gO9lT7GX5s
 3TQjsfhHAMDO5bIml4OPbuQpyUC203HkRJYfejgPlsrPnkkYgRnc+ZyV3Ao0fy9TXl1t
 APLw==
X-Gm-Message-State: ANoB5pksH+ls1xeMLC7jAmzemz2XW7umBgCG8m00AxjTkMnfmOAD/6p7
 UW6ZhiCOzI8EtZiE/C3WzHU=
X-Google-Smtp-Source: AA0mqf6n/LTjELlMgOPAUHKCZj998ajlsJmr6FJtHheLBD4DRKv0w+DZx/+jLTxZzLzeUXXjccj7Rg==
X-Received: by 2002:a05:622a:4806:b0:3a4:f140:f707 with SMTP id
 fb6-20020a05622a480600b003a4f140f707mr10057169qtb.317.1668378951056; 
 Sun, 13 Nov 2022 14:35:51 -0800 (PST)
Received: from shaak (modemcable055.92-163-184.mc.videotron.ca.
 [184.163.92.55]) by smtp.gmail.com with ESMTPSA id
 bk8-20020a05620a1a0800b006f9f3c0c63csm5482646qkb.32.2022.11.13.14.35.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Nov 2022 14:35:50 -0800 (PST)
Date: Sun, 13 Nov 2022 17:35:46 -0500
From: Liam Beguin <liambeguin@gmail.com>
To: Maxime Ripard <maxime@cerno.tech>
Message-ID: <Y3FxQsT240Wm0G6g@shaak>
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-13-f6736dec138e@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221018-clk-range-checks-fixes-v2-13-f6736dec138e@cerno.tech>
X-Mailman-Approved-At: Mon, 14 Nov 2022 07:07:23 +0000
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
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
 linux-renesas-soc@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Lechner <david@lechnology.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH v2 13/65] clk: lmk04832: clkout: Add a
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

Hi Maxime,

On Fri, Nov 04, 2022 at 02:17:30PM +0100, Maxime Ripard wrote:
> The LKM04832 "CLKOUT" clock implements a mux with a set_parent hook, but
> doesn't provide a determine_rate implementation.
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

This is correct, the set_parent hook is effectively unused at the
moment. It was implemented as a way for consumers to select the parent
themselves.

The LMK04832 is used in JESD204 applications where devices need a device
clock as well as a sysref clock. Since this is determined by the
hardware layout, a devicetree option is used to select the inital state
of the clkout mux. This is set at the end of lmk04832_register_clkout().

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
> Since the CLK_SET_RATE_NO_REPARENT flag was already set though, it seems
> unlikely.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Liam Beguin <liambeguin@gmail.com>

Cheers,
Liam

> ---
>  drivers/clk/clk-lmk04832.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/clk-lmk04832.c b/drivers/clk/clk-lmk04832.c
> index f416f8bc2898..f68bb0affdad 100644
> --- a/drivers/clk/clk-lmk04832.c
> +++ b/drivers/clk/clk-lmk04832.c
> @@ -1281,6 +1281,7 @@ static const struct clk_ops lmk04832_clkout_ops = {
>  	.is_enabled = lmk04832_clkout_is_enabled,
>  	.prepare = lmk04832_clkout_prepare,
>  	.unprepare = lmk04832_clkout_unprepare,
> +	.determine_rate = __clk_mux_determine_rate,
>  	.set_parent = lmk04832_clkout_set_parent,
>  	.get_parent = lmk04832_clkout_get_parent,
>  };
> 
> -- 
> b4 0.11.0-dev-99e3a
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
