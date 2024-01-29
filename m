Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FE384065F
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jan 2024 14:12:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47D43C6C841;
	Mon, 29 Jan 2024 13:12:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3A2B9C6C820
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jan 2024 13:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706533932; x=1738069932;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+Ew5LUI3g/pPiKdhhQ2t8V+CzBXr7IlkIiYR6xaMc2Q=;
 b=FoKgNuxXiadScDOvUIei8mUbe13xyXwGthVQOvzulh9ES//yI4GEPN7i
 KdHB05e4QsvoIhOHZ1VbzW2N3zLpBl6ffgME/9fSjmPuuPp+JYPrPhLL6
 hQj87ebFck50oyP51zv7GbTpR8M3YtzviEh4Zr04N1ZUBZ+t55SUcmVAT
 GhUH5NOBEmszJiC0U5V3cseOExklGIk9fGziuaFnR6sFTko/9X2LgkuZI
 NfP/5mNJbt5+/ZoR5zv5zvPVgSFR3n/tagh80NBzsp9/8gp/LYqlkEIGJ
 CacpXxqo3lWAA6J3dX29zVXZxFSFhB346xqHx1txAdPxaf9oob34DIYhW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="10328221"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="10328221"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 05:12:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="878068136"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="878068136"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.247.122.111])
 ([10.247.122.111])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 05:11:56 -0800
Message-ID: <aec1ba8e-b609-4ec1-b6e2-8f850ab45c7f@linux.intel.com>
Date: Mon, 29 Jan 2024 21:11:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>
References: <20230804084527.2082302-1-yong.liang.choong@linux.intel.com>
 <5bd05ba2-fd88-4e5c-baed-9971ff917484@lunn.ch>
 <f9b21a9d-4ae2-1f91-b621-2e27f746f661@linux.intel.com>
 <37fe9352-ec84-47b8-bb49-9441987ca1b9@lunn.ch>
 <ZQxPQ9t8/TKcjlo8@shell.armlinux.org.uk>
 <0098eaf3-717a-4b50-b2a0-4b28b75b0735@lunn.ch>
 <ZQxZVbmdcAN6UI2G@shell.armlinux.org.uk>
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <ZQxZVbmdcAN6UI2G@shell.armlinux.org.uk>
Cc: Voon Wei Feng <weifeng.voon@intel.com>, platform-driver-x86@vger.kernel.org,
 Lai Peter Jun Ann <jun.ann.lai@intel.com>, Eric Dumazet <edumazet@google.com>,
 David E Box <david.e.box@linux.intel.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 Jon Hunter <jonathanh@nvidia.com>, linux-stm32@st-md-mailman.stormreply.com,
 =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 Tan Tee Min <tee.min.tan@linux.intel.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Wong Vee Khee <veekhee@apple.com>, Jose Abreu <joabreu@synopsys.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paolo Abeni <pabeni@redhat.com>,
 Andrey Konovalov <andrey.konovalov@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Jean Delvare <jdelvare@suse.com>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Revanth Kumar Uppala <ruppala@nvidia.com>,
 Jochen Henneberg <jh@henneberg-systemdesign.com>,
 Jakub Kicinski <kuba@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, bpf@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/5] TSN auto negotiation
	between 1G and 2.5G
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



On 21/9/2023 10:55 pm, Russell King (Oracle) wrote:
> On Thu, Sep 21, 2023 at 04:41:20PM +0200, Andrew Lunn wrote:
>> On Thu, Sep 21, 2023 at 03:12:19PM +0100, Russell King (Oracle) wrote:
>>> On Thu, Sep 21, 2023 at 03:21:00PM +0200, Andrew Lunn wrote:
>>>>> Hi Andrew,
>>>>>
>>>>> After conducting a comprehensive study, it seems that implementing
>>>>> out-of-band for all link modes might not be feasible. I may have missed some
>>>>> key aspects during my analysis.
>>>>>
>>>>> Would you be open to sharing a high-level idea of how we could potentially
>>>>> make this feasible? Your insights would be greatly appreciated.
>>>>
>>>> stmmac_mac_link_up() gets passed interface, speed and duplex. That
>>>> tells you what the PHY has negotiated. Is there anything else you need
>>>> to know?
>>>
>>> The problem is... the stmmac driver is utter bollocks - that information
>>> is *not* passed to the BSP. Instead, stmmac parse and store information
>>> such as the PHY interface mode at initialisation time. BSPs also re-
>>> parse and store e.g. the PHY interface mode at initialisation time.
>>> The driver ignores what it gets from phylink.
>>>
>>> The driver is basically utter crap. That's an area I _had_ patches to
>>> clean up. I no longer do. stmmac is crap crap crap and will stay crap
>>> until they become more receptive to patches to fix it, even if the
>>> patches are not 100% to their liking but are in fact correct. Maybe
>>> if I ever decide to touch that driver in the future. Which I doubt
>>> given my recent experience.
>>
>> Hi Russell
>>
>> You pointed out the current proposal will break stuff. Do you see a
>> way forward for this patchset which does not first involve actually
>> cleaning up of this driver?
> 
> As I said in one of my replies, it would really help if the author can
> provide a table showing what is attempting to be achieved here. With
> that, we should be able to work out exactly what is required, what
> needs to change in stmmac, etc.
> 

Thank you, Russell and Andrew for the comments.

What I'm trying to achieve here is to enable interface mode switching 
between 2500basex and SGMII interfaces for Intel platforms.

I did based on the DM7052 SFP module and BCM84881 PHY to make the necessary 
changes in the new version of my patch series.

In the new patch series, the 'allow_switch_interface' flag was introduced, 
based on the 'allow_switch_interface' flag, the interface mode is 
configured to PHY_INTERFACE_MODE_NA within the 'phylink_validate_phy' 
function. This setting allows all ethtool link modes that are supported and 
advertised will be published. Then interface mode switching occurs based on
the selection of different link modes.

During the interface mode switching, the code will go through the 
`phylink_major_config` function and based on the interface mode to select 
PCS and PCS negotiation mode to configure PCS. Then, the MAC driver will 
perform SerDes configuration according to the interface mode.

I did rewrite the description for the new patch series, hoping that it is 
clear to describe the whole intention of the changes.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
