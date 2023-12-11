Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C10780C7BA
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Dec 2023 12:14:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9E66C6B475;
	Mon, 11 Dec 2023 11:14:06 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88A45C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Dec 2023 11:14:05 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2ca03103155so53095501fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Dec 2023 03:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702293244; x=1702898044;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TZlJKNJuAF2u1GSvqcTyzd/ThjaoKh1FfxAi9ygtV1w=;
 b=MZtiPvqNRbqyjrMwA6j264mLPNJM74YGkmeg5UE8eVlkT3Jk9zuwXdQChcqtCN6pw1
 lClkSDAjqjEsTIDYjwLp+MjxpDBkWXKRKLekdJhWveGtiGoPPyHPXEP+spWrauqtmb/0
 G0kv8zLJuP7DDp15AxhHohD8juHlqpchDfwX4eJ4TVj2q6GAyJ43j6svABgt8TO2bUyZ
 /WnpknqYAmcmSJfmoxdZz0poeluK+IzU0vGizcx9iMYOr1qvvqm6CCh28lhwouoSTepx
 X9nld+TFHdr+voRm2EBp1Irvcv/8dG8TWlqRqWY3z4XW7zawMEDwG/Kha6I+Vb/gApcU
 rWew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702293244; x=1702898044;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TZlJKNJuAF2u1GSvqcTyzd/ThjaoKh1FfxAi9ygtV1w=;
 b=GHMTfAsxnJs3Oy/xpXdGxStp5fh3heVjYUFEqZANH73u6UwTg0b/BLQsMsTdQXB/QA
 sHidTCglHkGpBfIP9SXLOyO7A3sk570l5Dep7RAcToBJlPXQLE98ohNRK87jl3d66Qrz
 Eg/oul6SWI6ME3NgLbU8h8lElMLkweXhsqm6GCBTJ5y28IZA+7sjkG5CbHRrmkCvSq3U
 bqfLOj1Lev287MMILdr9h3kHGfJqk+WWLdXvIQOhcoBmmtQxMj2h3SGxCEu+S6nu8Cvv
 Xs1dcZzP3Spaq72KOSQP1e9SwkTHllcu1LVmtea4knsI/cOMo0dZgFSXfm4nDBmpYP4I
 XmGQ==
X-Gm-Message-State: AOJu0YzXyyqH1WLdGHOnmLiAXlkZlKAdUMYkC3px/hBbbmln9dFRxYGZ
 woaUtAea54sjx+BdOApKsew=
X-Google-Smtp-Source: AGHT+IGafVmfte0G6LYewWQ5gZB1uWaDskC4142GTnR6Ss9eUnTqdCZMJJuoYtX2pGoyjTWSFWYrFw==
X-Received: by 2002:a05:6512:a8a:b0:50c:2254:9f5f with SMTP id
 m10-20020a0565120a8a00b0050c22549f5fmr1447443lfu.34.1702293244313; 
 Mon, 11 Dec 2023 03:14:04 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 y7-20020ac24467000000b0050bf02f9b3bsm1049049lfl.136.2023.12.11.03.14.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 03:14:03 -0800 (PST)
Date: Mon, 11 Dec 2023 14:14:00 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Jianheng Zhang <Jianheng.Zhang@synopsys.com>, 
 Jakub Kicinski <kuba@kernel.org>
Message-ID: <zx7tfojtnzuhcpglkeiwg6ep265xpcb5lmz6fgjjugc2tue6qe@cmuqtneujsvb>
References: <CY5PR12MB63726FED738099761A9B81E7BF8FA@CY5PR12MB6372.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nz47ttaxu56kfm67"
Content-Disposition: inline
In-Reply-To: <CY5PR12MB63726FED738099761A9B81E7BF8FA@CY5PR12MB6372.namprd12.prod.outlook.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>,
 open list <linux-kernel@vger.kernel.org>, James Li <James.Li1@synopsys.com>,
 "open list:STMMAC ETHERNET DRIVER" <netdev@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>, Eric Dumazet <edumazet@google.com>,
 Martin McKenny <Martin.McKenny@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: xgmac3+: add FPE
 handshaking support
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
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--nz47ttaxu56kfm67
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jianheng, Jakub

On Mon, Dec 11, 2023 at 06:13:21AM +0000, Jianheng Zhang wrote:
> Adds the HW specific support for Frame Preemption handshaking on XGMAC3+
> cores.

Thanks for the patch. No objection about the change:
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

The only note is that the DW XGMAC v3.x and DW QoS Eth v5.x FPE
implementations are now identical (see the attached diff). What about
factoring out the common parts to a separate file - stmmac_fpe.c
(perhaps together with the handshaking algo from the stmmac_main.c)
and send it out as an additional patch on top of this one? A similar
thing has been recently done for EST:
https://lore.kernel.org/netdev/20231201055252.1302-1-rohan.g.thomas@intel.com/
Although in this case AFAICS the implementation is simpler and the
only difference is in the CSR offset and the frame preemption residue
queue ID setting. All of that can be easily solved in the same way as
it was done for EST (see the link above).

Jakub, what do you think?

-Serge(y)

> 
> Signed-off-by: Jianheng Zhang <Jianheng.Zhang@synopsys.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h     |  6 ++
>  .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    | 65 ++++++++++++++++++----
>  2 files changed, 60 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> index 207ff17..306d15b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> @@ -194,6 +194,12 @@
>  #define XGMAC_MDIO_DATA			0x00000204
>  #define XGMAC_MDIO_C22P			0x00000220
>  #define XGMAC_FPE_CTRL_STS		0x00000280
> +#define XGMAC_TRSP			BIT(19)
> +#define XGMAC_TVER			BIT(18)
> +#define XGMAC_RRSP			BIT(17)
> +#define XGMAC_RVER			BIT(16)
> +#define XGMAC_SRSP			BIT(2)
> +#define XGMAC_SVER			BIT(1)
>  #define XGMAC_EFPE			BIT(0)
>  #define XGMAC_ADDRx_HIGH(x)		(0x00000300 + (x) * 0x8)
>  #define XGMAC_ADDR_MAX			32
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> index eb48211..091d932 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> @@ -1439,22 +1439,63 @@ static void dwxgmac3_fpe_configure(void __iomem *ioaddr, struct stmmac_fpe_cfg *
>  {
>  	u32 value;
>  
> -	if (!enable) {
> -		value = readl(ioaddr + XGMAC_FPE_CTRL_STS);
> +	if (enable) {
> +		cfg->fpe_csr = XGMAC_EFPE;
> +		value = readl(ioaddr + XGMAC_RXQ_CTRL1);
> +		value &= ~XGMAC_RQ;
> +		value |= (num_rxq - 1) << XGMAC_RQ_SHIFT;
> +		writel(value, ioaddr + XGMAC_RXQ_CTRL1);
> +	} else {
> +		cfg->fpe_csr = 0;
> +	}
> +	writel(cfg->fpe_csr, ioaddr + XGMAC_FPE_CTRL_STS);
> +}
>  
> -		value &= ~XGMAC_EFPE;
> +static int dwxgmac3_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev)
> +{
> +	u32 value;
> +	int status;
>  
> -		writel(value, ioaddr + XGMAC_FPE_CTRL_STS);
> -		return;
> +	status = FPE_EVENT_UNKNOWN;
> +
> +	/* Reads from the XGMAC_FPE_CTRL_STS register should only be performed
> +	 * here, since the status flags of MAC_FPE_CTRL_STS are "clear on read"
> +	 */
> +	value = readl(ioaddr + XGMAC_FPE_CTRL_STS);
> +
> +	if (value & XGMAC_TRSP) {
> +		status |= FPE_EVENT_TRSP;
> +		netdev_info(dev, "FPE: Respond mPacket is transmitted\n");
>  	}
>  
> -	value = readl(ioaddr + XGMAC_RXQ_CTRL1);
> -	value &= ~XGMAC_RQ;
> -	value |= (num_rxq - 1) << XGMAC_RQ_SHIFT;
> -	writel(value, ioaddr + XGMAC_RXQ_CTRL1);
> +	if (value & XGMAC_TVER) {
> +		status |= FPE_EVENT_TVER;
> +		netdev_info(dev, "FPE: Verify mPacket is transmitted\n");
> +	}
> +
> +	if (value & XGMAC_RRSP) {
> +		status |= FPE_EVENT_RRSP;
> +		netdev_info(dev, "FPE: Respond mPacket is received\n");
> +	}
> +
> +	if (value & XGMAC_RVER) {
> +		status |= FPE_EVENT_RVER;
> +		netdev_info(dev, "FPE: Verify mPacket is received\n");
> +	}
> +
> +	return status;
> +}
> +
> +static void dwxgmac3_fpe_send_mpacket(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
> +				      enum stmmac_mpacket_type type)
> +{
> +	u32 value = cfg->fpe_csr;
> +
> +	if (type == MPACKET_VERIFY)
> +		value |= XGMAC_SVER;
> +	else if (type == MPACKET_RESPONSE)
> +		value |= XGMAC_SRSP;
>  
> -	value = readl(ioaddr + XGMAC_FPE_CTRL_STS);
> -	value |= XGMAC_EFPE;
>  	writel(value, ioaddr + XGMAC_FPE_CTRL_STS);
>  }
>  
> @@ -1503,6 +1544,8 @@ static void dwxgmac3_fpe_configure(void __iomem *ioaddr, struct stmmac_fpe_cfg *
>  	.config_l4_filter = dwxgmac2_config_l4_filter,
>  	.set_arp_offload = dwxgmac2_set_arp_offload,
>  	.fpe_configure = dwxgmac3_fpe_configure,
> +	.fpe_send_mpacket = dwxgmac3_fpe_send_mpacket,
> +	.fpe_irq_status = dwxgmac3_fpe_irq_status,
>  };
>  
>  static void dwxlgmac2_rx_queue_enable(struct mac_device_info *hw, u8 mode,
> -- 
> 1.8.3.1
> 
> 

--nz47ttaxu56kfm67
Content-Type: text/x-patch; charset=us-ascii
Content-Disposition: attachment; filename="stmmac_fpe.diff"

--- drivers/net/ethernet/stmicro/stmmac/dwmac5_fpe.c	2023-12-11 14:01:26.888400348 +0300
+++ drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core_fpe.c	2023-12-11 14:01:49.538644889 +0300
@@ -1,64 +1,64 @@
-#define MAC_FPE_CTRL_STS		0x00000234
-#define TRSP				BIT(19)
-#define TVER				BIT(18)
-#define RRSP				BIT(17)
-#define RVER				BIT(16)
-#define SRSP				BIT(2)
-#define SVER				BIT(1)
-#define EFPE				BIT(0)
-
-#define GMAC_RXQ_CTRL0			0x000000a0
-#define GMAC_RXQ_CTRL1			0x000000a4
-
-#define GMAC_RXQCTRL_FPRQ		GENMASK(26, 24)
-#define GMAC_RXQCTRL_FPRQ_SHIFT		24
-
-void dwmac5_fpe_configure(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
-			  u32 num_txq, u32 num_rxq,
-			  bool enable)
+#define XGMAC_FPE_CTRL_STS		0x00000280
+#define XGMAC_TRSP			BIT(19)
+#define XGMAC_TVER			BIT(18)
+#define XGMAC_RRSP			BIT(17)
+#define XGMAC_RVER			BIT(16)
+#define XGMAC_SRSP			BIT(2)
+#define XGMAC_SVER			BIT(1)
+#define XGMAC_EFPE			BIT(0)
+
+#define XGMAC_RXQ_CTRL0                 0x000000a0
+#define XGMAC_RXQ_CTRL1                 0x000000a4
+
+#define XGMAC_RQ                        GENMASK(7, 4)
+#define XGMAC_RQ_SHIFT                  4
+
+static void dwxgmac3_fpe_configure(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
+				   u32 num_txq,
+				   u32 num_rxq, bool enable)
 {
 	u32 value;
 
 	if (enable) {
-		cfg->fpe_csr = EFPE;
-		value = readl(ioaddr + GMAC_RXQ_CTRL1);
-		value &= ~GMAC_RXQCTRL_FPRQ;
-		value |= (num_rxq - 1) << GMAC_RXQCTRL_FPRQ_SHIFT;
-		writel(value, ioaddr + GMAC_RXQ_CTRL1);
+		cfg->fpe_csr = XGMAC_EFPE;
+		value = readl(ioaddr + XGMAC_RXQ_CTRL1);
+		value &= ~XGMAC_RQ;
+		value |= (num_rxq - 1) << XGMAC_RQ_SHIFT;
+		writel(value, ioaddr + XGMAC_RXQ_CTRL1);
 	} else {
 		cfg->fpe_csr = 0;
 	}
-	writel(cfg->fpe_csr, ioaddr + MAC_FPE_CTRL_STS);
+	writel(cfg->fpe_csr, ioaddr + XGMAC_FPE_CTRL_STS);
 }
 
-int dwmac5_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev)
+static int dwxgmac3_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev)
 {
 	u32 value;
 	int status;
 
 	status = FPE_EVENT_UNKNOWN;
 
-	/* Reads from the MAC_FPE_CTRL_STS register should only be performed
+	/* Reads from the XGMAC_FPE_CTRL_STS register should only be performed
 	 * here, since the status flags of MAC_FPE_CTRL_STS are "clear on read"
 	 */
-	value = readl(ioaddr + MAC_FPE_CTRL_STS);
+	value = readl(ioaddr + XGMAC_FPE_CTRL_STS);
 
-	if (value & TRSP) {
+	if (value & XGMAC_TRSP) {
 		status |= FPE_EVENT_TRSP;
 		netdev_info(dev, "FPE: Respond mPacket is transmitted\n");
 	}
 
-	if (value & TVER) {
+	if (value & XGMAC_TVER) {
 		status |= FPE_EVENT_TVER;
 		netdev_info(dev, "FPE: Verify mPacket is transmitted\n");
 	}
 
-	if (value & RRSP) {
+	if (value & XGMAC_RRSP) {
 		status |= FPE_EVENT_RRSP;
 		netdev_info(dev, "FPE: Respond mPacket is received\n");
 	}
 
-	if (value & RVER) {
+	if (value & XGMAC_RVER) {
 		status |= FPE_EVENT_RVER;
 		netdev_info(dev, "FPE: Verify mPacket is received\n");
 	}
@@ -66,15 +66,15 @@
 	return status;
 }
 
-void dwmac5_fpe_send_mpacket(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
-			     enum stmmac_mpacket_type type)
+static void dwxgmac3_fpe_send_mpacket(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
+				      enum stmmac_mpacket_type type)
 {
 	u32 value = cfg->fpe_csr;
 
 	if (type == MPACKET_VERIFY)
-		value |= SVER;
+		value |= XGMAC_SVER;
 	else if (type == MPACKET_RESPONSE)
-		value |= SRSP;
+		value |= XGMAC_SRSP;
 
-	writel(value, ioaddr + MAC_FPE_CTRL_STS);
+	writel(value, ioaddr + XGMAC_FPE_CTRL_STS);
 }

--nz47ttaxu56kfm67
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--nz47ttaxu56kfm67--
