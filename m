Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 690302C2A83
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Nov 2020 15:57:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2610FC56631;
	Tue, 24 Nov 2020 14:57:08 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A7EAC5662F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Nov 2020 14:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J0J3E7b9p8oawWwuEj7kpUYKxWq5ce28QVykTXRpMWw=; b=u05sgykDakZ+56Z95sUEBTtjp
 o6F/rDI/sDO5xwz4tL2EqZb4Nczft02XO9EvJeef0tCFxtkfG3cgkaQo2KgjQLRGhubJNJpywtEIT
 ZFBFz89nuHKzIvvs8qkcu/caoeaqh24A3ZiVIv2g8JUdxJXbvGt/vnQHJOWj2xkQ4jtCEKb/qbtjb
 qQO41vt/Sa7p67hJ6Vvg4/cG25PG75Gw5FmDTMwNm/05G0mVRt7tosUcEVMZclmLUoITntUoYBOpV
 L1GN41vjd/d18I+Y1Sy6FW/DIQl7queUHwgp2UBZzvBBJs6xzJEujOXaF3Vbo/WQEFixU5PWuaWOs
 KIB7801zQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35532)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1khZkS-0007qo-Q0; Tue, 24 Nov 2020 14:56:52 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1khZkN-0007Qk-I3; Tue, 24 Nov 2020 14:56:47 +0000
Date: Tue, 24 Nov 2020 14:56:47 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Antonio Borneo <antonio.borneo@st.com>
Message-ID: <20201124145647.GF1551@shell.armlinux.org.uk>
References: <20201124143848.874894-1-antonio.borneo@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124143848.874894-1-antonio.borneo@st.com>
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

On Tue, Nov 24, 2020 at 03:38:48PM +0100, Antonio Borneo wrote:
> If the auto-negotiation fails to establish a gigabit link, the phy
> can try to 'down-shift': it resets the bits in MII_CTRL1000 to
> stop advertising 1Gbps and retries the negotiation at 100Mbps.
> 
> From commit 5502b218e001 ("net: phy: use phy_resolve_aneg_linkmode
> in genphy_read_status") the content of MII_CTRL1000 is not checked
> anymore at the end of the negotiation, preventing the detection of
> phy 'down-shift'.
> In case of 'down-shift' phydev->advertising gets out-of-sync wrt
> MII_CTRL1000 and still includes modes that the phy have already
> dropped. The link partner could still advertise higher speeds,
> while the link is established at one of the common lower speeds.
> The logic 'and' in phy_resolve_aneg_linkmode() between
> phydev->advertising and phydev->lp_advertising will report an
> incorrect mode.
> 
> Issue detected with a local phy rtl8211f connected with a gigabit
> capable router through a two-pairs network cable.
> 
> After auto-negotiation, read back MII_CTRL1000 and mask-out from
> phydev->advertising the modes that have been eventually discarded
> due to the 'down-shift'.

Sorry, but no. While your solution will appear to work, in
introduces unexpected changes to the user visible APIs.

>  	if (phydev->autoneg == AUTONEG_ENABLE && phydev->autoneg_complete) {
> +		if (phydev->is_gigabit_capable) {
> +			adv = phy_read(phydev, MII_CTRL1000);
> +			if (adv < 0)
> +				return adv;
> +			/* update advertising in case of 'down-shift' */
> +			mii_ctrl1000_mod_linkmode_adv_t(phydev->advertising,
> +							adv);

If a down-shift occurs, this will cause the configured advertising
mask to lose the 1G speed, which will be visible to userspace.
Userspace doesn't expect the advertising mask to change beneath it.
Since updates from userspace are done using a read-modify-write of
the ksettings, this can have the undesired effect of removing 1G
from the configured advertising mask.

We've had other PHYs have this behaviour; the correct solution is for
the PHY driver to implement reading the resolution from the PHY rather
than relying on the generic implementation if it can down-shift.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
