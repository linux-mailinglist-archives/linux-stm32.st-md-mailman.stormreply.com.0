Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 140E38C32AB
	for <lists+linux-stm32@lfdr.de>; Sat, 11 May 2024 19:13:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ACDA1C6907A;
	Sat, 11 May 2024 17:13:09 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DBC6FC64102
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 May 2024 17:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+PYJZKJmp4DNEIJz0QH32REFiAYsuHCbhSQAQyPwHDQ=; b=1noDtvzmo/8NcsHS2R9xnr2nF/
 +HZYubHFsdnVYYib9Z4ABljM4TQHtabJKRYloqxpCmcUtZ0Gq4xCAxPqdPaSo55mmK8XQlBOUX4pS
 OsnNiL+moSUHSzGX5//3on5yr9Nk6tDf1w1lp8maVEuk+EYk99alEjby65oXCH3jSMSrin6dJcHz9
 Ce5ZpGad1DHE87yKIpjwEhSAPbsWX6Pue65cWdIacoVDJAjZAjJVJu3x3T/UtfWRRv2HeE8TDz0Il
 313vTSJPzuwe9M5308HtX7F5SiNWix7eXwAZi+FtAu/K44SZj112tAe60ewKePUYdXj1B2GMT2ECV
 OgChaOng==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41854)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1s5qH3-00005T-1n;
 Sat, 11 May 2024 18:12:41 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1s5qH0-0004QC-WA; Sat, 11 May 2024 18:12:39 +0100
Date: Sat, 11 May 2024 18:12:38 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <Zj+nBpQn1cqTMJxQ@shell.armlinux.org.uk>
References: <20240510000331.154486-3-jitendra.vegiraju@broadcom.com>
 <20240511015924.41457-1-jitendra.vegiraju@broadcom.com>
 <4ede8911-827d-4fad-b327-52c9aa7ed957@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4ede8911-827d-4fad-b327-52c9aa7ed957@lunn.ch>
Cc: netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 edumazet@google.com, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, mcoquelin.stm32@gmail.com,
 Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2, net-next,
 2/2] net: stmmac: PCI driver for BCM8958X SoC
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

On Sat, May 11, 2024 at 06:16:52PM +0200, Andrew Lunn wrote:
> > +	/* This device interface is directly attached to the switch chip on
> > +	 *  the SoC. Since no MDIO is present, register fixed_phy.
> > +	 */
> > +	brcm_priv->phy_dev =
> > +		 fixed_phy_register(PHY_POLL,
> > +				    &dwxgmac_brcm_fixed_phy_status, NULL);
> > +	if (IS_ERR(brcm_priv->phy_dev)) {
> > +		dev_err(&pdev->dev, "%s\tNo PHY/fixed_PHY found\n", __func__);
> > +		return -ENODEV;
> > +	}
> > +	phy_attached_info(brcm_priv->phy_dev);
> 
> What switch is it? Will there be patches to extend SF2?

... and why is this legacy fixed_phy even necessary when stmmac uses
phylink which supports fixed links, including with custom fixed status?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
