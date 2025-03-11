Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FB4A5B891
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Mar 2025 06:33:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4ACE9C78F97;
	Tue, 11 Mar 2025 05:33:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2BD4C78F6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Mar 2025 05:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741671230; x=1773207230;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DLYuGmG8iFWf5LcT050MwmMyWf6njd/yrSqW870b0NQ=;
 b=d6si9sJbrmqCA9rMrP/odcYtu/3OvQMAI+z6I5odCWYP+Xw/Y3EMIuJn
 1nE1tC8qJJ53FYvME+QAORr0SZGtdlQ0KJKrsyBW7GzIstzC5a3MhuCpC
 lt23VwGRPMl1lhX4pjFjJa24f3EejGuZzLwR6aolJl8mUlTcRW3TQsLzi
 U/MCkR4t1iiNlMVIt63GVA2B2jSiL2npbzh/r+Qp69iAOxGBQLmLr+xPD
 ap2NP8YppMUud5Re9+Km9URIP1iViCfcfShloIkREuKbinMa/dxlTuNUb
 H2MtehwHSwAc5yorcsawPT0C10D/MtTo1arIiLxKgAGg/UdddC94+dF4Y A==;
X-CSE-ConnectionGUID: UFXINwpPQSOrKxMY9/D59A==
X-CSE-MsgGUID: rsmkxYLTTu2tXM2NCniSEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42602725"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="42602725"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 22:33:47 -0700
X-CSE-ConnectionGUID: CWULG/1UQUuYYhAiVQ7Zew==
X-CSE-MsgGUID: nO6dDApWTfWOLHIaR7SBuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="143395086"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.247.21.123])
 ([10.247.21.123])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 22:33:44 -0700
Message-ID: <3bc2cc11-3a87-479e-a0e0-c593e3214540@linux.intel.com>
Date: Tue, 11 Mar 2025 13:33:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kory Maincent <kory.maincent@bootlin.com>
References: <20250310050835.808870-1-yong.liang.choong@linux.intel.com>
 <20250310152014.1d593255@kmaincent-XPS-13-7390>
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <20250310152014.1d593255@kmaincent-XPS-13-7390>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [Linux-stm32] [PATCH net-next v1 1/1] stmmac: intel: Fix
 warning message for return value in intel_tsn_lane_is_available()
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



On 10/3/2025 10:20 pm, Kory Maincent wrote:
> On Mon, 10 Mar 2025 13:08:35 +0800
> Choong Yong Liang <yong.liang.choong@linux.intel.com> wrote:
> 
>> Fix the warning "warn: missing error code? 'ret'" in the
>> intel_tsn_lane_is_available() function.
>>
>> The function now returns 0 to indicate that a TSN lane was found and
>> returns -EINVAL when it is not found.
>>
>> Fixes: a42f6b3f1cc1 ("net: stmmac: configure SerDes according to the
>> interface mode")
>> Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
> 
> This patch is a fix it should go net instead net-next.
> Could you resend the patch with net prefix?
> 
> Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
> 
> Thank you!

Hi Kory,

Thank you for your feedback. I understand that the patch is a fix. However, 
since the code is not yet in the 'net' tree, we are unable to apply the fix 
there.

I'm not sure if there is another way to handle this fix other than sending 
it to the 'net-next' tree. I would appreciate any guidance you might have 
on this matter.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
