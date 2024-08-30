Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E34BA966D19
	for <lists+linux-stm32@lfdr.de>; Sat, 31 Aug 2024 01:59:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98F3FC6DD9A;
	Fri, 30 Aug 2024 23:59:21 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8541EC6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Aug 2024 23:59:14 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-2020e83eca1so25270005ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Aug 2024 16:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725062353; x=1725667153;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=sr+m/MCpvguQ1PEITzYf3gtI8iZ+jxmN3Qz312mDJ+Y=;
 b=NWNKTrFnpJ35KgSwVwyAldTaJsUzAL9xznj+xkH2JSoPGwlgOq9oc8LjTTGJljd7Wc
 WOQMoR02zVzd+oRiY8xkd0OxePsfj/cvVba3YSJ67+BZR8bSKW1g4hISpiELMNOSABtz
 i/l49NkEfnKillFrdZ2MOTQViFWbz75m244aDWHgO+FHT2d43wBkWqnN0ZZ5APECi3aS
 Z244qzagsS118pfKDlPq4fKKfgWrIVE02oyMAhckndaay9aqMm6VxvopuxzcePB1Y+zR
 LUSjz1rWaTQww46+GmTTSKsw6akPMd6ZN0T4VK8dY+C8trLUyKo8FhyXI1ESdM9e3r2X
 Hs4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725062353; x=1725667153;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sr+m/MCpvguQ1PEITzYf3gtI8iZ+jxmN3Qz312mDJ+Y=;
 b=Qj956X84luv5NfH2VKdWQ99Qq8qOJCI61X/9pc3WvuPxNPYNtNG0pkJTUAJkhrQnxk
 rMtpogocxwCJeK43y5FLRgJV+zZ9K5A94HleFvYx89ZNUDWFM9vs2/5++C30PeDTQzLw
 qW9q0wqkP+vPd0OEprt9RQSpaPOeeUkXXy7ek4Mwm+owDL4k+mFjcNQIvhXbmDrKYULh
 SXxxt5VgRc9tXow20rDQn0RvI8u46Zo5q/XlE/o0gA/ZdR0IHCLfWB+k2EEeSJPia58R
 VRBJqHFnkhm7fX0MeI0SCyfFlWGiywKlLEGxsNhe4qXmNFJ7Emn0vvezyvil1mo1XXQE
 WXCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3IZQ9mFTN/1f3+3v9eOWz2vVDrH+P/MVFEPWOx5OEvCFIUGf3vh0Rygonbwl0J3RT4ncTKLoN6K1DCw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwzL6zHUb3CETYCf9a+Y6/kER8YUmg7rtaS9Of8z/FPXc0i1JET
 kvXDWjoEbMLw+91hAxmglHcfx8lPRnIa+tNdsrrEsRP9xSxVIZPrOTiaYyHE
X-Google-Smtp-Source: AGHT+IEgofVC034M7KNRqW6gP1mCFO060gmQo6PGys6HKORyv1JMDN4S7cvVuPl5BWLZMdBvTzCsLQ==
X-Received: by 2002:a17:903:22c5:b0:201:f065:2b2c with SMTP id
 d9443c01a7336-2050c4666b0mr94473895ad.55.1725062352960; 
 Fri, 30 Aug 2024 16:59:12 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2051553720esm32038555ad.178.2024.08.30.16.59.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Aug 2024 16:59:11 -0700 (PDT)
Message-ID: <82473d11-ff14-494a-bac5-4a5b1fb8ce4d@gmail.com>
Date: Fri, 30 Aug 2024 16:59:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Florian Fainelli <f.fainelli@gmail.com>
To: ende.tan@starfivetech.com, netdev@vger.kernel.org
References: <20240829134043.323855-1-ende.tan@starfivetech.com>
Content-Language: en-US
In-Reply-To: <20240829134043.323855-1-ende.tan@starfivetech.com>
Cc: andrew@lunn.ch, leyfoon.tan@starfivetech.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 edumazet@google.com, joabreu@synopsys.com, minda.chen@starfivetech.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, pabeni@redhat.com,
 endeneer@gmail.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [net-next, v3,
 1/1] net: stmmac: Batch set RX OWN flag and other flags
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

On 8/29/24 06:40, ende.tan@starfivetech.com wrote:
> From: Tan En De <ende.tan@starfivetech.com>
> 
> Minimize access to the RX descriptor by collecting all the flags in a
> local variable and then updating the descriptor at once.
> 
> Signed-off-by: Tan En De <ende.tan@starfivetech.com>
> ---
> v3:
> - Use local variable to batch set the descriptor flags.
> - This reduces the number of accesses to the descriptor.
> v2: https://patchwork.kernel.org/project/netdevbpf/patch/20240821060307.46350-1-ende.tan@starfivetech.com/
> - Avoid introducing a new function just to set the interrupt-on-completion
>    bit, as it is wasteful to do so.
> - Delegate the responsibility of calling dma_wmb() from main driver code
>    to set_rx_owner() callbacks (i.e. let callbacks to manage the low-level
>    ordering/barrier rather than cluttering up the main driver code).
> v1: https://patchwork.kernel.org/project/netdevbpf/patch/20240814092438.3129-1-ende.tan@starfivetech.com/
> ---
>   drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c   | 6 ++++--
>   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c | 6 ++++--
>   2 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
> index 1c5802e0d7f4..dfcbe7036988 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
> @@ -186,10 +186,12 @@ static void dwmac4_set_tx_owner(struct dma_desc *p)
>   
>   static void dwmac4_set_rx_owner(struct dma_desc *p, int disable_rx_ic)
>   {
> -	p->des3 |= cpu_to_le32(RDES3_OWN | RDES3_BUFFER1_VALID_ADDR);
> +	u32 flags = cpu_to_le32(RDES3_OWN | RDES3_BUFFER1_VALID_ADDR);
>   
>   	if (!disable_rx_ic)
> -		p->des3 |= cpu_to_le32(RDES3_INT_ON_COMPLETION_EN);
> +		flags |= cpu_to_le32(RDES3_INT_ON_COMPLETION_EN);
> +
> +	p->des3 |= flags;

You could just batch the endian conversion too:

	u32 flags = DES3_OWN | RDES3_BUFFER1_VALID_ADDR;

	if (!disable_rx_ic)
		flags |= RDES3_INT_ON_COMPLETION_EN;

	p->desc3 |= cpu_to_le32(flags);

>   }
>   
>   static int dwmac4_get_tx_ls(struct dma_desc *p)
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
> index fc82862a612c..0c7ea939f787 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
> @@ -56,10 +56,12 @@ static void dwxgmac2_set_tx_owner(struct dma_desc *p)
>   
>   static void dwxgmac2_set_rx_owner(struct dma_desc *p, int disable_rx_ic)
>   {
> -	p->des3 |= cpu_to_le32(XGMAC_RDES3_OWN);
> +	u32 flags = cpu_to_le32(XGMAC_RDES3_OWN);
>   
>   	if (!disable_rx_ic)
> -		p->des3 |= cpu_to_le32(XGMAC_RDES3_IOC);
> +		 flags |= cpu_to_le32(XGMAC_RDES3_IOC);
> +
> +	p->des3 |= flags;

And likewise here, and that would likely squash the sparse warning, 
since you would not be assigning an 'u32' field to a __le32 field anymore.
-- 
Florian
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
