Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9777FAAFE
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Nov 2023 21:08:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A464C6B469;
	Mon, 27 Nov 2023 20:08:24 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73637C6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Nov 2023 20:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701115702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3O4ZRmciR+wHsAJ9W5qRG6w9TB013g8G4slV+9aIPT0=;
 b=JACWPN+4ACEM0y0YKqcNHfKoROvQAZ/1MIm7dDpPIK3ZD69hH2IV4BwoB9sk/iQxms+ucA
 BVgg5J7P2QK3uIzo7LiQ/hq8j0hIBIciET7jZc5l0Z3vnXeUVAG50+QXag1wc5oE3OCJL9
 7KK65N/e6e6B4AvGq+TsTmW3Avm0Nhc=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-353-Wrp1-LleO22Q0QmF-vQBag-1; Mon, 27 Nov 2023 15:08:21 -0500
X-MC-Unique: Wrp1-LleO22Q0QmF-vQBag-1
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-778b3526240so565013185a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Nov 2023 12:08:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701115700; x=1701720500;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3O4ZRmciR+wHsAJ9W5qRG6w9TB013g8G4slV+9aIPT0=;
 b=OcAF7/rziC2IsgvL2VtK1AIIsx4Z4xsofeQZh/vBVY+cIp5mJ+CLp3VicFQ0GgGn3g
 fdYEhoAGJzhfm3iTUBoF/fGSpSWGLCIUuHg++Z7UQZu/F3iHWfJi2/P5uxtxojoEPZHa
 friwEoFW38M+X6mpwjrH1pW4mh0HtMbUpE7DhwXk5jyZS3pwIjQEnuxNK3RvMPeA3gJz
 Dyr5J23rdFN9CM4Bfuis7CifL35lVUDsIWEajruHvog7YFEFgPmgEcLiiEIogniFhUcR
 PyIReMwcsoreyIoiJ2wmXMx8bipTbT7Hii1/anE5/EOjZzbvAmqvxkToF/696dV2HE1i
 O87w==
X-Gm-Message-State: AOJu0YyWsT94mbDGF16AdDzpmeav6kcIwMWfb6ZZAmVWE0j9bhkYi3Nx
 fe8IV46HXL40S3nMH1KHltPbjngVs5UCry/9WPbWEtPySQWX4FZY6ZXHDVldj4XYB0ngkyVErMu
 Xgc/gIKvWx9odEKvpm9q72ulBnZ0LOVu2b7AicLcp
X-Received: by 2002:a05:620a:4547:b0:77d:98a6:6482 with SMTP id
 u7-20020a05620a454700b0077d98a66482mr10312280qkp.5.1701115700644; 
 Mon, 27 Nov 2023 12:08:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFAOj5nW/hCUU/lQPFtlhep37vZxkbLPRtbKtgaPSf8NAsZmu5Q9f59kSPzVGwrfLyJ8/zyKQ==
X-Received: by 2002:a05:620a:4547:b0:77d:98a6:6482 with SMTP id
 u7-20020a05620a454700b0077d98a66482mr10312228qkp.5.1701115700263; 
 Mon, 27 Nov 2023 12:08:20 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::37])
 by smtp.gmail.com with ESMTPSA id
 dt32-20020a05620a47a000b0077d71d46887sm3926285qkb.112.2023.11.27.12.08.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 12:08:19 -0800 (PST)
Date: Mon, 27 Nov 2023 14:08:16 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Suraj Jaiswal <quic_jsuraj@quicinc.com>
Message-ID: <v45vmnfab7a2p5kikwz3stjvphddyxkxrtcnipcsptvcwohqrl@hzyz3hzddxnv>
References: <cover.1700737841.git.quic_jsuraj@quicinc.com>
 <62eaaace3713751cb1ecac3163e857737107ca0e.1700737841.git.quic_jsuraj@quicinc.com>
MIME-Version: 1.0
In-Reply-To: <62eaaace3713751cb1ecac3163e857737107ca0e.1700737841.git.quic_jsuraj@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Jose Abreu <joabreu@synopsys.com>, Conor Dooley <conor+dt@kernel.org>,
 kernel@quicinc.com, linux-kernel@vger.kernel.org,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Rob Herring <robh+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
 Prasad Sodagudi <psodagud@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Thu, Nov 23, 2023 at 05:08:15PM +0530, Suraj Jaiswal wrote:
> Add IRQ support to listen HW fault like ECC,DPP,FSM
> fault and print the fault information in the kernel
> log.
> 
> Signed-off-by: Suraj Jaiswal <quic_jsuraj@quicinc.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/common.h  |  1 +
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  2 ++
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 18 +++++++++++++++++
>  .../ethernet/stmicro/stmmac/stmmac_platform.c | 20 +++++++++++++++++++
>  4 files changed, 41 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
> index 6b935922054d..c4821c7ab674 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/common.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/common.h
> @@ -347,6 +347,7 @@ enum request_irq_err {
>  	REQ_IRQ_ERR_SFTY_UE,
>  	REQ_IRQ_ERR_SFTY_CE,
>  	REQ_IRQ_ERR_LPI,
> +	REQ_IRQ_ERR_SAFETY,
>  	REQ_IRQ_ERR_WOL,
>  	REQ_IRQ_ERR_MAC,
>  	REQ_IRQ_ERR_NO,
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> index cd7a9768de5f..8893d4b7fa38 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> @@ -33,6 +33,7 @@ struct stmmac_resources {
>  	int irq;
>  	int sfty_ce_irq;
>  	int sfty_ue_irq;
> +	int safety_common_intr;
>  	int rx_irq[MTL_MAX_RX_QUEUES];
>  	int tx_irq[MTL_MAX_TX_QUEUES];
>  };
> @@ -331,6 +332,7 @@ struct stmmac_priv {
>  	/* XDP BPF Program */
>  	unsigned long *af_xdp_zc_qps;
>  	struct bpf_prog *xdp_prog;
> +	int safety_common_intr;
>  };
>  
>  enum stmmac_state {
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 8964fc8a955f..2ae4f34444de 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3530,6 +3530,10 @@ static void stmmac_free_irq(struct net_device *dev,
>  		if (priv->wol_irq > 0 && priv->wol_irq != dev->irq)
>  			free_irq(priv->wol_irq, dev);
>  		fallthrough;
> +	case REQ_IRQ_ERR_SAFETY:
> +		if (priv->safety_common_intr > 0 && priv->safety_common_intr != dev->irq)
> +			free_irq(priv->safety_common_intr, dev);
> +		fallthrough;
>  	case REQ_IRQ_ERR_WOL:
>  		free_irq(dev->irq, dev);
>  		fallthrough;
> @@ -3736,6 +3740,18 @@ static int stmmac_request_irq_single(struct net_device *dev)
>  		}
>  	}
>  
> +	if (priv->safety_common_intr > 0 && priv->safety_common_intr != dev->irq) {
> +		ret = request_irq(priv->safety_common_intr, stmmac_safety_interrupt,
> +				  0, "safety", dev);
> +		if (unlikely(ret < 0)) {
> +			netdev_err(priv->dev,
> +				   "%s: alloc safety failed %d (error: %d)\n",
> +				   __func__, priv->safety_common_intr, ret);
> +			irq_err = REQ_IRQ_ERR_SAFETY;
> +			goto irq_error;
> +		}
> +	}
> +
>  	return 0;
>  
>  irq_error:
> @@ -7398,6 +7414,8 @@ int stmmac_dvr_probe(struct device *device,
>  	priv->lpi_irq = res->lpi_irq;
>  	priv->sfty_ce_irq = res->sfty_ce_irq;
>  	priv->sfty_ue_irq = res->sfty_ue_irq;
> +	priv->safety_common_intr = res->safety_common_intr;
> +
>  	for (i = 0; i < MTL_MAX_RX_QUEUES; i++)
>  		priv->rx_irq[i] = res->rx_irq[i];
>  	for (i = 0; i < MTL_MAX_TX_QUEUES; i++)
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index 1ffde555da47..bae1704d5f4b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -690,9 +690,25 @@ devm_stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
>  #endif /* CONFIG_OF */
>  EXPORT_SYMBOL_GPL(devm_stmmac_probe_config_dt);
>  
> +int stmmac_get_fault_intr_config(struct platform_device *pdev, struct stmmac_resources *res)
> +{
> +	int ret = 0;
> +
> +	res->safety_common_intr = platform_get_irq_byname(pdev, "safety");
> +
> +	if (res->safety_common_intr < 0) {
> +		if (res->safety_common_intr != -EPROBE_DEFER)
> +			dev_err(&pdev->dev, "safety IRQ configuration information not found\n");
> +		ret = 1;
> +	}
> +
> +	return ret;
> +}

I think other reviewers have covered most of what I want to say, but
I think this doesn't deserve its own function and should just be done
directly, as is done for eth_lpi for example. I think it also should be
considered an optional interrupt based on my understanding of its
purpose (just like eth_lpi).

> +
>  int stmmac_get_platform_resources(struct platform_device *pdev,
>  				  struct stmmac_resources *stmmac_res)
>  {
> +	int ret = 0;
>  	memset(stmmac_res, 0, sizeof(*stmmac_res));
>  
>  	/* Get IRQ information early to have an ability to ask for deferred
> @@ -702,6 +718,10 @@ int stmmac_get_platform_resources(struct platform_device *pdev,
>  	if (stmmac_res->irq < 0)
>  		return stmmac_res->irq;
>  
> +	ret = stmmac_get_fault_intr_config(pdev, stmmac_res);
> +	if (ret)
> +		dev_err(&pdev->dev, "Fault interrupt not present\n");
> +
>  	/* On some platforms e.g. SPEAr the wake up irq differs from the mac irq
>  	 * The external wake up irq can be passed through the platform code
>  	 * named as "eth_wake_irq"
> -- 
> 2.25.1
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
