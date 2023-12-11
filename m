Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B09D80CBE3
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Dec 2023 14:55:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB12FC6B458;
	Mon, 11 Dec 2023 13:55:35 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89700C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Dec 2023 13:55:34 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-50bf2d9b3fdso5804524e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Dec 2023 05:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702302934; x=1702907734;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Y/C7XRUm9qYzlb99kHURD4mz8PnbMXnLMuSDz0HuUZU=;
 b=bFkjA8tc2eqvtHdHpIZ49jmQPlJKCSYIECprffBhJks0KUtYRxbYXX9Ybes5Y7zuQy
 a0M/deVaAMsqnZfzNnR9JUxMJzcWu6I763caBL2y0jXQTxiT1RyKzW0KeCQcExoCi5aM
 O/UYLeZPPSbm7I3YZh1gLS+/+bMczgWj/88vhkFEBXcq2/lqQOxA/9La7FMMdDOZETf0
 AIOEC0P1HaOlvEb5dqLaiehWnrXyLoYDSEjBy1X6K0tz5p/4Fws28Q2l13QJxJH8YfNU
 Suj7ROwuoHkI1n4hw8BNmMEFZ33fRT7EthoMdYPKC4tZP2Eg7tHGyEIsvgMx1pTvU8IU
 W0Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702302934; x=1702907734;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y/C7XRUm9qYzlb99kHURD4mz8PnbMXnLMuSDz0HuUZU=;
 b=Dx8n76+i2DXID5UQmPK1FjGffASya3nC5Edr8kWoI99ylbS0Y4PwfxJvHLWM4RbenH
 f/backh+6sdmEar+s2Yes0haM3Au2WwwAsklfiK/1/FTPERogwPHX6zVX4TwaDcKNoic
 c7Wyfl/ImmhtiK6em1KSUCd1w2btuoGxGvzOfIw7NH6Z39O8D2sju9iHMNm3jRF/MYfc
 lADswsTQnQCeI1OhGYzuefdXqyZLhV6NVIqtTPTnOse2Leruq8E2kb9+lXXYIMqsC9r0
 3NqlQ1yg1Pb3yIx/RHbaEuZCDRRM1T7vGwhT3VL3wDAA75WyrfkNKWfRq61j3XfQ+Kj0
 Xx6A==
X-Gm-Message-State: AOJu0YxrJ/ounIoBWMHjV94E7GVakDigvCxWRrsDLFCfp62AmNaTIxRs
 RlwDECIyTi+a5W+kNt2do3w=
X-Google-Smtp-Source: AGHT+IGknyyl6hqy37057FSHne2s8bshLzwd0cwoLKxfp2llKbxhKDspkZNjGsBlV5gxqynEerQROA==
X-Received: by 2002:a19:4319:0:b0:50b:f147:faf7 with SMTP id
 q25-20020a194319000000b0050bf147faf7mr1602044lfa.66.1702302933389; 
 Mon, 11 Dec 2023 05:55:33 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a056512128a00b0050bbb90533bsm1094171lfs.186.2023.12.11.05.55.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 05:55:32 -0800 (PST)
Date: Mon, 11 Dec 2023 16:55:29 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Suraj Jaiswal <quic_jsuraj@quicinc.com>
Message-ID: <fa362vwmgtfs2iofwteuk3mwh22eu7nds4dh2rw3cax5edh4kp@gf3bhl526yla>
References: <20231211080153.3005122-1-quic_jsuraj@quicinc.com>
 <20231211080153.3005122-4-quic_jsuraj@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231211080153.3005122-4-quic_jsuraj@quicinc.com>
Cc: Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 kernel@quicinc.com, Jose Abreu <joabreu@synopsys.com>,
 Andy Gross <agross@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Prasad Sodagudi <psodagud@quicinc.com>, Andrew Halaney <ahalaney@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, linux-arm-msm@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v5 3/3] net: stmmac: Add driver
 support for DWMAC5 safety IRQ support
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

> [PATCH net-next v5 3/3] net: stmmac: Add driver support for DWMAC5 safety IRQ support
On Mon, Dec 11, 2023 at 01:31:53PM +0530, Suraj Jaiswal wrote:
> Add IRQ support to listen HW safety IRQ like ECC(error
> correction code), DPP(data path parity), FSM(finite state
> machine) fault and print the fault information in the kernel
> log.

I guess the subject and the patch log are a bit misleading. Safety
IRQs have been supported by the kernel since commit 8bf993a5877e
("net: stmmac: Add support for DWMAC5 and implement Safety Features").
Meanwhile based on the patch body what you are doing here is adding
the common safety IRQ line support. Please fix it.

> 
> Signed-off-by: Suraj Jaiswal <quic_jsuraj@quicinc.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/common.h   |  1 +
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h   |  2 ++
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c  | 18 ++++++++++++++++++
>  .../ethernet/stmicro/stmmac/stmmac_platform.c  |  9 +++++++++
>  4 files changed, 30 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
> index 721c1f8e892f..cb9645fe16d8 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/common.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/common.h
> @@ -347,6 +347,7 @@ enum request_irq_err {

>  	REQ_IRQ_ERR_SFTY_UE,
>  	REQ_IRQ_ERR_SFTY_CE,
>  	REQ_IRQ_ERR_LPI,
> +	REQ_IRQ_ERR_SAFETY,

1. For the sake of unification please use the REQ_IRQ_ERR_SFTY id
instead, since the individual UE and CE IRQs have already been defined
that way.

2. For readability please group up the IRQs of the same type. Like
this:
+	REQ_IRQ_ERR_SFTY,
  	REQ_IRQ_ERR_SFTY_UE,
 	REQ_IRQ_ERR_SFTY_CE,
* Note it would be also better to have the common IRQ ID being defined
* above the individual ones.

>  	REQ_IRQ_ERR_WOL,
>  	REQ_IRQ_ERR_MAC,
>  	REQ_IRQ_ERR_NO,
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> index 9f89acf31050..aa2eda6fb927 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> @@ -33,6 +33,7 @@ struct stmmac_resources {
>  	int irq;
>  	int sfty_ce_irq;
>  	int sfty_ue_irq;

> +	int safety_common_irq;

ditto:

+	int sfty_irq;
 	int sfty_ce_irq;
 	int sfty_ue_irq;

Note there is no need in the "common" word in the name, just sfty_irq
is enough to infer that it's a common IRQ number.

>  	int rx_irq[MTL_MAX_RX_QUEUES];
>  	int tx_irq[MTL_MAX_TX_QUEUES];
>  };
> @@ -299,6 +300,7 @@ struct stmmac_priv {
>  	unsigned long active_vlans[BITS_TO_LONGS(VLAN_N_VID)];

>  	int sfty_ce_irq;
>  	int sfty_ue_irq;
> +	int safety_common_irq;

ditto:
+	int sfty_irq;
 	int sfty_ce_irq;
 	int sfty_ue_irq;

>  	int rx_irq[MTL_MAX_RX_QUEUES];
>  	int tx_irq[MTL_MAX_TX_QUEUES];
>  	/*irq name */
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 47de466e432c..e4a0d9ec8b3f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3592,6 +3592,10 @@ static void stmmac_free_irq(struct net_device *dev,
>  		if (priv->wol_irq > 0 && priv->wol_irq != dev->irq)
>  			free_irq(priv->wol_irq, dev);
>  		fallthrough;

> +	case REQ_IRQ_ERR_SAFETY:
> +		if (priv->safety_common_irq > 0 && priv->safety_common_irq != dev->irq)
> +			free_irq(priv->safety_common_irq, dev);

s/SAFETY/SFTY
s/common_//
s/safety/sfty

> +		fallthrough;
>  	case REQ_IRQ_ERR_WOL:
>  		free_irq(dev->irq, dev);
>  		fallthrough;
> @@ -3798,6 +3802,18 @@ static int stmmac_request_irq_single(struct net_device *dev)
>  		}
>  	}
>  

> +	if (priv->safety_common_irq > 0 && priv->safety_common_irq != dev->irq) {

s/common_//
s/safety/sfty

> +		ret = request_irq(priv->safety_common_irq, stmmac_safety_interrupt,

s/safety_common_irq/sfty_irq

> +				  0, "safety", dev);

The rest of the IRQ names are determined as:

		int_name = priv->int_name_sfty;
		sprintf(int_name, "%s:%s", dev->name, "safety");
		ret = request_irq(priv->sfty_irq,
				  stmmac_safety_interrupt,
				  0, int_name, dev);

For maintainability it would be better to keep the code unified and
have the same pattern implemented here too.

> +		if (unlikely(ret < 0)) {
> +			netdev_err(priv->dev,
> +				   "%s: alloc safety failed %d (error: %d)\n",

> +				   __func__, priv->safety_common_irq, ret);
> +			irq_err = REQ_IRQ_ERR_SAFETY;

s/common_//
s/safety/sfty
s/SAFETY/SFTY

> +			goto irq_error;
> +		}
> +	}
> +
>  	return 0;
>  
>  irq_error:
> @@ -7464,6 +7480,8 @@ int stmmac_dvr_probe(struct device *device,
>  	priv->lpi_irq = res->lpi_irq;
>  	priv->sfty_ce_irq = res->sfty_ce_irq;
>  	priv->sfty_ue_irq = res->sfty_ue_irq;

> +	priv->safety_common_irq = res->safety_common_irq;
> +

s/common_//
s/safety/sfty

>  	for (i = 0; i < MTL_MAX_RX_QUEUES; i++)
>  		priv->rx_irq[i] = res->rx_irq[i];
>  	for (i = 0; i < MTL_MAX_TX_QUEUES; i++)
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index 1ffde555da47..41a4a253d75b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -726,6 +726,15 @@ int stmmac_get_platform_resources(struct platform_device *pdev,
>  		dev_info(&pdev->dev, "IRQ eth_lpi not found\n");
>  	}
>  

> +	stmmac_res->safety_common_irq =
> +		platform_get_irq_byname_optional(pdev, "safety");

Please define the IRQ resource name as "sfty" to be looking as the
individual safety IRQ names.

> +
> +	if (stmmac_res->safety_common_irq < 0) {
> +		if (stmmac_res->safety_common_irq == -EPROBE_DEFER)

s/common_//
s/safety/sfty

-Serge(y)

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
