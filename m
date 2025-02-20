Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE70A3CF30
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Feb 2025 03:12:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D213C78F9F;
	Thu, 20 Feb 2025 02:12:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE1E0C78F65
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Feb 2025 02:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740017547; x=1771553547;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4GOWM9o6duBwNSk0MN9yfWLhHhK9OLJQXgL3slB8rzo=;
 b=IB8El/bW5HU2s+us/yXJ9LeYZHW6auJvUPJcrcK+74tQSWhQmHGxPNGO
 sWWfeJXR5r9USnbdHo82wyuvuyiNl+Eewrav/sOzY6HNRpryaFjVkgwlI
 AoHQwmEHEMg1mzGHxqor4OvdLICZFqbhKEaF/v2QwN6sbQUjNbOzxo3F2
 m8vFrr/VxqO22gBjgEmVgbcDcQwf461u9NT20XiHdkVMeXjMryqiV6y/G
 PFyqd/pRm1WmONQg0pzBAPpi9EPoQdXah/yBPUtvJedGgc34Pf6h07gGa
 ZQfns17wSGsfVDZv3YKS7zyFu823lomtk9/m2FyIT/Z530N+c7Wapqk+Y w==;
X-CSE-ConnectionGUID: JYwjLifKTyu2GM7r5oy3lw==
X-CSE-MsgGUID: EbMaTuPoQ/aqMY89py3Dhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="44554542"
X-IronPort-AV: E=Sophos;i="6.13,300,1732608000"; d="scan'208";a="44554542"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 18:12:24 -0800
X-CSE-ConnectionGUID: YqxEkxR6RByijTI3qHobrg==
X-CSE-MsgGUID: cCeY1AXzS7ODnxJwAyxXZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,300,1732608000"; d="scan'208";a="114738857"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.247.53.67])
 ([10.247.53.67])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 18:12:17 -0800
Message-ID: <be0689a5-2202-4231-9e97-49e9576236a2@linux.intel.com>
Date: Thu, 20 Feb 2025 10:12:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <20250206131859.2960543-1-yong.liang.choong@linux.intel.com>
 <20250206131859.2960543-3-yong.liang.choong@linux.intel.com>
 <Z6TVmdCZeWerAZKP@shell.armlinux.org.uk>
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <Z6TVmdCZeWerAZKP@shell.armlinux.org.uk>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, David E Box <david.e.box@intel.com>,
 Eric Dumazet <edumazet@google.com>, David E Box <david.e.box@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>, linux-stm32@st-md-mailman.stormreply.com,
 x86@kernel.org, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Mengyuan Lou <mengyuanlou@net-swift.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>, Simon Horman <horms@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
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



On 6/2/2025 11:30 pm, Russell King (Oracle) wrote:
> Also, if the reset is required, what happens if we're already using
> SGMII, but AN has been disabled temporarily and is then re-enabled?
> Is a reset required?
> 

Hi Russell,

When we use SGMII with XPCS, the AN is disabled and then re-enabled. This 
process does not involve any PCS configuration, so a reset is not required.

I tested it with stmmac (dwmac5) + xpcs + Marvell (88E1510) PHY, and it 
works fine when AN is temporarily disabled and then re-enabled without a reset.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
