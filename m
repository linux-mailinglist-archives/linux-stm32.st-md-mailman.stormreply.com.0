Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 337753ED25B
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Aug 2021 12:50:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D41CDC57B7A;
	Mon, 16 Aug 2021 10:50:49 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83A25C5719E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Aug 2021 10:50:46 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10077"; a="215837034"
X-IronPort-AV: E=Sophos;i="5.84,324,1620716400"; d="scan'208";a="215837034"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2021 03:50:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,324,1620716400"; d="scan'208";a="530423882"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga002.fm.intel.com with ESMTP; 16 Aug 2021 03:50:43 -0700
Received: from linux.intel.com (vwong3-iLBPG3.png.intel.com [10.88.229.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 571FE5808DB;
 Mon, 16 Aug 2021 03:50:40 -0700 (PDT)
Date: Mon, 16 Aug 2021 18:50:37 +0800
From: Wong Vee Khee <vee.khee.wong@linux.intel.com>
To: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>
Message-ID: <20210816105037.GA11930@linux.intel.com>
References: <cover.1629092894.git.vijayakannan.ayyathurai@intel.com>
 <b0fd3bf4e5c105e959df60d3c876297721b62ee6.1629092894.git.vijayakannan.ayyathurai@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b0fd3bf4e5c105e959df60d3c876297721b62ee6.1629092894.git.vijayakannan.ayyathurai@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: linux-kernel@vger.kernel.org, weifeng.voon@intel.com,
 vee.khee.wong@intel.com, netdev@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, peppe.cavallaro@st.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1 2/3] net: stmmac: add ethtool
 per-queue statistic framework
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

On Mon, Aug 16, 2021 at 02:15:59PM +0800, Vijayakannan Ayyathurai wrote:
> Adding generic ethtool per-queue statistic framework to display the
> statistics for each rx/tx queue. In future, users can avail it to add
> more per-queue specific counters. Number of rx/tx queues displayed is
> depending on the available rx/tx queues in that particular MAC config
> and this number is limited up to the MTL_MAX_{RX|TX}_QUEUES defined
> in the driver.
> 
> Ethtool per-queue statistic display will look like below, when users
> start adding more counters.
> 
> Example:
>  q0_tx_statA:
>  q0_tx_statB:
>  q0_tx_statC:
>  |
>  q0_tx_statX:
>  .
>  .
>  .
>  qMAX_tx_statA:
>  qMAX_tx_statB:
>  qMAX_tx_statC:
>  |
>  qMAX_tx_statX:
> 
>  q0_rx_statA:
>  q0_rx_statB:
>  q0_rx_statC:
>  |
>  q0_rx_statX:
>  .
>  .
>  .
>  qMAX_rx_statA:
>  qMAX_rx_statB:
>  qMAX_rx_statC:
>  |
>  qMAX_rx_statX:
> 
> In addition, this patch has the support on displaying the number of
> packets received and transmitted per queue.
>

Acked-by: Wong Vee Khee <vee.khee.wong@linux.intel.com>

> Signed-off-by: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>
> ---
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
