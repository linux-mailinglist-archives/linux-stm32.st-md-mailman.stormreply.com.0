Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0345AD9EF5
	for <lists+linux-stm32@lfdr.de>; Sat, 14 Jun 2025 20:22:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57FFCC36B3D;
	Sat, 14 Jun 2025 18:22:23 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E837BC36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Jun 2025 18:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LWVGJpxfZxK5NWqKsMehk6v+OXAVVCcYoYUm9xSLX/c=; b=AFnGMw0U82bkfJeUm1qa6MToAQ
 4DNM7+9jW6wRrHGrILCc1akHMwLWpcAODcTO4kRMTR8zKDpDDaMZACfuNkd8LMyjCxKq1f7SREwEg
 +59raP3R8l8vsFX4S0BUsQR9lpfnZgJ0EgZX+jCpxIzPe8vdoex1+W2CxPlyxTvU/1Sp2hYBbm00p
 hO6lLM/+m0qcJk1Irc5h5sXSvF3V33IotOT/w33bOwIRfEb+JmW00/eC6+48RLFHz3Wjl1aQkz9HY
 Sbp3rzOaw1HwVyg10QT6TpP/81H8WWkoVYRumO9m3jiyBFhQ2t6Gywb2pPDmUlAwjdtoeFgu1eBfB
 Drupz9fw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43052)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1uQVW4-00027I-1a;
 Sat, 14 Jun 2025 19:22:08 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1uQVW0-00031F-1O;
 Sat, 14 Jun 2025 19:22:04 +0100
Date: Sat, 14 Jun 2025 19:22:04 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Simon Horman <horms@kernel.org>
Message-ID: <aE29zFKp5PLAM5pP@shell.armlinux.org.uk>
References: <E1uPkbO-004EyA-EU@rmk-PC.armlinux.org.uk>
 <20250614153512.GQ414686@horms.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250614153512.GQ414686@horms.kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: qcom-ethqos: add
 ethqos_pcs_set_inband()
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

On Sat, Jun 14, 2025 at 04:35:12PM +0100, Simon Horman wrote:
> On Thu, Jun 12, 2025 at 05:16:30PM +0100, Russell King (Oracle) wrote:
> > Add ethqos_pcs_set_inband() to improve readability, and to allow future
> > changes when phylink PCS support is properly merged.
> > 
> > Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
> > Tested-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org> # sa8775p-ride-r3
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> Thanks Russell,
> 
> The nit below notwithstanding this looks good to me.
> 
> Reviewed-by: Simon Horman <horms@kernel.org>
> 
> > ---
> >  .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 13 +++++++++----
> >  1 file changed, 9 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > index e30bdf72331a..2e398574c7a7 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > @@ -622,6 +622,11 @@ static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
> >  	}
> >  }
> >  
> > +static void ethqos_pcs_set_inband(struct stmmac_priv *priv, bool enable)
> > +{
> > +	stmmac_pcs_ctrl_ane(priv, priv->ioaddr, enable, 0, 0);
> 
> FWIIW, I would have gone for the following, as all the type of
> three of the trailing parameters is bool.
> 
> 	stmmac_pcs_ctrl_ane(priv, priv->ioaddr, enable, false, false);

So the original code:

            stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 0, 0, 0);
            stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 1, 0, 0);
            stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 1, 0, 0);
            stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 1, 0, 0);

While one could convert the last two arguments to true/false, I'd prefer
leaving them as is, as less change means less chance to introduce a bug.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
