Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3965554C759
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jun 2022 13:23:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D13BFC5E2C6;
	Wed, 15 Jun 2022 11:23:56 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 92046C0D2BC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jun 2022 11:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8YSiJRfVSCRx99U4o4ghQCn9P4N6/d/6pd8/bsVzP/w=; b=sJwyns6OubrMfUYLSJE9YUhSxl
 wFZOMo2Z/Ni92QoRvJWfpTrl50shcYJRQoRf6+xu3smxsaJwBLyoAFl0cIt98vqOX602Z8LieV9vU
 PsOx1fBdGMxUIke/5Angd2vgYfh+iihFxLe8vQWP5d3PHNJaQvg4czO+2nakqXpuA7V3W31+tAOV7
 4iA1twudj5/aUk4LbxTfn0JjdZStskGbKVRNtGZBsfyHVV9ZS8Jk162BisR4LCe80i0K8EXhOPYl/
 b5a9WvpqAwJbFTMk5ZfSXLc+IOYUjvxPIpFal5ts0ytY9peeFpniCR+61OWtXM30YHsnroirYhcmw
 K4wzjD0w==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:32876)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1o1R7U-0004QB-Vo; Wed, 15 Jun 2022 12:23:33 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1o1R7J-0008NQ-LM; Wed, 15 Jun 2022 12:23:21 +0100
Date: Wed, 15 Jun 2022 12:23:21 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Ong Boon Leong <boon.leong.ong@intel.com>
Message-ID: <YqnBKTpbhx+quBIc@shell.armlinux.org.uk>
References: <20220615083908.1651975-1-boon.leong.ong@intel.com>
 <20220615083908.1651975-4-boon.leong.ong@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220615083908.1651975-4-boon.leong.ong@intel.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, Emilio Riva <emilio.riva@ericsson.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Vivien Didelot <vivien.didelot@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v5 3/5] net: pcs: xpcs: add CL37
 1000BASE-X AN support
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

On Wed, Jun 15, 2022 at 04:39:06PM +0800, Ong Boon Leong wrote:
> For CL37 1000BASE-X AN, DW xPCS does not support C22 method but offers
> C45 vendor-specific MII MMD for programming.
> 
> We also add the ability to disable Autoneg (through ethtool for certain
> network switch that supports 1000BASE-X (1000Mbps and Full-Duplex) but
> not Autoneg capability.
> 
> v4: Fixes to comment from Russell King. Thanks!
>     https://patchwork.kernel.org/comment/24894239/
>     Make xpcs_modify_changed() as private, change to use
>     mdiodev_modify_changed() for cleaner code.
> 
> v3: Fixes to issues spotted by Russell King. Thanks!
>     https://patchwork.kernel.org/comment/24890210/
>     Use phylink_mii_c22_pcs_decode_state(), remove unnecessary
>     interrupt clearing and skip speed & duplex setting if AN
>     is enabled.
> 
> v2: Fixes to issues spotted by Russell King in v1. Thanks!
>     https://patchwork.kernel.org/comment/24826650/
>     Use phylink_mii_c22_pcs_encode_advertisement() and implement
>     C45 MII ADV handling since IP only support C45 access.
> 
> Tested-by: Emilio Riva <emilio.riva@ericsson.com>
> Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
