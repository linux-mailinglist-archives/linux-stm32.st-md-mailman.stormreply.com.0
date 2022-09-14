Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE10F5B8691
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Sep 2022 12:47:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 643DDC03FCD;
	Wed, 14 Sep 2022 10:47:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4710CC03FC8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Sep 2022 10:47:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D46F15A1;
 Wed, 14 Sep 2022 03:48:03 -0700 (PDT)
Received: from [10.57.18.118] (unknown [10.57.18.118])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C013F3F71A;
 Wed, 14 Sep 2022 03:47:54 -0700 (PDT)
Message-ID: <65db2835-f70a-dcaf-7949-879e10bd9ebc@arm.com>
Date: Wed, 14 Sep 2022 11:47:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-GB
To: Qingfang DENG <dqfext@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Ong Boon Leong <boon.leong.ong@intel.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220914015120.3023123-1-dqfext@gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220914015120.3023123-1-dqfext@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: fix invalid usage of
 irq_set_affinity_hint
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

On 2022-09-14 02:51, Qingfang DENG wrote:
> The cpumask should not be a local variable, since its pointer is saved
> to irq_desc and may be accessed from procfs.
> To fix it, store cpumask to the heap.

FWIW, by the look of it you might be able to use cpumask_of() and not 
store anything at all.

Robin.

> Fixes: 8deec94c6040 ("net: stmmac: set IRQ affinity hint for multi MSI vectors")
> Signed-off-by: Qingfang DENG <dqfext@gmail.com>
> ---
>   drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  2 ++
>   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 15 ++++++++-------
>   2 files changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> index bdbf86cb102a..720e9f2a40d8 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> @@ -77,6 +77,7 @@ struct stmmac_tx_queue {
>   	dma_addr_t dma_tx_phy;
>   	dma_addr_t tx_tail_addr;
>   	u32 mss;
> +	cpumask_t cpu_mask;
>   };
>   
>   struct stmmac_rx_buffer {
> @@ -114,6 +115,7 @@ struct stmmac_rx_queue {
>   		unsigned int len;
>   		unsigned int error;
>   	} state;
> +	cpumask_t cpu_mask;
>   };
>   
>   struct stmmac_channel {
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 8418e795cc21..7b1c1be998e3 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3469,7 +3469,6 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
>   {
>   	struct stmmac_priv *priv = netdev_priv(dev);
>   	enum request_irq_err irq_err;
> -	cpumask_t cpu_mask;
>   	int irq_idx = 0;
>   	char *int_name;
>   	int ret;
> @@ -3580,9 +3579,10 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
>   			irq_idx = i;
>   			goto irq_error;
>   		}
> -		cpumask_clear(&cpu_mask);
> -		cpumask_set_cpu(i % num_online_cpus(), &cpu_mask);
> -		irq_set_affinity_hint(priv->rx_irq[i], &cpu_mask);
> +		cpumask_set_cpu(i % num_online_cpus(),
> +				&priv->dma_conf.rx_queue[i].cpu_mask);
> +		irq_set_affinity_hint(priv->rx_irq[i],
> +				      &priv->dma_conf.rx_queue[i].cpu_mask);
>   	}
>   
>   	/* Request Tx MSI irq */
> @@ -3605,9 +3605,10 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
>   			irq_idx = i;
>   			goto irq_error;
>   		}
> -		cpumask_clear(&cpu_mask);
> -		cpumask_set_cpu(i % num_online_cpus(), &cpu_mask);
> -		irq_set_affinity_hint(priv->tx_irq[i], &cpu_mask);
> +		cpumask_set_cpu(i % num_online_cpus(),
> +				&priv->dma_conf.tx_queue[i].cpu_mask);
> +		irq_set_affinity_hint(priv->tx_irq[i],
> +				      &priv->dma_conf.tx_queue[i].cpu_mask);
>   	}
>   
>   	return 0;
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
