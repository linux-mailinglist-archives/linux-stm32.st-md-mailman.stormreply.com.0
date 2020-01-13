Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A876B139414
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jan 2020 15:58:17 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63270C36B0C;
	Mon, 13 Jan 2020 14:58:17 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D008C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2020 14:54:09 +0000 (UTC)
Received: from cakuba (c-73-93-4-247.hsd1.ca.comcast.net [73.93.4.247])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 72A4C20661;
 Mon, 13 Jan 2020 14:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578927247;
 bh=+tBhl1sLCJP/p0MoLb8K4ZlbC7vCLCmh0VyIotWkp3U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WRIzdv/Dl2lNzNKusUFmrd+8Xdbd63fCKtbgASuIZNtRMvEQOcDutfNEM0lmCBuZu
 lg0LvogSkI8beX9SKvJYbiPjfdMjyGy+9eL7me5jL6j6JdWSWFq4hzI7+rF/q5nlF8
 StJLauWncJk2m+xvT+qcvjseBPj6q6hAooY/qju8=
Date: Mon, 13 Jan 2020 06:54:06 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Message-ID: <20200113065406.54bb324b@cakuba>
In-Reply-To: <d72e539523e063a391391d447ece658524bb8d57.1578920366.git.Jose.Abreu@synopsys.com>
References: <cover.1578920366.git.Jose.Abreu@synopsys.com>
 <d72e539523e063a391391d447ece658524bb8d57.1578920366.git.Jose.Abreu@synopsys.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 13 Jan 2020 14:58:15 +0000
Cc: Joao Pinto <Joao.Pinto@synopsys.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 1/8] net: stmmac: Initial
	support for TBS
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

On Mon, 13 Jan 2020 14:02:36 +0100, Jose Abreu wrote:
> Adds the initial hooks for TBS support. This needs a 32 byte descriptor
> in order for it to work with current HW. Adds all the logic for Enhanced
> Descriptors in main core but no HW related logic for now.
> 
> Signed-off-by: Jose Abreu <Jose.Abreu@synopsys.com>

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> index f98c5eefb382..dceaeb72a414 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> @@ -42,10 +42,13 @@ struct stmmac_tx_info {
>  /* Frequently used values are kept adjacent for cache effect */
>  struct stmmac_tx_queue {
>  	u32 tx_count_frames;
> +	int tbs_avail;
> +	int tbs_en;

These could be bool or a bitfield?

>  	struct timer_list txtimer;
>  	u32 queue_index;
>  	struct stmmac_priv *priv_data;
>  	struct dma_extended_desc *dma_etx ____cacheline_aligned_in_smp;
> +	struct dma_edesc *dma_entx ____cacheline_aligned_in_smp;

Won't this create a cache line-sized hole? Is the structure member
supposed to be aligned or the data its pointing to?

>  	struct dma_desc *dma_tx;
>  	struct sk_buff **tx_skbuff;
>  	struct stmmac_tx_info *tx_skbuff_dma;

> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> index 0531afa9b21e..19190c609282 100644
> --- a/include/linux/stmmac.h
> +++ b/include/linux/stmmac.h
> @@ -139,6 +139,7 @@ struct stmmac_txq_cfg {
>  	u32 low_credit;
>  	bool use_prio;
>  	u32 prio;
> +	int tbs_en;

also bool?

>  };
>  
>  struct plat_stmmacenet_data {
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
