Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67519903335
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jun 2024 09:07:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F621C6C838;
	Tue, 11 Jun 2024 07:07:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2CFB1CFAC7F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jun 2024 07:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718089631; x=1749625631;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=O7FhlWpnmO6DG8mmvYqNQY1UaM6Z2e5kCT35MiL0Qzo=;
 b=M/gZQr9gMlL0SGv+syuyEqWfl493mLt5pcdZFRWj3GlFNAktFhLF0HiF
 KLs5tgu6pQSBeWUEn4SaYaYtLTBlo89UYDmBLzvzvvOHqBn3w90Pd8Nsl
 eVBpncBTR2R00yXM6hnlflAQTipYsUQCB+1pw9zjIJkA2gxhpQeholj4M
 gBvfNxPjodKdefHOwe939pgrkPx+joyCJMfRK6mPHyYLRlFomxAuhtx1h
 ldgIczY+SnO9QYnYqiWSTpsqxzWF0N8dxf/sZJhn+I9+s7EHWyULo5AQ7
 itKfAqOu3AypcFmMxIjFr89LOS2drfye39CR8kwPF+zhS+29743B7LwpN Q==;
X-CSE-ConnectionGUID: G+1PGkwHTA6O+v6UtIByZQ==
X-CSE-MsgGUID: naCi1GU2Rim8fbHnV6hMPQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14950416"
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; d="scan'208";a="14950416"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 00:07:03 -0700
X-CSE-ConnectionGUID: k1lMzQXiRqCvcTIBQayrzw==
X-CSE-MsgGUID: Hsi4SuxNTey4XSabgKdncg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; d="scan'208";a="76786882"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.247.197])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 00:06:59 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 11 Jun 2024 10:06:55 +0300 (EEST)
To: "Ng, Boon Khai" <boon.khai.ng@intel.com>
In-Reply-To: <DM8PR11MB5751B40B4FB8C1DA200D05FEC1C72@DM8PR11MB5751.namprd11.prod.outlook.com>
Message-ID: <f125a891-0e09-8cd7-4b23-6a936493ccfc@linux.intel.com>
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
 <3c32c9b9-be77-41c8-97f7-371bd6f8fa16@lunn.ch>
 <DM8PR11MB5751B40B4FB8C1DA200D05FEC1C72@DM8PR11MB5751.namprd11.prod.outlook.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Tham,
 Mun Yew" <mun.yew.tham@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "Ang,
 Tien Sung" <tien.sung.ang@intel.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, "G Thomas, Rohan" <rohan.g.thomas@intel.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
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

On Tue, 11 Jun 2024, Ng, Boon Khai wrote:

> > > it does have stmmac_est.c and stmmac_ptp.c to that support for both
> > > dwmac4 and dwxgmac2, with that I think it is suitable for introducing
> > > another file called stmmac_vlan?
> > 
> > Yes, stmmac_vlan.c is O.K.
> 
> Thanks Andrew, I'll make an effort to consolidate the code into the
> stmmac_vlan.c, wonder the next submission I should go into net or 
> net next?

By default, everything goes to -next (in any subsystem). Only fixes and a 
few other exceptions this is not go through the non-next trees.

-- 
 i.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
