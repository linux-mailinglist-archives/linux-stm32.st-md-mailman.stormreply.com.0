Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC7D317304
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Feb 2021 23:15:00 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 511EBC57B53;
	Wed, 10 Feb 2021 22:15:00 +0000 (UTC)
Received: from mail.baikalelectronics.ru (mail.baikalelectronics.com
 [87.245.175.226])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6AA2BC5718A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Feb 2021 22:14:57 +0000 (UTC)
Date: Thu, 11 Feb 2021 01:14:55 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Message-ID: <20210210221455.jo22rq6eey3ujqmt@mobilestation>
References: <20210208135609.7685-1-Sergey.Semin@baikalelectronics.ru>
 <20210208135609.7685-17-Sergey.Semin@baikalelectronics.ru>
 <20210210144924.6b8e7a11@xhacker.debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210210144924.6b8e7a11@xhacker.debian>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Cc: Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 Lars Persson <larper@axis.com>, linux-stm32@st-md-mailman.stormreply.com,
 Johan Hovold <johan@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Jose Abreu <joabreu@synopsys.com>, Serge Semin <fancer.lancer@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Vyacheslav Mitrofanov <Vyacheslav.Mitrofanov@baikalelectronics.ru>, "David S.
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
Subject: Re: [Linux-stm32] [PATCH v2 16/24] net: stmmac: Use optional reset
 control API to work with stmmaceth
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

On Wed, Feb 10, 2021 at 02:49:24PM +0800, Jisheng Zhang wrote:
> Hi,
> 
> On Mon, 8 Feb 2021 16:56:00 +0300 Serge Semin wrote:
> 
> 
> > 
> > Since commit bb3222f71b57 ("net: stmmac: platform: use optional clk/reset
> > get APIs") a manual implementation of the optional device reset control
> > functionality has been replaced with using the
> > devm_reset_control_get_optional() method. But for some reason the optional
> > reset control handler usage hasn't been fixed and preserved the
> > NULL-checking statements. There is no need in that in order to perform the
> > reset control assertion/deassertion because the passed NULL will be
> > considered by the reset framework as absent optional reset control handler
> > anyway.
> > 
> > Fixes: bb3222f71b57 ("net: stmmac: platform: use optional clk/reset get APIs")
> 

> The patch itself looks good, but the Fix tag isn't necessary since the
> patch is a clean up rather than a bug fix. Can you please drop it in next
> version?

Ok. I'll remove it.

-Sergey

> 
> Thanks
> 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > ---
> >  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 19 ++++++++-----------
> >  1 file changed, 8 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 4f1bf8f6538b..a8dec219c295 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -4935,15 +4935,13 @@ int stmmac_dvr_probe(struct device *device,
> >         if ((phyaddr >= 0) && (phyaddr <= 31))
> >                 priv->plat->phy_addr = phyaddr;
> > 
> > -       if (priv->plat->stmmac_rst) {
> > -               ret = reset_control_assert(priv->plat->stmmac_rst);
> > -               reset_control_deassert(priv->plat->stmmac_rst);
> > -               /* Some reset controllers have only reset callback instead of
> > -                * assert + deassert callbacks pair.
> > -                */
> > -               if (ret == -ENOTSUPP)
> > -                       reset_control_reset(priv->plat->stmmac_rst);
> > -       }
> > +       ret = reset_control_assert(priv->plat->stmmac_rst);
> > +       reset_control_deassert(priv->plat->stmmac_rst);
> > +       /* Some reset controllers have only reset callback instead of
> > +        * assert + deassert callbacks pair.
> > +        */
> > +       if (ret == -ENOTSUPP)
> > +               reset_control_reset(priv->plat->stmmac_rst);
> > 
> >         /* Init MAC and get the capabilities */
> >         ret = stmmac_hw_init(priv);
> > @@ -5155,8 +5153,7 @@ int stmmac_dvr_remove(struct device *dev)
> >         stmmac_exit_fs(ndev);
> >  #endif
> >         phylink_destroy(priv->phylink);
> > -       if (priv->plat->stmmac_rst)
> > -               reset_control_assert(priv->plat->stmmac_rst);
> > +       reset_control_assert(priv->plat->stmmac_rst);
> >         if (priv->hw->pcs != STMMAC_PCS_TBI &&
> >             priv->hw->pcs != STMMAC_PCS_RTBI)
> >                 stmmac_mdio_unregister(ndev);
> > --
> > 2.29.2
> > 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
