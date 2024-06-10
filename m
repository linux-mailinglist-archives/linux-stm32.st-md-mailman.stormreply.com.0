Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D89A39021AB
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jun 2024 14:30:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98A4FC78017;
	Mon, 10 Jun 2024 12:30:56 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C85DC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2024 12:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=ZAmsJ52qEwd6M60f4uacAxS1bKk0l5sx1M5ZKU+F02g=; b=RI6pwL8Mkl7wa4Jo79n0XYBrkV
 ro9kjR65ptgoMiajSMTClkDTnPMHfm0b9oXxDSfIpRRzYWC97ceiJ6shdT3fyBRH1TdcFTEpWpHLK
 PcxHw8B06RELz2fyisz4uMaNIVSTMtmCeylDOqIYfuOSfftgFcIMawAQmfqj2a/WO4EI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1sGeAY-00HIOs-FV; Mon, 10 Jun 2024 14:30:38 +0200
Date: Mon, 10 Jun 2024 14:30:38 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Ng, Boon Khai" <boon.khai.ng@intel.com>
Message-ID: <3c32c9b9-be77-41c8-97f7-371bd6f8fa16@lunn.ch>
References: <20240527093339.30883-1-boon.khai.ng@intel.com>
 <20240527093339.30883-2-boon.khai.ng@intel.com>
 <48176576-e1d2-4c45-967a-91cabb982a21@lunn.ch>
 <DM8PR11MB5751469FAA2B01EB6CEB7B50C1F12@DM8PR11MB5751.namprd11.prod.outlook.com>
 <48673551-cada-4194-865f-bc04c1e19c29@lunn.ch>
 <DM8PR11MB5751194374C75EC5D5889D6AC1F32@DM8PR11MB5751.namprd11.prod.outlook.com>
 <322d8745-7eae-4a68-4606-d9fdb19b4662@linux.intel.com>
 <BL3PR11MB57488DF9B08EACD88D938E2FC1F82@BL3PR11MB5748.namprd11.prod.outlook.com>
 <734c0d46-63f2-457d-85bf-d97159110583@lunn.ch>
 <DM8PR11MB5751CD3D8EF4DF0B138DEB7FC1FB2@DM8PR11MB5751.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DM8PR11MB5751CD3D8EF4DF0B138DEB7FC1FB2@DM8PR11MB5751.namprd11.prod.outlook.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Tham,
 Mun Yew" <mun.yew.tham@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "Ang,
 Tien Sung" <tien.sung.ang@intel.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>,
 Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, "G Thomas,
 Rohan" <rohan.g.thomas@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "Looi, Hong Aun" <hong.aun.looi@intel.com>
Subject: Re: [Linux-stm32] [Enable Designware XGMAC VLAN Stripping Feature
 v2 1/1] net: stmmac: dwxgmac2: Add support for HW-accelerated VLAN
 Stripping
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

On Fri, Jun 07, 2024 at 04:09:37AM +0000, Ng, Boon Khai wrote:
> > 
> > Do you have access to all the reference documentation for the IP driven in
> > dwmac4_core.c, dwxgmac2_core.c and stmmac_main.c? Is it just VLAN which
> > is the same, and everything else is different? Or are other blocks of the
> > hardware also identical and the code should be shared?
> > If VLAN is all that is identical, then stammc_vlan.c would make sense.
> 
> Hi Andrew, I only have access to the document for 
> dwmac4_core.c and dwxgmac2_core.c

O.K. So please do look at the VLAN code in other places and see if any
can be shared.

, I notice that in the linux mainline
> https://github.com/torvalds/linux/tree/master/drivers/net/ethernet/stmicro/
> stmmac
> 
> it does have stmmac_est.c and stmmac_ptp.c to that support for both
> dwmac4 and dwxgmac2, with that I think it is suitable for introducing
> another file called stmmac_vlan?

Yes, stmmac_vlan.c is O.K.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
