Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4999E53E108
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Jun 2022 08:28:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DEFB1C0D2BC;
	Mon,  6 Jun 2022 06:28:19 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B52C2C03FC8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jun 2022 06:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654496897; x=1686032897;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wdDYJ5XqGQgotDlH0rFCdHOAVHtDqbqcv/4oCjtcY4I=;
 b=I/FmjtDcadEXg4OTD8KxCfpzxMkWNZIL8+WJsUWtQMSBCqIu4n9q2A2v
 F9GmrW4DmO7p2wqR7FotmgPwuArvcDhL5MfvVEVWVCUyzuaktfEU6Askk
 Nq5LnSmqdElRfdKAQmnFiFKcvfw+p6X5n6P3uBN9VI7LwWM32FyQc7Y+N
 p8SpYcCO8jCFVRUG34/7466jLBVvEhc6aZA9j+uKWxT4mCa2G2elha6FJ
 FMeaFkciFkS9hmL1eXNLW2OWHnDbmV6egNCzgArclbFyZuC25sWxjNAOn
 LHLeRntP5ToM1wpg6+EJSzh0pQQ/G/mZ7Lz/ZKhsXegybRuTgX6lIy7Ym w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10369"; a="264435226"
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; d="scan'208";a="264435226"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2022 23:26:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; d="scan'208";a="532005010"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga003.jf.intel.com with ESMTP; 05 Jun 2022 23:26:56 -0700
Received: from linux.intel.com (vwong3-iLBPG3.png.intel.com [10.88.229.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 953F658068A;
 Sun,  5 Jun 2022 23:26:53 -0700 (PDT)
Date: Mon, 6 Jun 2022 14:26:50 +0800
From: Wong Vee Khee <vee.khee.wong@linux.intel.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <20220606062650.GA31937@linux.intel.com>
References: <1ac9b6787b0db83b0095711882c55c77c8ea8da0.1654462241.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1ac9b6787b0db83b0095711882c55c77c8ea8da0.1654462241.git.christophe.jaillet@wanadoo.fr>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] stmmac: intel: Fix an error handling path
 in intel_eth_pci_probe()
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

On Sun, Jun 05, 2022 at 10:50:48PM +0200, Christophe JAILLET wrote:
> When the managed API is used, there is no need to explicitly call
> pci_free_irq_vectors().
> 
> This looks to be a left-over from the commit in the Fixes tag. Only the
> .remove() function had been updated.
> 
> So remove this unused function call and update goto label accordingly.
> 
> Fixes: 8accc467758e ("stmmac: intel: use managed PCI function on probe and resume")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 

LGTM

Reviewed-by: Wong Vee Khee <vee.khee.wong@linux.intel.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
