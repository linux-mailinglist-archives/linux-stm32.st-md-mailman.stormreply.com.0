Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3BA800420
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Dec 2023 07:49:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D01AC6B479;
	Fri,  1 Dec 2023 06:49:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA1BEC64110
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Dec 2023 06:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701413359; x=1732949359;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zgA9er2TieuKbZ/sO/TlArv1h+YGFZzAROMCbrfkuck=;
 b=MTFsC0g1DjozCxDEThNoIlNPrB5Gk5xbRGfRHiHkLKzE9YOOh1ynjoTq
 Id405T6ZaZgW6Nc3Dh1640HFuqJuuq3RyaBERG0CfHehjA7ZbPoR8inSp
 oLfRtHvnVjtwvCtKkOOnJaGeWXLc/CBtMlNRQHytaAz4L/2htzWZqtHkO
 fDx1kbuL+nOtEGufohfeZvLI8eDeZegYucGQaoGLGWy81M4LLHJdvIa6s
 t6QzMpjAITi4ph6Jtqx9tTr65NX9qQDaTE/F+4umvZ21SaAzgRfuV/UoN
 uyEWGxBEu4ZLcwZQu7W5TuKut9qGxwALdIcYRKt0YHopt5O3Y8xoWL7y4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="372835333"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; d="scan'208";a="372835333"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 22:49:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="835678296"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; d="scan'208";a="835678296"
Received: from ppgyli0104.png.intel.com ([10.126.160.64])
 by fmsmga008.fm.intel.com with ESMTP; 30 Nov 2023 22:49:12 -0800
From: Rohan G Thomas <rohan.g.thomas@intel.com>
To: fancer.lancer@gmail.com
Date: Fri,  1 Dec 2023 14:49:09 +0800
Message-Id: <20231201064909.28399-1-rohan.g.thomas@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cjgx6e3agc6gpvs75nhkf6wlztk73epmct6tcuooyqvk2nx2o2@vr5buyk637t3>
References: <cjgx6e3agc6gpvs75nhkf6wlztk73epmct6tcuooyqvk2nx2o2@vr5buyk637t3>
MIME-Version: 1.0
Cc: pabeni@redhat.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, rohan.g.thomas@intel.com, andriy.shevchenko@linux.intel.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
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

On Fri, 6 Oct 2023 13:08:33 +0300 Serge Semin wrote:
> Hi Rohan, Jakub
> ...
> Interesting thing. My DW QoS Eth _v5.10a_ HW manual explicitly states that
> it's multiplied by _6_ in nanoseconds (just rechecked). So either there is a
> difference between the minor DW QoS Eth IP-core releases or the older HW-
> manuals have had a typo in the MTL_EST_CONTROL.PTOV field description.
> Synopsys normally describes such changes (whether it was a mistake or a
> functional change) in the IP-core release notes. The release notes document
> is supplied as a separate pdf file. Alas I don't have one.( Even if I had it it
> would have been useless since the change was introduced in the newer QoS
> IP-cores. Rohan, do you happen to have the release notes for DW QoS Eth IP-
> core v5.30 at hands?
> Something like DWC_ether_qos_rc_relnotes.pdf?

Hi Serge,

Sorry for the delay. Sends out another version with the suggested changes.

Managed to get DWC_ether_qos_relnotes.pdf for v5.20a and v5.30a. But I couldn't
find anything related to this. So for refactoring, I'm keeping the logic as in
the upstream code to avoid any regression.

> 
> Also please double check that your DW QoS Eth v5.30a for sure states that
> MTL_EST_CONTROL.PTOV contains value multiplied by _6_. So we wouldn't
> be wasting time trying to workaround a more complex problem than we
> already have.

Yes, I checked this again. For DW QoS Eth v5.30a the multiplier for 
MTL_EST_CONTROL.PTOV is _9_ as per the databook.

Also noticed a similar difference for MTL_EST_Status.BTRL field length. As per
the upstream code and DW QoS Eth v5.10a databook this field covers bit 8 to bit
11. But for the xgmac IP and DW QoS Eth v5.30a databook this field covers bit 8
to bit 15. Again nothing mentioned in the release notes. Here also I'm keeping
the logic as in the upstream code to avoid any regression.

> 
> -Serge(y)
> 

Best Regards,
Rohan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
