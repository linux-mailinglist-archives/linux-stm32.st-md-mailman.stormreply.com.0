Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF280910201
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Jun 2024 12:57:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C509C7128E;
	Thu, 20 Jun 2024 10:57:51 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B095C7128D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 10:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JL1dgGAqb9hLYRxS4TGWl0ExqWTdbEg1InyHIVddSDI=; b=gqnnX1Vh1PSSDC8IoumrXSiDNV
 AVnNoRLO4X+4HrAt2e2Gk1SGD1rZvPiYN4vL8sl53pOY2Mvy1UvxA/RpV1NGVTbEppKDnCSZ6bg5b
 lcLIhcWGa44XjZ9mv/nwTxCn+9Th8080Ftd4hCf+mh+k/wgZ/dWXlUkyDpOYRhnUy7HLYf6j/pZny
 pZKq8ceRbSzUcwvXH9UvQuej7sm3O74ttio97QoiEHDHqTAZHz4qpvzYAZJhL8NIEmoWP6OW54Dof
 0AzkkSmiUkq1exokIMAdtHpah6zkJEw0a+O7GTq+6cDPrLc3RDRSZOHHUMn+hZoLn0nf+RUGDzDJ9
 VOhZoe4g==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:32904)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1sKFTm-0001cl-2i;
 Thu, 20 Jun 2024 11:57:22 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1sKFTk-0007ba-Gl; Thu, 20 Jun 2024 11:57:20 +0100
Date: Thu, 20 Jun 2024 11:57:20 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Message-ID: <ZnQLED/C3Opeim5q@shell.armlinux.org.uk>
References: <20240619184550.34524-1-brgl@bgdev.pl>
 <20240619184550.34524-9-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240619184550.34524-9-brgl@bgdev.pl>
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Vinod Koul <vkoul@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-msm@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 8/8] net: stmmac: qcom-ethqos:
 add a DMA-reset quirk for sa8775p-ride-r3
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

On Wed, Jun 19, 2024 at 08:45:49PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> On sa8775p-ride the RX clocks from the AQR115C PHY are not available at
> the time of the DMA reset so we need to loop TX clocks to RX and then
> disable loopback after link-up. Use the provided callbacks to do it for
> this board.

If you're using true Cisco SGMII, there are _no_ clocks transferred
between the PHY and PCS/MAC. There are two balanced pairs of data
lines and that is all - one for transmit and one for receive. So this
explanation doesn't make sense to me.

> +static void qcom_ethqos_set_serdes_loopback(struct qcom_ethqos *ethqos,
> +					    bool enable)
> +{
> +	rgmii_updatel(ethqos,
> +		      SGMII_PHY_CNTRL1_SGMII_TX_TO_RX_LOOPBACK_EN,
> +		      enable ? SGMII_PHY_CNTRL1_SGMII_TX_TO_RX_LOOPBACK_EN : 0,
> +		      EMAC_WRAPPER_SGMII_PHY_CNTRL1);
> +}
> +
> +static void qcom_ethqos_open(struct net_device *pdev, void *priv)
> +{
> +	struct qcom_ethqos *ethqos = priv;
> +
> +	qcom_ethqos_set_serdes_loopback(ethqos, true);
> +}
> +
> +static void qcom_ethqos_link_up(struct net_device *ndev, void *priv)
> +{
> +	struct qcom_ethqos *ethqos = priv;
> +
> +	qcom_ethqos_set_serdes_loopback(ethqos, false);
> +}
> +

So you enable loopback at open time, and disable it when the link comes
up. This breaks inband signalling (should stmmac ever use that) because
enabling loopback prevents the PHY sending the SGMII result to the PCS
to indicate that the link has come up... thus phylink won't call
mac_link_up().

So no, I really hate this proposed change.

What I think would be better is if there were hooks at the appropriate
places to handle the lack of clock over _just_ the period that it needs
to be handled, rather than hacking the driver as this proposal does,
abusing platform callbacks because there's nothing better.

I don't have time to go through stmmac and make any suggestions (sorry)
so I can only to say NAK to this change.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
