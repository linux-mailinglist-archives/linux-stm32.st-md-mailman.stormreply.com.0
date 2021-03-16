Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F6B33CA6F
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Mar 2021 01:41:45 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6FE9C57B55;
	Tue, 16 Mar 2021 00:41:44 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08A3AC5662E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Mar 2021 00:41:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 13E0B64F5D;
 Tue, 16 Mar 2021 00:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615855301;
 bh=VOYpVt5GwO6xxd7dzoJqdqBQftQfoa6f+tTn+g1OspY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=D3D1NwUuG0CuABzkFTHXcEAW+S7iIYvnc+93RHujNFtyOqGnPORw93SC2PO8r5GxT
 lVPI4D4FhmO4FWooADcYUwTjmCrzDRDqOWo5htEtnoYMQlT7MkeucFC8etgProA2md
 ad9Xj1r3TvDxivfFzmvitvuV4GhlC0Z8kvFTqTtfHIzSNQkcv2+BULqz07q/38v9Ua
 NW6dUIrrsXuzhEIzRFrEJrXJAAsBugvAXWqDDOl9owixrrKRpX/9XtX3MkKksdiGjS
 vP5zxn1qoPU3QgIF9HRB6/dRTBB2emhNh/z9tDH1HDpnoAZCOQ1DR+bEjW4fLAKzPU
 L03jnisdxoGqQ==
Date: Mon, 15 Mar 2021 17:41:40 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: mohammad.athari.ismail@intel.com
Message-ID: <20210315174140.6abb0edf@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20210315221409.3867-2-mohammad.athari.ismail@intel.com>
References: <20210315221409.3867-1-mohammad.athari.ismail@intel.com>
 <20210315221409.3867-2-mohammad.athari.ismail@intel.com>
MIME-Version: 1.0
Cc: Alexandre Torgue <alexandre.torgue@st.com>,
 Voon Weifeng <weifeng.voon@intel.com>, vee.khee.wong@intel.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, "David S .
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/2] net: stmmac: EST interrupts
 handling and error reporting
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

On Tue, 16 Mar 2021 06:14:08 +0800 mohammad.athari.ismail@intel.com
wrote:
> From: Voon Weifeng <weifeng.voon@intel.com>
> 
> Enabled EST related interrupts as below:
> 1) Constant Gate Control Error (CGCE)
> 2) Head-of-Line Blocking due to Scheduling (HLBS)
> 3) Head-of-Line Blocking due to Frame Size (HLBF).
> 4) Base Time Register error (BTRE)
> 5) Switch to S/W owned list Complete (SWLC)
> 
> For HLBS, the user will get the info of all the queues that shows this
> error. For HLBF, the user will get the info of all the queue with the
> latest frame size which causes the error. Frame size 0 indicates no
> error.
> 
> The ISR handling takes place when EST feature is enabled by user.
> 
> Signed-off-by: Voon Weifeng <weifeng.voon@intel.com>
> Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>
> Co-developed-by: Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>
> Signed-off-by: Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>

> +	if (status & HLBS) {
> +		value = readl(ioaddr + MTL_EST_SCH_ERR);
> +		value &= txqcnt_mask;
> +
> +		/* Clear Interrupt */
> +		writel(value, ioaddr + MTL_EST_SCH_ERR);
> +
> +		/* Collecting info to shows all the queues that has HLBS
> +		 * issue. The only way to clear this is to clear the
> +		 * statistic
> +		 */
> +		if (net_ratelimit())
> +			netdev_err(dev, "EST: HLB(sched) Queue %u\n", value);

This is a mask so probably better display it as hex?

> +	}
> +
> +	if (status & HLBF) {
> +		value = readl(ioaddr + MTL_EST_FRM_SZ_ERR);
> +		feqn = value & txqcnt_mask;
> +
> +		value = readl(ioaddr + MTL_EST_FRM_SZ_CAP);
> +		hbfq = (value & SZ_CAP_HBFQ_MASK(txqcnt)) >> SZ_CAP_HBFQ_SHIFT;
> +		hbfs = value & SZ_CAP_HBFS_MASK;
> +
> +		/* Clear Interrupt */
> +		writel(feqn, ioaddr + MTL_EST_FRM_SZ_ERR);
> +
> +		if (net_ratelimit())
> +			netdev_err(dev, "EST: HLB(size) Queue %u Size %u\n",
> +				   hbfq, hbfs);
> +	}
> +
> +	if (status & BTRE) {
> +		btrl = (status & BTRL) >> BTRL_SHIFT;
> +
> +		if (net_ratelimit())
> +			netdev_info(dev, "EST: BTR Error Loop Count %u\n",
> +				    btrl);
> +
> +		writel(BTRE, ioaddr + MTL_EST_STATUS);
> +	}
> +
> +	if (status & SWLC) {
> +		writel(SWLC, ioaddr + MTL_EST_STATUS);
> +		netdev_info(dev, "EST: SWOL has been switched\n");
> +	}
> +
> +	return status;

Caller never checks the return value, it probably should if this driver
supports shared irqs? Otherwise you can make this function void.

> +}
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
