Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2AB9D2222
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Nov 2024 10:06:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 022E8C78F6D;
	Tue, 19 Nov 2024 09:06:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CED71C6DD94
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Nov 2024 09:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732007208; x=1763543208;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=HtjEr6MyQAiTzXqILd1meE2GmGtMVF3rg86A6w3dlq4=;
 b=d18uCJkADfMIYAaANLoTqH+Ke8DUmgkowJJqENVgDRf24b/tEf1TD+FD
 cfCme7HdzY4vVv3J9IO8JtrBGl7mGtqgPCZ+EiLCL0vluORnbK6Pu3w03
 EzvjBG7yHM1J4SJm8eAs4BkKAo7Km+W7MYbA7fSAAjCN5PwZqa+LLKSUL
 /25QfWcEWFdblWucTIfbar4zqbk+V3saao/JAZGjYi/anR9GYlOblJ0vU
 MFIuVpgIwsPTFUStWVgjLDVvRPb6C5GEcjMSsjeWoNuDzaDXrsbrYlyfW
 eRylGOcRscfKfS5e86Q3GSv+XInEncsMhEw+/QA+wmp/vxymvZmpRWo7s A==;
X-CSE-ConnectionGUID: l3h09zZXQpyswNtejxPYsg==
X-CSE-MsgGUID: yBAjC1kbQEObxXQ1nHgJBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="19605055"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="19605055"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 01:06:39 -0800
X-CSE-ConnectionGUID: zsvHZ+PwTi68k0a9K6UDpA==
X-CSE-MsgGUID: 4tKkEW0eSyiBbNpB7+8d9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89905283"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.247.75.104])
 ([10.247.75.104])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 01:06:36 -0800
Message-ID: <c1bb831c-fd88-4b03-bda6-d8f4ec4a1681@linux.intel.com>
Date: Tue, 19 Nov 2024 17:06:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <20241115111151.183108-1-yong.liang.choong@linux.intel.com>
 <20241115111151.183108-2-yong.liang.choong@linux.intel.com>
 <ZzdOkE0lqpl6wx2d@shell.armlinux.org.uk>
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <ZzdOkE0lqpl6wx2d@shell.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Oleksij Rempel <o.rempel@pengutronix.de>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net v2 1/2] net: phy: replace
 phydev->eee_enabled with eee_cfg.eee_enabled
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



On 15/11/2024 9:37 pm, Russell King (Oracle) wrote:
> On Fri, Nov 15, 2024 at 07:11:50PM +0800, Choong Yong Liang wrote:
>> Not all PHYs have EEE enabled by default. For example, Marvell PHYs are
>> designed to have EEE hardware disabled during the initial state.
>>
>> In the initial stage, phy_probe() sets phydev->eee_enabled to be disabled.
>> Then, the MAC calls phy_support_eee() to set eee_cfg.eee_enabled to be
>> enabled. However, when phy_start_aneg() is called,
>> genphy_c45_an_config_eee_aneg() still refers to phydev->eee_enabled.
>> This causes the 'ethtool --show-eee' command to show that EEE is enabled,
>> but in actuality, the driver side is disabled.
>>
>> This patch will remove phydev->eee_enabled and replace it with
>> eee_cfg.eee_enabled. When performing genphy_c45_an_config_eee_aneg(),
>> it will follow the master configuration to have software and hardware
>> in sync.
> 
> Hmm. I'm not happy with how you're handling my patch. I would've liked
> some feedback on it (thanks for spotting that the set_eee case needed
> to pass the state to genphy_c45_an_config_eee_aneg()).
> 
> However, what's worse is, that the bulk of this patch is my work, yet
> you've effectively claimed complete authorship of it in the way you
> are submitting this patch. Moreover, you are violating the kernel
> submission rules, as the Signed-off-by does not include one for me
> (which I need to explicitly give.) I was waiting for the results of
> your testing before finalising the patch.
> 
> The patch needs to be authored by me, the first sign-off needs to be
> me, then optionally Co-developed-by for you, and then your sign-off.
> 
> See Documentation/process/submitting-patches.rst
> 
> Thanks.
> 
> pw-bot: cr
> 

Sorry for the late reply; I just got back from my sick leave. I wasn't 
aware that you had already submitted a patch. I thought I should include it 
in my patch series. However, I think I messed up the "Signed-off" part. 
Sorry about that.

The testing part actually took quite some time to complete, and I was 
already sick last Friday. I was only able to complete the patch series and 
resubmit the patch, and I thought we could discuss the test results from 
the patch series. The issue was initially found with EEE on GPY PHY working 
together with ptp4l, and it did not meet the expected results. There are 
many things that need to be tested, as it is not only Marvell PHY that has 
the issue.

With your patch, most of the issues were resolved based on the testing. 
However, the set_eee was using the old value of eee_enabled and was not 
able to turn EEE on or off. I think Heiner's patch already solved that part.

With all the solutions provided, I think the only patch left that I need to 
submit is the one calling 'phy_support_eee()' from stmmac.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
