Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE143E86DF
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Aug 2021 01:55:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 088E4C5A4CD;
	Tue, 10 Aug 2021 23:55:43 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CBFB5C5719E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Aug 2021 23:55:41 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10072"; a="202188767"
X-IronPort-AV: E=Sophos;i="5.84,311,1620716400"; d="scan'208";a="202188767"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2021 16:55:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,311,1620716400"; d="scan'208";a="421996902"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga003.jf.intel.com with ESMTP; 10 Aug 2021 16:55:36 -0700
Received: from linux.intel.com (vwong3-iLBPG3.png.intel.com [10.88.229.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 42F28580922;
 Tue, 10 Aug 2021 16:55:32 -0700 (PDT)
Date: Wed, 11 Aug 2021 07:55:29 +0800
From: Wong Vee Khee <vee.khee.wong@linux.intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <20210810235529.GB30818@linux.intel.com>
References: <20210809102229.933748-1-vee.khee.wong@linux.intel.com>
 <20210809102229.933748-2-vee.khee.wong@linux.intel.com>
 <YREvDRkiuScyN8Ws@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YREvDRkiuScyN8Ws@lunn.ch>
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

Hi Andrew,
On Mon, Aug 09, 2021 at 03:35:09PM +0200, Andrew Lunn wrote:
> On Mon, Aug 09, 2021 at 06:22:28PM +0800, Wong Vee Khee wrote:
> > From: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
> > 
> > Unlike any other platforms, Intel AlderLake-S uses Synopsys SerDes where
> > all the SerDes PLL configurations are controlled by the xPCS at the BIOS
> > level. If the driver perform a xPCS soft reset on initialization, these
> > settings will be switched back to the power on reset values.
> > 
> > This changes the xpcs_create function to take in an additional argument
> > to check if the platform request to skip xPCS soft reset during device
> > initialization.
> 
> Why not just call into the BIOS and ask it to configure the SERDES?
> Isn't that what ACPI is all about, hiding the details from the OS? Or
> did the BIOS writers not add a control method to do this?
> 
>     Andrew

BIOS does configured the SerDes. The problem here is that all the
configurations done by BIOS are being reset at xpcs_create().

We would want user of the pcs-xpcs module (stmmac, sja1105) to have
control whether or not we need to perform to the soft reset in the
xpcs_create() call.

Hope that explained.

Regards,
 VK
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
