Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 595C281A171
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Dec 2023 15:50:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19DE3C6B477;
	Wed, 20 Dec 2023 14:50:13 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F1F8C6B45E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Dec 2023 14:50:12 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-50e23a4df33so6249573e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Dec 2023 06:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703083811; x=1703688611;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tQMVlWraizGAsp+Xq1UapuY9LfPT8dVSobx1WZx4NDU=;
 b=FPSNOVNv84GAUiDH0XJG3cIh/EwTowEdItZs9mJZoreyZeo4NP9QLklC2XTbmvcBCx
 EqrgcOipvJJGle3zWvV8mQD4GGg/6Nl2OC8jW9spz21m3rxWbtoAqkoH2NYg4Q8VAII4
 x/r42LyhkSZtwpLJaDYgv1CnuZRcAIsedl6dO60EgR3ydHwta+GqCLv9LS7P5KAsNRsT
 MlikMm/VwF7rZWb6/IwJ5rKIzqAmTuW4NV5VWk4yU2yF0pX+skKUjUd6vHrC4t4MyjxI
 3Rad9JSzBcNK/6DN8793N7J/di8IfCb0GURUymHfh7F5n8Sd0z5gF9cv8bpUlVZ4geak
 bQyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703083811; x=1703688611;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tQMVlWraizGAsp+Xq1UapuY9LfPT8dVSobx1WZx4NDU=;
 b=DbIhVPFM0xg8zG915251ZeD0k4+orE4pRYcZ+QbpdSBEv728dCcBGXoRT9rwRRNDm/
 k6NPa9mX1MJXilyG9Z1O7GxM9QOqmTFdd/Zy6j4PvkQf59iaB6PXGjWZWPMqctTxqqvo
 prE8/tbwr/4GVCOM495qVtWiu9fFTwnd6mOvBIWCPrlZw8y6SFfz2UXj41idetzrTpIn
 AEOJSX6VA/cP8655rs3VZLIsLpoYrZ9X2wPuTV+aZeaJwH//g90Np38yeLm4+N4KfrrX
 VEIXiIWw89NfC9uw/De1gPF73+cmHuirdWjF0q1nPDByKGG12dTro8s2ItsPxM2eu3ZH
 BqyQ==
X-Gm-Message-State: AOJu0YyRhfbwOkxiqDg80h5m72bczdziyu6aoiJgT/tNGYtxgN+bqcI2
 l86IUgLrk+wishh+Z0GoPig=
X-Google-Smtp-Source: AGHT+IH2QPqNZG3UOvLCupNMT1tPQwsk3NsXXG5geXiKr9gUlC2O7XrU3eI+6JRjQfPd86pupnKiYw==
X-Received: by 2002:a05:6512:239a:b0:50e:4ec6:ed15 with SMTP id
 c26-20020a056512239a00b0050e4ec6ed15mr1194151lfv.107.1703083810905; 
 Wed, 20 Dec 2023 06:50:10 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 b11-20020a0565120b8b00b0050e40a2bc97sm615311lfv.13.2023.12.20.06.50.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Dec 2023 06:50:10 -0800 (PST)
Date: Wed, 20 Dec 2023 17:50:05 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Suraj Jaiswal <quic_jsuraj@quicinc.com>
Message-ID: <irmn42brbxjwz45gh7hoay4aeollnq7gnzkuyuzjxjyh3syrst@mvgm7vecrhna>
References: <20231219104815.3443231-1-quic_jsuraj@quicinc.com>
 <20231219104815.3443231-4-quic_jsuraj@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="lffsxbm2gt2npdfi"
Content-Disposition: inline
In-Reply-To: <20231219104815.3443231-4-quic_jsuraj@quicinc.com>
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
Subject: Re: [Linux-stm32] [PATCH net-next v7 3/3] net: stmmac: Add driver
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
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--lffsxbm2gt2npdfi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Suraj

On Tue, Dec 19, 2023 at 04:18:15PM +0530, Suraj Jaiswal wrote:
> Add support to listen HW safety IRQ like ECC(error
> correction code), DPP(data path parity), FSM(finite state
> machine) fault in common IRQ line.
> 
> Signed-off-by: Suraj Jaiswal <quic_jsuraj@quicinc.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/common.h  |  1 +
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  2 ++
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 35 +++++++++++++++++++
>  .../ethernet/stmicro/stmmac/stmmac_platform.c |  8 +++++
>  4 files changed, 46 insertions(+)
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
> index 9f89acf31050..9aeaca01cace 100644
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
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 47de466e432c..f6639ffb017e 100644
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
> @@ -3661,6 +3665,21 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
>  		}
>  	}
>  
> +	/* Request the common Safety Feature Correctible/Uncorrectible
> +	 * Error line in case of another line is used
> +	 */

> +	if (priv->sfty_irq > 0 && priv->sfty_irq != dev->irq) {
> +		ret = request_irq(priv->sfty_irq, stmmac_safety_interrupt,
> +				  0, dev->name, dev);

Not entirely what I asked. What I asked was to make the code unified in
the respective IRQ-request methods. You just copy-and-pasted the same
code snippet in both functions. To see what I meant please find the
diff attached to this message. It's applicable on top of this patch.

> +		if (unlikely(ret < 0)) {
> +			netdev_err(priv->dev,

> +				   "%s: alloc safety failed %d (error: %d)\n",
> +				   __func__, priv->sfty_irq, ret);

This looks different than the rest of the error messages in this
method (see the attached diff).

> +			irq_err = REQ_IRQ_ERR_SFTY;
> +			goto irq_error;
> +		}
> +	}
> +
>  	/* Request the Safety Feature Correctible Error line in
>  	 * case of another line is used
>  	 */
> @@ -3798,6 +3817,21 @@ static int stmmac_request_irq_single(struct net_device *dev)
>  		}
>  	}
>  
> +	/* Request the common Safety Feature Correctible/Uncorrectible
> +	 * Error line in case of another line is used
> +	 */
> +	if (priv->sfty_irq > 0 && priv->sfty_irq != dev->irq) {

> +		ret = request_irq(priv->sfty_irq, stmmac_safety_interrupt,
> +				  0, dev->name, dev);

IRQF_SHARED?

> +		if (unlikely(ret < 0)) {

> +			netdev_err(priv->dev,
> +				   "%s: alloc safety failed %d (error: %d)\n",
> +				   __func__, priv->sfty_irq, ret);

This also looks different than the rest of the error messages in this 
method (see the attached diff).

Some other comments I'll send to v8 after all the above finally fixed.

-Serge(y)

> +			irq_err = REQ_IRQ_ERR_SFTY;
> +			goto irq_error;
> +		}
> +	}
> +
>  	return 0;
>  
>  irq_error:
> @@ -7462,6 +7496,7 @@ int stmmac_dvr_probe(struct device *device,
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

--lffsxbm2gt2npdfi
Content-Type: text/x-patch; charset=us-ascii
Content-Disposition: attachment; filename="common_sfty_irq.diff"

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index f9d80fc00cb8..2bb3f1adbb61 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -329,6 +329,7 @@ struct stmmac_priv {
 	char int_name_mac[IFNAMSIZ + 9];
 	char int_name_wol[IFNAMSIZ + 9];
 	char int_name_lpi[IFNAMSIZ + 9];
+	char int_name_sfty[IFNAMSIZ + 10];
 	char int_name_sfty_ce[IFNAMSIZ + 10];
 	char int_name_sfty_ue[IFNAMSIZ + 10];
 	char int_name_rx_irq[MTL_MAX_TX_QUEUES][IFNAMSIZ + 14];
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index e49b1306b338..93439a14378f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3539,11 +3539,13 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
 	 * Error line in case of another line is used
 	 */
 	if (priv->sfty_irq > 0 && priv->sfty_irq != dev->irq) {
+		int_name = priv->int_name_sfty;
+		sprintf(int_name, "%s:%s", dev->name, "safety");
 		ret = request_irq(priv->sfty_irq, stmmac_safety_interrupt,
-				  0, dev->name, dev);
+				  0, int_name, dev);
 		if (unlikely(ret < 0)) {
 			netdev_err(priv->dev,
-				   "%s: alloc safety failed %d (error: %d)\n",
+				   "%s: alloc sfty MSI %d (error: %d)\n",
 				   __func__, priv->sfty_irq, ret);
 			irq_err = REQ_IRQ_ERR_SFTY;
 			goto irq_error;
@@ -3692,10 +3694,10 @@ static int stmmac_request_irq_single(struct net_device *dev)
 	 */
 	if (priv->sfty_irq > 0 && priv->sfty_irq != dev->irq) {
 		ret = request_irq(priv->sfty_irq, stmmac_safety_interrupt,
-				  0, dev->name, dev);
+				  IRQF_SHARED, dev->name, dev);
 		if (unlikely(ret < 0)) {
 			netdev_err(priv->dev,
-				   "%s: alloc safety failed %d (error: %d)\n",
+				   "%s: ERROR: allocating the sfty IRQ %d (%d)\n",
 				   __func__, priv->sfty_irq, ret);
 			irq_err = REQ_IRQ_ERR_SFTY;
 			goto irq_error;

--lffsxbm2gt2npdfi
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--lffsxbm2gt2npdfi--
