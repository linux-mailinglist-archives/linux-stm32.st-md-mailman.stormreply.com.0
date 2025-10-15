Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 475EBBE0DD5
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Oct 2025 23:48:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4E05C5717C;
	Wed, 15 Oct 2025 21:48:55 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3BE67C57176
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 21:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZTSdOvDlbsuQj/667Lv/041NU1iVeaPF8hOZogCvbXQ=; b=YuylOvSujLmb3kYb3oa3KZhd1o
 wcivn+oEGR5jMG+fLOcoNiGMQFOKlJReF4ZhQCgW6UNgwmkI7KBv/Rwe7BlB8vQBvcxbkJM/FS25R
 nbkiY2chbvHiaGiXJbu3uf20ojRKMuT53zFf1J2Vf4jui+7wXJdVEhEPIEYB3on4i4Z/ijLr3qM2t
 5pMpZA4Bg/QIYfx62+RbxJ00uIQTNyetpbTjGOrPLJvbE8pLkT9GtmaUtTSoyx3s3qK8bSjc+uYNQ
 aJ4+ULCk2sB3TksqCuRGzjct29p90b4FiKHUhV0wbNIgFvMGQR+yHmUjhLcpll5Gzf3Tl7vYPHTBd
 Oxs7DzZQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50176)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1v99MA-000000005Ut-17h0;
 Wed, 15 Oct 2025 22:48:26 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1v99M1-000000002dZ-0S6N; Wed, 15 Oct 2025 22:48:17 +0100
Date: Wed, 15 Oct 2025 22:48:16 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <aPAWoDGVgeRFV95b@shell.armlinux.org.uk>
References: <aO-tbQCVu47R3izM@shell.armlinux.org.uk>
 <E1v92N3-0000000AmHQ-4Bm2@rmk-PC.armlinux.org.uk>
 <15ea57e0-d127-4722-b752-4989d5a443c0@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <15ea57e0-d127-4722-b752-4989d5a443c0@lunn.ch>
Cc: Song Yoong Siang <yoong.siang.song@intel.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Kees Cook <kees@kernel.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
 Swathi K S <swathi.ks@samsung.com>, Eric Dumazet <edumazet@google.com>,
 Jisheng Zhang <jszhang@kernel.org>, Simon Horman <horms@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Yu-Chun Lin <eleanor15x@gmail.com>,
 Furong Xu <0x1207@gmail.com>, Oleksij Rempel <o.rempel@pengutronix.de>,
 Shenwei Wang <shenwei.wang@nxp.com>,
 Abhishek Chauhan <quic_abchauha@quicinc.com>,
 Jacob Keller <jacob.e.keller@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Daniel Machon <daniel.machon@microchip.com>,
 Ley Foon Tan <leyfoon.tan@starfivetech.com>, linux-arm-msm@vger.kernel.org,
 "Jan Petrous \(OSS\)" <jan.petrous@oss.nxp.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Alexis Lothore <alexis.lothore@bootlin.com>,
 Drew Fustini <dfustini@tenstorrent.com>, linux-arm-kernel@lists.infradead.org,
 Rohan G Thomas <rohan.g.thomas@altera.com>,
 Vladimir Oltean <olteanv@gmail.com>, Inochi Amaoto <inochiama@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
 Boon Khai Ng <boon.khai.ng@altera.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 11/14] net: stmmac: do not
 require snps, ps-speed for SGMII
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

On Wed, Oct 15, 2025 at 11:26:03PM +0200, Andrew Lunn wrote:
> On Wed, Oct 15, 2025 at 03:20:53PM +0100, Russell King (Oracle) wrote:
> > SGMII mode does not require port-speed to be specified; this only
> > switches SGMII to use the MAC configuration register speed settings
> > and the actual value is irrelevant when the link comes up.
> > 
> > As it seems the intention was to support "reverse SGMII" with this
> > setting, but the code didn't actually configure that due to a typo,
> > the warning and bad DT binding documentation has led people to
> > specify snps,ps-speed in their DT files inappropriately.
> 
> I know you hit the patch limit. Do you have a patch in the next series
> which updates the binding?

I don't at present, and I'm not sure what the point of updating it
would actually be, because this is another thing that's just broken.

The purpose of this property is to allow DT to specify the operating
speed of the link when acting as if it were a PHY on the end of a
SGMII (or RGMII) link using in-band signalling. However, because the
code mixes up GMAC_CONTROL_TE instead of GMAC_CONTROL_TC, when this
is set, the _transmit enable_ is set, rather than the _transmit
configuration_ bit, meaning the core doesn't actually send the
inband status as if it were a PHY.

So, the whole thing is pointless, it's never worked from what I can
see, and lastly... this property should not even be specifying a
speed at all, because that's what we have the fixed-link stuff for.
At best, this should have triggered a discussion about PHY
interface modes such as reverse-SGMII and reverse-RGMII that we've
recently had where the MAC is acting as if it were a PHY.

We can't get rid of it because doing so would break existing DTS
files. We can't fix it to work, because given the vagueness of the
current definition, people have added this property even when they
do not want to be operating in reverse mode.

Hence, I would like this property a slow and painful^h^h^hfree death.
Maybe mark the property deprecated, and remove all explanation of it
apart from stating that it's obsolete after this patch series has
been merged and we've proven that it's never been useful.

IMHO, it's a property that should never have existed.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
