Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 610E1A48682
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Feb 2025 18:25:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05F5DCFAC45;
	Thu, 27 Feb 2025 17:25:18 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0DAECCFAC44
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Feb 2025 17:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rbxxJ9pdlSP3U09DcPRoocZLIIpwjB5GRyunBWX+jlE=; b=bJ+zGhXU3FlmjFeUxlk/urw9rv
 L3AEa6Crjr/Tt+MWVqCW0ex61iL/HQnvl3iWgmhVvH4aJHt0TkewpstPiWl9JPfnh4xG7Cb4VmA3H
 yyddM7pcXpXp+dBWq25hy9PipEB1RwCOXRY82q4gsJ30fsMS70CyliJYkoLmHF/IQw2ZA5gupv82F
 D7iolgE/gBFu84QJaTZoJ61CB8hgph05k8nciXdOQu6/rKC1BCkkqpqX0njPqk53QtXiMh7G6UJiN
 fpPWiy8fBrDilcnDsPoqV1N1h8vcTvR+syRi+ISMqC3Go2wLTTqRCVecY+SaMdYTuCPXaiGoT1bJi
 XeF9wDbw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48846)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tnhdD-0007oW-2A;
 Thu, 27 Feb 2025 17:25:07 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tnhd8-0008Jo-1M;
 Thu, 27 Feb 2025 17:25:02 +0000
Date: Thu, 27 Feb 2025 17:25:02 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <Z8Cf7j530L2QaUqT@shell.armlinux.org.uk>
References: <Z8B4tVd4nLUKXdQ4@shell.armlinux.org.uk>
 <E1tnf1S-0056LC-6H@rmk-PC.armlinux.org.uk>
 <16e3f674-0267-47c1-8825-7f15a379332c@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <16e3f674-0267-47c1-8825-7f15a379332c@lunn.ch>
Cc: Thierry Reding <treding@nvidia.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jon Hunter <jonathanh@nvidia.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next 3/5] net: stmmac: simplify
 phylink_suspend() and phylink_resume() calls
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

On Thu, Feb 27, 2025 at 05:45:35PM +0100, Andrew Lunn wrote:
> > @@ -7927,13 +7925,9 @@ int stmmac_resume(struct device *dev)
> >  	}
> >  
> >  	rtnl_lock();
> > -	if (device_may_wakeup(priv->device) && priv->plat->pmt) {
> > -		phylink_resume(priv->phylink);
> > -	} else {
> > -		phylink_resume(priv->phylink);
> > -		if (device_may_wakeup(priv->device))
> > -			phylink_speed_up(priv->phylink);
> > -	}
> > +	phylink_resume(priv->phylink);
> > +	if (device_may_wakeup(priv->device) && !priv->plat->pmt)
> > +		phylink_speed_up(priv->phylink);
> >  	rtnl_unlock();
> >  
> >  	rtnl_lock();
> 
> Unrelated to this patch, but unlock() followed by lock()? Seems like
> some more code which could be cleaned up?

Indeed, this vanishes in the next patch due to phylink_resume()
moving later.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
