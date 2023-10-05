Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDF07B9CEA
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Oct 2023 14:15:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E90F5C6C835;
	Thu,  5 Oct 2023 12:15:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F2C4C6C831
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Oct 2023 12:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696508106; x=1728044106;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WT2vF2g6ySQ88OnBsaROozLS1/K+Uk2umLsgnTugo4g=;
 b=Js6iO0PkBrXwg5+dDPfQ98niGUsyaJioNikn+TSqaoKnmQq0ShJwM322
 8ACk1h1hFz45pEtM6+g3qwfF2Dy7aPej0e3M8Q3RAjvvxiTtEgfvvIxGT
 5IYQTXXZ3zRI6nUy9KISaEbcT8EVJpP0n8lZb8Kjn9DfVFySxi2BjTXKD
 mXvEQrdMRCNKOSFQt9nyWqhOxEoOaOPILgepCOBU8+y1OsH4NZXyk4zbR
 YjpqrJO6M2U+QgPhpvlGrjh4qmHb5cz1UdCuxRq/EXaXjxQULLdzBFuBr
 6IsNd26f+e/LB14mLzXA3fyA6V+woCegfxZxqUB9746zXZGUwfqgLos0U w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="414443736"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="414443736"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 05:15:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="728425237"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="728425237"
Received: from ppglcf2090.png.intel.com ([10.126.160.96])
 by orsmga006.jf.intel.com with ESMTP; 05 Oct 2023 05:14:59 -0700
From: Rohan G Thomas <rohan.g.thomas@intel.com>
To: kuba@kernel.org
Date: Thu,  5 Oct 2023 20:14:41 +0800
Message-Id: <20231005121441.22916-1-rohan.g.thomas@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20231004092613.07cb393f@kernel.org>
References: <20231004092613.07cb393f@kernel.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, fancer.lancer@gmail.com,
 linux-kernel@vger.kernel.org, edumazet@google.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, rohan.g.thomas@intel.com,
 andriy.shevchenko@linux.intel.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/1] net: stmmac: xgmac: EST
	interrupts handling
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

On Wed, 4 Oct 2023 09:26:13 -0700 Jakub Kicinski wrote:
> On Tue, 3 Oct 2023 14:12:15 +0300 Serge Semin wrote:
> > If I didn't miss some details after that we'll have a common EST
> > module utilized for both DW QoS Eth and DW XGMAC IP-cores.
> 
> So the question now is whether we want Rohan to do this conversion _first_,
> in DW QoS 5, and then add xgmac part. Or the patch should go in as is and
> you'll follow up with the conversion?

Hi Jakub, Serge,

If agreed, this commit can go in. I can submit another patch with the
refactoring suggested by Serge.

Again, thanks Serge for the prompt response. Regarding the below point in your
earlier response,

> > 2. PTP time offset setup performed by means of the
> > MTL_EST_CONTROL.PTOV field. DW QoS Eth v5.x HW manual claims it's "The
> > value of PTP Clock period multiplied by 6 in nanoseconds." So either Jose got
> > mistaken by using _9_ for DW XGMAC v3.x or the DW XGMAC indeed is
> > different in that aspect.

This is a little confusing...
I referred databooks for DW QoS Eth v5.30a and DW XGMAC v3.10a. In both this is
mentioned as "The value of PTP Clock period multiplied by 9 in nanoseconds".

Best Regards,
Rohan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
