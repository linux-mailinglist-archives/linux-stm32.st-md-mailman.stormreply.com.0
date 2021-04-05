Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E86354226
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Apr 2021 14:43:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54F89C57B69;
	Mon,  5 Apr 2021 12:43:30 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3D54C56639
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Apr 2021 12:43:28 +0000 (UTC)
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1lTOZV-00EvHl-4V; Mon, 05 Apr 2021 14:43:13 +0200
Date: Mon, 5 Apr 2021 14:43:13 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Voon, Weifeng" <weifeng.voon@intel.com>
Message-ID: <YGsF4aGguqsfaQQ3@lunn.ch>
References: <20210401150152.22444-1-michael.wei.hong.sit@intel.com>
 <20210401150152.22444-2-michael.wei.hong.sit@intel.com>
 <20210401151044.GZ1463@shell.armlinux.org.uk>
 <SN6PR11MB3136F7A7ACA1A5C324031607887A9@SN6PR11MB3136.namprd11.prod.outlook.com>
 <YGcPc3dan0ocRSG2@lunn.ch>
 <SN6PR11MB3136C4F44116EC909186742C88779@SN6PR11MB3136.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SN6PR11MB3136C4F44116EC909186742C88779@SN6PR11MB3136.namprd11.prod.outlook.com>
Cc: "Chuah, Kim Tatt" <kim.tatt.chuah@intel.com>,
 "qiangqing.zhang@nxp.com" <qiangqing.zhang@nxp.com>,
 "fugang.duan@nxp.com" <fugang.duan@nxp.com>,
 "alexandre.torgue@st.com" <alexandre.torgue@st.com>, "Wong,
 Vee Khee" <vee.khee.wong@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>, "Sit,
 Michael Wei Hong" <michael.wei.hong.sit@intel.com>,
 "joabreu@synopsys.com" <joabreu@synopsys.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "kuba@kernel.org" <kuba@kernel.org>, "Ong,
 Boon Leong" <boon.leong.ong@intel.com>,
 "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "hkallweit1@gmail.com" <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 1/2] net: stmmac: enable 2.5Gbps
	link speed
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

On Mon, Apr 05, 2021 at 09:07:34AM +0000, Voon, Weifeng wrote:
> > On Fri, Apr 02, 2021 at 07:45:04AM +0000, Voon, Weifeng wrote:
> > > > > +	/* 2.5G mode only support 2500baseT full duplex only */
> > > > > +	if (priv->plat->has_gmac4 && priv->plat->speed_2500_en) {
> > > > > +		phylink_set(mac_supported, 2500baseT_Full);
> > > > > +		phylink_set(mask, 10baseT_Half);
> > > > > +		phylink_set(mask, 10baseT_Full);
> > > > > +		phylink_set(mask, 100baseT_Half);
> > > > > +		phylink_set(mask, 100baseT_Full);
> > > > > +		phylink_set(mask, 1000baseT_Half);
> > > > > +		phylink_set(mask, 1000baseT_Full);
> > > > > +		phylink_set(mask, 1000baseKX_Full);
> > > >
> > > > Why? This seems at odds to the comment above?
> > >
> > > > What about 2500baseX_Full ?
> > >
> > > The comments explain that the PCS<->PHY link is in 2500BASE-X and why
> > > 10/100/1000 link speed is mutually exclusive with 2500.
> > > But the connected external PHY are twisted pair cable which only
> > > supports 2500baseT_full.
> > 
> > The PHY should indicate what modes its supports. The PHY drivers
> > get_features() call should set supported to only 2500baseT_Full, if that is
> > all it supports.
> > 
> > What modes are actually used should then be the intersect of what both the
> > MAC and the PHY indicate they can do.
> 
> Noted Andrew. Instead of masking the 10/100/1000 mode support in the MAC, we will
> set the supported modes in the PCS.

PCS?

You said:

> > > But the connected external PHY are twisted pair cable which only
> > > supports 2500baseT_full.

So it should be the PHY, not the PCS, which indicates it only supports
2500baseT_full.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
