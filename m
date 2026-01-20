Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E600D3BE9A
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Jan 2026 06:05:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6BE6C36B3C;
	Tue, 20 Jan 2026 05:05:09 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17D01C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Jan 2026 05:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wCN4UYMt+Rx9hUfDdniW1Dw+n2P8tOWoG81cAbW5WLA=; b=ZTZDLJy8AtdAVEYsVuFeC7mDKa
 uqcRNQ3b5NqGxITW36UeV/zro1ZtWcMy7ec+fSFOg1es3Z1d06YQfxeHw3FG2kmC07/YObcV3gTb8
 aARNhEQZR4bvFJA5sZRxDN7DurNgQ9+5GCqBgbKu7mUIXt/3wx/sHJWfx09jYEouEMxiLKmhgPaNu
 sFXgMjYw7twYE+jl/TdOcy0GJNScd+FPGLfbg6qY4ySI+la+/N5KmtzDmwS2+WwgdM5jm3Vd5+DQ5
 GrrOuyciKjra04i3y4zgH6yU4yuGKHPnA61cyJKRTFbl0Sx8IuCJUq2Mu0IePKXBYWNlBoAd3wlJG
 fV3zK6qQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46264)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vi3vE-000000005rn-1wmm;
 Tue, 20 Jan 2026 05:04:56 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vi3vB-000000007Am-2N4p; Tue, 20 Jan 2026 05:04:53 +0000
Date: Tue, 20 Jan 2026 05:04:53 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <aW8M9ZiiftGBQIRM@shell.armlinux.org.uk>
References: <E1vhoSH-00000005H1f-2cq9@rmk-PC.armlinux.org.uk>
 <20260119192125.1245102-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260119192125.1245102-1-kuba@kernel.org>
Cc: neil.armstrong@linaro.org, mohd.anwar@oss.qualcomm.com, vkoul@kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 andrew+netdev@lunn.ch, edumazet@google.com, andrew@lunn.ch,
 mcoquelin.stm32@gmail.com, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [net-next,
	05/14] net: stmmac: add stmmac core serdes support
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

On Mon, Jan 19, 2026 at 11:21:25AM -0800, Jakub Kicinski wrote:
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> 
> For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
> ---
> net: stmmac: add stmmac core serdes support
> 
> This commit adds SerDes PHY support to the stmmac core driver, moving it
> from platform glue into the integrated PCS driver. The SerDes is managed
> through phy_init/phy_exit for lifecycle and phy_power_on/phy_power_off
> for the power state.
> 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
> > index 2f826fe7229b..4d1902f3a58f 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
> 
> [ ... ]
> 
> > static int dwmac_integrated_pcs_enable(struct phylink_pcs *pcs)
> > {
> > 	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
> > +	struct stmmac_priv *priv = spcs->priv;
> > +	int ret;
> >
> > -	stmmac_mac_irq_modify(spcs->priv, 0, spcs->int_mask);
> > +	ret = dwmac_serdes_power_on(priv);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (spcs->interface != PHY_INTERFACE_MODE_NA) {
> > +		ret = dwmac_serdes_set_mode(priv, spcs->interface);
> > +		if (ret)
> > +			return ret;
>                         ^^^^^^^^^^
> 
> If dwmac_serdes_set_mode() fails here, doesn't this leave the SerDes in
> a powered-on state? dwmac_serdes_power_on() succeeded at this point but
> there's no corresponding dwmac_serdes_power_off() call before returning
> the error.
> 
> Looking at phylink_major_config(), it appears to discard the return
> value from phylink_pcs_enable(), so the caller won't know to call
> pcs_disable() to clean up the power state.

This AI analysis is incorrect.

By the time phylink_pcs_enable() has been called, the PCS is already
plumbed in to phylink. It _will_ have phylink_pcs_disable() called on
it at some point in the future, either by having the PCS displaced
by another in a subsequent phylink_major_config(), or by a driver
calling phylink_stop().

If we clean up here, then we will call dwmac_serdes_power_off() twice.

Yes, it's not "nice" but that's the way phylink is right now, and
without reworking phylink to record that pcs_enable() has failed
to avoid a subsequent pcs_disable(), and to stop the major config
(which then potentially causes a whole bunch of other issues). I
don't even want to think about that horrid scenario at the moment.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
