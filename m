Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B2DD20EC3
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jan 2026 19:55:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2FAE1C8F273;
	Wed, 14 Jan 2026 18:55:50 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69AAAC8F270
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jan 2026 18:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iTNLp10Ro+X5fPkwXrfSV4iRZlIf0RMpE69VDQnSaDU=; b=1LhRzFKXkFPsaaOO+voWBOqmCx
 WlnkLzJfHlydzw2SupdC0FtuHxJFpWUTE3rHxleSIvoNimmsJ74c4uQvhjZ5mKgk1erkai5LToTCu
 KGmiXHFeAVwhRvi7Dr7f08JrQRzAfcc9+n1xowSCaSCfv74kEjtro56lOmizuDoQHXoweuV6H04bA
 ATi3Udti/sDsrn/o9G3B40TwksP84ndpiOAovq7FyzWG+L++U1By4AXv4Q1+iLLOGqE4SWX74XiWb
 zisnyNCoVk3fB4Ad/jxIeqn8mldsG2eB5Re8HQizk8XYDzCQuP/9mG7DR3gHc8DKVBNFTX2s9SJQa
 Viw5474Q==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40706)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vg61r-000000000b8-1JiZ;
 Wed, 14 Jan 2026 18:55:39 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vg61n-000000001sW-0Hze; Wed, 14 Jan 2026 18:55:35 +0000
Date: Wed, 14 Jan 2026 18:55:34 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vladimir Oltean <olteanv@gmail.com>
Message-ID: <aWfmpq-dJ-mUCvz1@shell.armlinux.org.uk>
References: <aWfWDsCoBc3YRKKo@shell.armlinux.org.uk>
 <aWfWDsCoBc3YRKKo@shell.armlinux.org.uk>
 <E1vg4vs-00000003SFt-1Fje@rmk-PC.armlinux.org.uk>
 <E1vg4vs-00000003SFt-1Fje@rmk-PC.armlinux.org.uk>
 <20260114184705.djvad5phrnfen6wx@skbuf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260114184705.djvad5phrnfen6wx@skbuf>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Andrew Lunn <andrew@lunn.ch>, Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-phy@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 03/14] phy: qcom-sgmii-eth: add
 .set_mode() and .validate() methods
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

On Wed, Jan 14, 2026 at 08:47:05PM +0200, Vladimir Oltean wrote:
> On Wed, Jan 14, 2026 at 05:45:24PM +0000, Russell King (Oracle) wrote:
> > qcom-sgmii-eth is an Ethernet SerDes supporting only Ethernet mode
> > using SGMII, 1000BASE-X and 2500BASE-X.
> > 
> > Add an implementation of the .set_mode() method, which can be used
> > instead of or as well as the .set_speed() method. The Ethernet
> > interface modes mentioned above all have a fixed data rate, so
> > setting the mode is sufficient to fully specify the operating
> > parameters.
> > 
> > Add an implementation of the .validate() method, which will be
> > necessary to allow discovery of the SerDes capabilities for platform
> > independent SerDes support in the stmmac netowrk driver.
> 
> s/netowrk/network/
> 
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> 
> Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>

According to patchwork (I forgot the RFC tag on the patches) it needs
linux/phy.h included. Plesae let me know if you'd like me to retain
your r-b. Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
