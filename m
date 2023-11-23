Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B2A7F5E68
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Nov 2023 12:55:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 94A67C6B476;
	Thu, 23 Nov 2023 11:55:43 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23D68C6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Nov 2023 11:55:42 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-507973f3b65so1063543e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Nov 2023 03:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700740541; x=1701345341;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rEhXyXecSsXMQIg/YxUPDQVBwLqafKsHNHP/Yqj+n9A=;
 b=sfPIHhAlEtrEz+QqF6PtzUyc0qhjfBM2AYg4/qK1xV/bIztgL/MAm84BMz83Yt3hAF
 wQdjvDLJPEOQd/gHGW3O5sAv84l3hcoTvMX+7MV1t4ytRK1i6sYFZOhNeAfaXpvCkRmr
 ML+J+rixW0W9JMimWIg5yudPsJT/oIFZ1sk31RAV8Vv3jNGvR5uRZLJOJ/suKAFCgqQN
 ItI5aMewI5uT0l7ELQmv0COFedyhCnTHv83mfpdrhDfJAK1vmWkcbvgc6h40oN+PPpmt
 fbTtwxy9+Po73QDDvDSbfap1a+BP5C/QUAlW36hubxjTEg6V8ynuo8fqOIshS8zQfhHz
 v7sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700740541; x=1701345341;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rEhXyXecSsXMQIg/YxUPDQVBwLqafKsHNHP/Yqj+n9A=;
 b=VaXyaBcL6wQyrydHDFR/vh/xhRENRPbB3qDC+yEWUZugwlkKjyu7SB0i3b9RZSHF4C
 ds3jUpHwLbahzR4VhtXeIXsriGU+Yov+2vVN0ttXTbkLn4tIRE+TUzRHkTQHBcA3gSjg
 XV8wupBRQXzH6AZs5q4AMyf/IU80To9ZdiXNC2RLd3G39tZsuDNd9XamLKgHjWbrJXV0
 5DzsgsMaVNM27agV4wvAOoDK08Y+XJ4XXf3EVmOWaaS/LZbjNc6iQruJ/7Bvs2ssQik0
 LPzyBrw5+Y4cx9yKnYm83UWv8Pz4PDdhWCltgtAyBQbWxz5HDcJTwaAeHkiBEvjgiFfP
 t77g==
X-Gm-Message-State: AOJu0YzqJo7VPdSNrl/sy0BLSkMh86E06Capf67jU4fSLLyjaFpVDQS0
 xTQ/KvbHbvqaSYehpjoXZ4964Q==
X-Google-Smtp-Source: AGHT+IEQmg9QqvwxWaq3S4vi5vqQ2B4nJxRaKyvDHdI7fGHr0Y0QeQwLVtigFPh+zv9FMG5fnt/9Fw==
X-Received: by 2002:a19:740f:0:b0:500:9f7b:e6a4 with SMTP id
 v15-20020a19740f000000b005009f7be6a4mr3036004lfe.32.1700740541278; 
 Thu, 23 Nov 2023 03:55:41 -0800 (PST)
Received: from [172.30.204.221] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 k41-20020a0565123da900b0050aaa64ed60sm170104lfv.54.2023.11.23.03.55.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Nov 2023 03:55:40 -0800 (PST)
Message-ID: <1e02f4f8-ebd3-4f57-98a9-48d7e08c0ad4@linaro.org>
Date: Thu, 23 Nov 2023 12:55:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Suraj Jaiswal <quic_jsuraj@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Prasad Sodagudi <psodagud@quicinc.com>, Andrew Halaney <ahalaney@redhat.com>
References: <cover.1700737841.git.quic_jsuraj@quicinc.com>
 <62eaaace3713751cb1ecac3163e857737107ca0e.1700737841.git.quic_jsuraj@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <62eaaace3713751cb1ecac3163e857737107ca0e.1700737841.git.quic_jsuraj@quicinc.com>
Cc: kernel@quicinc.com
Subject: Re: [Linux-stm32] [PATCH net-next v3 3/3] net: stmmac: Add driver
 support for DWMAC5 fault IRQ Support
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



On 11/23/23 12:38, Suraj Jaiswal wrote:
> Add IRQ support to listen HW fault like ECC,DPP,FSM
> fault and print the fault information in the kernel
> log.
> 
> Signed-off-by: Suraj Jaiswal <quic_jsuraj@quicinc.com>
> ---
>   drivers/net/ethernet/stmicro/stmmac/common.h  |  1 +
>   drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  2 ++
>   .../net/ethernet/stmicro/stmmac/stmmac_main.c | 18 +++++++++++++++++
>   .../ethernet/stmicro/stmmac/stmmac_platform.c | 20 +++++++++++++++++++
>   4 files changed, 41 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
> index 6b935922054d..c4821c7ab674 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/common.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/common.h
> @@ -347,6 +347,7 @@ enum request_irq_err {
>   	REQ_IRQ_ERR_SFTY_UE,
>   	REQ_IRQ_ERR_SFTY_CE,
>   	REQ_IRQ_ERR_LPI,
> +	REQ_IRQ_ERR_SAFETY,
>   	REQ_IRQ_ERR_WOL,
>   	REQ_IRQ_ERR_MAC,
>   	REQ_IRQ_ERR_NO,
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> index cd7a9768de5f..8893d4b7fa38 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> @@ -33,6 +33,7 @@ struct stmmac_resources {
>   	int irq;
>   	int sfty_ce_irq;
>   	int sfty_ue_irq;
> +	int safety_common_intr;
>   	int rx_irq[MTL_MAX_RX_QUEUES];
>   	int tx_irq[MTL_MAX_TX_QUEUES];
>   };
> @@ -331,6 +332,7 @@ struct stmmac_priv {
>   	/* XDP BPF Program */
>   	unsigned long *af_xdp_zc_qps;
>   	struct bpf_prog *xdp_prog;
> +	int safety_common_intr;
other interrupts use _irq yet you seem to use _intr, plus the
aforementioned "safety" vs "fault" naming

[...]

>   
> +int stmmac_get_fault_intr_config(struct platform_device *pdev, struct stmmac_resources *res)
> +{
> +	int ret = 0;
get rid of ret and return directly

> +
> +	res->safety_common_intr = platform_get_irq_byname(pdev, "safety");
> +
stray newline?

> +	if (res->safety_common_intr < 0) {
> +		if (res->safety_common_intr != -EPROBE_DEFER)
> +			dev_err(&pdev->dev, "safety IRQ configuration information not found\n");
> +		ret = 1;
> +	}
> +
> +	return ret;
> +}
> +
>   int stmmac_get_platform_resources(struct platform_device *pdev,
>   				  struct stmmac_resources *stmmac_res)
>   {
> +	int ret = 0;
Missing newline between declarations and code
Unnecessary initialization

>   	memset(stmmac_res, 0, sizeof(*stmmac_res));
>   
>   	/* Get IRQ information early to have an ability to ask for deferred
> @@ -702,6 +718,10 @@ int stmmac_get_platform_resources(struct platform_device *pdev,
>   	if (stmmac_res->irq < 0)
>   		return stmmac_res->irq;
>   
> +	ret = stmmac_get_fault_intr_config(pdev, stmmac_res);
> +	if (ret)
> +		dev_err(&pdev->dev, "Fault interrupt not present\n");
Since you're getting the return value, perhaps the errno should
be propagated

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
