Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 460119D3A17
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Nov 2024 13:00:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0BD21C7A82A;
	Wed, 20 Nov 2024 12:00:09 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04A84C78F87
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Nov 2024 12:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1FVnryMM8lSBpu5IKb6YzzE0+p3MecXFHq+tUNyftqs=; b=NVsic0aqBY69L9DWCME2+mmF/b
 CE4nxmsQ1kXVHb5JKokNfJizGvCJAxwUeLKHuSgJIUnKSoo5WjR2BBwPXoIzVRaGj9T8Tmto06gZi
 9ZowFFLJBZsKmYLlQAbYxHdwGDEi4ysIKnKKAUTXn7EORLvSaAMzkBBk5BVcd54GMEsw+1hiTHFDS
 QShu4RArI/MXolXw+KA7bvZ0HaQmfBoJfi34jT6Jodsxt65MtJkUQ77rdn3c76W0HU8heSUJjk/3r
 G79IPnI8kDtH4qxtwKDf3DASryoAWElXEYWarb2vhegkObAumfOXuYvZhnTD6K3G3Vn6dVhN6URjH
 3l44bIeQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56694)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tDjMt-0005RK-1U;
 Wed, 20 Nov 2024 11:59:36 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tDjMn-000742-10;
 Wed, 20 Nov 2024 11:59:29 +0000
Date: Wed, 20 Nov 2024 11:59:29 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jan Petrous <jan.petrous@oss.nxp.com>
Message-ID: <Zz3PIROyOIvpzlto@shell.armlinux.org.uk>
References: <20241119-upstream_s32cc_gmac-v5-0-7dcc90fcffef@oss.nxp.com>
 <Zzy_enX2VyS0YUl3@shell.armlinux.org.uk>
 <Zz3Oz3JiRLyD1qKx@lsv051416.swis.nl-cdc01.nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zz3Oz3JiRLyD1qKx@lsv051416.swis.nl-cdc01.nxp.com>
Cc: Andrew Lunn <andrew@lunn.ch>, NXP S32 Linux Team <s32@nxp.com>,
 Emil Renner Berthing <kernel@esmil.dk>, imx@lists.linux.dev,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Eric Dumazet <edumazet@google.com>,
 Iyappan Subramanian <iyappan@os.amperecomputing.com>,
 Quan Nguyen <quan@os.amperecomputing.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Jacob Keller <jacob.e.keller@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Richard Cochran <richardcochran@gmail.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Keyur Chudgar <keyur@os.amperecomputing.com>,
 Minda Chen <minda.chen@starfivetech.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Serge Semin <fancer.lancer@gmail.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v5 00/16] Add support for Synopsis DWMAC
 IP on NXP Automotive SoCs S32G2xx/S32G3xx/S32R45
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

On Wed, Nov 20, 2024 at 12:58:07PM +0100, Jan Petrous wrote:
> On Tue, Nov 19, 2024 at 04:40:26PM +0000, Russell King (Oracle) wrote:
> > Hi,
> > 
> > On Tue, Nov 19, 2024 at 04:00:06PM +0100, Jan Petrous via B4 Relay wrote:
> > > The SoC series S32G2xx and S32G3xx feature one DWMAC instance,
> > > the SoC S32R45 has two instances. The devices can use RGMII/RMII/MII
> > > interface over Pinctrl device or the output can be routed
> > > to the embedded SerDes for SGMII connectivity.
> > > 
> > > The provided stmmac glue code implements only basic functionality,
> > > interface support is restricted to RGMII only. More, including
> > > SGMII/SerDes support will come later.
> > > 
> > > This patchset adds stmmac glue driver based on downstream NXP git [0].
> > 
> > A few things for the overall series:
> > 
> > 1. Note that net-next is closed due to the merge window, so patches should
> >    be sent as RFC.
> > 
> > 2. The formatting of the subject line should include the tree to which
> >    you wish the patches to be applied - that being net-next for
> >    development work.
> > 
> > For more information, see:
> > 
> > https://kernel.org/doc/html/v6.12/process/maintainer-netdev.html#netdev-faq
> > 
> 
> Hi Russell,
> 
> thanks for review and hints with series proper targeting. I will
> reformulate series to 'RFC net-next v6 x/y' for v6.

'PATCH RFC net-next v6 x/y' is better.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
