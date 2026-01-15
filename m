Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 71032D25384
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jan 2026 16:15:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 260A5C8F285;
	Thu, 15 Jan 2026 15:15:59 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89BDBC87ED5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jan 2026 15:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QOLovP1nf5K8/XFRLq/JOQI95IJezXEIyYwgpMIfHxg=; b=RrA0c2Crm8jwm+G3tWPYeyiqT7
 zErC1h99cNML2NBK9REG2mW04hcq38xBMii0CtX5baQwyTf8qSB+aKaO+QM16CHsyH9H/x2aTuxXM
 ILfkpky1HEd40uBy+7wNq7YihR+5WgT3rnxPGL3ikENUP57iAluJPkWrrF+YrdYlpNbGPFz8tsnbm
 m2rGB7I1S1E8qmyGtbzKZZuc1Ow0GJno4sJnG6IV9aMMxUZzPXN+MAEceecT5UJxepEK9pPRiWEUf
 nTa3+MGFhxPa6YurSLP0sHO2oC5Q9T0m8M4LzafOZ69dGyIIToW9uQSqyf8XcRUdBk9k0K86Gmyfl
 UaBs1WYw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59658)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vgP4Z-000000001PW-0scZ;
 Thu, 15 Jan 2026 15:15:43 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vgP4U-000000002kl-1vG7; Thu, 15 Jan 2026 15:15:38 +0000
Date: Thu, 15 Jan 2026 15:15:38 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <aWkEmockEyLsZKMd@shell.armlinux.org.uk>
References: <aWfWDsCoBc3YRKKo@shell.armlinux.org.uk>
 <E1vg4w2-00000003SG5-2FH5@rmk-PC.armlinux.org.uk>
 <a91a0937-93cd-40f2-9759-8823fb08f48c@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a91a0937-93cd-40f2-9759-8823fb08f48c@bootlin.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Andrew Lunn <andrew@lunn.ch>, Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-phy@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 05/14] net: stmmac: add stmmac
 core serdes support
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

On Thu, Jan 15, 2026 at 03:48:40PM +0100, Maxime Chevallier wrote:
> Hi Russell,
> 
> On 14/01/2026 18:45, Russell King (Oracle) wrote:
> > Rather than having platform glue implement SerDes PHY support, add it
> > to the core driver, specifically to the stmmac integrated PCS driver
> > as the SerDes is connected to the integrated PCS.
> > 
> > Platforms using external PCS can also populate plat->serdes, and the
> > core driver will call phy_init() and phy_exit() when the administrative
> > state of the interface changes, but the other phy methods will not be
> > called.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> Unfortunately I have no way to test. But still,

I am hoping Mohd Ayaan Anwar will be able to do at least some testing
on the qcom-ethqos hardware.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
