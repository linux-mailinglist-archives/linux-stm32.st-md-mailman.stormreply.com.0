Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 754008265F3
	for <lists+linux-stm32@lfdr.de>; Sun,  7 Jan 2024 21:38:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1879DC6B476;
	Sun,  7 Jan 2024 20:38:53 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 323C5C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  7 Jan 2024 20:38:51 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-50eaaf2c7deso1079860e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 07 Jan 2024 12:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704659930; x=1705264730;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rWIKvi1hnVUw865j4JFaimjjwkxSfRuC7mbyHpWGOpM=;
 b=Mdo9O0htKxUJchT/4u8RLzpL4TCpg/u0s4LAmiXhqeea40X6xqmpMtk8S7Iq3t3PTG
 kReP0XkCtfIFoZU4wBsE+oTbYoQpSe2fAwJ1BxKmxW8PiJQXyt+/So8PVlAabHp6Ic0h
 87YtBlmX12b+HThmMmSn49aGdIs9Y2SfcrJylWx7qNEnmjwyzSU9hLOWmRdHVk+U+HnM
 i55rJDR56/qaog68cCmUWUugSyjVhAEfpi+3xRlnSNtpq4ZCDKIyWAXAncvGqGNHiaUA
 wiqYQiikIHxI5uhr45FDIZUqGCk01Inp+LxZ3FrPxU5bR+pDUC4mMK43edG3ZIlVTTnh
 uOZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704659930; x=1705264730;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rWIKvi1hnVUw865j4JFaimjjwkxSfRuC7mbyHpWGOpM=;
 b=vI44FpAM9E4kES0tEII6QKn0/UXLD/R+qJ/VN3NFwhCTxDWdXj2/YIwWkWclj3OChz
 dh6hCVjuHqGNy8oVh6fbSJ60LPe6LagztIFbk6xEvQ7MEeBe6fKYf1oDKJJBTMDkfNwp
 zwUpNVz3ZPdCim8AQdz+16N/o2qUeQPcur1OWO2lRnbV3ylNGcel/99MD8otz+brKNyE
 i9j/spjNM6oqJvcdY2kH9surQrgbqf3UF/rhyS3XLvO6MOKXaUOuGzWlYdnNluBeq7vw
 ahXl9ODLnMXgkP4HQ6YXQc0iIY+1/ag1BpPbtHkc25MW6Mp+o9WXybGeeRfZLcaeZf92
 nv7g==
X-Gm-Message-State: AOJu0YzYAifjtmi+7MqC9csKynkNx5g2nc+vnMsKmEeQ0bUbrmet0SyE
 wBSyhu9CuZq78QPEdRF78Vo=
X-Google-Smtp-Source: AGHT+IGf/Yyv7wSMS0i9F/tpUZxtbrw3bOb3lTUoMOnmKCIdtuSDBq6EtPRjB7mAxRnLhJyTVDlImQ==
X-Received: by 2002:ac2:5fa6:0:b0:50e:698c:2d93 with SMTP id
 s6-20020ac25fa6000000b0050e698c2d93mr685779lfe.57.1704659930101; 
 Sun, 07 Jan 2024 12:38:50 -0800 (PST)
Received: from mobilestation ([95.79.203.166])
 by smtp.gmail.com with ESMTPSA id
 w10-20020ac2598a000000b0050e7e38c9e0sm918192lfn.62.2024.01.07.12.38.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jan 2024 12:38:49 -0800 (PST)
Date: Sun, 7 Jan 2024 23:38:46 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Leong Ching Swee <leong.ching.swee@intel.com>
Message-ID: <xybq2523vgod6rbefw4zjs2kb2xtfmizecdwdjzyl6l2iovjqq@o3q4t2qny55o>
References: <20240105070925.2948871-1-leong.ching.swee@intel.com>
 <20240105070925.2948871-4-leong.ching.swee@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240105070925.2948871-4-leong.ching.swee@intel.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Teoh Ji Sheng <ji.sheng.teoh@intel.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 3/4] net: stmmac: Add support
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

On Fri, Jan 05, 2024 at 03:09:24PM +0800, Leong Ching Swee wrote:
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
>  .../ethernet/stmicro/stmmac/stmmac_platform.c | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index 70eadc83ca68..ae6859153e98 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -710,6 +710,10 @@ EXPORT_SYMBOL_GPL(devm_stmmac_probe_config_dt);
>  int stmmac_get_platform_resources(struct platform_device *pdev,
>  				  struct stmmac_resources *stmmac_res)
>  {

> +	char irq_name[9];
> +	int i;
> +	int irq;
> +

Reverse xmas tree please. Also what the point in having "i" and "irq"
defined separately? Wouldn't it be better to merge them into a single
statement:
+	char irq_name[9];
+	int i, irq;

>  	memset(stmmac_res, 0, sizeof(*stmmac_res));
>  
>  	/* Get IRQ information early to have an ability to ask for deferred
> @@ -743,6 +747,30 @@ int stmmac_get_platform_resources(struct platform_device *pdev,
>  		dev_info(&pdev->dev, "IRQ eth_lpi not found\n");
>  	}
>  

> +	/* For RX Channel */

Why haven't you added a more descriptive comment as I suggested on v1:

+	/* Get optional Tx/Rx DMA per-channel IRQs, which otherwise
+	 * are supposed to be delivered via the common MAC IRQ line
+	 */

?

> +	for (i = 0; i < MTL_MAX_RX_QUEUES; i++) {
> +		snprintf(irq_name, sizeof(irq_name), "dma_rx%i", i);
> +		irq = platform_get_irq_byname_optional(pdev, irq_name);
> +		if (irq == -EPROBE_DEFER)
> +			return irq;
> +		else if (irq < 0)
> +			break;
> +
> +		stmmac_res->rx_irq[i] = irq;
> +	}
> +

> +	/* For TX Channel */

* see the comment above

-Serge(y)

> +	for (i = 0; i < MTL_MAX_TX_QUEUES; i++) {
> +		snprintf(irq_name, sizeof(irq_name), "dma_tx%i", i);
> +		irq = platform_get_irq_byname_optional(pdev, irq_name);
> +		if (irq == -EPROBE_DEFER)
> +			return irq;
> +		else if (irq < 0)
> +			break;
> +
> +		stmmac_res->tx_irq[i] = irq;
> +	}
> +
>  	stmmac_res->addr = devm_platform_ioremap_resource(pdev, 0);
>  
>  	return PTR_ERR_OR_ZERO(stmmac_res->addr);
> -- 
> 2.34.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
