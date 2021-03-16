Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C61933E080
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Mar 2021 22:29:46 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19C58C57B79;
	Tue, 16 Mar 2021 21:29:46 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70084C57B77
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Mar 2021 21:29:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1E20E64F90;
 Tue, 16 Mar 2021 21:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615930182;
 bh=6RWKiVSp1/qWdoI29E3FxmJ1FLp/tfgmDY/WQwvvLS4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BV+6JSsh0pUiBBkUaq94EITX1815VL2FAcI0CYxmiHLEw7StGKU3R73tbHiCfCZBb
 9a0o3/wOcxnLw+hQv6yqpigxO6LDDXhU79NzC83ZBP+wGC5DRu/HJQYbNsjul2EhCf
 TMsSblZyWUVHllmCBGdfn0JDAj8wJbmcTU9UDTxpoim5AZRyIbY1q6phTvJfDy+4fq
 wfS7M9cro5LCPzKD37lTKVsS//BvQ46M1ojS2o32Cu841A90nUK3dPfc5U2iTOnHjl
 PanDksj4OzL4uyHbKRIzA9Lz579a5hrUZetG8scu2/JaOVEQ0diEZ7pMpttXJ/MvPq
 pX+1BrXqsahwA==
Date: Tue, 16 Mar 2021 14:29:41 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Voon Weifeng <weifeng.voon@intel.com>
Message-ID: <20210316142941.3ea1e24d@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20210316121823.18659-4-weifeng.voon@intel.com>
References: <20210316121823.18659-1-weifeng.voon@intel.com>
 <20210316121823.18659-4-weifeng.voon@intel.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Torgue <alexandre.torgue@st.com>,
 Wong Vee Khee <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RESEND v1 net-next 3/5] net: stmmac: introduce
 MSI Interrupt routines for mac, safety, RX & TX
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

On Tue, 16 Mar 2021 20:18:21 +0800 Voon Weifeng wrote:
> From: Ong Boon Leong <boon.leong.ong@intel.com>
> 
> Now we introduce MSI interrupt service routines and hook these routines
> up if stmmac_open() sees valid irq line being requested:-
> 
> stmmac_mac_interrupt()    :- MAC (dev->irq), WOL (wol_irq), LPI (lpi_irq)
> stmmac_safety_interrupt() :- Safety Feat Correctible Error (sfty_ce_irq)
>                              & Uncorrectible Error (sfty_ue_irq)
> stmmac_msi_intr_rx()      :- For all RX MSI irq (rx_irq)
> stmmac_msi_intr_tx()      :- For all TX MSI irq (tx_irq)

Do you split RX and TX irqs out on purpose? Most commonly one queue
pair maps to one CPU, so using single IRQ for Rx and Tx results in
fewer IRQs being triggered and better system performance.

> Each of IRQs will have its unique name so that we can differentiate
> them easily under /proc/interrupts.
> 
> Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>
> Signed-off-by: Voon Weifeng <weifeng.voon@intel.com>

> +static int stmmac_request_irq(struct net_device *dev)

This function is a one huge if statement, please factor out both sides
into separate subfunctions.

> +	netdev_info(priv->dev, "PASS: requesting IRQs\n");

Does the user really need to know interrupts were requested on every
probe?

> +	return ret;

return 0; ?

> +irq_error:
> +	stmmac_free_irq(dev, irq_err, irq_idx);
> +	return ret;
> +}
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
