Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F12BFDC73
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Oct 2025 20:11:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7B37C58D4D;
	Wed, 22 Oct 2025 18:11:16 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93FF0C58D40
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Oct 2025 18:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rA2LYAqEb92Q4g4Yq5hfL5BuClXd15oA216rjXGuuxw=; b=oUDa7GAInMplqxvZSxR7xdnKfh
 gnH6WvqRq/oIBsMGn5B4Ks5GnfWDskOvVYABlOA8tn8Phd8Dp7vZrjhCud8Fzmqj/iaKFdMEuCxnY
 kZvFEFV0mmL5eZU2ZxkV8WAEFsf2UL0JcrMjG7K/4TbXTaabn8auv8wRmqRN4miJ74OHF2XkN71iw
 RGfxe6FO+nXNyGucn/kr9fZQW6Fr+rd9AbX3hTGL4ag4Y+E6rLalGw44eGLv/adpU0DlyaCbVSoTN
 E1fcCouudt62ivDHgkNWQpp8exExqQYx1XBEDtlg4ILJUHnKvov2uOrXITsn5NXJgdUAhPKZAyyla
 2VkdLFkw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57282)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vBdIf-000000005HL-3eJg;
 Wed, 22 Oct 2025 19:11:05 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vBdIb-000000000uh-3ctw; Wed, 22 Oct 2025 19:11:01 +0100
Date: Wed, 22 Oct 2025 19:11:01 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <aPkeNRyRtHOMs5h5@shell.armlinux.org.uk>
References: <aPIwqo9mCEOb7ZQu@shell.armlinux.org.uk>
 <E1v9jCZ-0000000B2PP-2cuM@rmk-PC.armlinux.org.uk>
 <eb0d1b55-307b-4b51-953f-fdcc1a8fbe27@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eb0d1b55-307b-4b51-953f-fdcc1a8fbe27@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 4/6] net: phylink: add phylink
 managed wake-on-lan PHY speed control
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

On Wed, Oct 22, 2025 at 04:28:19PM +0200, Maxime Chevallier wrote:
> Hi Russell,
> 
> > +
> > +	if (phylink_phy_pm_speed_ctrl(pl))
> > +		phy_speed_down(pl->phydev, false);
> 
> Should this rather be phylink_speed_down, to take into account the fact
>  that the PHY might be on SFP ? either here or directly in
> phylink_phy_pm_speed_ctrl() above ?

I think using phylink_speed_*() makes more sense than merging the test
into phylink_phy_pm_speed_ctrl(). If something changes in what we do
with speed_up/down() then we want everyone to be affected (not that I
forsee any change there.) Logically though...

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
