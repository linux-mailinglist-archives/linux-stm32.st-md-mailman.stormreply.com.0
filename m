Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E373F86B7
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Aug 2021 13:50:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34188C57B60;
	Thu, 26 Aug 2021 11:50:27 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2A91C5718D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Aug 2021 11:50:24 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10087"; a="214597319"
X-IronPort-AV: E=Sophos;i="5.84,353,1620716400"; d="scan'208";a="214597319"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2021 04:50:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,353,1620716400"; d="scan'208";a="465099620"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga007.jf.intel.com with ESMTP; 26 Aug 2021 04:50:21 -0700
Received: from linux.intel.com (vwong3-iLBPG3.png.intel.com [10.88.229.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 719855805A3;
 Thu, 26 Aug 2021 04:50:17 -0700 (PDT)
Date: Thu, 26 Aug 2021 19:50:14 +0800
From: Wong Vee Khee <vee.khee.wong@linux.intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <20210826115014.GA5112@linux.intel.com>
References: <20210809102229.933748-1-vee.khee.wong@linux.intel.com>
 <20210809102229.933748-2-vee.khee.wong@linux.intel.com>
 <YREvDRkiuScyN8Ws@lunn.ch> <20210810235529.GB30818@linux.intel.com>
 <f2a1f135-b77a-403d-5d2e-c497efc99df7@gmail.com>
 <YRPcyHTc2FJeEoqk@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YRPcyHTc2FJeEoqk@lunn.ch>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org,
 Voon Weifeng <weifeng.voon@intel.com>, Russell King <linux@armlinux.org.uk>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "David S . Miller" <davem@davemloft.net>, Jose Abreu <joabreu@synopsys.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 1/2] net: pcs: xpcs: enable skip
	xPCS soft reset
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

On Wed, Aug 11, 2021 at 04:20:56PM +0200, Andrew Lunn wrote:
> > > BIOS does configured the SerDes. The problem here is that all the
> > > configurations done by BIOS are being reset at xpcs_create().
> > > 
> > > We would want user of the pcs-xpcs module (stmmac, sja1105) to have
> > > control whether or not we need to perform to the soft reset in the
> > > xpcs_create() call.
> > 
> > I understood Andrew's response as suggesting to introduce the ability for
> > xpcs_create() to make a BIOS call which would configure the SerDes after
> > xpcs_soft_reset().
> 
> Yes. Exactly. That is what ACPI is for, so we should use it for this.
> 
>      Andrew

Thanks Florian for the explaination.

I have checked with the BIOS developers and they did not implmenet a
method to this at the kernel level.

Also, Intel AlderLake has both UEFI BIOS and Slim Bootloader which
make it least feasible to go for the ACPI method as per suggested.


Regards,
  VK
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
