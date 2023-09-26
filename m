Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D64C07AEB6E
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Sep 2023 13:26:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 827B2C6B462;
	Tue, 26 Sep 2023 11:26:01 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B311AC6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Sep 2023 11:26:00 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2c012232792so145200931fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Sep 2023 04:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695727560; x=1696332360;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+La3l4QJeXsp9Kjml5oMSUKYjgR6+RcPlKBCRGbxUVA=;
 b=lA/RhZ73cWfMus7B5vnBK+/c/xyOCZYvPjBFDlfZf56zplJXdr98oNbsnYcU/40Edz
 IYfDiZRJWYt+0Acen+T3TvtQb4HpeIDUec2d9RmsYomJT5YmLY4PH+JN6h1kxIJ+AUw0
 MyYEouJ+hBEjxfgUjjsBnkpm5sTTTYOi/lMH4/K/1YsE44bns08IfFt9aZDpzksdm0UP
 2i6zTa6UlQ0901TzEjuSGcr4pmOT0Be9JvT8PyfeFCQUv5crUckOGJI/Itvz/zyMnQsX
 Kky4L831oRM0KjNeHSgJGnvpLqFzqP5Y5YhigQZPNVEeI2C7x3SYEEjlbjLY9fyDssZh
 Lt+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695727560; x=1696332360;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+La3l4QJeXsp9Kjml5oMSUKYjgR6+RcPlKBCRGbxUVA=;
 b=gw3x3FlWGGyN7vxIZSNviFJEnotzAcJgQC0egRleb2ia1PNak66vQV3iqfX07n750T
 DyT2FcnA44pHKHzw2zXPZ0BTrpE6Xh4Iu59JPFbACppOPAhC0HDHFbmZMm79wywJOLdL
 dNFov4rrEyMcKIEFn4dkXQjZwY4nF3d0o1fy1Wvh0CA2wo4TNwXR4Ei1/vd/b2lo171l
 m/sRKMwj4CTqp9+w8RxTosqKGZP2agAzpVJWg/CWfYDQ1Wh4LWNQnhNizUMd1fO6JQog
 FJ5R9JvHl5zwuaHJsG9EA8lp5XDWjXDa9PDWTxfURxaKimLWgADUlasFEhzrUPZMKWc/
 xH9w==
X-Gm-Message-State: AOJu0YwQMYqhVr3i/DvCjcAFdvSmOBqzQUCrnqQSkp6c9eaRA9etcIHH
 cwEZWRly+XagpzGFF+VQkos=
X-Google-Smtp-Source: AGHT+IEvmx+5EHYSLC77siv1F1Hb04SJWpdevDTLmF9HM1gC4Y/v8GV0GGsuSP0bvyOLYr16VCNfEg==
X-Received: by 2002:a2e:9dc3:0:b0:2bf:f5c9:2dce with SMTP id
 x3-20020a2e9dc3000000b002bff5c92dcemr8000692ljj.30.1695727559653; 
 Tue, 26 Sep 2023 04:25:59 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 g17-20020a2e9cd1000000b002c02f371e37sm2596182ljj.52.2023.09.26.04.25.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Sep 2023 04:25:59 -0700 (PDT)
Date: Tue, 26 Sep 2023 14:25:56 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Rohan G Thomas <rohan.g.thomas@intel.com>
Message-ID: <xwcwjtyy5yx6pruoa3vmssnjzkbeahmfyym4e5lrq2efcwwiym@2upf4ko4mah5>
References: <20230923031031.21434-1-rohan.g.thomas@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230923031031.21434-1-rohan.g.thomas@intel.com>
Cc: devicetree@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/1] net: stmmac: xgmac: EST
	interrupts handling
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

Hi Rohan

On Sat, Sep 23, 2023 at 11:10:31AM +0800, Rohan G Thomas wrote:
> Enabled the following EST related interrupts:
>   1) Constant Gate Control Error (CGCE)
>   2) Head-of-Line Blocking due to Scheduling (HLBS)
>   3) Head-of-Line Blocking due to Frame Size (HLBF)
>   4) Base Time Register error (BTRE)
>   5) Switch to S/W owned list Complete (SWLC)
> Also, add EST errors into the ethtool statistic.
> 
> The commit e49aa315cb01 ("net: stmmac: EST interrupts handling and
> error reporting") and commit 9f298959191b ("net: stmmac: Add EST
> errors into ethtool statistic") add EST interrupts handling and error
> reporting support to DWMAC4 core. This patch enables the same support
> for XGMAC.

So, this is basically a copy of what was done for the DW QoS Eth
IP-core (DW GMAC v4.x/v5.x). IMO it would be better to factor it out
into a separate module together with the rest of the setup methods
like it's done for TC or PTP. But since it implies some much more work
I guess we can leave it as is for now...

Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

> 
> Signed-off-by: Rohan G Thomas <rohan.g.thomas@intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  .../net/ethernet/stmicro/stmmac/dwxgmac2.h    | 27 ++++++
>  .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 89 +++++++++++++++++++
>  2 files changed, 116 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> index 7a8f47e7b728..75782b8cdfe9 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> @@ -289,6 +289,33 @@
>  #define XGMAC_PTOV_SHIFT		23
>  #define XGMAC_SSWL			BIT(1)
>  #define XGMAC_EEST			BIT(0)
> +#define XGMAC_MTL_EST_STATUS		0x00001058
> +#define XGMAC_BTRL			GENMASK(15, 8)
> +#define XGMAC_BTRL_SHIFT		8
> +#define XGMAC_BTRL_MAX			GENMASK(15, 8)
> +#define XGMAC_CGCE			BIT(4)
> +#define XGMAC_HLBS			BIT(3)
> +#define XGMAC_HLBF			BIT(2)
> +#define XGMAC_BTRE			BIT(1)
> +#define XGMAC_SWLC			BIT(0)
> +#define XGMAC_MTL_EST_SCH_ERR		0x00001060
> +#define XGMAC_MTL_EST_FRM_SZ_ERR	0x00001064
> +#define XGMAC_MTL_EST_FRM_SZ_CAP	0x00001068
> +#define XGMAC_SZ_CAP_HBFS_MASK		GENMASK(14, 0)
> +#define XGMAC_SZ_CAP_HBFQ_SHIFT		16
> +#define XGMAC_SZ_CAP_HBFQ_MASK(val)	\
> +	({					\
> +		typeof(val) _val = (val);	\
> +		(_val > 4 ? GENMASK(18, 16) :	\
> +		 _val > 2 ? GENMASK(17, 16) :	\
> +		 BIT(16));			\
> +	})
> +#define XGMAC_MTL_EST_INT_EN		0x00001070
> +#define XGMAC_IECGCE			BIT(4)
> +#define XGMAC_IEHS			BIT(3)
> +#define XGMAC_IEHF			BIT(2)
> +#define XGMAC_IEBE			BIT(1)
> +#define XGMAC_IECC			BIT(0)
>  #define XGMAC_MTL_EST_GCL_CONTROL	0x00001080
>  #define XGMAC_BTR_LOW			0x0
>  #define XGMAC_BTR_HIGH			0x1
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> index f352be269deb..0af0aefa6656 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> @@ -1469,9 +1469,97 @@ static int dwxgmac3_est_configure(void __iomem *ioaddr, struct stmmac_est *cfg,
>  		ctrl &= ~XGMAC_EEST;
>  
>  	writel(ctrl, ioaddr + XGMAC_MTL_EST_CONTROL);
> +
> +	/* Configure EST interrupt */
> +	if (cfg->enable)
> +		ctrl = XGMAC_IECGCE | XGMAC_IEHS | XGMAC_IEHF | XGMAC_IEBE |
> +		       XGMAC_IECC;
> +	else
> +		ctrl = 0;
> +
> +	writel(ctrl, ioaddr + XGMAC_MTL_EST_INT_EN);
>  	return 0;
>  }
>  
> +static void dwxgmac3_est_irq_status(void __iomem *ioaddr,
> +				    struct net_device *dev,
> +				    struct stmmac_extra_stats *x, u32 txqcnt)
> +{
> +	u32 status, value, feqn, hbfq, hbfs, btrl;
> +	u32 txqcnt_mask = BIT(txqcnt) - 1;
> +
> +	status = readl(ioaddr + XGMAC_MTL_EST_STATUS);
> +
> +	value = XGMAC_CGCE | XGMAC_HLBS | XGMAC_HLBF | XGMAC_BTRE | XGMAC_SWLC;
> +
> +	/* Return if there is no error */
> +	if (!(status & value))
> +		return;
> +
> +	if (status & XGMAC_CGCE) {
> +		/* Clear Interrupt */
> +		writel(XGMAC_CGCE, ioaddr + XGMAC_MTL_EST_STATUS);
> +
> +		x->mtl_est_cgce++;
> +	}
> +
> +	if (status & XGMAC_HLBS) {
> +		value = readl(ioaddr + XGMAC_MTL_EST_SCH_ERR);
> +		value &= txqcnt_mask;
> +
> +		x->mtl_est_hlbs++;
> +
> +		/* Clear Interrupt */
> +		writel(value, ioaddr + XGMAC_MTL_EST_SCH_ERR);
> +
> +		/* Collecting info to shows all the queues that has HLBS
> +		 * issue. The only way to clear this is to clear the
> +		 * statistic.
> +		 */
> +		if (net_ratelimit())
> +			netdev_err(dev, "EST: HLB(sched) Queue 0x%x\n", value);
> +	}
> +
> +	if (status & XGMAC_HLBF) {
> +		value = readl(ioaddr + XGMAC_MTL_EST_FRM_SZ_ERR);
> +		feqn = value & txqcnt_mask;
> +
> +		value = readl(ioaddr + XGMAC_MTL_EST_FRM_SZ_CAP);
> +		hbfq = (value & XGMAC_SZ_CAP_HBFQ_MASK(txqcnt)) >>
> +			XGMAC_SZ_CAP_HBFQ_SHIFT;
> +		hbfs = value & XGMAC_SZ_CAP_HBFS_MASK;
> +
> +		x->mtl_est_hlbf++;
> +
> +		/* Clear Interrupt */
> +		writel(feqn, ioaddr + XGMAC_MTL_EST_FRM_SZ_ERR);
> +
> +		if (net_ratelimit())
> +			netdev_err(dev, "EST: HLB(size) Queue %u Size %u\n",
> +				   hbfq, hbfs);
> +	}
> +
> +	if (status & XGMAC_BTRE) {
> +		if ((status & XGMAC_BTRL) == XGMAC_BTRL_MAX)
> +			x->mtl_est_btrlm++;
> +		else
> +			x->mtl_est_btre++;
> +
> +		btrl = (status & XGMAC_BTRL) >> XGMAC_BTRL_SHIFT;
> +
> +		if (net_ratelimit())
> +			netdev_info(dev, "EST: BTR Error Loop Count %u\n",
> +				    btrl);
> +
> +		writel(XGMAC_BTRE, ioaddr + XGMAC_MTL_EST_STATUS);
> +	}
> +
> +	if (status & XGMAC_SWLC) {
> +		writel(XGMAC_SWLC, ioaddr + XGMAC_MTL_EST_STATUS);
> +		netdev_info(dev, "EST: SWOL has been switched\n");
> +	}
> +}
> +
>  static void dwxgmac3_fpe_configure(void __iomem *ioaddr, u32 num_txq,
>  				   u32 num_rxq, bool enable)
>  {
> @@ -1541,6 +1629,7 @@ const struct stmmac_ops dwxgmac210_ops = {
>  	.config_l4_filter = dwxgmac2_config_l4_filter,
>  	.set_arp_offload = dwxgmac2_set_arp_offload,
>  	.est_configure = dwxgmac3_est_configure,
> +	.est_irq_status = dwxgmac3_est_irq_status,
>  	.fpe_configure = dwxgmac3_fpe_configure,
>  };
>  
> -- 
> 2.26.2
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
