Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 386F0494DF8
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Jan 2022 13:32:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C09E6C5F1FC;
	Thu, 20 Jan 2022 12:32:10 +0000 (UTC)
Received: from mx2.securetransport.de (mx2.securetransport.de [188.68.39.254])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0FE91C5AB61
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jan 2022 12:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
 s=dhelectronicscom; t=1642681353;
 bh=haRx+ubYjgsAVsAb5w88a4ry5nJOF4pa9uDRBaSa44w=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=cZ5qJEyS/orQOOU91nKcQhTSnJqYqW7MXnegpOI2sZxzeTyUWheyJn69wWnBRMAoS
 ML7stLZ1yUp6fcc/ShECchfssFyh9abrZB2Gsj9rBreYZnwMtGbX1s38egRMmS+MHt
 0oGdzVe/NFSFqJ5VjsYtWMfOQuOqkyQlgkOwUBtZOnl5bQTXAmlzizfHZcsv/IPxEs
 Poe9/AhaOweMNNX9sglE/i7nh8U9FkBBQnOSFn+DytYy8in4s2+/gk1dccEfzuIFcI
 nPu6Xc4WHRUGY8zFuN7UrbHL/b081G05arw0ZVNvIv+4ZGeTu73SVUTvZAgcErmDW6
 pYhz/rsO+BB6Q==
X-secureTransport-forwarded: yes
From: Johann Neuhauser <jneuhauser@dh-electronics.com>
Complaints-To: abuse@cubewerk.de
To: "Marek MV. Vasut" <marex@denx.de>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Thread-Topic: [PATCH 2/5] clk: stm32mp1: Add parent_data to ETHRX clock
Thread-Index: AQHYDKowBbptfmImJ0K3nNIY0Ny5waxr0veA
Date: Thu, 20 Jan 2022 12:07:12 +0000
Message-ID: <ddf6afba3fd2402a8b3f60fe30bbdbba@dh-electronics.com>
References: <20220118202958.1840431-1-marex@denx.de>
 <20220118202958.1840431-2-marex@denx.de>
In-Reply-To: <20220118202958.1840431-2-marex@denx.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 20 Jan 2022 12:32:09 +0000
Cc: "Marek MV. Vasut" <marex@denx.de>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Stephen Boyd <sboyd@kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH 2/5] clk: stm32mp1: Add parent_data to
	ETHRX clock
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

> From: Marek Vasut [mailto:marex@denx.de]
> Sent: Tuesday, January 18, 2022 9:30 PM
> 
> Pass parent_data to ETHRX clock with new fw_name = "ETH_RX_CLK/ETH_REF_CLK".
> By default, this change has no impact on the operation of the clock driver.
> However, due to the fw_name, it permits DT to override ETHRX clock parent,
> which might be needed in case the ETHRX clock are supplied by external clock
> source.
> 
> Example of MCO2 supplying clock to ETH_RX_CLK via external pad-to-pad wire:
> &rcc {
>          clocks = <&rcc CK_MCO2>;
>          clock-names = "ETH_RX_CLK/ETH_REF_CLK";
> };
> 
> Note that while this patch permits to implement this rare usecase, the issue
> with ethernet RX and TX input clock modeling on MP1 is far more complex and
> requires more core plumbing.
> 
> [1] STM32MP1 Reference Manual RM0436 Rev 3, Page 574,
>     Figure 83. Peripheral clock distribution for Ethernet
>     https://www.st.com/resource/en/reference_manual/dm00327659-stm32mp157-advanced-armbased-32bit-mpus-
> stmicroelectronics.pdf
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Christophe Roullier <christophe.roullier@foss.st.com>
> Cc: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/clk/clk-stm32mp1.c | 36 ++++++++++++++++++++++++++++++++----
>  1 file changed, 32 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/clk-stm32mp1.c b/drivers/clk/clk-stm32mp1.c
> index 23a34ab459a3b..7ad2e6203baef 100644
> --- a/drivers/clk/clk-stm32mp1.c
> +++ b/drivers/clk/clk-stm32mp1.c
> @@ -155,6 +155,10 @@ static const char * const eth_src[] = {
>         "pll4_p", "pll3_q"
>  };
> 
> +const struct clk_parent_data ethrx_src[] = {
> +       { .name = "ethck_k", .fw_name = "ETH_RX_CLK/ETH_REF_CLK" },
> +};
> +
>  static const char * const rng_src[] = {
>         "ck_csi", "pll4_r", "ck_lse", "ck_lsi"
>  };
> @@ -317,6 +321,7 @@ struct clock_config {
>         const char *name;
>         const char *parent_name;
>         const char * const *parent_names;
> +       const struct clk_parent_data *parent_data;
>         int num_parents;
>         unsigned long flags;
>         void *cfg;
> @@ -576,6 +581,7 @@ static struct clk_hw *
>  clk_stm32_register_gate_ops(struct device *dev,
>                             const char *name,
>                             const char *parent_name,
> +                           const struct clk_parent_data *parent_data,
>                             unsigned long flags,
>                             void __iomem *base,
>                             const struct stm32_gate_cfg *cfg,
> @@ -586,7 +592,10 @@ clk_stm32_register_gate_ops(struct device *dev,
>         int ret;
> 
>         init.name = name;
> -       init.parent_names = &parent_name;
> +       if (parent_name)
> +               init.parent_names = &parent_name;
> +       if (parent_data)
> +               init.parent_data = parent_data;
>         init.num_parents = 1;
>         init.flags = flags;
> 
> @@ -611,6 +620,7 @@ clk_stm32_register_gate_ops(struct device *dev,
>  static struct clk_hw *
>  clk_stm32_register_composite(struct device *dev,
>                              const char *name, const char * const *parent_names,
> +                            const struct clk_parent_data *parent_data,
>                              int num_parents, void __iomem *base,
>                              const struct stm32_composite_cfg *cfg,
>                              unsigned long flags, spinlock_t *lock)
> @@ -1135,6 +1145,7 @@ _clk_stm32_register_gate(struct device *dev,
>         return clk_stm32_register_gate_ops(dev,
>                                     cfg->name,
>                                     cfg->parent_name,
> +                                   cfg->parent_data,
>                                     cfg->flags,
>                                     base,
>                                     cfg->cfg,
> @@ -1148,8 +1159,8 @@ _clk_stm32_register_composite(struct device *dev,
>                               const struct clock_config *cfg)
>  {
>         return clk_stm32_register_composite(dev, cfg->name, cfg->parent_names,
> -                                           cfg->num_parents, base, cfg->cfg,
> -                                           cfg->flags, lock);
> +                                           cfg->parent_data, cfg->num_parents,
> +                                           base, cfg->cfg, cfg->flags, lock);
>  }
> 
>  #define GATE(_id, _name, _parent, _flags, _offset, _bit_idx, _gate_flags)\
> @@ -1258,6 +1269,16 @@ _clk_stm32_register_composite(struct device *dev,
>         .func           = _clk_stm32_register_gate,\
>  }
> 
> +#define STM32_GATE_PDATA(_id, _name, _parent, _flags, _gate)\
> +{\
> +       .id             = _id,\
> +       .name           = _name,\
> +       .parent_data    = _parent,\
> +       .flags          = _flags,\
> +       .cfg            = (struct stm32_gate_cfg *) {_gate},\
> +       .func           = _clk_stm32_register_gate,\
> +}
> +
>  #define _STM32_GATE(_gate_offset, _gate_bit_idx, _gate_flags, _mgate, _ops)\
>         (&(struct stm32_gate_cfg) {\
>                 &(struct gate_cfg) {\
> @@ -1291,6 +1312,10 @@ _clk_stm32_register_composite(struct device *dev,
>         STM32_GATE(_id, _name, _parent, _flags,\
>                    _STM32_MGATE(_mgate))
> 
> +#define MGATE_MP1_PDATA(_id, _name, _parent, _flags, _mgate)\
> +       STM32_GATE_PDATA(_id, _name, _parent, _flags,\
> +                  _STM32_MGATE(_mgate))
> +
>  #define _STM32_DIV(_div_offset, _div_shift, _div_width,\
>                    _div_flags, _div_table, _ops)\
>         .div = &(struct stm32_div_cfg) {\
> @@ -1354,6 +1379,9 @@ _clk_stm32_register_composite(struct device *dev,
>  #define PCLK(_id, _name, _parent, _flags, _mgate)\
>         MGATE_MP1(_id, _name, _parent, _flags, _mgate)
> 
> +#define PCLK_PDATA(_id, _name, _parent, _flags, _mgate)\
> +       MGATE_MP1_PDATA(_id, _name, _parent, _flags, _mgate)
> +
>  #define KCLK(_id, _name, _parents, _flags, _mgate, _mmux)\
>              COMPOSITE(_id, _name, _parents, CLK_OPS_PARENT_ENABLE |\
>                        CLK_SET_RATE_NO_REPARENT | _flags,\
> @@ -1951,7 +1979,7 @@ static const struct clock_config stm32mp1_clock_cfg[] = {
>         PCLK(MDMA, "mdma", "ck_axi", 0, G_MDMA),
>         PCLK(GPU, "gpu", "ck_axi", 0, G_GPU),
>         PCLK(ETHTX, "ethtx", "ck_axi", 0, G_ETHTX),
> -       PCLK(ETHRX, "ethrx", "ck_axi", 0, G_ETHRX),
> +       PCLK_PDATA(ETHRX, "ethrx", ethrx_src, 0, G_ETHRX),
>         PCLK(ETHMAC, "ethmac", "ck_axi", 0, G_ETHMAC),
>         PCLK(FMC, "fmc", "ck_axi", CLK_IGNORE_UNUSED, G_FMC),
>         PCLK(QSPI, "qspi", "ck_axi", CLK_IGNORE_UNUSED, G_QSPI),
> --
> 2.34.1
Tested-by: Johann Neuhauser <jneuhauser@dh-electronics.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
