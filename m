Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AE2A464F3
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Feb 2025 16:35:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E5FFC7A832;
	Wed, 26 Feb 2025 15:35:01 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3878DC7A831
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Feb 2025 15:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=We2PZZN/Z/OuW0OC8GwI1XN1ZlLiDb7BHXEm1VKevUk=; b=Nr0yY4QOvO504vfmWBFQmckDao
 kNFatIEDpJJ49/rgYpfiH++mWZHYZIFvqFiGiXICM9+pzthfUMdPm085ugAORIS3wfA6892RzO7ys
 XfghSaloouVCRP/vJ4x1dPqWm4qT9JOLDlXny/EWwtvq2FoQRvL01pJn6YNuVsEDQ2AQbmNrF1sMQ
 prEvODafyJe2vhYMbMrOCqIzl76gHh8JPgUgK0HbiqTvGpBjuY6PfdNEeMiouWLF5C7wG2IiUlS9m
 XFFePb5qrC1YziycPejRxgJ/jMXRSUZrhxfnRbnOM6zeZFJ4JKzGAho6Vn3ki5ucSBQ0Uy6i9xN8H
 fIvMutIA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42746)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tnJQQ-0004iF-1A;
 Wed, 26 Feb 2025 15:34:18 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tnJQG-0007CL-1X;
 Wed, 26 Feb 2025 15:34:08 +0000
Date: Wed, 26 Feb 2025 15:34:08 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Message-ID: <Z780cM9bejxhzTXO@shell.armlinux.org.uk>
References: <20250226074837.1679988-1-yong.liang.choong@linux.intel.com>
 <20250226074837.1679988-2-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250226074837.1679988-2-yong.liang.choong@linux.intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, David E Box <david.e.box@intel.com>,
 Eric Dumazet <edumazet@google.com>, David E Box <david.e.box@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>, linux-stm32@st-md-mailman.stormreply.com,
 x86@kernel.org, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Mengyuan Lou <mengyuanlou@net-swift.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>, Simon Horman <horms@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
 Borislav Petkov <bp@alien8.de>,
 Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v8 1/6] net: phylink: use
 pl->link_interface in phylink_expects_phy()
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

On Wed, Feb 26, 2025 at 03:48:32PM +0800, Choong Yong Liang wrote:
> The phylink_expects_phy() function allows MAC drivers to check if they are
> expecting a PHY to attach. The checking condition in phylink_expects_phy()
> aims to achieve the same result as the checking condition in
> phylink_attach_phy().
> 
> However, the checking condition in phylink_expects_phy() uses
> pl->link_config.interface, while phylink_attach_phy() uses
> pl->link_interface.
> 
> Initially, both pl->link_interface and pl->link_config.interface are set
> to SGMII, and pl->cfg_link_an_mode is set to MLO_AN_INBAND.
> 
> When the interface switches from SGMII to 2500BASE-X,
> pl->link_config.interface is updated by phylink_major_config().
> At this point, pl->cfg_link_an_mode remains MLO_AN_INBAND, and
> pl->link_config.interface is set to 2500BASE-X.
> Subsequently, when the STMMAC link goes down and comes up again,
> it is blocked by phylink_expects_phy().

I thought we ascertained that it's not "link goes down" but when the
interface is taken down administratively. "Link goes down" to most
people mean an event such as the network cable being unplugged.
Please fix the patch description.

> Since phylink_expects_phy() and phylink_attach_phy() aim to achieve the
> same result, phylink_expects_phy() should check pl->link_interface,
> which never changes, instead of pl->link_config.interface, which is
> updated by phylink_major_config().
> 
> Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>

With, and *only* with the above fixed:

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
