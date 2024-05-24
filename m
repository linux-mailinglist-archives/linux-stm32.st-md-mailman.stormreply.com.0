Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9428CE874
	for <lists+linux-stm32@lfdr.de>; Fri, 24 May 2024 18:07:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B0A1C6DD6D;
	Fri, 24 May 2024 16:07:33 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 34041C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 May 2024 16:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=vB6ljBLofLeiWQTydwB3NoHusR29U8CF0lK7vzGBV4k=; b=dgrOW9yZhUJ6EgseHLKa2qObIE
 sEGtkvAhdwnXM08XCODga/KipPotgi20+vvPCR1cDu6WOBApKMAXlItaJmDtQ2XMOuMsF7P5RPLV0
 KfCHV9QGtjRlOVeA1BRbsymDzHyqaQlHGjrJS+tx6GFAztkhtiZbK583Hrz6CbFZlVGE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1sAXRr-00Fxrz-17; Fri, 24 May 2024 18:07:15 +0200
Date: Fri, 24 May 2024 18:07:15 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sneh Shah <quic_snehshah@quicinc.com>
Message-ID: <a7317809-77a1-4884-83d8-2271ceea2c81@lunn.ch>
References: <20240524130653.30666-1-quic_snehshah@quicinc.com>
 <20240524130653.30666-3-quic_snehshah@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240524130653.30666-3-quic_snehshah@quicinc.com>
Cc: kernel@quicinc.com, linux-kernel@vger.kernel.org,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Vinod Koul <vkoul@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH net-next 2/2] net: stmmac:
 dwmac-qcom-ethqos: Enable support for 2500BASEX
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

On Fri, May 24, 2024 at 06:36:53PM +0530, Sneh Shah wrote:
> With integrated PCS qcom mac supports both SGMII and 2500BASEX mode.
> Implement get_interfaces to add support for 2500BASEX.

I don't know this driver very well..... but

/* PCS defines */
#define STMMAC_PCS_RGMII        (1 << 0)
#define STMMAC_PCS_SGMII        (1 << 1)
#define STMMAC_PCS_TBI          (1 << 2)
#define STMMAC_PCS_RTBI         (1 << 3)


static int stmmac_ethtool_get_link_ksettings(struct net_device *dev,
                                             struct ethtool_link_ksettings *cmd)
{
        struct stmmac_priv *priv = netdev_priv(dev);

        if (!(priv->plat->flags & STMMAC_FLAG_HAS_INTEGRATED_PCS) &&
            (priv->hw->pcs & STMMAC_PCS_RGMII ||
             priv->hw->pcs & STMMAC_PCS_SGMII)) {
                struct rgmii_adv adv;
                u32 supported, advertising, lp_advertising;

                if (!priv->xstats.pcs_link) {
                        cmd->base.speed = SPEED_UNKNOWN;
                        cmd->base.duplex = DUPLEX_UNKNOWN;
                        return 0;
                }

/**
 * stmmac_check_pcs_mode - verify if RGMII/SGMII is supported
 * @priv: driver private structure
 * Description: this is to verify if the HW supports the PCS.
 * Physical Coding Sublayer (PCS) interface that can be used when the MAC is
 * configured for the TBI, RTBI, or SGMII PHY interface.
 */
static void stmmac_check_pcs_mode(struct stmmac_priv *priv)
{
        int interface = priv->plat->mac_interface;

        if (priv->dma_cap.pcs) {
                if ((interface == PHY_INTERFACE_MODE_RGMII) ||
                    (interface == PHY_INTERFACE_MODE_RGMII_ID) ||
                    (interface == PHY_INTERFACE_MODE_RGMII_RXID) ||
                    (interface == PHY_INTERFACE_MODE_RGMII_TXID)) {
                        netdev_dbg(priv->dev, "PCS RGMII support enabled\n");
                        priv->hw->pcs = STMMAC_PCS_RGMII;
                } else if (interface == PHY_INTERFACE_MODE_SGMII) {
                        netdev_dbg(priv->dev, "PCS SGMII support enabled\n");
                        priv->hw->pcs = STMMAC_PCS_SGMII;
                }
        }
}

I get the feeling this is a minimal hack, rather than a proper
solution.

    Andrew

---
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
