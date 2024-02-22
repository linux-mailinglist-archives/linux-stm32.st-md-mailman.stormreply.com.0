Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3EF85FA4E
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Feb 2024 14:52:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DFAE4C6B47A;
	Thu, 22 Feb 2024 13:52:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9FABC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Feb 2024 13:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708609952; x=1740145952;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=okDN9skIyTEGp8a+Kir+3FckEcXNTLEnbwIFZOEO+K0=;
 b=bIFd9/Fh3IGmdXEjCiQtAJhaqB7IA3loIJzOZBROn9EWcYI7tbvHrnNb
 t8b0ibSZVd95qUVOEKdi6mLGs+kuOETRa0w0DFmtkNxQXuvVb+dZJQKbh
 Nl0RPPnyRIy9wN2NVsQjyOMuIfwf51UMXCIbT2/0/hsorYUxvseUIZbma
 bNs0tK7N0HTEHknuIpn0YOvVOMisS545nV2fNrKn1/JiU6dFCWzPQDb33
 Ewlskzhi1sZU0pmKeyo4spYxhOhu2fwFGDIIHJ5UshgkIB2MEQFKZZMmw
 010VblRprUi3KNZrW7zjEvAv+Q0Zdwsd/mc0TEK/Bo9Fupy0uac/qcFUI Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="13534161"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; d="scan'208";a="13534161"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 05:52:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; d="scan'208";a="36331628"
Received: from pglc0455.png.intel.com ([10.221.89.106])
 by orviesa002.jf.intel.com with ESMTP; 22 Feb 2024 05:52:26 -0800
From: Rohan G Thomas <rohan.g.thomas@intel.com>
To: kurt@linutronix.de
Date: Thu, 22 Feb 2024 21:52:22 +0800
Message-Id: <20240222135222.7332-1-rohan.g.thomas@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240220-stmmac_est-v1-1-c41f9ae2e7b7@linutronix.de>
References: <20240220-stmmac_est-v1-1-c41f9ae2e7b7@linutronix.de>
MIME-Version: 1.0
Cc: pabeni@redhat.com, netdev@vger.kernel.org, bigeasy@linutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 rohan.g.thomas@intel.com, andriy.shevchenko@linux.intel.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net] net: stmmac: Fix EST offset for dwmac 5.10
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

Hi Kurt,

On Tue, Feb 20, 2024 at 09:22:46AM +0100, Kurt Kanzenbach wrote:
> Fix EST offset for dwmac 5.10.
> 
> Currently configuring Qbv doesn't work as expected. The schedule is
> configured, but never confirmed:
> 
> |[  128.250219] imx-dwmac 428a0000.ethernet eth1: configured EST
> 
> The reason seems to be the refactoring of the EST code which set the wrong
> EST offset for the dwmac 5.10. After fixing this it works as before:
> 
> |[  106.359577] imx-dwmac 428a0000.ethernet eth1: configured EST [
> |128.430715] imx-dwmac 428a0000.ethernet eth1: EST: SWOL has been
> |switched
> 
> Tested on imx93.
> 
> Fixes: c3f3b97238f6 ("net: stmmac: Refactor EST implementation")
> Signed-off-by: Kurt Kanzenbach <kurt@linutronix.de>
> ---

Thanks for fixing this. Sorry for the typo.

Best Regards,
Rohan

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
