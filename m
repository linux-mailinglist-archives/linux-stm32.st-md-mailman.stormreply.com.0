Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A4A41E502
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Oct 2021 01:31:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2BAF8C5A4CD;
	Thu, 30 Sep 2021 23:31:52 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B952FCFAC52
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Sep 2021 23:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=9gmdjG51P4sUtdlckZMNf2bN5+zN0n8cVhZkk4LzqwE=; b=pC5GRS0XWArGvEi55mbqERtVOh
 N39cL3bi9yU69ML2hwVJ6lOe3tLcxU7O827WLtiuL720YgiSe9kDsdVok9lzuD2BvtKu/R58bCI/Q
 MYdjTqAQIQ2WB73gZnYaDK+3pG5Qm/xwNDy25zsvvgUUv3CtLNCW0CYzJDdNpoYvb3HU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1mW5Wa-0091JE-Nn; Fri, 01 Oct 2021 01:31:36 +0200
Date: Fri, 1 Oct 2021 01:31:36 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Wong Vee Khee <vee.khee.wong@linux.intel.com>
Message-ID: <YVZI2GWxUNZdL2SX@lunn.ch>
References: <20210930064436.1502516-1-vee.khee.wong@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210930064436.1502516-1-vee.khee.wong@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Wong Vee Khee <veekhee@gmail.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v1 1/1] net: stmmac: fix EEE init
 issue when paired with EEE capable PHYs
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

On Thu, Sep 30, 2021 at 02:44:36PM +0800, Wong Vee Khee wrote:
> When STMMAC is paired with Energy-Efficient Ethernet(EEE) capable PHY,
> and the PHY is advertising EEE by default, we need to enable EEE on the
> xPCS side too, instead of having user to manually trigger the enabling
> config via ethtool.
> 
> Fixed this by adding xpcs_config_eee() call in stmmac_eee_init().
> 
> Fixes: 7617af3d1a5e ("net: pcs: Introducing support for DWC xpcs Energy Efficient Ethernet")
> Cc: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
> Signed-off-by: Wong Vee Khee <vee.khee.wong@linux.intel.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 553c4403258a..981ccf47dcea 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -486,6 +486,10 @@ bool stmmac_eee_init(struct stmmac_priv *priv)
>  		timer_setup(&priv->eee_ctrl_timer, stmmac_eee_ctrl_timer, 0);
>  		stmmac_set_eee_timer(priv, priv->hw, STMMAC_DEFAULT_LIT_LS,
>  				     eee_tw_timer);
> +		if (priv->hw->xpcs)
> +			xpcs_config_eee(priv->hw->xpcs,
> +					priv->plat->mult_fact_100ns,
> +					true);
>  	}


       /* Check if it needs to be deactivated */
        if (!priv->eee_active) {
                if (priv->eee_enabled) {
                        netdev_dbg(priv->dev, "disable EEE\n");
                        stmmac_lpi_entry_timer_config(priv, 0);
                        del_timer_sync(&priv->eee_ctrl_timer);
                        stmmac_set_eee_timer(priv, priv->hw, 0, eee_tw_timer);
                }
                mutex_unlock(&priv->lock);
                return false;
        }

Don't you want to turn it of in here?

      Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
