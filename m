Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 676466BF344
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Mar 2023 21:58:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 293AAC6907C;
	Fri, 17 Mar 2023 20:58:01 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F0FFC69053
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Mar 2023 20:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dZeWiRhjX2jTc6AkO+17VmA9bj/Bj3rR/73GUR3OEW4=; b=IO/VVsx2D9PvqNqMwcSg/mPkeh
 vu5KPNie2nPo1nelTEi4mumhG1/k4XJkbVPXA3NgUGhz6aq+sNHwzq4mHHnuoUwgRjZY7L+eSSpkz
 iDGfAmwREQTpsVT41OjhnF0s95Xbzxlm594QPFtyTSttqZO+GIutg1AIKAUjJYdBLtKHrGZfg4LQX
 FX/jreGLqVFpgdeBeMKmQkT748OA5ELDA1vu4x0SE63krhv35+Q09L93VzTXK5FnSj6t2oV0tB4YM
 St7NZC4tkYCNht4tfHkS3CU/oHtBWUhwAi0mRFrofWJEKBs/uvJxTN3URflAFRPktjDXAWBWBhbTD
 S+qo3zIQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56108)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1pdH94-0003TX-At; Fri, 17 Mar 2023 20:57:50 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1pdH92-0003mq-JK; Fri, 17 Mar 2023 20:57:48 +0000
Date: Fri, 17 Mar 2023 20:57:48 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <ZBTUTD6RL22pdlmq@shell.armlinux.org.uk>
References: <20230314070208.3703963-1-michael.wei.hong.sit@intel.com>
 <20230314070208.3703963-2-michael.wei.hong.sit@intel.com>
 <10aff941-e18a-4d77-974b-1760529988a6@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <10aff941-e18a-4d77-974b-1760529988a6@lunn.ch>
X-Topics: 
Cc: linux-kernel@vger.kernel.org, Voon Weifeng <weifeng.voon@intel.com>,
 netdev@vger.kernel.org, Lai Peter Jun Ann <peter.jun.ann.lai@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Looi Hong Aun <hong.aun.looi@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v2 1/2] net: stmmac: fix PHY handle
	parsing
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

On Fri, Mar 17, 2023 at 08:56:19PM +0100, Andrew Lunn wrote:
> On Tue, Mar 14, 2023 at 03:02:07PM +0800, Michael Sit Wei Hong wrote:
> > phylink_fwnode_phy_connect returns 0 when set to MLO_AN_INBAND.
> > This causes the PHY handle parsing to skip and the PHY will not be attached
> > to the MAC.
> 
> Please could you expand the commit message because i'm having trouble
> following this.
> 
> phylink_fwnode_phy_connect() says:
> 
> 	/* Fixed links and 802.3z are handled without needing a PHY */
> 	if (pl->cfg_link_an_mode == MLO_AN_FIXED ||
> 	    (pl->cfg_link_an_mode == MLO_AN_INBAND &&
> 	     phy_interface_mode_is_8023z(pl->link_interface)))
> 		return 0;
> 
> So your first statement is not true. It should be MLO_AN_INBAND
> and phy_interface_mode_is_8023z.
> 
> > Add additional check for PHY handle parsing when set to MLO_AN_INBAND.
> 
> Looking at the patch, there is no reference to MLO_AN_INBAND, or
> managed = "in-band-status";

That's the pesky "xpcs_an_inband" which ends up as phylink's
"ovr_an_inband"... I'm sure these are random renames of stuff to make
sure that people struggle to follow the code.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
