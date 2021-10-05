Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E884224D0
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Oct 2021 13:16:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA63AC5AB7F;
	Tue,  5 Oct 2021 11:16:10 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A93EC5AB7C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Oct 2021 11:16:07 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="248972472"
X-IronPort-AV: E=Sophos;i="5.85,348,1624345200"; d="scan'208";a="248972472"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2021 04:16:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,348,1624345200"; d="scan'208";a="483736181"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga007.fm.intel.com with ESMTP; 05 Oct 2021 04:16:02 -0700
Received: from linux.intel.com (vwong3-ilbpg3.png.intel.com [10.88.229.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 53B435805EE;
 Tue,  5 Oct 2021 04:15:59 -0700 (PDT)
Date: Tue, 5 Oct 2021 19:15:56 +0800
From: Wong Vee Khee <vee.khee.wong@linux.intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <20211005111556.GA28642@linux.intel.com>
References: <20210930064436.1502516-1-vee.khee.wong@linux.intel.com>
 <YVZI2GWxUNZdL2SX@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YVZI2GWxUNZdL2SX@lunn.ch>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Fri, Oct 01, 2021 at 01:31:36AM +0200, Andrew Lunn wrote:
> On Thu, Sep 30, 2021 at 02:44:36PM +0800, Wong Vee Khee wrote:
> > When STMMAC is paired with Energy-Efficient Ethernet(EEE) capable PHY,
> > and the PHY is advertising EEE by default, we need to enable EEE on the
> > xPCS side too, instead of having user to manually trigger the enabling
> > config via ethtool.
> > 
> > Fixed this by adding xpcs_config_eee() call in stmmac_eee_init().
> > 
> > Fixes: 7617af3d1a5e ("net: pcs: Introducing support for DWC xpcs Energy Efficient Ethernet")
> > Cc: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
> > Signed-off-by: Wong Vee Khee <vee.khee.wong@linux.intel.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 553c4403258a..981ccf47dcea 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -486,6 +486,10 @@ bool stmmac_eee_init(struct stmmac_priv *priv)
> >  		timer_setup(&priv->eee_ctrl_timer, stmmac_eee_ctrl_timer, 0);
> >  		stmmac_set_eee_timer(priv, priv->hw, STMMAC_DEFAULT_LIT_LS,
> >  				     eee_tw_timer);
> > +		if (priv->hw->xpcs)
> > +			xpcs_config_eee(priv->hw->xpcs,
> > +					priv->plat->mult_fact_100ns,
> > +					true);
> >  	}
> 
> 
>        /* Check if it needs to be deactivated */
>         if (!priv->eee_active) {
>                 if (priv->eee_enabled) {
>                         netdev_dbg(priv->dev, "disable EEE\n");
>                         stmmac_lpi_entry_timer_config(priv, 0);
>                         del_timer_sync(&priv->eee_ctrl_timer);
>                         stmmac_set_eee_timer(priv, priv->hw, 0, eee_tw_timer);
>                 }
>                 mutex_unlock(&priv->lock);
>                 return false;
>         }
> 
> Don't you want to turn it of in here?
> 
>       Andrew

You're right.

Will introduce a new patch for that.

Regards,
Vee Khee
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
