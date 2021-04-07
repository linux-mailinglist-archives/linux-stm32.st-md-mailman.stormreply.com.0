Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C4C356C71
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Apr 2021 14:44:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A6E0C5719D;
	Wed,  7 Apr 2021 12:44:51 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE0F4C56639
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Apr 2021 12:44:49 +0000 (UTC)
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1lU7Xz-00FJ58-BU; Wed, 07 Apr 2021 14:44:39 +0200
Date: Wed, 7 Apr 2021 14:44:39 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Voon, Weifeng" <weifeng.voon@intel.com>
Message-ID: <YG2pN8uupbXP7xqU@lunn.ch>
References: <20210405112953.26008-1-michael.wei.hong.sit@intel.com>
 <YGsMbBW9h4H1y/T8@lunn.ch>
 <CO1PR11MB5044B1F80C412E6F0CAFD5509D779@CO1PR11MB5044.namprd11.prod.outlook.com>
 <YGsgHWItHcLFV9Kg@lunn.ch>
 <SN6PR11MB313690E7953BF715A8F488D688769@SN6PR11MB3136.namprd11.prod.outlook.com>
 <YGy/N+cRLGTifJSN@lunn.ch>
 <SN6PR11MB3136E862F38D7C573759989188759@SN6PR11MB3136.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SN6PR11MB3136E862F38D7C573759989188759@SN6PR11MB3136.namprd11.prod.outlook.com>
Cc: "Chuah, Kim Tatt" <kim.tatt.chuah@intel.com>,
 "qiangqing.zhang@nxp.com" <qiangqing.zhang@nxp.com>,
 "fugang.duan@nxp.com" <fugang.duan@nxp.com>,
 "alexandre.torgue@st.com" <alexandre.torgue@st.com>, "Wong,
 Vee Khee" <vee.khee.wong@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "Sit,
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

> Intel mgbe is flexible to pair with any PHY. Only Aquantia/Marvell
> multi-gige PHY can do rate adaption right?

The Marvell/Marvell multi-gige PHY can also do rate
adaptation. Marvell buying Aquantia made naming messy :-(
I should probably use part numbers.

> Hence, we still need to take care of others PHYs.

Yes, it just makes working around the broken design harder if you want
to get the most out of the hardware.

   Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
