Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB92153208
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Feb 2020 14:39:34 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E08FFC36B0B;
	Wed,  5 Feb 2020 13:39:33 +0000 (UTC)
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44439C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Feb 2020 13:39:30 +0000 (UTC)
Received: from localhost (unknown [IPv6:2001:982:756:1:57a7:3bfd:5e85:defb])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id EE241158E83BF;
 Wed,  5 Feb 2020 05:39:25 -0800 (PST)
Date: Wed, 05 Feb 2020 14:39:24 +0100 (CET)
Message-Id: <20200205.143924.1875004608052019375.davem@davemloft.net>
To: boon.leong.ong@intel.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200205085510.32353-2-boon.leong.ong@intel.com>
References: <20200205085510.32353-1-boon.leong.ong@intel.com>
 <20200205085510.32353-2-boon.leong.ong@intel.com>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Wed, 05 Feb 2020 05:39:28 -0800 (PST)
Cc: Jose.Abreu@synopsys.com, Joao.Pinto@synopsys.com, weifeng.voon@intel.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, arnd@arndb.de,
 mcoquelin.stm32@gmail.com, tee.min.tan@intel.com, peppe.cavallaro@st.com,
 alexandru.ardelean@analog.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v4 1/6] net: stmmac: Fix incorrect
 location to set real_num_rx|tx_queues
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

From: Ong Boon Leong <boon.leong.ong@intel.com>
Date: Wed,  5 Feb 2020 16:55:05 +0800

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 5836b21edd7e..4d9afa13eeb9 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -2657,6 +2657,10 @@ static int stmmac_hw_setup(struct net_device *dev, bool init_ptp)
>  		stmmac_enable_tbs(priv, priv->ioaddr, enable, chan);
>  	}
>  
> +	/* Configure real RX and TX queues */
> +	netif_set_real_num_rx_queues(dev, priv->plat->rx_queues_to_use);
> +	netif_set_real_num_tx_queues(dev, priv->plat->tx_queues_to_use);
> +
>  	/* Start the ball rolling... */
>  	stmmac_start_all_dma(priv);
>  

It is only safe to ignore the return values from
netif_set_real_num_{rx,tx}_queues() if you call them before the
network device is registered.  Because only in that case are these
functions guaranteed to succeed.

But now that you have moved these calls here, they can fail.

Therefore you must check the return value and unwind the state
completely upon failures.

Honestly, I think this change will have several undesirable side effects:

1) Lots of added new code complexity

2) A new failure mode when resuming the device, users will find this
   very hard to diagnose and recover from

What real value do you get from doing these calls after probe?

If you can't come up with a suitable answer to that question, you
should reconsider this change.

Thanks.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
