Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B71A2D383
	for <lists+linux-stm32@lfdr.de>; Sat,  8 Feb 2025 04:33:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E82ABC78F64;
	Sat,  8 Feb 2025 03:33:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81735C78039
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  8 Feb 2025 03:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738985638; x=1770521638;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=E4ef/ftjH8Y83ESfkZ/ek4OwMIc3mSgBksj42G9pEyE=;
 b=aTT8XPozpeg9mHEB5DVX5fnHZgVIBzHi3mkdCvT3IsSh3j1SxSk59LBk
 u5IoxOSkdpfYDy/goh0ScwM0EHYQFOBaNDSCU3bHwmaXeX99zYL0P0B0q
 w+wP455YZD30b1rZRBIHp7P7pUXIXLJGJZK/QaGsEkzq+I79fP/NI+O+t
 jP0IuplNutU9/ZDB/os55zr4g1yeP86EXUzxBVghEURs9VmxuyxB5hDyA
 xMb5eszETR0R3F3/0D4jFonI2ULUN5nBmHuBmJ4iM44HN6l0+mPQFAIAg
 eH91tTV+pfCr3X5BDEguPqQE59rGQ0swqQ5JI8eBTOU2hKDRJ5tHXq4df A==;
X-CSE-ConnectionGUID: lF5vMtcnR9GFsuY14NX2+Q==
X-CSE-MsgGUID: lSmWBZprRlOJmPqGw8L4AA==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="39541422"
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; d="scan'208";a="39541422"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 19:33:48 -0800
X-CSE-ConnectionGUID: KfrjFuMpRnayDLYzhLb9nA==
X-CSE-MsgGUID: nahwQkBJSY+cDoGI/mkrIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; d="scan'208";a="111621205"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.247.21.123])
 ([10.247.21.123])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 19:33:41 -0800
Message-ID: <71887246-d30f-4134-8c6d-b379477b2457@linux.intel.com>
Date: Sat, 8 Feb 2025 11:33:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <20250206131859.2960543-1-yong.liang.choong@linux.intel.com>
 <20250206131859.2960543-3-yong.liang.choong@linux.intel.com>
 <Z6TVmdCZeWerAZKP@shell.armlinux.org.uk>
 <564ede5d-9f53-40be-9305-63f63b384e15@linux.intel.com>
 <12e86fbe-9515-4b81-951c-8bf86e2939d6@lunn.ch>
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <12e86fbe-9515-4b81-951c-8bf86e2939d6@lunn.ch>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, David E Box <david.e.box@intel.com>,
 Eric Dumazet <edumazet@google.com>, David E Box <david.e.box@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>, linux-stm32@st-md-mailman.stormreply.com,
 x86@kernel.org, "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Simon Horman <horms@kernel.org>, Richard Cochran <richardcochran@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
 Borislav Petkov <bp@alien8.de>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v7 2/7] net: pcs: xpcs:
 re-initiate clause 37 Auto-negotiation
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



On 7/2/2025 9:32 pm, Andrew Lunn wrote:
>> Good point. I cannot find this scenario in the datasheet. Please allow me
>> some time to test this scenario. I will update you with the results.
> 
> By data sheet, do you mean documentation from Synopsis, or is this an
> internal document? Assuming the hardware engineers have not hacked up
> the Synopsis IP too much, the Synopsis documentation is probably the
> most accurate you have.
> 
>>> What about 1000BASE-X when AN is enabled or disabled and then switching
>>> to SGMII?
>>>
>> According to the datasheet, a soft reset is required.
> 
> Do you know if this is specific to Intels integration of the Synopsis
> IP, or this is part of the core licensed IP?
> 
> We need to understand when we need a quirk because intel did something
> odd, or it is part of the licensed IP and should happen for all
> devices using the IP.
> 
> 	Andrew
> 

Hi Andrew,

Thank you for your questions. Just to clarify, when I mention the 
"datasheet," I am referring to the documentation from "Synopsis - 
DesignWare Cores Ethernet PCS" and not specific to Intel's documentation.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
