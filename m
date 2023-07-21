Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDA775C476
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Jul 2023 12:17:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A14FAC6B442;
	Fri, 21 Jul 2023 10:17:45 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 92A23C65E70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jul 2023 10:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689934664; x=1721470664;
 h=date:from:cc:subject:message-id:references:mime-version:
 in-reply-to; bh=C6wVBmCZeZFNIMXqGKN2Zjs/KW8YVqteA5G+zqzpIaw=;
 b=i+l/jeDN2lQ+Y6g+rP9I6eUB5XCBjftw8gdHmJOI7M7+MMeFyz8JBbRp
 xVpKpU/64etNPx81yCtee95gEzWnqP8ip+Mnm7JT4+04IiDNCmWEK3YSk
 Ki65F7bT/oOvejNKecpFV4u/jI5mipDo34UFv5p8HxPXjCxIYncDrAgSn
 ob8DnwT5dKrYn3YmjDlcTBTzpEDpUpFArdcq0JYxcMvNL9k+T6A073HZ4
 Kplb/3897DRB27j6A/4AcpUQaaoUXycyfRS++juCi6Bzw2E+/X7GcayUT
 IlF31lbXsnRGBuWAhRLBZMzuse57d+zB9C9RK0NZI04HM3xN7NwYXC1DQ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="433219666"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="433219666"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 03:17:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="848786020"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="848786020"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga004.jf.intel.com with ESMTP; 21 Jul 2023 03:17:38 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@intel.com>) id 1qMnCZ-00HFw5-2w;
 Fri, 21 Jul 2023 13:17:35 +0300
Date: Fri, 21 Jul 2023 13:17:35 +0300
From: Shevchenko Andriy <andriy.shevchenko@intel.com>
Message-ID: <ZLpbPxy4XHEGyU6I@smile.fi.intel.com>
References: <20230721062617.9810-1-boon.khai.ng@intel.com>
 <20230721062617.9810-2-boon.khai.ng@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230721062617.9810-2-boon.khai.ng@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: linux-kernel@vger.kernel.org, Boon Khai Ng <boon.khai.ng@intel.com>,
 Mun Yew Tham <mun.yew.tham@intel.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Leong Ching Swee <leong.ching.swee@intel.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 G Thomas Rohan <rohan.g.thomas@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [Enable Designware XGMAC VLAN Stripping Feature
 1/2] dt-bindings: net: snps, dwmac: Add description for rx-vlan-offload
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

On Fri, Jul 21, 2023 at 02:26:16PM +0800, Boon@ecsmtp.png.intel.com wrote:
> From: Boon Khai Ng <boon.khai.ng@intel.com>
> 
> This patch is to add the dts setting for the MAC controller on
> synopsys 10G Ethernet MAC which allow the 10G MAC to turn on
> hardware accelerated VLAN stripping. Once the hardware accelerated
> VLAN stripping is turn on, the VLAN tag will be stripped by the
> 10G Ethernet MAC.

...

> Reviewed-by: Shevchenko Andriy <andriy.shevchenko@linux.intel.com>

This is wrong:
- I never reviewed DT bindings in all your series.
- My name for the patches is also wrong.

P.S. What I mentioned in the internal mail is that you can add my tag to
    the code, and not to the DT. Sorry, I probably hadn't been clear.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
