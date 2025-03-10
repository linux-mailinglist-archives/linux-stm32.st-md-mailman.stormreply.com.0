Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 071C3A58A5E
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Mar 2025 03:17:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95238C78F85;
	Mon, 10 Mar 2025 02:17:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0367DC78F75
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Mar 2025 02:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741573056; x=1773109056;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=cvz/Me2nH/t84KohtCMiEZKpQSLJ47u4h7hNNkCqYI0=;
 b=Q7GZnqWqYYOvMu6ZIaIFrl7FGVqd0XoraUx42J3uz+Mj7xUBmGbebnjV
 43yCMiesi/nvfilU31wIXX8TKCNJMpUmbXJZpuIVndWH+G9oTEEXjPPdQ
 jrMWLlI51P6EVWW6j6OE1fkS2KlK93dU/qG0R6X2ch/sLCQim5TOaSlzq
 xJHNcpEv5YeyEYZv+Xxx07zuIYeu/Nein/CjtyUGc71MgygWELNaxFJjo
 hKYZKpLjsotxRd1f+eNhOyozcfKftAES8GaiiJ1VD3DpySgc04UBRo1Jf
 Q5hqcl4TDsS7hxDxyQOgT3spoZvzPanLJf+bZmu+RGxgYkLSnqSSVoqJH Q==;
X-CSE-ConnectionGUID: loxJhqEHT3+0mrdslQW44g==
X-CSE-MsgGUID: 2BJ7FNcbQbqCiV1qAQ+/1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="52763931"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; d="scan'208";a="52763931"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2025 19:17:34 -0700
X-CSE-ConnectionGUID: H0j5eek0SheUYkhhk/umzg==
X-CSE-MsgGUID: lADrhadKRkK2+QNbJcgOvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; d="scan'208";a="119702595"
Received: from kmania1x-mobl.gar.corp.intel.com (HELO [10.107.17.30])
 ([10.107.17.30])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2025 19:15:46 -0700
Message-ID: <2f1f4a5f-712e-45c4-ae9f-57105f92f14a@linux.intel.com>
Date: Mon, 10 Mar 2025 10:15:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dan Carpenter <dan.carpenter@linaro.org>
References: <677ffce5-0d76-4b97-abd3-1ac7608417f3@stanley.mountain>
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <677ffce5-0d76-4b97-abd3-1ac7608417f3@stanley.mountain>
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [bug report] net: stmmac: configure SerDes
 according to the interface mode
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



On 8/3/2025 7:17 pm, Dan Carpenter wrote:
> Hello Choong Yong Liang,
> 
> Commit a42f6b3f1cc1 ("net: stmmac: configure SerDes according to the
> interface mode") from Feb 27, 2025 (linux-next), leads to the
> following Smatch static checker warning:
> 
> 	drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c:497 intel_tsn_lane_is_available()
> 	warn: missing error code? 'ret'
> 
> drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
>      472 static int intel_tsn_lane_is_available(struct net_device *ndev,
>      473                                        struct intel_priv_data *intel_priv)
>      474 {
>      475         struct stmmac_priv *priv = netdev_priv(ndev);
>      476         struct pmc_ipc_cmd tmp = {};
>      477         struct pmc_ipc_rbuf rbuf = {};
>      478         int ret = 0, i, j;
> 
> Better to avoid initializing ret so that bug show up as uninitialized
> variables.
> 
>      479         const int max_fia_regs = 5;
>      480
>      481         tmp.cmd = IPC_SOC_REGISTER_ACCESS;
>      482         tmp.sub_cmd = IPC_SOC_SUB_CMD_READ;
>      483
>      484         for (i = 0; i < max_fia_regs; i++) {
>      485                 tmp.wbuf[0] = R_PCH_FIA_15_PCR_LOS1_REG_BASE + i;
>      486
>      487                 ret = intel_pmc_ipc(&tmp, &rbuf);
>      488                 if (ret < 0) {
>      489                         netdev_info(priv->dev, "Failed to read from PMC.\n");
>      490                         return ret;
>      491                 }
>      492
>      493                 for (j = 0; j <= intel_priv->max_tsn_lane_regs; j++)
>      494                         if ((rbuf.buf[0] >>
>      495                                 (4 * (intel_priv->tsn_lane_regs[j] % 8)) &
>      496                                         B_PCH_FIA_PCR_L0O) == 0xB)
> --> 497                                 return ret;
> 
> This should probably be return -EINVAL, right?
> 
>      498         }
>      499
>      500         return ret;
> 
> It's more clear to just return 0 for the success path.  Otherwise you
> have to read the code a bit.
> 
>      501 }
> 
> regards,
> dan carpenter

Hello Dan,

Thank you for bringing this to my attention.

The code at line 497 should return 0 to indicate success when the condition 
is met. Additionally, I will modify line 500 to return -EINVAL to clearly 
signify an error when no valid lane is found.

I will prepare and submit a patch to implement these changes. If you have 
any further feedback or suggestions, please feel free to let me know.

Thanks again for your valuable input.

Best regards,
Yong Liang
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
