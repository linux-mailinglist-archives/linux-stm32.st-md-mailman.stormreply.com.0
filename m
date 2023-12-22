Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A46781CF8A
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Dec 2023 22:49:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01E3FC6B477;
	Fri, 22 Dec 2023 21:49:17 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2DDAC03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Dec 2023 21:49:15 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2ccb778160cso1257811fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Dec 2023 13:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703281755; x=1703886555;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Vy+I7LnjOAXPaFtrmXfqjIk/V4/7h6p6CdTlzhvcUuQ=;
 b=KulP0DGHr6PL0/Fzx+BY8s6puJBjFBrsdaiyfuC53CyokCPZAhtgy2QtEeC2H0yq5C
 zWlZafnPdjrz1PANDt2mL3S7JiLJWHD3/MlvutFfc++5ph7+is/z500hYKHqPkrrBYx2
 muiMVmt/ct/7Q0mqrG5VAiqtYatWO21mTDIu9y9zZq576jNI1DfaBQDOCoiux79dEDje
 uIRuyUxOPQGJbpdipshaqvuD5yU5oFSGR/KNPufLcgpVvzF6wy9inK0DfV/YBCh6LM56
 veH1slFb2l4GEJ1wedi7+xaextf1xGBhJ+tEu0admrRxtJctEMpjcDBfGKnHcN7jYBPs
 +Dzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703281755; x=1703886555;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vy+I7LnjOAXPaFtrmXfqjIk/V4/7h6p6CdTlzhvcUuQ=;
 b=LCCGTgco4ZLhRfS1KsfjBk0B/KKIVLkLsx9Rfkp++dAnNEgMvKFiATvsj1bcXhxii5
 22dUNV+PO9IGlrHMm7R0g/DPR+6svqxNQbwmkS2lJzK8wBCz+jQG15OrgsQB811G0Swv
 yTfL+1fTEJ1KO5h75Zd+CKtCZvK9cxeFnez3WOzn47/0sSR7g6BwORcKkhFnLIy1UfiP
 9+VXdzP6Vj4DDX68G5tijP/ObdsIyaV9iMVwV6rGm9jBnLM3/HljzH0FSgN+NP3tUCGt
 GU8jJGlOpCds30Nsn/GFUOH3GJEHniMLYFaDA1c5OSvpHLfQ7j3KoMYmX6TU46XuByvn
 g2CA==
X-Gm-Message-State: AOJu0Yw0YDLOtDrXL645mQO685QiiZIwr2SritnvXX6Zte4+mnMaarm3
 zK31YqwWQW57iUFjY8eCnUc=
X-Google-Smtp-Source: AGHT+IFa9n/ld3l+fvWjT1a659p1CwK1uQUNIgQVx9mR3Q1BIRhe7l9cxDlBDhzqjXJN1Wj785LXQw==
X-Received: by 2002:a2e:6a16:0:b0:2cc:1dac:fe2a with SMTP id
 f22-20020a2e6a16000000b002cc1dacfe2amr1135192ljc.64.1703281754750; 
 Fri, 22 Dec 2023 13:49:14 -0800 (PST)
Received: from mobilestation ([95.79.203.166])
 by smtp.gmail.com with ESMTPSA id
 bd7-20020a05651c168700b002cc70f6ce25sm744700ljb.14.2023.12.22.13.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 13:49:14 -0800 (PST)
Date: Sat, 23 Dec 2023 00:49:10 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Leong Ching Swee <leong.ching.swee@intel.com>
Message-ID: <qyiveqz3egzctymkwflgw4u6ubnpiss2x244fsepop7t3ve7ev@7x24oaiferuy>
References: <20231222054451.2683242-1-leong.ching.swee@intel.com>
 <20231222054451.2683242-4-leong.ching.swee@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231222054451.2683242-4-leong.ching.swee@intel.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Teoh Ji Sheng <ji.sheng.teoh@intel.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1 3/4] net: stmmac: Add support
 for TX/RX channel interrupt
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

On Fri, Dec 22, 2023 at 01:44:50PM +0800, Leong Ching Swee wrote:
> From: Swee Leong Ching <leong.ching.swee@intel.com>
> 
> Enable TX/RX channel interrupt registration for MAC that interrupts CPU
> through shared peripheral interrupt (SPI).
> 
> Per channel interrupts and interrupt-names are registered through,
> Eg: 4 tx and 4 rx channels:
> interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
>              <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
>              <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
>              <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
>              <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
>              <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
>              <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
>              <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
> interrupt-names = "dma_tx0",
>                   "dma_tx1",
>                   "dma_tx2",
>                   "dma_tx3",
>                   "dma_rx0",
>                   "dma_rx1",
>                   "dma_rx2",
>                   "dma_rx3";
> 
> Signed-off-by: Teoh Ji Sheng <ji.sheng.teoh@intel.com>
> Signed-off-by: Swee Leong Ching <leong.ching.swee@intel.com>
> ---
>  .../ethernet/stmicro/stmmac/stmmac_platform.c | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index 70eadc83ca68..f857907f13a0 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -710,6 +710,8 @@ EXPORT_SYMBOL_GPL(devm_stmmac_probe_config_dt);
>  int stmmac_get_platform_resources(struct platform_device *pdev,
>  				  struct stmmac_resources *stmmac_res)
>  {

> +	char irq_name[8];

By DW XGMAC v2.x IP-core design there can be up to 16 Tx channels and
12 Rx channels. Thus it's better to set irq_name size being at least
(strlen("dma_tx16") + 1) == 9 beforehand since you are adding this
code anyway and for some reason didn't consider to pick the Jisheng'
patch up which fixed the MTL_MAX_TX_QUEUES/MTL_MAX_RX_QUEUES macros.

> +	int i;

Please add an empty line between the variables declaration and the
next statement.

>  	memset(stmmac_res, 0, sizeof(*stmmac_res));
>  
>  	/* Get IRQ information early to have an ability to ask for deferred
> @@ -719,6 +721,28 @@ int stmmac_get_platform_resources(struct platform_device *pdev,
>  	if (stmmac_res->irq < 0)
>  		return stmmac_res->irq;
>  

> +	/* For RX Channel */
> +	for (i = 0; i < MTL_MAX_RX_QUEUES; i++) {
> +		snprintf(irq_name, sizeof(irq_name), "dma_rx%i", i);
> +		stmmac_res->rx_irq[i] = platform_get_irq_byname_optional(pdev, irq_name);
> +		if (stmmac_res->rx_irq[i] < 0) {
> +			if (stmmac_res->rx_irq[i] == -EPROBE_DEFER)
> +				return -EPROBE_DEFER;
> +			break;
> +		}
> +	}

What about:

+	/* Get optional Tx/Rx DMA per-channel IRQs, which otherwise
+	 * are supposed to be delivered via the common MAC IRQ line
+	 */
+	for (i = 0; i < MTL_MAX_RX_QUEUES; i++) {
+		snprintf(irq_name, sizeof(irq_name), "dma_rx%i", i);
+		irq = platform_get_irq_byname_optional(pdev, irq_name);
+		if (irq == -EPROBE_DEFER)
+			return irq;
+		else if (irq < 0)
+			break;
+
+		stmmac_res->rx_irq[i] = irq;
+	}

It's cleaner a bit with less indentations and doesn't pollute
rx_irq[]/tx_irq[] arrays with the error numbers.

> +
> +	/* For TX Channel */
> +	for (i = 0; i < MTL_MAX_TX_QUEUES; i++) {
> +		snprintf(irq_name, sizeof(irq_name), "dma_tx%i", i);
> +		stmmac_res->tx_irq[i] = platform_get_irq_byname_optional(pdev, irq_name);
> +		if (stmmac_res->tx_irq[i] < 0) {
> +			if (stmmac_res->rx_irq[i] == -EPROBE_DEFER)
> +				return -EPROBE_DEFER;
> +			break;
> +		}
> +	}
> +

Please move the Tx/Rx IRQs getting loops to the bottom of the
stmmac_get_platform_resources() method. Thus the order of the IRQs
getting would be the same as the order of the IRQs requests
implemented in the stmmac_request_irq_multi_msi() and
stmmac_request_irq_single() methods.

-Serge(y)

>  	/* On some platforms e.g. SPEAr the wake up irq differs from the mac irq
>  	 * The external wake up irq can be passed through the platform code
>  	 * named as "eth_wake_irq"
> -- 
> 2.34.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
