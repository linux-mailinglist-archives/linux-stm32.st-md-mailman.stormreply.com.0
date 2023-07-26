Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0037627D3
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jul 2023 02:43:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A431C6A61A;
	Wed, 26 Jul 2023 00:43:44 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9059C6905A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 00:43:42 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-51a52a7d859so921206a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jul 2023 17:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690332222; x=1690937022;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kzMeq122EOx0WClFDw8E5FGXVSDQXhMLtpdYnB5KEhE=;
 b=rCXOFOSZzvDmeeApZdiE2vysrOJpkwjtuwvtU1bf29LkRxM6AYlw2fZd7d2i9PcPjm
 +W11XmK4je/aZMdDboBH2Lo1cM1xt/9foDHz5xhNeiDVUGJBeK+dGmrH5FM/qXKW9YLq
 rM+29x7NL+0VFecSgb/VznJqSCYTW+HuGt0zBQzMxjcPkN3rXe+UjsHabvOOY9QKpGOA
 yNqnSs5xBVg6wo8k5nPLWzXj0btLPz0dAytmBX4XbWKobx5M3c/k7mcaVWnzueYoXGK/
 ChQdgYeJZlzovWokbo5/hSk/lDCCvkuN70z1uHYSBHVNOeTtdg8/8r0JCBtpKw+J2Xjm
 8ZdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690332222; x=1690937022;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kzMeq122EOx0WClFDw8E5FGXVSDQXhMLtpdYnB5KEhE=;
 b=ADo3DuLgGBzuxVSgHk1A4a27efFRYkGMDVQFklXiBYAUwQrA5qSs/KhDsxKJkzSEMA
 RM4l6/5EllUI+DOAqPdhDmbzy5DC/Jz5cl+nmOFTGHAkvLfsl7u/VrhmU8DjgB0i5wkr
 HCN/t7DqHokMpi2SRBiAf4v48uEpJ1YT4vR/619iXsTTkGMa5aZ2lOATo1DtG8gElWoY
 6HK/dHumhRIGvSAjnj68scLGwCvaX+RIqtyL+dkM6gfv6GtfdCpRcrmCwXED6HEav4pG
 +X3NvHPy1Hq74SKPHLW50+HPtLRNCppDn8Vm9IR1IfYEDmDk8B+26boCNoVSEEdusG8m
 omqA==
X-Gm-Message-State: ABy/qLb27l971M4uaPJDkWC6aEgk6mXQXu+A69t1odb/kOnF8TnMOSLF
 oBigApwVCJoj5tagzkZZhZA=
X-Google-Smtp-Source: APBJJlHwe2LqFb+lOsuZJE20DQkYEjOIxawrT1fLB/cSVFrUIWnFWKl8ujaoNdXJsqT52Aa++t2d0A==
X-Received: by 2002:a17:906:2253:b0:993:e695:b585 with SMTP id
 19-20020a170906225300b00993e695b585mr867715ejr.9.1690332221810; 
 Tue, 25 Jul 2023 17:43:41 -0700 (PDT)
Received: from skbuf ([188.25.175.105]) by smtp.gmail.com with ESMTPSA id
 rl6-20020a170907216600b009920a690cd9sm8865097ejb.59.2023.07.25.17.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 17:43:41 -0700 (PDT)
Date: Wed, 26 Jul 2023 03:43:38 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Shenwei Wang <shenwei.wang@nxp.com>
Message-ID: <20230726004338.6i354ue576hb35of@skbuf>
References: <20230725194931.1989102-1-shenwei.wang@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230725194931.1989102-1-shenwei.wang@nxp.com>
Cc: imx@lists.linux.dev, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Frank Li <frank.li@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: dwmac-imx: pause the TXC
	clock in fixed-link
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

Hi Shenwei,

On Tue, Jul 25, 2023 at 02:49:31PM -0500, Shenwei Wang wrote:
> When using a fixed-link setup, certain devices like the SJA1105 require a
> small pause in the TXC clock line to enable their internal tunable
> delay line (TDL).
> 
> To satisfy this requirement, this patch temporarily disables the TX clock,
> and restarts it after a required period. This provides the required
> silent interval on the clock line for SJA1105 to complete the frequency
> transition and enable the internal TDLs.
> 
> So far we have only enabled this feature on the i.MX93 platform.
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> Reviewed-by: Frank Li <frank.li@nxp.com>
> ---

Sorry for not responding off-list. Super busy.

I've tested both this patch on top of net-next as well as the lf-6.1.y
version you've sent separately - on a cold boot in both cases. Both the
i.MX93 base board and the SJA1105 EVB (powered by an external power supply)
were cold booted.

Unfortunately, the patch does not appear to work as intended, and
ethtool -S eth1 still shows no RX counter incrementing on the SJA1105
CPU port when used in RGMII mode (where the problem is).

>  .../net/ethernet/stmicro/stmmac/dwmac-imx.c   | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
> index b9378a63f0e8..799aedeec094 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
> @@ -40,6 +40,9 @@
>  #define DMA_BUS_MODE			0x00001000
>  #define DMA_BUS_MODE_SFT_RESET		(0x1 << 0)
>  #define RMII_RESET_SPEED		(0x3 << 14)
> +#define TEN_BASET_RESET_SPEED		(0x2 << 14)
> +#define RGMII_RESET_SPEED		(0x0 << 14)
> +#define CTRL_SPEED_MASK			(0x3 << 14)
>  
>  struct imx_dwmac_ops {
>  	u32 addr_width;
> @@ -56,6 +59,7 @@ struct imx_priv_data {
>  	struct regmap *intf_regmap;
>  	u32 intf_reg_off;
>  	bool rmii_refclk_ext;
> +	void __iomem *base_addr;
>  
>  	const struct imx_dwmac_ops *ops;
>  	struct plat_stmmacenet_data *plat_dat;
> @@ -212,6 +216,61 @@ static void imx_dwmac_fix_speed(void *priv, unsigned int speed)
>  		dev_err(dwmac->dev, "failed to set tx rate %lu\n", rate);
>  }
>  
> +static bool imx_dwmac_is_fixed_link(struct imx_priv_data *dwmac)
> +{
> +	struct plat_stmmacenet_data *plat_dat;
> +	struct device_node *dn;
> +
> +	if (!dwmac || !dwmac->plat_dat)
> +		return false;
> +
> +	plat_dat = dwmac->plat_dat;
> +	dn = of_get_child_by_name(dwmac->dev->of_node, "fixed-link");
> +	if (!dn)
> +		return false;
> +
> +	if (plat_dat->phy_node == dn || plat_dat->phylink_node == dn)
> +		return true;
> +
> +	return false;
> +}

I'm really not sure what prompted the complication here, since instead of:

if (imx_dwmac_is_fixed_link(dwmac)) {

you can do:

#include <linux/of_mdio.h>

if (of_phy_is_fixed_link(dwmac->dev->of_node)) {

and the latter has the advantage that it also matches (tested on
imx93-11x11-evk-sja1105.dts). I've had to make this change for testing,
because otherwise, the workaround wasn't even executing. Other than that,
I've done no other debugging.

Considering the fact that you need to resend a functional version even
in principle anyway, let's continue the discussion and debugging off-list.

Ah, please be aware of the message from the kernel test robot which said
that you're setting but not using the plat_dat variable in imx_dwmac_fix_speed_mx93().
It's probably a remnant of what later became imx_dwmac_is_fixed_link(),
but it still needs to be removed.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
