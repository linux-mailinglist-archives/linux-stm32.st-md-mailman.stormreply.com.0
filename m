Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F712C2B74
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Nov 2020 16:38:10 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 833ACC56630;
	Tue, 24 Nov 2020 15:38:10 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12798C32EA7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Nov 2020 15:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gemFyzpNjNLon40XFhSL9X2QjE/xiw9/g4FNTnG3Ym4=; b=D8CkwFXXZblYfDir5fESdil6h
 NJyGgTiXqzqCcZfxLA8A8+baS9eDHlGG1kk8H9YaehBBDfvIICFz31qIDxAeTVL4fJ50/QDIv3Aul
 xaA2bie40QhHP5Y6iQKZuO9ESIwZBYCb55pFpbPEEWFSytwA1c1oEZzD+Uoo64odChsrldM4fURpV
 YmsVpGK0Vv+RZWqdcBW+znGKeLK6Em3GxajInaLTTbft1RKaJUmeKbsc7gcAWLPXtKqy5ZPpCGJhu
 UqKRl51EIlxSR6R0s8ohVoP8Nx7V+6Api/6lE/zcji2uszEmAUpEmPcvevOwkOs8T4sbYRxMSOUan
 Dvo0U0w4w==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35544)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1khaOC-0007tb-AP; Tue, 24 Nov 2020 15:37:56 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1khaO6-0007S6-L7; Tue, 24 Nov 2020 15:37:50 +0000
Date: Tue, 24 Nov 2020 15:37:50 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Antonio Borneo <antonio.borneo@st.com>
Message-ID: <20201124153750.GH1551@shell.armlinux.org.uk>
References: <20201124143848.874894-1-antonio.borneo@st.com>
 <20201124145647.GF1551@shell.armlinux.org.uk>
 <bd83b9c15f6cfed5df90da4f6b50d1a3f479b831.camel@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bd83b9c15f6cfed5df90da4f6b50d1a3f479b831.camel@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Andrew Lunn <andrew@lunn.ch>, Salil Mehta <salil.mehta@huawei.com>,
 netdev@vger.kernel.org, linuxarm@huawei.com, stable@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Yonglong Liu <liuyonglong@huawei.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH] net: phy: fix auto-negotiation in case of
	'down-shift'
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

On Tue, Nov 24, 2020 at 04:17:42PM +0100, Antonio Borneo wrote:
> On Tue, 2020-11-24 at 14:56 +0000, Russell King - ARM Linux admin wrote:
> > Userspace doesn't expect the advertising mask to change beneath it.
> > Since updates from userspace are done using a read-modify-write of
> > the ksettings, this can have the undesired effect of removing 1G
> > from the configured advertising mask.
> > 
> > We've had other PHYs have this behaviour; the correct solution is for
> > the PHY driver to implement reading the resolution from the PHY rather
> > than relying on the generic implementation if it can down-shift
> 
> If it's already upstream, could you please point to one of the phy driver
> that already implements this properly?

Reading the resolved information is PHY specific as it isn't
standardised.

Marvell PHYs have read the resolved information for a very long time.
I added support for it to at803x.c:

06d5f3441b2e net: phy: at803x: use operating parameters from PHY-specific status

after it broke for exactly the reason you're reporting for your PHY.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
