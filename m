Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C15CD38ED3
	for <lists+linux-stm32@lfdr.de>; Sat, 17 Jan 2026 14:52:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3672BC8F290;
	Sat, 17 Jan 2026 13:52:50 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B96ACC8F28F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 17 Jan 2026 13:52:48 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 8005F1A28EA;
 Sat, 17 Jan 2026 13:52:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 40F5B60708;
 Sat, 17 Jan 2026 13:52:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 892EF10B69083; Sat, 17 Jan 2026 14:52:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1768657966; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=5gDixT1C1g9aXGEdjl/pZkav3MxrZ1blNqQfJLK1BvE=;
 b=WKcU6NrvukifFmQkh8Va7m7KICHp61NXtJxizqM8LdcErwoE6rzE6E54u19h1ifDeJPIxI
 4mqKwlC3c0cA+f6Qj6CGlzfvbLaRWhgzLGLjkIE1OT70IQBYXzMzbzzNYGsPmuDrfAXdba
 rAHuSNuxHb3pNuARUDSg2t+VTtm4RwQt4yNc0/cMjTvJA0QgFwLYRRD6EqFtwYacSPXK6M
 02Bbkt09P7mNAA+lKnonX9NqJKinXZzdd6VJyBl3daHersl+UcO3yoTyp5rqI2+ssqU7iF
 KrsYy34nmQRZvReF0srgsRxMadFk9pXF4o7+q9Qkl/FdfmrCfYSn/Hh8iEahsg==
Message-ID: <194679cb-f8e0-4195-b85b-8726b9f5b4f6@bootlin.com>
Date: Sat, 17 Jan 2026 14:52:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <E1vgtBc-00000005D6v-040n@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vgtBc-00000005D6v-040n@rmk-PC.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC net-next] net: stmmac: enable RPS and
	RBU interrupts
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

Hi Russell,

On 17/01/2026 00:25, Russell King (Oracle) wrote:
> Enable receive process stopped and receive buffer unavailable
> interrupts, so that the statistic counters can be updated.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> 
> Maxime,
> 
> You may find this patch useful, as it makes the "rx_buf_unav_irq"
> and "rx_process_stopped_irq" ethtool statistic counters functional.
> This means that the lack of receive descriptors can still be detected
> even if the receive side doesn't actually stall.

Nice ! I'll give a test and take a deeper look after the weekend :)

Thanks,

Maxime

> 
> I'm not sure why we publish these statistic counters if we don't
> enable the interrupts to allow them to ever be non-zero.
> 
>  drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
> index 9d9077a4ac9f..d7f86b398abe 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
> @@ -99,6 +99,8 @@ static inline u32 dma_chanx_base_addr(const struct dwmac4_addrs *addrs,
>  #define DMA_CHAN_INTR_ENA_NIE_4_10	BIT(15)
>  #define DMA_CHAN_INTR_ENA_AIE_4_10	BIT(14)
>  #define DMA_CHAN_INTR_ENA_FBE		BIT(12)
> +#define DMA_CHAN_INTR_ENA_RPS		BIT(8)
> +#define DMA_CHAN_INTR_ENA_RBU		BIT(7)
>  #define DMA_CHAN_INTR_ENA_RIE		BIT(6)
>  #define DMA_CHAN_INTR_ENA_TIE		BIT(0)
>  
> @@ -107,6 +109,8 @@ static inline u32 dma_chanx_base_addr(const struct dwmac4_addrs *addrs,
>  					 DMA_CHAN_INTR_ENA_TIE)
>  
>  #define DMA_CHAN_INTR_ABNORMAL		(DMA_CHAN_INTR_ENA_AIE | \
> +					 DMA_CHAN_INTR_ENA_RPS | \
> +					 DMA_CHAN_INTR_ENA_RBU | \
>  					 DMA_CHAN_INTR_ENA_FBE)
>  /* DMA default interrupt mask for 4.00 */
>  #define DMA_CHAN_INTR_DEFAULT_MASK	(DMA_CHAN_INTR_NORMAL | \
> @@ -119,6 +123,8 @@ static inline u32 dma_chanx_base_addr(const struct dwmac4_addrs *addrs,
>  					 DMA_CHAN_INTR_ENA_TIE)
>  
>  #define DMA_CHAN_INTR_ABNORMAL_4_10	(DMA_CHAN_INTR_ENA_AIE_4_10 | \
> +					 DMA_CHAN_INTR_ENA_RPS | \
> +					 DMA_CHAN_INTR_ENA_RBU | \
>  					 DMA_CHAN_INTR_ENA_FBE)
>  /* DMA default interrupt mask for 4.10a */
>  #define DMA_CHAN_INTR_DEFAULT_MASK_4_10	(DMA_CHAN_INTR_NORMAL_4_10 | \

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
