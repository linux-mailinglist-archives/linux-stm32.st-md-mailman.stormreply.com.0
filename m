Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BF681B656
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Dec 2023 13:49:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 169A8C6C841;
	Thu, 21 Dec 2023 12:49:30 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 117D0C6C820
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Dec 2023 12:49:28 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-50e34a72660so981184e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Dec 2023 04:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703162968; x=1703767768;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=g/mzU2hT9PSnrGwqsNWl+y1l0fBpKuzZ5AOH7TNPFbk=;
 b=eRGS98WgLu79e7DN5nEVKBsl76AQg+vddumkZw3UhQ9FW2p220knlWMMtdKlqeNvBB
 gHH/+ByT3LlwGRN8DUnKxrgLFxR1VVA97Eq6czRMXb8d+BuqkGipNtPM/RVqEOyJxZUd
 E6auyMhnV6OGov1CnXAGUCtqjrP+XMm2+LHtFy29or21CL0kZcl2BwpeIZ3cJxD3HZY/
 XCHdGdyqz2LTxYZftY+sdHGLZLZ9fFAb+wvpn6ZE2cCVf2Z6iCtOHlNNwYeo5XccLpop
 S/IyCXgj99whYQfIgF24gh4HDQvZwm50nSC+E86PLpkgwXSy7mg1COjdmrdpzF0Ksxou
 Q2+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703162968; x=1703767768;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g/mzU2hT9PSnrGwqsNWl+y1l0fBpKuzZ5AOH7TNPFbk=;
 b=W6g6ePz/6r0hYG/3DxcLHJaliZ4Qw5n6bEmZG9sD40fbeVvORhK5yool0R+RFU/VNj
 Nvbunc9hzWoG+xRFsjKggXnVtu3o6ZKPYENp5HkU2wFMp0Lmw2nog7WrWQmLOYGhVSKq
 xmjenvSo0OY9h300ffPiDSyuaFtqr8/ZFnavbsSeKLPpmb5Y2M3aS8LzysD0Iq96zhBj
 I2uB6P/8nE6BtlSsvsgQa/He4OFCxAGfJJhLZHZteFmdU6f/w/G513Ggfs6AMGYN2wtB
 DUfjxyKVlNiCR/8gKfX1NKzkjsqqan9Aj229s+eh9/BtJoehV0oj4HeghX+S1H6J7YxL
 Iy5Q==
X-Gm-Message-State: AOJu0Yywxm2ZUSzw/bqu6bpZ1SfPAYjWbVPrtkqqj/lB7fNCXfoPOg+h
 9uhxAyf1MjJNdXwPeNNe+3U=
X-Google-Smtp-Source: AGHT+IGyV6f8UBheAjNEECK8PtWI9VmNULPlJgekTe+vJCU+PbbS1a1JmkG5ZHVdEmvAloCVKJ4sGA==
X-Received: by 2002:ac2:596d:0:b0:50d:179b:b38d with SMTP id
 h13-20020ac2596d000000b0050d179bb38dmr8710227lfp.45.1703162967896; 
 Thu, 21 Dec 2023 04:49:27 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 d19-20020a193853000000b0050bf16efc9csm266216lfj.308.2023.12.21.04.49.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 04:49:27 -0800 (PST)
Date: Thu, 21 Dec 2023 15:49:23 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Suraj Jaiswal <quic_jsuraj@quicinc.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Message-ID: <yromhtr73rwsr6hizr4tq37vfvyzfue7wzpmufqyscwspzffza@uhfcrn573acd>
References: <20231221073620.232619-1-quic_jsuraj@quicinc.com>
 <20231221073620.232619-4-quic_jsuraj@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231221073620.232619-4-quic_jsuraj@quicinc.com>
Cc: Rob Herring <robh@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Conor Dooley <conor+dt@kernel.org>, kernel@quicinc.com,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Andy Gross <agross@kernel.org>, Prasad Sodagudi <psodagud@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH net-next v8 3/3] net: stmmac: Add driver
 support for DWMAC5 common safety IRQ
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

Hi Suraj

On Thu, Dec 21, 2023 at 01:06:20PM +0530, Suraj Jaiswal wrote:
> Add support to listen HW safety IRQ like ECC(error
> correction code), DPP(data path parity), FSM(finite state
> machine) fault in common IRQ line.
> 
> Signed-off-by: Suraj Jaiswal <quic_jsuraj@quicinc.com>

Thanks for taking my notes into account. One more comment is further
below.

> ---
>  drivers/net/ethernet/stmicro/stmmac/common.h  |  1 +
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  3 ++
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 37 +++++++++++++++++++
>  .../ethernet/stmicro/stmmac/stmmac_platform.c |  8 ++++
>  4 files changed, 49 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
> index 721c1f8e892f..b9233b09b80f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/common.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/common.h
> @@ -344,6 +344,7 @@ enum request_irq_err {
>  	REQ_IRQ_ERR_ALL,
>  	REQ_IRQ_ERR_TX,
>  	REQ_IRQ_ERR_RX,
> +	REQ_IRQ_ERR_SFTY,
>  	REQ_IRQ_ERR_SFTY_UE,
>  	REQ_IRQ_ERR_SFTY_CE,
>  	REQ_IRQ_ERR_LPI,
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> index 9f89acf31050..ca3d93851bed 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> @@ -31,6 +31,7 @@ struct stmmac_resources {
>  	int wol_irq;
>  	int lpi_irq;
>  	int irq;
> +	int sfty_irq;
>  	int sfty_ce_irq;
>  	int sfty_ue_irq;
>  	int rx_irq[MTL_MAX_RX_QUEUES];
> @@ -297,6 +298,7 @@ struct stmmac_priv {
>  	void __iomem *ptpaddr;
>  	void __iomem *estaddr;
>  	unsigned long active_vlans[BITS_TO_LONGS(VLAN_N_VID)];
> +	int sfty_irq;
>  	int sfty_ce_irq;
>  	int sfty_ue_irq;
>  	int rx_irq[MTL_MAX_RX_QUEUES];
> @@ -305,6 +307,7 @@ struct stmmac_priv {
>  	char int_name_mac[IFNAMSIZ + 9];
>  	char int_name_wol[IFNAMSIZ + 9];
>  	char int_name_lpi[IFNAMSIZ + 9];
> +	char int_name_sfty[IFNAMSIZ + 10];
>  	char int_name_sfty_ce[IFNAMSIZ + 10];
>  	char int_name_sfty_ue[IFNAMSIZ + 10];
>  	char int_name_rx_irq[MTL_MAX_TX_QUEUES][IFNAMSIZ + 14];
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 47de466e432c..7d4e827dfeab 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3592,6 +3592,10 @@ static void stmmac_free_irq(struct net_device *dev,
>  		if (priv->wol_irq > 0 && priv->wol_irq != dev->irq)
>  			free_irq(priv->wol_irq, dev);
>  		fallthrough;
> +	case REQ_IRQ_ERR_SFTY:
> +		if (priv->sfty_irq > 0 && priv->sfty_irq != dev->irq)
> +			free_irq(priv->sfty_irq, dev);
> +		fallthrough;
>  	case REQ_IRQ_ERR_WOL:
>  		free_irq(dev->irq, dev);
>  		fallthrough;
> @@ -3661,6 +3665,23 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
>  		}
>  	}
>  
> +	/* Request the common Safety Feature Correctible/Uncorrectible
> +	 * Error line in case of another line is used
> +	 */
> +	if (priv->sfty_irq > 0 && priv->sfty_irq != dev->irq) {
> +		int_name = priv->int_name_sfty;
> +		sprintf(int_name, "%s:%s", dev->name, "safety");
> +		ret = request_irq(priv->sfty_irq, stmmac_safety_interrupt,
> +				  0, int_name, dev);
> +		if (unlikely(ret < 0)) {
> +			netdev_err(priv->dev,
> +				   "%s: alloc sfty MSI %d (error: %d)\n",
> +				   __func__, priv->sfty_irq, ret);
> +			irq_err = REQ_IRQ_ERR_SFTY;
> +			goto irq_error;
> +		}
> +	}
> +
>  	/* Request the Safety Feature Correctible Error line in
>  	 * case of another line is used
>  	 */
> @@ -3798,6 +3819,21 @@ static int stmmac_request_irq_single(struct net_device *dev)
>  		}
>  	}
>  
> +	/* Request the common Safety Feature Correctible/Uncorrectible
> +	 * Error line in case of another line is used
> +	 */
> +	if (priv->sfty_irq > 0 && priv->sfty_irq != dev->irq) {

> +		ret = request_irq(priv->sfty_irq, stmmac_safety_interrupt,
> +				  IRQF_SHARED, dev->name, dev);

Just noticed yesterday that stmmac_safety_interrupt() is also called
from the stmmac_interrupt() handler which is supposed to be registered
on the generic "mac" IRQ. Won't it cause races around the CSRs
(doubtfully but still worth to note) and the errors handling
(stmmac_global_err()) in case if both IRQs are raised simultaneously?
At the very least it looks suspicious and worth double-checking.

I also found out that nobody seemed to care that the same handler is
registered on MAC, WoL and LPI IRQ lines. Hmm, no race-related
problems have been reported so far for the platforms with separate
WoL/LPI IRQs. It's either a lucky coincident or the IRQs are always
assigned to the same CPU or the IRQs handle is indeed free of races.
In anyway it looks suspicious too. At the very least AFAICS the DMA
IRQ-handler is indeed racy on the status CSR access. It isn't
cleared-on-read, but write-one-to-clear. So the statistics might be
calculated more than once for the same CSR state. There might be some
other problems I failed to spot on the first glance.

David, Eric, Jacub, Paolo, your opinion about the note above?

-Serge(y)

> +		if (unlikely(ret < 0)) {
> +			netdev_err(priv->dev,
> +				   "%s: ERROR: allocating the sfty IRQ %d (%d)\n",
> +				   __func__, priv->sfty_irq, ret);
> +			irq_err = REQ_IRQ_ERR_SFTY;
> +			goto irq_error;
> +		}
> +	}
> +
>  	return 0;
>  
>  irq_error:
> @@ -7462,6 +7498,7 @@ int stmmac_dvr_probe(struct device *device,
>  	priv->dev->irq = res->irq;
>  	priv->wol_irq = res->wol_irq;
>  	priv->lpi_irq = res->lpi_irq;
> +	priv->sfty_irq = res->sfty_irq;
>  	priv->sfty_ce_irq = res->sfty_ce_irq;
>  	priv->sfty_ue_irq = res->sfty_ue_irq;
>  	for (i = 0; i < MTL_MAX_RX_QUEUES; i++)
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index 70eadc83ca68..ab250161fd79 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -743,6 +743,14 @@ int stmmac_get_platform_resources(struct platform_device *pdev,
>  		dev_info(&pdev->dev, "IRQ eth_lpi not found\n");
>  	}
>  
> +	stmmac_res->sfty_irq =
> +		platform_get_irq_byname_optional(pdev, "sfty");
> +	if (stmmac_res->sfty_irq < 0) {
> +		if (stmmac_res->sfty_irq == -EPROBE_DEFER)
> +			return -EPROBE_DEFER;
> +		dev_info(&pdev->dev, "IRQ safety IRQ not found\n");
> +	}
> +
>  	stmmac_res->addr = devm_platform_ioremap_resource(pdev, 0);
>  
>  	return PTR_ERR_OR_ZERO(stmmac_res->addr);
> -- 
> 2.25.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
