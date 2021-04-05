Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8AD3542DF
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Apr 2021 16:35:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E13CC57B69;
	Mon,  5 Apr 2021 14:35:28 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4D54C56639
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Apr 2021 14:35:26 +0000 (UTC)
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1lTQJp-00EwLg-1z; Mon, 05 Apr 2021 16:35:09 +0200
Date: Mon, 5 Apr 2021 16:35:09 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Sit, Michael Wei Hong" <michael.wei.hong.sit@intel.com>
Message-ID: <YGsgHWItHcLFV9Kg@lunn.ch>
References: <20210405112953.26008-1-michael.wei.hong.sit@intel.com>
 <YGsMbBW9h4H1y/T8@lunn.ch>
 <CO1PR11MB5044B1F80C412E6F0CAFD5509D779@CO1PR11MB5044.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CO1PR11MB5044B1F80C412E6F0CAFD5509D779@CO1PR11MB5044.namprd11.prod.outlook.com>
Cc: "Chuah, Kim Tatt" <kim.tatt.chuah@intel.com>,
 "fugang.duan@nxp.com" <fugang.duan@nxp.com>,
 "alexandre.torgue@st.com" <alexandre.torgue@st.com>, "Voon,
 Weifeng" <weifeng.voon@intel.com>, "Wong, Vee Khee" <vee.khee.wong@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "qiangqing.zhang@nxp.com" <qiangqing.zhang@nxp.com>,
 "joabreu@synopsys.com" <joabreu@synopsys.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "kuba@kernel.org" <kuba@kernel.org>, "Ong,
 Boon Leong" <boon.leong.ong@intel.com>,
 "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "hkallweit1@gmail.com" <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/2] Enable 2.5Gbps speed for
	stmmac
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

> > You have a MAC and an PCS in the stmmac IP block. That then has
> > some
> > sort of SERDES interface, running 1000BaseX, SGMII, SGMII
> > overclocked
> > at 2.5G or 25000BaseX. Connected to the SERDES you have a PHY
> > which
> > converts to copper, giving you 2500BaseT.
> > 
> > You said earlier, that the PHY can only do 2500BaseT. So it should
> > be
> > the PHY driver which sets supported to 2500BaseT and no other
> > speeds.
> > 
> > You should think about when somebody uses this MAC with a
> > different
> > PHY, one that can do the full range of 10/half through to 2.5G
> > full. What generally happens is that the PHY performs auto-neg to
> > determine the link speed. For 10M-1G speeds the PHY will
> > configure its
> > SERDES interface to SGMII and phylink will ask the PCS to also be
> > configured to SGMII. If the PHY negotiates 2500BaseT, it will
> > configure its side of the SERDES to 2500BaseX or SGMII
> > overclocked at
> > 2.5G. Again, phylink will ask the PCS to match what the PHY is
> > doing.
> > 
> > So, where exactly is the limitation in your hardware? PCS or PHY?
> The limitation in the hardware is at the PCS side where it is either running
> in SGMII 2.5G or SGMII 1G speeds.
> When running on SGMII 2.5G speeds, we disable the in-band AN and use 2.5G speed only

So there is no actual limitation! The MAC should indicate it can do
10Half through to 2500BaseT. And you need to listen to PHYLINK and
swap the PCS between SGMII to overclocked SGMII when it requests.

PHYLINK will call stmmac_mac_config() and use state->interface to
decide how to configure the PCS to match what the PHY is doing.

     Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
