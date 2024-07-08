Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD8D92A91F
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Jul 2024 20:44:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 325B8C6DD96;
	Mon,  8 Jul 2024 18:44:50 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5EFE7C6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Jul 2024 18:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=BaKxXGEMOlayyhLsGXif1KQG2vcFB+P6/Y+sfJMfeVA=; b=J8eDdFKAUUOdx5ph0CN/m2xC+D
 q1H9spsGcMgxv81OvAfZKTaFS8gQZagbqS1iLl4h26o3OAUxP2qYL+VZthAYLoyy7WajsNWQ8bl2a
 sP5BzTDMRdT5tyhZbpfS9lLFbDu+hHxcemziOZCWJKCcrC1EJ8D1pf6iZlykEr4ND9BY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1sQtLj-0024FS-FX; Mon, 08 Jul 2024 20:44:31 +0200
Date: Mon, 8 Jul 2024 20:44:31 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <7cde7743-2a8c-4d12-aecb-d1e50d5099ea@lunn.ch>
References: <20240708082220.877141-1-0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240708082220.877141-1-0x1207@gmail.com>
Cc: linux-kernel@vger.kernel.org, rock.xu@nio.com,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1] net: stmmac: Refactor Frame
 Preemption(FPE) implementation
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

On Mon, Jul 08, 2024 at 04:22:20PM +0800, Furong Xu wrote:
> Refactor FPE implementation by moving common code for DWMAC4 and
> DWXGMAC into a separate FPE module.
> 
> FPE implementation for DWMAC4 and DWXGMAC differs only for:
> 1) Offset address of MAC_FPE_CTRL_STS
> 2) FPRQ(Frame Preemption Residue Queue) field in MAC_RxQ_Ctrl1

This quite a big patch. Could you split it up a bit please.

> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> @@ -84,8 +84,8 @@
>  #define XGMAC_MCBCQEN			BIT(15)
>  #define XGMAC_MCBCQ			GENMASK(11, 8)
>  #define XGMAC_MCBCQ_SHIFT		8
> -#define XGMAC_RQ			GENMASK(7, 4)
> -#define XGMAC_RQ_SHIFT			4
> +#define XGMAC_FPRQ			GENMASK(7, 4)
> +#define XGMAC_FPRQ_SHIFT		4

You could for example put renames like this into a patch. It should
then be obviously correct, so quick and easy to review.

> @@ -96,10 +96,11 @@
>  #define XGMAC_LPIIS			BIT(5)
>  #define XGMAC_PMTIS			BIT(4)
>  #define XGMAC_INT_EN			0x000000b4
> +#define XGMAC_FPEIE			BIT(15)
>  #define XGMAC_TSIE			BIT(12)
>  #define XGMAC_LPIIE			BIT(5)
>  #define XGMAC_PMTIE			BIT(4)
> -#define XGMAC_INT_DEFAULT_EN		(XGMAC_LPIIE | XGMAC_PMTIE)
> +#define XGMAC_INT_DEFAULT_EN		(XGMAC_FPEIE | XGMAC_LPIIE | XGMAC_PMTIE)

This change is not obvious. First off, it would of been easier to read
if you put XGMAC_LPIIE at the end. But i would also suggest you make
this a separate patch, and have the commit message explain why this is
needed.

> +static void fpe_configure(struct stmmac_priv *priv, struct stmmac_fpe_cfg *cfg,
> +			  u32 num_txq, u32 num_rxq, bool enable)
> +{
> +	u32 value;
> +
> +	if (enable) {
> +		cfg->fpe_csr = FPE_CTRL_STS_EFPE;
> +		if (priv->plat->has_xgmac) {
> +			value = readl(priv->ioaddr + XGMAC_RXQ_CTRL1);
> +			value &= ~XGMAC_FPRQ;
> +			value |= (num_rxq - 1) << XGMAC_FPRQ_SHIFT;
> +			writel(value, priv->ioaddr + XGMAC_RXQ_CTRL1);
> +		} else if (priv->plat->has_gmac4) {
> +			value = readl(priv->ioaddr + GMAC_RXQ_CTRL1);
> +			value &= ~GMAC_RXQCTRL_FPRQ;
> +			value |= (num_rxq - 1) << GMAC_RXQCTRL_FPRQ_SHIFT;
> +			writel(value, priv->ioaddr + GMAC_RXQ_CTRL1);
> +		}

Since you are using a structure of function pointers, it would seem
more logical to have a fpe_xgmac_configure() and a
fpe_gmac4_configure(), and then xgmac_fpe_ops and gmac4_fpe_ops.

> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -974,8 +974,7 @@ static void stmmac_fpe_link_state_handle(struct stmmac_priv *priv, bool is_up)
>  	bool *hs_enable = &fpe_cfg->hs_enable;
>  
>  	if (is_up && *hs_enable) {
> -		stmmac_fpe_send_mpacket(priv, priv->ioaddr, fpe_cfg,
> -					MPACKET_VERIFY);
> +		stmmac_fpe_send_mpacket(priv, priv, fpe_cfg, MPACKET_VERIFY);

passing priv twice looks very odd! It makes me think the API is
designed wrong. This could be because of the refactoring changes you
made? Maybe add another patch cleaning this up?

    Andrew

---
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
