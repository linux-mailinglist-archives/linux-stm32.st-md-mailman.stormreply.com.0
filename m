Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD22C3149D7
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Feb 2021 09:00:45 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90500C57189;
	Tue,  9 Feb 2021 08:00:45 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C0FECC3FADB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Feb 2021 08:00:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 27CCC64E6F;
 Tue,  9 Feb 2021 08:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612857642;
 bh=PrZKwTBAEkhO9oVwFzz9vR4RpjecGA222H6u+Smz3/g=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=RZfSdW4MONU6xyHZcAlXF3UuyrNKwqpNx49sUuIUYtO86OB+31RzMa1O7dF6M8YBN
 S9MNPiFRGvoUA8A7uoT3UZCXdmXkFdNWGQbJ+sjvPOwuF+KFSBJW6x2gxRNadUf4bP
 TGupFGxUhX0KPEaei1olRQFWoplvhuVhF2qYSql41c20wThIpVrLDHHKFENyYOEJl2
 h6MSfwndGoBOY8w349HyrpUO+EjDiPP8L/NShDsheNvOfjRpZ9QV9QdZU2yJWTiPRZ
 i9t4psH+djtVZrQpkwSgDJim/iW8woBnt+ZvJELngCF1WqDRt/z1M9KYOY8Du/SNoX
 y0os1dyaKr6Yg==
MIME-Version: 1.0
In-Reply-To: <20210126090120.19900-3-gabriel.fernandez@foss.st.com>
References: <20210126090120.19900-1-gabriel.fernandez@foss.st.com>
 <20210126090120.19900-3-gabriel.fernandez@foss.st.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Alexandre Torgue <alexandre.torgue@st.com>,
 Etienne Carriere <etienne.carriere@st.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 marex@denx.de
Date: Tue, 09 Feb 2021 00:00:40 -0800
Message-ID: <161285764074.418021.15522379930579131077@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 02/14] clk: stm32mp1: merge
	'ck_hse_rtc' and 'ck_rtc' into one clock
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

Quoting gabriel.fernandez@foss.st.com (2021-01-26 01:01:08)
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> 
> 'ck_rtc' has multiple clocks as input (ck_hsi, ck_lsi, and ck_hse).
> A divider is available only on the specific rtc input for ck_hse.
> This Merge will facilitate to have a more coherent clock tree
> in no trusted / trusted world.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---
>  drivers/clk/clk-stm32mp1.c | 49 +++++++++++++++++++++++++++++++++-----
>  1 file changed, 43 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clk/clk-stm32mp1.c b/drivers/clk/clk-stm32mp1.c
> index 35d5aee8f9b0..0e1d4427a8df 100644
> --- a/drivers/clk/clk-stm32mp1.c
> +++ b/drivers/clk/clk-stm32mp1.c
> @@ -245,7 +245,7 @@ static const char * const dsi_src[] = {
>  };
>  
>  static const char * const rtc_src[] = {
> -       "off", "ck_lse", "ck_lsi", "ck_hse_rtc"
> +       "off", "ck_lse", "ck_lsi", "ck_hse"
>  };
>  
>  static const char * const mco1_src[] = {
> @@ -1031,6 +1031,42 @@ static struct clk_hw *clk_register_cktim(struct device *dev, const char *name,
>         return hw;
>  }
>  
> +/* The divider of RTC clock concerns only ck_hse clock */
> +#define HSE_RTC 3
> +
> +static unsigned long clk_divider_rtc_recalc_rate(struct clk_hw *hw,
> +                                                unsigned long parent_rate)
> +{
> +       if (clk_hw_get_parent(hw) == clk_hw_get_parent_by_index(hw, HSE_RTC))
> +               return clk_divider_ops.recalc_rate(hw, parent_rate);
> +
> +       return parent_rate;
> +}
> +
> +static long clk_divider_rtc_round_rate(struct clk_hw *hw, unsigned long rate,
> +                                      unsigned long *prate)
> +{
> +       if (clk_hw_get_parent(hw) == clk_hw_get_parent_by_index(hw, HSE_RTC))

This clk op can be called at basically any time. Maybe this should use
the determine rate op and then look to see what the parent is that comes
in via the rate request structure? Or is the intention to keep this
pinned to one particular parent? Looking at this right now it doesn't
really make much sense why the current parent state should play into
what rate the clk can round to, unless there is some more clk flags
going on that constrain the ability to change this clk's parent.

> +               return clk_divider_ops.round_rate(hw, rate, prate);
> +
> +       return *prate;
> +}
> +
> +static int clk_divider_rtc_set_rate(struct clk_hw *hw, unsigned long rate,
> +                                   unsigned long parent_rate)
> +{
> +       if (clk_hw_get_parent(hw) == clk_hw_get_parent_by_index(hw, HSE_RTC))
> +               return clk_divider_ops.set_rate(hw, rate, parent_rate);
> +
> +       return parent_rate;
> +}
> +
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
