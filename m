Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4086E638E08
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Nov 2022 17:03:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E37CBC65E45;
	Fri, 25 Nov 2022 16:03:36 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE375C640F3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Nov 2022 16:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669392215; x=1700928215;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ogMIFJsSPtXr34UU0OZ654UJ+S1J3B2EduR1CCJaTuc=;
 b=Tr22GoRlqOT8mae/kuhgvb139gEwNDN1CHnRrC9tFqvm5+4JQBHp18SI
 dGDk9U8kedkwemxGq6iS4XAurbSkEDeo5jUQp5rI4/4AGpg/6uMYkUAjX
 PziN1ZL9w8+eWQlABfV8p6hZevGxx2VsRvUjfE7sMbfcKR8OcyFOayqZj
 FiU1CZjlqzSxqJRgKH5+hLugfZgMARkLM28ztkKIEXAWu8gL7zGjorOFW
 7/cnYDvrzQJBnZsmzbIkYc6TdyenHupM8t3E+sComDXD9NKS4TkgmWHPg
 SQlwGri1tYizOYGOQvHeZ8aXMWG5FYsC/3idsR02WSFCYpD4U//vgZ7nl g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="294207282"
X-IronPort-AV: E=Sophos;i="5.96,193,1665471600"; d="scan'208";a="294207282"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2022 08:01:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="784975819"
X-IronPort-AV: E=Sophos;i="5.96,193,1665471600"; d="scan'208";a="784975819"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by fmsmga001.fm.intel.com with ESMTP; 25 Nov 2022 08:01:53 -0800
Received: from newjersey.igk.intel.com (newjersey.igk.intel.com
 [10.102.20.203])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 2APG1pIt005314; Fri, 25 Nov 2022 16:01:51 GMT
From: Alexander Lobakin <alexandr.lobakin@intel.com>
To: "Goh, Wei Sheng" <wei.sheng.goh@intel.com>
Date: Fri, 25 Nov 2022 17:01:35 +0100
Message-Id: <20221125160135.83994-1-alexandr.lobakin@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221123105110.23617-1-wei.sheng.goh@intel.com>
References: <20221123105110.23617-1-wei.sheng.goh@intel.com>
MIME-Version: 1.0
Cc: Alexandre Torgue <alexandre.torgue@st.com>,
 Voon Wei Feng <weifeng.voon@intel.com>, netdev@vger.kernel.org,
 Tan Tee Min <tee.min.tan@intel.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Alexander Lobakin <alexandr.lobakin@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Looi Hong Aun <hong.aun.looi@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Ahmad Tarmizi Noor Azura <noor.azura.ahmad.tarmizi@intel.com>
Subject: Re: [Linux-stm32] [PATCH net v4] net: stmmac: Set MAC's flow
	control register to reflect current settings
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

From: "Goh, Wei Sheng" <wei.sheng.goh@intel.com>
Date: Wed, 23 Nov 2022 18:51:10 +0800

> Currently, pause frame register GMAC_RX_FLOW_CTRL_RFE is not updated
> correctly when 'ethtool -A <IFACE> autoneg off rx off tx off' command
> is issued. This fix ensures the flow control change is reflected directly
> in the GMAC_RX_FLOW_CTRL_RFE register.

Any particular reason why you completely ignored by review comments
to the v3[0]? I'd like to see them fixed or at least replied.

> 
> Fixes: 46f69ded988d ("net: stmmac: Use resolved link config in mac_link_up()")
> Cc: <stable@vger.kernel.org> # 5.10.x
> Signed-off-by: Goh, Wei Sheng <wei.sheng.goh@intel.com>
> Signed-off-by: Noor Azura Ahmad Tarmizi <noor.azura.ahmad.tarmizi@intel.com>
> ---
> V3 -> V4: Fix commit message and incorrect insertions(+) value
> V2 -> V3: Removed value assign for 'flow' in else statement based on review comments
> V1 -> V2: Removed needless condition based on review comments
> 
>  drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c |  2 ++
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 12 ++++++++++--
>  2 files changed, 12 insertions(+), 2 deletions(-)

[...]

> -- 
> 2.17.1

[0] https://lore.kernel.org/netdev/20221123180947.488302-1-alexandr.lobakin@intel.com

Thanks,
Olek
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
