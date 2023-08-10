Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6E9777B0C
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Aug 2023 16:43:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80AD2C6B469;
	Thu, 10 Aug 2023 14:43:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63016C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 14:43:57 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37AClMFF009213; Thu, 10 Aug 2023 16:43:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=lr83yk56r2f+wy5jyGAofD+fwP+vkuyJt43Zjpa5KV4=; b=zl
 nUVYSEF+5ckaVlq8pYuPA6QMSL2WVai4btRmRySGRPr2T6TDJUN23xPkHRXcOTS4
 o6zKKACkEAzSCRw6P7tV5PZDqYqDfMItXWOETWJbFijqfehxJhEA0FdU5/xW6wVo
 aahopf/52rab1U1eZM26eyy1WWTNyU6Kswl+IWNLII8n7liueb/YzGlTYJjouwAv
 4yUpqUolRcNqsWesICd6vkT5FD+/MMO/J2HfpObZ5ctKmKbrWW4RTYmj9rjpqwgT
 L/ox5bo47WeEa5ac7/05A6XNhmDAxo7/eEVEPGcXdrPy1EMSFlU8wmPUO6iAOef8
 P2geTdp/33+fSc1u+0tQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3sd0730mgg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Aug 2023 16:43:41 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 37C58100057;
 Thu, 10 Aug 2023 16:43:41 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EEAD0222C88;
 Thu, 10 Aug 2023 16:43:40 +0200 (CEST)
Received: from [10.201.21.122] (10.201.21.122) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 10 Aug
 2023 16:43:40 +0200
Message-ID: <1c327ece-ce22-1d82-92ef-9db281e93f92@foss.st.com>
Date: Thu, 10 Aug 2023 16:43:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu
 <joabreu@synopsys.com>
References: <20230809165007.1439-1-jszhang@kernel.org>
 <20230809165007.1439-5-jszhang@kernel.org>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20230809165007.1439-5-jszhang@kernel.org>
X-Originating-IP: [10.201.21.122]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-10_11,2023-08-10_01,2023-05-22_02
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 04/10] net: stmmac: enlarge
 max rx/tx queues and channels to 16
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

On 8/9/23 18:50, Jisheng Zhang wrote:
> xgmac supports up to 16 rx/tx queues and up to 16 channels.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c | 5 ++---
>   include/linux/stmmac.h                              | 6 +++---
>   2 files changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> index a0c2ef8bb0ac..aaae82d3d9dc 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> @@ -202,9 +202,8 @@ static void dwxgmac2_map_mtl_to_dma(struct mac_device_info *hw, u32 queue,
>   	void __iomem *ioaddr = hw->pcsr;
>   	u32 value, reg;
>   
> -	reg = (queue < 4) ? XGMAC_MTL_RXQ_DMA_MAP0 : XGMAC_MTL_RXQ_DMA_MAP1;
> -	if (queue >= 4)
> -		queue -= 4;
> +	reg = XGMAC_MTL_RXQ_DMA_MAP0 + (queue & ~0x3);
> +	queue &= 0x3;
>   
>   	value = readl(ioaddr + reg);
>   	value &= ~XGMAC_QxMDMACH(queue);
> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> index ef67dba775d0..11671fd6adee 100644
> --- a/include/linux/stmmac.h
> +++ b/include/linux/stmmac.h
> @@ -15,9 +15,9 @@
>   #include <linux/platform_device.h>
>   #include <linux/phy.h>
>   
> -#define MTL_MAX_RX_QUEUES	8
> -#define MTL_MAX_TX_QUEUES	8
> -#define STMMAC_CH_MAX		8
> +#define MTL_MAX_RX_QUEUES	16
> +#define MTL_MAX_TX_QUEUES	16
> +#define STMMAC_CH_MAX		16
>   
>   #define STMMAC_RX_COE_NONE	0
>   #define STMMAC_RX_COE_TYPE1	1

Acked-by: Alexandre TORGUE <alexandre.torgue@foss.st.com>

Regards
Alex

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
