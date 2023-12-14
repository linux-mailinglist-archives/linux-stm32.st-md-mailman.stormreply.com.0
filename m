Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9E0813441
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Dec 2023 16:12:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE851C6B47D;
	Thu, 14 Dec 2023 15:12:20 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F9CAC6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Dec 2023 15:12:19 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-50e18689828so735915e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Dec 2023 07:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702566738; x=1703171538;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3L9IW1XXYJamkBl9kuyV2sbbsqpozouQnx6/10RpzLw=;
 b=CcbYTx6UL2rSmhu560bnFZt9yipcT2oe1ng9pohCG2q8fUIdIJXN44g0DAcyNxdZpq
 s85KMTWGCHiR1jL4tlcoaHJNRMPD4VR6wxlBgPvIBct9f3EVLl9xtlNtrUppm4hOMjCh
 TojCPAfVL+wGCDFJFs0yPJc4BRcEHzWwO3ijx8Z1+CXCJu3/1OUWgpCOzZJ5NHAFN4E9
 YDlMCbuvZY+cwKg434ngHx0DolhjPjKU9t0UxdU7QVosisfZ6HSXKOEFtuZ9otVWlG1x
 SgSp5Ha9MffDwZPiYYqTIFxVXssKd5ys9SR1+DwzcklYSWjELNkms4m4fTsM+dTagt4y
 O4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702566738; x=1703171538;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3L9IW1XXYJamkBl9kuyV2sbbsqpozouQnx6/10RpzLw=;
 b=IoWpWYFi6WTI7WbUH2NYGX5RGbRIa/7apNjVqRLBbYpRlpiUZknDN66d1UWXqK0vhD
 5+WIXatXsfROmVf4PI1H2+ESeF7GhL7sx8vG9wSo8dVUs8OiwAdU3tOq4xjqFWMm4XbO
 dFv2MFs/mtu8iWU+ZJWFcciXr3vh7e49mZe1jeLOJPONFhTgyzGZtjdrjUoVd3EbFpIa
 45QiqWVZC3sG3qI1nBX6nY1AiKNW11/6nfI43CD+GO6OqPyQOTJf9eyrE+pJoBpHMSBS
 HfOcEhP6reGl/tfmC2SRlWv/qS+cAT9BMz6+5WlaUy5rHaAviYe9YA2H4ID2X0V4URh5
 dTTw==
X-Gm-Message-State: AOJu0YwgGORqk3dU3yWzVVm/TYX1akrmS1qgvX8TqCjjrS1EvER7kbmF
 e5sb5hqjBUfnuoZbIEzV/9E=
X-Google-Smtp-Source: AGHT+IEP3u4O2lNbWkKG8W6U43RJc9F6kHw2aeiH1kBN6pG9EFt7MG3Lv/BMC49bba7SPP2qAPULeg==
X-Received: by 2002:ac2:5201:0:b0:50b:f9b2:cf2 with SMTP id
 a1-20020ac25201000000b0050bf9b20cf2mr4406925lfl.40.1702566738075; 
 Thu, 14 Dec 2023 07:12:18 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 j26-20020ac2455a000000b0050bbad31c64sm1885297lfm.172.2023.12.14.07.12.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 07:12:17 -0800 (PST)
Date: Thu, 14 Dec 2023 18:12:14 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Suraj Jaiswal <quic_jsuraj@quicinc.com>
Message-ID: <bcppwdnscrebqtsap2fyfd6ltpi4al3ojm5dqytzp37h7y7rdy@zqy6bncdhzl2>
References: <20231212115841.3800241-1-quic_jsuraj@quicinc.com>
 <20231212115841.3800241-4-quic_jsuraj@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231212115841.3800241-4-quic_jsuraj@quicinc.com>
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
Subject: Re: [Linux-stm32] [PATCH net-next v6 3/3] net: stmmac: Add driver
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

On Tue, Dec 12, 2023 at 05:28:41PM +0530, Suraj Jaiswal wrote:
> Add support to listen HW safety IRQ like ECC(error
> correction code), DPP(data path parity), FSM(finite state
> machine) fault in common IRQ line.
> 
> Signed-off-by: Suraj Jaiswal <quic_jsuraj@quicinc.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/common.h  |  1 +
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  3 +++
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 21 +++++++++++++++++++
>  .../ethernet/stmicro/stmmac/stmmac_platform.c |  9 ++++++++
>  4 files changed, 34 insertions(+)
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
> index 47de466e432c..6cf289f192a7 100644
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
> @@ -3759,6 +3763,7 @@ static int stmmac_request_irq_single(struct net_device *dev)
>  	struct stmmac_priv *priv = netdev_priv(dev);
>  	enum request_irq_err irq_err;
>  	int ret;

> +	char *int_name;

See my comment below.

>  
>  	ret = request_irq(dev->irq, stmmac_interrupt,
>  			  IRQF_SHARED, dev->name, dev);
> @@ -3798,6 +3803,20 @@ static int stmmac_request_irq_single(struct net_device *dev)
>  		}
>  	}
>  

> +	if (priv->sfty_irq > 0 && priv->sfty_irq != dev->irq) {
> +		int_name = priv->int_name_sfty;
> +		sprintf(int_name, "%s:%s", dev->name, "safety");
> +		ret = request_irq(priv->sfty_irq, stmmac_safety_interrupt,
> +				  0, int_name, dev);
> +		if (unlikely(ret < 0)) {
> +			netdev_err(priv->dev,
> +				   "%s: alloc safety failed %d (error: %d)\n",
> +				   __func__, priv->sfty_irq, ret);
> +			irq_err = REQ_IRQ_ERR_SFTY;
> +			goto irq_error;
> +		}
> +	}
> +

Omg, I thought this change belonged to stmmac_request_irq_multi_msi().
My bad, sorry. Please move the code above to
stmmac_request_irq_multi_msi() and get back the part in
stmmac_request_irq_single() as it was in v5, but instead of specifying
"safety" IRQ name use "dev->name" as the rest of similar code snippets
in here have:

+	if (priv->sfty_irq > 0 && priv->sfty_irq != dev->irq) {
+		ret = request_irq(priv->sfty_irq, stmmac_safety_interrupt,
+				  0, dev->name, dev);
+		if (unlikely(ret < 0)) {
+			netdev_err(priv->dev,
+				   "%s: alloc safety failed %d (error: %d)\n",
+				   __func__, priv->sfty_irq, ret);
+			irq_err = REQ_IRQ_ERR_SFTY;
+			goto irq_error;
+		}
+	}

I guess at some point afterwards we'll need to refactor the IRQs
request part of this driver: replace stmmac_request_irq_single() body
with the upper part of the stmmac_request_irq_multi_msi() method and
then just make the former method being called from the later one...

>  	return 0;
>  
>  irq_error:
> @@ -7462,8 +7481,10 @@ int stmmac_dvr_probe(struct device *device,
>  	priv->dev->irq = res->irq;
>  	priv->wol_irq = res->wol_irq;
>  	priv->lpi_irq = res->lpi_irq;
> +	priv->sfty_irq = res->sfty_irq;
>  	priv->sfty_ce_irq = res->sfty_ce_irq;
>  	priv->sfty_ue_irq = res->sfty_ue_irq;

> +

Please drop this change. The code below is attached to the code above
because it basically does the same but in the loop. 

>  	for (i = 0; i < MTL_MAX_RX_QUEUES; i++)
>  		priv->rx_irq[i] = res->rx_irq[i];
>  	for (i = 0; i < MTL_MAX_TX_QUEUES; i++)
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index 1ffde555da47..3808a3225a7d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -726,6 +726,15 @@ int stmmac_get_platform_resources(struct platform_device *pdev,
>  		dev_info(&pdev->dev, "IRQ eth_lpi not found\n");
>  	}
>  
> +	stmmac_res->sfty_irq =
> +		platform_get_irq_byname_optional(pdev, "sfty");

> +

Please drop this change too. It's normal to have a method call
attached to the error check statement especially seeing the rest of
the similar code snippets are designed that way in this function.

-Serge(y)

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
