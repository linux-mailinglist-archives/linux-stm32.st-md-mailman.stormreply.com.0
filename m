Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D5E782B0B
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Aug 2023 15:58:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 694BEC6B44E;
	Mon, 21 Aug 2023 13:58:10 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C6CBC6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 13:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OS0lvFtBNyEGIlutfKlsCWdNAR/9cLg3EU19hb5EGS8=; b=jE8MlowF16n1coowOyKHA4y6IP
 JO8g855XJWA5YmPRVfJyL7wNalLKXyjsvgddIXWBItbYicbzliIxJ/eHxxbnS2WuuPtjKoqFZub66
 pMTJkzvNSNMIRLICjtgIsHPP2qVpf1eZEJ3I9cphKJrP/Qleaxxsj6TGnkkTfvZHD0MIxsfjapkUl
 umzBZawKst490OPX539UaqcbIc31cxoy/Z+SwXZD42Ne5aSBauqe/7Cv/7eptQx07vbwqGLEsQPlw
 rz35ZEfuefm8w8GKHoYSmz6YVXlUMxuB/qpj3XhMAhR82/zhHQgPb/szLBhSdUtugqInXep0Ix4vj
 naThhy7Q==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36514)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1qY5Pm-00007q-29;
 Mon, 21 Aug 2023 14:57:54 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1qY5Pk-0004p0-0l; Mon, 21 Aug 2023 14:57:52 +0100
Date: Mon, 21 Aug 2023 14:57:51 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Serge Semin <fancer.lancer@gmail.com>
Message-ID: <ZONtX8EMXnmHQFnD@shell.armlinux.org.uk>
References: <20230816152926.4093-1-jszhang@kernel.org>
 <20230816152926.4093-3-jszhang@kernel.org>
 <9e55fd03-6b05-46de-874e-01d9cdbf4524@lunn.ch>
 <ZOJuzakni1youMtX@shell.armlinux.org.uk>
 <dmfhl4ptoytmconczdkccli5qlkct33tgfqaoigygrzak52g63@qw7pwoa5m2x3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dmfhl4ptoytmconczdkccli5qlkct33tgfqaoigygrzak52g63@qw7pwoa5m2x3>
Cc: Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Rob Herring <robh+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v4 2/9] net: stmmac: xgmac: add
 more feature parsing from hw cap
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

On Mon, Aug 21, 2023 at 04:25:42PM +0300, Serge Semin wrote:
> Hi Russel, Andrew
> 
> On Sun, Aug 20, 2023 at 08:51:41PM +0100, Russell King (Oracle) wrote:
> > On Sun, Aug 20, 2023 at 09:15:06PM +0200, Andrew Lunn wrote:
> > > On Wed, Aug 16, 2023 at 11:29:19PM +0800, Jisheng Zhang wrote:
> 
> > > > The XGMAC_HWFEAT_GMIISEL bit also indicates whether support 10/100Mbps
> > > > or not.
> 
> > > 
> > > The commit message fails to explain the 'Why?' question. GMII does
> > > normally imply 10/100/1000, so i would expect dma_cap->mbps_1000 also
> > > implies 10/100/1000? So why also set dma_cap->mbps_10_100?
> 
> Regarding DW XGMAC. I can't say for sure. Based on DW XGMAC v2.10
> IP-core HW manual it has MAC_HW_Feature0.GMIISEL(1) flag indicating
> whether there is GMII interface besides of the XGMII interface. But in
> my databook MAC_HW_Feature0.BIT(0) is marked as reserved and
> MAC_Tx_Configuration.SS field doesn't have 10/100Mbps modes despite of
> what is defined in dwxgmac2.h by means of the XGMAC_CONFIG_SS_10_MII
> and XGMAC_CONFIG_SS_1000_GMII macros.
> 
> But DW GMAC or DW Eth QoS can be synthesized with the 1000-only
> mode enabled. GMIISEL and MIISEL flags reflect the OP_MODE IP-core
> synthesize parameter state. It can have three different values:
> 
> Mode of Operation	Description: Configures the MAC to work in
> 			10/100/1000 Mbps mode. Select 10/100/1000
> 			Mbps for enabling both Fast Ethernet and Gigabit
> 			operations, 10/100 Mbps for Fast Ethernet-only
> 			operations, and 1000 Mbps for Gigabit-only operations.
> !!!			Value Range: 10/100/1000 Mbps, 10/100 Mbps, or 1000 Mbps
> 			Default Value:
> 				10/100/1000 Mbps with Gigabit License
> 				10/100 with Fast Ethernet license
> HDL Parameter Name: OP_MODE
> 
> > > 
> > > Maybe a better change would be to modify:
> > > 
> > >         seq_printf(seq, "\t1000 Mbps: %s\n",
> > >                    (priv->dma_cap.mbps_1000) ? "Y" : "N");
> > > 
> > > to actually say 10/100/1000 Mbps? It does not appear this is used for
> > > anything other than debugfs?
> > 
> 
> > Indeed, it also looks to me like mbps_1000 and mbps_10_100 are only
> > used to print things in the debugfs file, and do not have any effect
> > on the driver.
> 
> They should have been utilized somehow in the stmmac_mac_link_up() and

No, definitely not in mac_link_up(). If these flags indicate what speeds
are available, then what would mac_link_up() do if, e.g. the core says
"I don't support 1G" and phylink determines that the result of
negotiation is 1G?

This is clearly not the right place. The right place is when
initialising the phylink MAC capabilities, which is currently done in
stmmac_phy_setup() without *any* regard what so ever for what speeds
are actually supported, with the exception of "oh, is that the maximum
speed".

> > It does bring up one last question though: if the driver makes no use
> > of these hw_cap bits, then is there any point in printing them in the
> > debugfs file?
> 
> This question can be applied to almost the half of the dma_feature
> structure fields.) One more patch extends it with even more mainly
> unused fields:
> https://lore.kernel.org/netdev/20230819105440.226892-1-0x1207@gmail.com/

If the hw_cap field is specific, then how about some hardware specific
data giving something like an enum listing the capabilties, the enum
used to index a string table of capabilities, and an array of bit
numbers in hw_cap for those fields, or an array of masks? This data
could be const, which means that stmmac_dma_cap_show() only needs
the hw_cap value and the struct.

That also means that stmmac_phy_setup() could also index the
array of bit numbers to test for e.g. GMII/MII support to determine
whether 10/100 and 1000 capabilities should be added for phylink.

If we look at the "half_duplex" dma capability, things are similarly
stupid. Pulling out of dwmac4:

        dma_cap->half_duplex = (hw_cap & GMAC_HW_FEAT_HDSEL) >> 2;

This is not tested elsewhere from what I can find - neither the
hwcap nor the half_duplex field except for reporting in debugfs.
It isn't used to restrict the phylink capabilities for HD, since
the only test is this:

        /* Half-Duplex can only work with single queue */
        if (priv->plat->tx_queues_to_use > 1)
                priv->phylink_config.mac_capabilities &=
                        ~(MAC_10HD | MAC_100HD | MAC_1000HD);

So, the reporting of "half duplex" mode in debugfs has absolutely
nothing to do with whether we try to use half duplex modes in the
driver.

This is rubbish. Utter rubbish.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
