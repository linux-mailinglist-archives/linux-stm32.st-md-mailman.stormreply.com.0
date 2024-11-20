Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED959D38AC
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Nov 2024 11:48:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D3C8C78F87;
	Wed, 20 Nov 2024 10:48:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46E3DC78F67
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Nov 2024 10:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732099705; x=1763635705;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DdnwLC1nlOOJXfXe14SuzanZGrbtUU6kyE6ng30glmk=;
 b=XTEKrmcFbOhuVLGEV8QKj8g6IpZUaz8FZjTfFYi74ON2qVmiwqQ2jZvH
 C62x2dfbJMe6f7uUPvHdNkMC9+ycUyOJ6PtjLIpZrF9q09ISXxy6Im/ry
 ALFWfEDR7bKKvdEyjAqhhdsTCOJzHR3ghexN0eo1J5FqJy3R9oBHPgZu1
 lFHhRwMz6/5B2xznZuv72ob/GWE26ZsrLyYc9rTH2WpQfsRx/wZmUn6ci
 IBrL/6lrmJGVrcECkyfzsPLepgr30XAD1092xo5dFkz4X0mfFZyns7hAP
 +EmvLM6Mb4/tuv9sakJQF56MxQs6p7P6SxQMGziM/0DEQZxMiD1DIn0EI g==;
X-CSE-ConnectionGUID: Zu1uUNz6SSmxIl3VcdwmSA==
X-CSE-MsgGUID: +/McGuUXRL2BhIjc8WQVWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="31521009"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208";a="31521009"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 02:48:17 -0800
X-CSE-ConnectionGUID: W48YHOZpTiGL35DWyTxvhg==
X-CSE-MsgGUID: BIrFOaQ7Sv+bsw9FnoXbDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208";a="89677797"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.247.82.175])
 ([10.247.82.175])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 02:48:13 -0800
Message-ID: <14202f42-5408-4127-8664-8ad958fb2046@linux.intel.com>
Date: Wed, 20 Nov 2024 18:48:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Oleksij Rempel <o.rempel@pengutronix.de>
References: <20241115111151.183108-1-yong.liang.choong@linux.intel.com>
 <20241115111151.183108-2-yong.liang.choong@linux.intel.com>
 <ZzdOkE0lqpl6wx2d@shell.armlinux.org.uk>
 <c1bb831c-fd88-4b03-bda6-d8f4ec4a1681@linux.intel.com>
 <ZzxerMEiUYUhdDIy@pengutronix.de>
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <ZzxerMEiUYUhdDIy@pengutronix.de>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-kernel@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>
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



On 19/11/2024 5:47 pm, Oleksij Rempel wrote:
>> Sorry for the late reply; I just got back from my sick leave. I wasn't aware
>> that you had already submitted a patch. I thought I should include it in my
>> patch series. However, I think I messed up the "Signed-off" part. Sorry
>> about that.
>>
>> The testing part actually took quite some time to complete, and I was
>> already sick last Friday. I was only able to complete the patch series and
>> resubmit the patch, and I thought we could discuss the test results from the
>> patch series. The issue was initially found with EEE on GPY PHY working
>> together with ptp4l, and it did not meet the expected results. There are
>> many things that need to be tested, as it is not only Marvell PHY that has
>> the issue.
> 
> Hm, the PTP issue with EEE is usually related to PHYs implementing the
> EEE without MAC/LPI support. This PHYs are buffering frames and changing
> the transmission time, so if the time stamp is made by MAC it will have
> different real transmission time. So far i know, Atheros and Realtek
> implement it, even if it is not always officially documented, it can be
> tested.
> 
> Regards,
> Oleksij

Thanks, Oleksij, for the suggestion.
The actual problem we are facing is that the software and hardware 
configuration is not in sync.

With the following patches applied, the issues were fixed:
- 
https://patchwork.kernel.org/project/netdevbpf/patch/E1tBXAF-00341F-EQ@rmk-PC.armlinux.org.uk/
- 
https://patchwork.kernel.org/project/netdevbpf/patch/a5efc274-ce58-49f3-ac8a-5384d9b41695@gmail.com/
- 
https://patchwork.kernel.org/project/netdevbpf/patch/20241120083818.1079456-1-yong.liang.choong@linux.intel.com/
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
