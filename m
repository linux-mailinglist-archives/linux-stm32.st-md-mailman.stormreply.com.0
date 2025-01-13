Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B032A0C10E
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jan 2025 20:12:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EBA5DC78018;
	Mon, 13 Jan 2025 19:12:26 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C823C030CB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2025 19:12:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id F0350A412FB;
 Mon, 13 Jan 2025 19:10:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B61D3C4CED6;
 Mon, 13 Jan 2025 19:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736795543;
 bh=jCOB8aOzNhWI9qttXZRifzoIBgrVVWf/a92tgmgzrwA=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=HN9yx449EQxLOrNAvGNn9irfi+2rJJpk/6PEosDIO9CBH0RbAVxhy/bbpQAosnOQr
 4MiPb0aHyqbI1zpSxlNAaXGyoCXDa+Hjcs4ktJCbLdMFu2J8vVXwxohYLbmvOsCalo
 FjBuU9eSfrclmjBtKLK9Ozt/L0rSH3d/6br0mPUECpe7T2gL8EuVbfBf909TQO2qy4
 cvJlaBttOtm/f/7jwbEaB9AF37wPfx+MpPnUgAs6ob9Wf6byI0uuxgTIu5KmVU+hfA
 Mtna0ceEensBP7JFfcgHmsUphBAecSY65k4195gqUYk8CWXtx3uo7flhZKKo9wJZiD
 PnURzcV80O2yQ==
Message-ID: <9cc9071129187fbc1498ec25fb1c985d.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250109211908.1553072-5-dario.binacchi@amarulasolutions.com>
References: <20250109211908.1553072-1-dario.binacchi@amarulasolutions.com>
 <20250109211908.1553072-5-dario.binacchi@amarulasolutions.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-kernel@vger.kernel.org
Date: Mon, 13 Jan 2025 11:12:21 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Cc: Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 4/4] clk: stm32f4: support spread
	spectrum clock generation
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

Quoting Dario Binacchi (2025-01-09 13:18:31)
> diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
> index db1c56c8d54f..6c80c0dbb0a3 100644
> --- a/drivers/clk/clk-stm32f4.c
> +++ b/drivers/clk/clk-stm32f4.c
> @@ -35,6 +35,7 @@
>  #define STM32F4_RCC_APB2ENR            0x44
>  #define STM32F4_RCC_BDCR               0x70
>  #define STM32F4_RCC_CSR                        0x74
> +#define STM32F4_RCC_SSCGR              0x80
>  #define STM32F4_RCC_PLLI2SCFGR         0x84
>  #define STM32F4_RCC_PLLSAICFGR         0x88
>  #define STM32F4_RCC_DCKCFGR            0x8c
> @@ -42,6 +43,12 @@
>  
>  #define STM32F4_RCC_PLLCFGR_N_MASK     GENMASK(14, 6)
>  
> +#define STM32F4_RCC_SSCGR_SSCGEN       BIT(31)
> +#define STM32F4_RCC_SSCGR_SPREADSEL    BIT(30)
> +#define STM32F4_RCC_SSCGR_RESERVED_MASK        GENMASK(29, 28)
> +#define STM32F4_RCC_SSCGR_INCSTEP_MASK GENMASK(27, 13)
> +#define STM32F4_RCC_SSCGR_MODPER_MASK  GENMASK(12, 0)
> +
>  #define NONE -1
>  #define NO_IDX  NONE
>  #define NO_MUX  NONE
> @@ -512,6 +519,17 @@ static const struct clk_div_table pll_divr_table[] = {
>         { 2, 2 }, { 3, 3 }, { 4, 4 }, { 5, 5 }, { 6, 6 }, { 7, 7 }, { 0 }
>  };
>  
> +enum stm32f4_pll_ssc_mod_type {
> +       STM32F4_PLL_SSC_CENTER_SPREAD,
> +       STM32F4_PLL_SSC_DOWN_SPREAD,
> +};
> +
> +struct stm32f4_pll_ssc {
> +       unsigned int mod_freq;
> +       unsigned int mod_depth;
> +       enum stm32f4_pll_ssc_mod_type mod_type;
> +};
> +
>  struct stm32f4_pll {
>         spinlock_t *lock;
>         struct  clk_gate gate;
> @@ -519,6 +537,8 @@ struct stm32f4_pll {
>         u8 bit_rdy_idx;
>         u8 status;
>         u8 n_start;
> +       bool ssc_enable;
> +       struct stm32f4_pll_ssc ssc_conf;
>  };
>  
>  #define to_stm32f4_pll(_gate) container_of(_gate, struct stm32f4_pll, gate)
> @@ -541,6 +561,7 @@ struct stm32f4_vco_data {
>         u8 offset;
>         u8 bit_idx;
>         u8 bit_rdy_idx;
> +       bool sscg;
>  };
>  
>  static const struct stm32f4_vco_data  vco_data[] = {
> @@ -661,6 +682,34 @@ static long stm32f4_pll_round_rate(struct clk_hw *hw, unsigned long rate,
>         return *prate * n;
>  }
>  
> +static void stm32f4_pll_set_ssc(struct clk_hw *hw, unsigned long parent_rate,
> +                               unsigned int ndiv)
> +{
> +       struct clk_gate *gate = to_clk_gate(hw);
> +       struct stm32f4_pll *pll = to_stm32f4_pll(gate);
> +       struct stm32f4_pll_ssc *ssc = &pll->ssc_conf;
> +       u32 modeper, incstep;
> +       u32 sscgr;
> +
> +       sscgr = readl(base + STM32F4_RCC_SSCGR);
> +       /* reserved field must be kept at reset value */
> +       sscgr &= STM32F4_RCC_SSCGR_RESERVED_MASK;
> +
> +       modeper = DIV_ROUND_CLOSEST(parent_rate, 4 * ssc->mod_freq);
> +       incstep = DIV_ROUND_CLOSEST(((1 << 15) - 1) * ssc->mod_depth * ndiv,
> +                                   5 * 10000 * modeper);
> +       sscgr |= STM32F4_RCC_SSCGR_SSCGEN |
> +               FIELD_PREP(STM32F4_RCC_SSCGR_INCSTEP_MASK, incstep) |
> +               FIELD_PREP(STM32F4_RCC_SSCGR_MODPER_MASK, modeper);
> +
> +       if (ssc->mod_type)
> +               sscgr |= STM32F4_RCC_SSCGR_SPREADSEL;
> +
> +       pr_debug("%s: pll: %s: modeper: %d, incstep: %d, sscgr: 0x%08x\n",
> +                __func__, clk_hw_get_name(hw), modeper, incstep, sscgr);

Do we need to keep all this pr_debug()? It's tested code right?

> +       writel(sscgr, base + STM32F4_RCC_SSCGR);
> +}
> +
>  static int stm32f4_pll_set_rate(struct clk_hw *hw, unsigned long rate,
>                                 unsigned long parent_rate)
>  {
> @@ -683,6 +732,9 @@ static int stm32f4_pll_set_rate(struct clk_hw *hw, unsigned long rate,
>  
>         writel(val, base + pll->offset);
>  
> +       if (pll->ssc_enable)
> +               stm32f4_pll_set_ssc(hw, parent_rate, n);
> +
>         if (pll_state)
>                 stm32f4_pll_enable(hw);
>  
> @@ -788,6 +840,87 @@ static struct clk_hw *clk_register_pll_div(const char *name,
>         return hw;
>  }
>  
> +static int stm32f4_pll_init_ssc(struct clk_hw *hw, struct stm32f4_pll_ssc *conf)

__init

const conf?

> +{
> +       struct clk_gate *gate = to_clk_gate(hw);
> +       struct stm32f4_pll *pll = to_stm32f4_pll(gate);
> +       struct clk_hw *parent;
> +       unsigned long parent_rate;
> +       int pll_state;
> +       unsigned long n, val;
> +
> +       parent = clk_hw_get_parent(hw);
> +       if (!parent) {
> +               pr_err("%s: failed to get clock parent\n", __func__);
> +               return -ENODEV;
> +       }
> +
> +       parent_rate = clk_hw_get_rate(parent);
> +
> +       pll->ssc_enable = true;
> +       memcpy(&pll->ssc_conf, conf, sizeof(pll->ssc_conf));
> +
> +       pll_state = stm32f4_pll_is_enabled(hw);
> +
> +       if (pll_state)
> +               stm32f4_pll_disable(hw);
> +
> +       val = readl(base + pll->offset);
> +       n = FIELD_GET(STM32F4_RCC_PLLCFGR_N_MASK, val);
> +
> +       pr_debug("%s: pll: %s, parent: %s, parent-rate: %lu, n: %lu\n",
> +                __func__, clk_hw_get_name(hw), clk_hw_get_name(parent),
> +                parent_rate, n);
> +
> +       stm32f4_pll_set_ssc(hw, parent_rate, n);
> +
> +       if (pll_state)
> +               stm32f4_pll_enable(hw);
> +
> +       return 0;
> +}
> +
> +static int stm32f4_pll_ssc_parse_dt(struct device_node *np,

__init

> +                                   struct stm32f4_pll_ssc *conf)
> +{
> +       int ret;
> +       const char *s;
> +
> +       if (!conf)
> +               return -EINVAL;
> +
> +       ret = of_property_read_u32(np, "st,ssc-modfreq-hz", &conf->mod_freq);
> +       if (ret)
> +               return ret;
> +
> +       ret = of_property_read_u32(np, "st,ssc-moddepth-permyriad",
> +                                  &conf->mod_depth);
> +       if (ret) {
> +               pr_err("%pOF: missing st,ssc-moddepth-permyriad\n", np);
> +               return ret;
> +       }
> +
> +       ret = of_property_read_string(np, "st,ssc-modmethod", &s);
> +       if (ret) {
> +               pr_err("%pOF: missing st,ssc-modmethod\n", np);
> +               return ret;
> +       }
> +
> +       if (!strcmp(s, "down-spread")) {
> +               conf->mod_type = STM32F4_PLL_SSC_DOWN_SPREAD;
> +       } else if (!strcmp(s, "center-spread")) {
> +               conf->mod_type = STM32F4_PLL_SSC_CENTER_SPREAD;
> +       } else {
> +               pr_err("%pOF: wrong value (%s) for fsl,ssc-modmethod\n", np, s);
> +               return -EINVAL;
> +       }

Can you use match_string() like fwnode_property_match_property_string()
does?

> +
> +       pr_debug("%pOF: SSCG settings: mod_freq: %d, mod_depth: %d mod_method: %s [%d]\n",
> +                np, conf->mod_freq, conf->mod_depth, s, conf->mod_type);
> +
> +       return 0;
> +}
> +
>  static struct clk_hw *stm32f4_rcc_register_pll(const char *pllsrc,
>                 const struct stm32f4_pll_data *data,  spinlock_t *lock)
>  {
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
