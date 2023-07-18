Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8EC768D9D
	for <lists+linux-stm32@lfdr.de>; Mon, 31 Jul 2023 09:16:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65353C6C822;
	Mon, 31 Jul 2023 07:16:21 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F415C6905A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jul 2023 08:39:01 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1qLgEE-0003ai-SD; Tue, 18 Jul 2023 10:38:42 +0200
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1qLgED-0004fO-Eo; Tue, 18 Jul 2023 10:38:41 +0200
Date: Tue, 18 Jul 2023 10:38:41 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <20230718083841.p67wflhjlwnu56j4@pengutronix.de>
References: <20230717164307.2868264-1-m.felsch@pengutronix.de>
 <20230717164307.2868264-2-m.felsch@pengutronix.de>
 <cd8c177e-7840-4636-a039-dbe8884b3d2b@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cd8c177e-7840-4636-a039-dbe8884b3d2b@lunn.ch>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Approved-At: Mon, 31 Jul 2023 07:16:17 +0000
Cc: kernel@pengutronix.de, joabreu@synopsys.com, conor+dt@kernel.org,
 mcoquelin.stm32@gmail.com, devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 edumazet@google.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 peppe.cavallaro@st.com, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 2/2] net: stmmac: platform: add
 support for phy-supply
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

On 23-07-18, Andrew Lunn wrote:
> > +static int stmmac_phy_power(struct platform_device *pdev,
> > +			    struct plat_stmmacenet_data *plat,
> > +			    bool enable)
> > +{
> > +	struct regulator *regulator = plat->phy_regulator;
> > +	int ret = 0;
> > +
> > +	if (regulator) {
> > +		if (enable)
> > +			ret = regulator_enable(regulator);
> > +		else
> > +			regulator_disable(regulator);
> > +	}
> > +
> > +	if (ret)
> > +		dev_err(&pdev->dev, "Fail to enable regulator\n");
> 
> 'enable' is only correct 50% of the time.

You mean to move it under the enable path.

> > @@ -742,6 +786,8 @@ static int __maybe_unused stmmac_pltfr_suspend(struct device *dev)
> >  	if (priv->plat->exit)
> >  		priv->plat->exit(pdev, priv->plat->bsp_priv);
> >  
> > +	stmmac_phy_power_off(pdev, priv->plat);
> > +
> 
> What about WOL? You probably want to leave the PHY with power in that
> case.

Good point didn't consider WOL. Is there a way to check if WOL is
enabled?

Regards,
  Marco

> 
> > @@ -757,6 +803,11 @@ static int __maybe_unused stmmac_pltfr_resume(struct device *dev)
> >  	struct net_device *ndev = dev_get_drvdata(dev);
> >  	struct stmmac_priv *priv = netdev_priv(ndev);
> >  	struct platform_device *pdev = to_platform_device(dev);
> > +	int ret;
> > +
> > +	ret = stmmac_phy_power_on(pdev, priv->plat);
> > +	if (ret)
> > +		return ret;
> 
> And this needs to balance with _suspend when WOL is being used.
> 
>     Andrew
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
