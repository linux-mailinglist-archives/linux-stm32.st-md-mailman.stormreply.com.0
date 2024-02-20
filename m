Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD7985B897
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Feb 2024 11:08:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CAFB1C6A61D;
	Tue, 20 Feb 2024 10:08:46 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78D37C69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Feb 2024 10:08:45 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-512b700c8ebso2294618e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Feb 2024 02:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708423725; x=1709028525;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+toL7F0kapuzeBLcfc5DcPeiTKIyw1Qh60DwqayzqDU=;
 b=Cq7FNSPn4WYR1xpnRU/lF6qNdaBYrenEvhDCX/0hODIs58Zz2OAhbCr5/haJJ47zfI
 uT4T3t8QoexCbnKIw9HhqvBxB3XVEFa1EJcs7XVX+hcpHmjkdBlUdG+uyuefovKTTcfK
 Cq2x1jmpCAZxLRUvdBlDif3KCEDmSuKJmtwTsTZ+i+Wr/eL5SOcMPoDOtw5+qTAqo7QD
 nX/MFLCEWcl5MOFAECMpinu7FSMNqg1K72zmFAHnjDeoTbhvOBJCpGW5MY132HSGtfDN
 rhKRxZ1+ynXBwVOT1Bqe2bVEpk61Lr0hnoH+WiIemfnLRqtluwr85yDi1WaTMqDQ8b0b
 07wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708423725; x=1709028525;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+toL7F0kapuzeBLcfc5DcPeiTKIyw1Qh60DwqayzqDU=;
 b=jjuz7ntSmb5RM7/DzjMnjaGld+oj6XDASEEfDaXGPKbDysZbsICbj6DJavGR0Mvj4B
 AdLPM9bPa5uulhIQGLltVfFK5cdqpUSgDr0frduWGO8reVaKOhBC+NOSCRcGGZoaF7qR
 lQqEkID3U/5858UbcM0AA9HI24WbJOauZmswZvE0ndxwG61NPHad/qSVQgcWBvyJv70L
 NpTe/JvXtOdfVswIfv/Ci2yoQUozQj2SztIApRJvCnmlG3KSj5u2LmmqPUydaopDoh2Z
 XTJfPZK5ffy3coPMpgQlT3YgNF1FHWBo0r5QxOAhJTjX1Ucn5x5/FuQ9/syiRjE2VcXL
 B6dA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZk+/AbqZZL6od8B+T3NwlHyOtkXD8xZMlLhLffIE7RA7nf8TjrA9IR4/QhcQGcRZC48FZcvfGO0pKnFv3tWTtwvbCsJzMVWVKRSVd9znk3kYvziYDcXzx
X-Gm-Message-State: AOJu0YygG+58IqqBa+j/o8R9DuY5SCcXlxylD1IYav0Mh3oniD6KvkGE
 MMmD13lcOUpJ0lln2D92ngVyQw3s0BNFJWqA8oOZ55sOIbMe+910
X-Google-Smtp-Source: AGHT+IHRIUgCBvBMs2u9VD5mm0TT4sdm+ubatW6v+3YvFEbj6ODVK8F0sTO+qhcrQUMf2MsZ309twA==
X-Received: by 2002:a05:6512:39d1:b0:512:c2e7:27a3 with SMTP id
 k17-20020a05651239d100b00512c2e727a3mr1510368lfu.33.1708423724417; 
 Tue, 20 Feb 2024 02:08:44 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 t17-20020a195f11000000b0051181cbea91sm1262744lfb.228.2024.02.20.02.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 02:08:43 -0800 (PST)
Date: Tue, 20 Feb 2024 13:08:40 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Piotr Wejman <piotrwejman90@gmail.com>
Message-ID: <nniukwj6oil7hbr2aefvlwicw362h7gotrudarozre35dk3ugm@wjsosr7p27li>
References: <20240219102405.32015-1-piotrwejman90@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240219102405.32015-1-piotrwejman90@gmail.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: fix rx queue priority
	assignment
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

On Mon, Feb 19, 2024 at 11:24:05AM +0100, Piotr Wejman wrote:
> The driver should ensure that same priority is not mapped to multiple
> rx queues. Currently dwmac4_rx_queue_priority function is adding
> priorities for a queue without clearing them from others.
> 
> From DesignWare Cores Ethernet Quality-of-Service
> Databook, section 17.1.29 MAC_RxQ_Ctrl2:
> "[...]The software must ensure that the content of this field is
> mutually exclusive to the PSRQ fields for other queues, that is,
> the same priority is not mapped to multiple Rx queues[...]"
> 
> After this patch, dwmac4_rx_queue_priority function will:
> - assign desired priorities to a queue
> - remove those priorities from all other queues
> The write sequence of CTRL2 and CTRL3 registers is done in the way to
> ensure this order.
> 

Thanks for the fix. The change in general seems good. The same is
applicable for the DW XGMAC too. Could you please apply it to
dwxgmac2_rx_queue_prio()?

> Also, the PSRQn field contains the mask of priorities and not only one
> priority. Rename "prio" argument to "prio_mask".

Please move this to a separate patch applied on top of the main change
described above. Also in order to be done coherently the renaming
should be extended onto all the Tx/Rx queue prio parts in the
driver:
0. dwmac4_core.c
   +-> dwmac4_rx_queue_priority()
   +-> dwmac4_tx_queue_priority()
1. dwxgmac2_core.c
   +-> dwxgmac2_rx_queue_prio()
   +-> dwxgmac2_tx_queue_prio()
2. hwif.h
   +-> stmmac_ops::rx_queue_prio
   +-> stmmac_ops::tx_queue_prio
3. stmmac.h
   +-> stmmac_rxq_cfg::prio
   +-> stmmac_txq_cfg::prio
4. stmmac_main.c:
   +-> stmmac_mac_config_rx_queues_prio()::prio
   +-> stmmac_mac_config_tx_queues_prio()::prio

* Hope I listed all of them.

-Serge(y)

> 
> Signed-off-by: Piotr Wejman <piotrwejman90@gmail.com>
> ---
>  .../net/ethernet/stmicro/stmmac/dwmac4_core.c | 36 +++++++++++++------
>  1 file changed, 26 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
> index 6b6d0de09619..6acc8bad794e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
> @@ -89,22 +89,38 @@ static void dwmac4_rx_queue_enable(struct mac_device_info *hw,
>  }
>  
>  static void dwmac4_rx_queue_priority(struct mac_device_info *hw,
> -				     u32 prio, u32 queue)
> +				     u32 prio_mask, u32 queue)
>  {
>  	void __iomem *ioaddr = hw->pcsr;
> -	u32 base_register;
> -	u32 value;
> +	u32 clear_mask = 0;
> +	u32 ctrl2, ctrl3;
> +	int i;
>  
> -	base_register = (queue < 4) ? GMAC_RXQ_CTRL2 : GMAC_RXQ_CTRL3;
> -	if (queue >= 4)
> -		queue -= 4;
> +	ctrl2 = readl(ioaddr + GMAC_RXQ_CTRL2);
> +	ctrl3 = readl(ioaddr + GMAC_RXQ_CTRL3);
>  
> -	value = readl(ioaddr + base_register);
> +	for (i = 0; i < 4; i++)
> +		clear_mask |= ((prio_mask << GMAC_RXQCTRL_PSRQX_SHIFT(i)) &
> +						GMAC_RXQCTRL_PSRQX_MASK(i));
>  
> -	value &= ~GMAC_RXQCTRL_PSRQX_MASK(queue);
> -	value |= (prio << GMAC_RXQCTRL_PSRQX_SHIFT(queue)) &
> +	ctrl2 &= ~clear_mask;
> +	ctrl3 &= ~clear_mask;
> +
> +	if (queue < 4) {
> +		ctrl2 |= (prio_mask << GMAC_RXQCTRL_PSRQX_SHIFT(queue)) &
>  						GMAC_RXQCTRL_PSRQX_MASK(queue);
> -	writel(value, ioaddr + base_register);
> +
> +		writel(ctrl2, ioaddr + GMAC_RXQ_CTRL2);
> +		writel(ctrl3, ioaddr + GMAC_RXQ_CTRL3);
> +	} else {
> +		queue -= 4;
> +
> +		ctrl3 |= (prio_mask << GMAC_RXQCTRL_PSRQX_SHIFT(queue)) &
> +						GMAC_RXQCTRL_PSRQX_MASK(queue);
> +
> +		writel(ctrl3, ioaddr + GMAC_RXQ_CTRL3);
> +		writel(ctrl2, ioaddr + GMAC_RXQ_CTRL2);
> +	}
>  }
>  
>  static void dwmac4_tx_queue_priority(struct mac_device_info *hw,
> -- 
> 2.25.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
