Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E48FD5FEC6F
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Oct 2022 12:18:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92A44C6411F;
	Fri, 14 Oct 2022 10:18:17 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF75EC6411C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Oct 2022 10:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2M67E4exov3pIudJ8dLX9p/62WDBS+2cAltVv6T03AA=; b=sfHm+VkQDbGDSCIPpuYyvJu4Op
 HByYBFDrqYxmiUy0/ltP/mwZ3fBqsuUWp7JPlrmTRBoCgYnK1wQiD+eDogKbjvWQ3kguf0JhNtHWX
 pOjaspaz6RlSgqzEmyP7gBjF92JKKgCDaaZgfxlJYxvrbVcfEWC9xTdua4i6ay06rx29OkrPaTXqG
 GEuhXjDZZohqo7F3SOuBbOfqSvxHm4/uYevqnlFP+Pij7rZoWZXGHWrk9PB6P8ZxkCUo60wNfzYDS
 68cv7b2cqjtta56EjRarN4kcSCuVwdBRWlHnd4ijQkF+Kc/VXG1Sw2cfxGqKkWNevhoXHK/C1Kilv
 84epCK8w==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34718)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1ojHlV-0000hC-CG; Fri, 14 Oct 2022 11:18:06 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1ojHlO-0005eU-FA; Fri, 14 Oct 2022 11:17:58 +0100
Date: Fri, 14 Oct 2022 11:17:58 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Shenwei Wang <shenwei.wang@nxp.com>
Message-ID: <Y0k3VqK4oOLOEljJ@shell.armlinux.org.uk>
References: <20221013133904.978802-1-shenwei.wang@nxp.com>
 <Y0g3tW26qDDaxYPP@shell.armlinux.org.uk>
 <PAXPR04MB9185777624723D0FE11C6E4689259@PAXPR04MB9185.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <PAXPR04MB9185777624723D0FE11C6E4689259@PAXPR04MB9185.eurprd04.prod.outlook.com>
Cc: Andrew Lunn <andrew@lunn.ch>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [EXT] Re: [PATCH v5 0/2] net: phylink: add
 phylink_set_mac_pm() helper
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

On Thu, Oct 13, 2022 at 07:24:02PM +0000, Shenwei Wang wrote:
> > -----Original Message-----
> > From: Russell King <linux@armlinux.org.uk>
> > Sent: Thursday, October 13, 2022 11:07 AM
> > On Thu, Oct 13, 2022 at 08:39:02AM -0500, Shenwei Wang wrote:
> > > Per Russell's suggestion, the implementation is changed from the
> > > helper function to add an extra property in phylink_config structure
> > > because this change can easily cover SFP usecase too.
> > 
> > Which tree are you aiming this for - net-next or net?
> 
> The patch can be applied to both trees.  You can select the one which is easy to
> go ahead.

That may be the case at the moment, because the net-next tree has been
merged into mainline and the net tree recently updated to mainline, but
that is not always the case.

The purpose of the tag in the subject line is to tell the various
maintainers on the netdev mailing list what _your_ expectation is for
the patch and where _you_ intend it to be applied.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
