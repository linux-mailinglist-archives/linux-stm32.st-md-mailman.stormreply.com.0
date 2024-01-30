Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CA6842102
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jan 2024 11:19:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74535C6B476;
	Tue, 30 Jan 2024 10:19:18 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17DF7C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jan 2024 10:19:17 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5110f515deaso3447936e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jan 2024 02:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706609956; x=1707214756;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bqQQDhRRVdivtCR2RnVp4C+rg441BFeJmpW269ZUjvc=;
 b=a+ykjKlx+imIYkq5E9ZFrcK8GnhMOHVixyoHJePLHe63z778miUwPALpyrtgyZNN9T
 O+w0IpnDtEqSpIkaQ5q161LAljOp52miFvvzsc+kZXyF1xryvchvqCNzAWJHwXHMovSA
 JN0xNrYOzgHcl4f5kKii0VyvkB3Q//SUzDqtwBMhCicfId62YaZ0u9ixBkg+uJccOL1w
 CFQIeAIFl5dbMkchwPvKRL5e4Q6EJZGxc+sysGDwXrgMtLtLoSP1rNkq32jAefT0dW9m
 iEzOf4mpZVHhHQDua9dAVALOhoCtSj213tTJRZ57nfvCvNrp/YL/SCGpO9dAhqcmfZqY
 /BiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706609956; x=1707214756;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bqQQDhRRVdivtCR2RnVp4C+rg441BFeJmpW269ZUjvc=;
 b=DKfC9e95bnRlxl5YrKS2IhAa8b15mDbeAvnfsWxEFhnEgP55NvtSLYHrotsbUm4bqX
 QpaYrym9AKZqzH5bT0VzlVpXDtXLnNggbLvodFDQfMgSNoJfYZBD+jsC8uxJ6sjYgf/i
 V2kePGDSrMtHXyTuRPsQX6F7dAA2CkcEeXKxFIaMsxpffApVMIqSlOaNI+El5wkHmv/2
 5f+PihaiMRAiYjDgpxy9i9hiFsyunvJg9JrhglI0kfIUpaMoVqqxkxmxcNH4FFvheQTh
 ManxDTvyWEyyIeV/WjufNxONwTJccpvH43wg+FkmdNTUjzaClScwZ8AH9ZuUA2+1mUh5
 OVlA==
X-Gm-Message-State: AOJu0YxM8uWOeZbPnwWIKW9QcKg7v66GnFhYCbNctpiCCjOd7jMQiMh1
 r9PGKtl4+VRNrBlm4hmP46jd6sgsqjBvLhlsTbIzgGThHhZEj/cG
X-Google-Smtp-Source: AGHT+IGkfWodCAd1V4VL3ykTegESEJ5oK9yDXZxXBUS94LBvk3lIzAz/vdRHyu2Bb1UwWde0cjKpZg==
X-Received: by 2002:ac2:47f8:0:b0:510:153a:6bdc with SMTP id
 b24-20020ac247f8000000b00510153a6bdcmr4918922lfp.19.1706609955922; 
 Tue, 30 Jan 2024 02:19:15 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a056512360300b005101bcd1d8esm1407264lfs.292.2024.01.30.02.19.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jan 2024 02:19:15 -0800 (PST)
Date: Tue, 30 Jan 2024 13:19:12 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Andrew Halaney <ahalaney@redhat.com>
Message-ID: <bavqej4yjxjyqubofpgwl2ixkvbbevr5kvtwnkx24qxh7jznjp@hdbcl4bfcpqh>
References: <20240129121129.3581530-1-quic_jsuraj@quicinc.com>
 <20240129121129.3581530-4-quic_jsuraj@quicinc.com>
 <zfnh5lfz63zlxm6ysexlfv2xstaw4pfnqazmmhdtywxdpwihqu@dfh6wwhcziuo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <zfnh5lfz63zlxm6ysexlfv2xstaw4pfnqazmmhdtywxdpwihqu@dfh6wwhcziuo>
Cc: Suraj Jaiswal <quic_jsuraj@quicinc.com>, Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 kernel@quicinc.com, Jose Abreu <joabreu@synopsys.com>,
 Andy Gross <agross@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Prasad Sodagudi <psodagud@quicinc.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v10 3/3] net: stmmac: Add driver
 support for common safety IRQ
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

Hi Andrew, Suraj

On Mon, Jan 29, 2024 at 10:20:18AM -0600, Andrew Halaney wrote:
> On Mon, Jan 29, 2024 at 05:41:29PM +0530, Suraj Jaiswal wrote:
> > Add support to listen HW safety IRQ like ECC(error
> > correction code), DPP(data path parity), FSM(finite state
> > machine) fault in common IRQ line.
> > 
> > Signed-off-by: Suraj Jaiswal <quic_jsuraj@quicinc.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/common.h  |  1 +
> >  drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  3 ++
> >  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 41 ++++++++++++++++++-
> >  .../ethernet/stmicro/stmmac/stmmac_platform.c |  8 ++++
> >  4 files changed, 51 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
> > index 721c1f8e892f..b9233b09b80f 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/common.h
> > +++ b/drivers/net/ethernet/stmicro/stmmac/common.h
> > @@ -344,6 +344,7 @@ enum request_irq_err {
> >  	REQ_IRQ_ERR_ALL,
> >  	REQ_IRQ_ERR_TX,
> >  	REQ_IRQ_ERR_RX,
> > +	REQ_IRQ_ERR_SFTY,
> >  	REQ_IRQ_ERR_SFTY_UE,
> >  	REQ_IRQ_ERR_SFTY_CE,
> >  	REQ_IRQ_ERR_LPI,
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> > index 9f89acf31050..ca3d93851bed 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> > @@ -31,6 +31,7 @@ struct stmmac_resources {
> >  	int wol_irq;
> >  	int lpi_irq;
> >  	int irq;
> > +	int sfty_irq;
> >  	int sfty_ce_irq;
> >  	int sfty_ue_irq;
> >  	int rx_irq[MTL_MAX_RX_QUEUES];
> > @@ -297,6 +298,7 @@ struct stmmac_priv {
> >  	void __iomem *ptpaddr;
> >  	void __iomem *estaddr;
> >  	unsigned long active_vlans[BITS_TO_LONGS(VLAN_N_VID)];
> > +	int sfty_irq;
> >  	int sfty_ce_irq;
> >  	int sfty_ue_irq;
> >  	int rx_irq[MTL_MAX_RX_QUEUES];
> > @@ -305,6 +307,7 @@ struct stmmac_priv {
> >  	char int_name_mac[IFNAMSIZ + 9];
> >  	char int_name_wol[IFNAMSIZ + 9];
> >  	char int_name_lpi[IFNAMSIZ + 9];
> > +	char int_name_sfty[IFNAMSIZ + 10];
> >  	char int_name_sfty_ce[IFNAMSIZ + 10];
> >  	char int_name_sfty_ue[IFNAMSIZ + 10];
> >  	char int_name_rx_irq[MTL_MAX_TX_QUEUES][IFNAMSIZ + 14];
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 47de466e432c..e0192a282121 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -3592,6 +3592,10 @@ static void stmmac_free_irq(struct net_device *dev,
> >  		if (priv->wol_irq > 0 && priv->wol_irq != dev->irq)
> >  			free_irq(priv->wol_irq, dev);
> >  		fallthrough;
> > +	case REQ_IRQ_ERR_SFTY:
> > +		if (priv->sfty_irq > 0 && priv->sfty_irq != dev->irq)
> > +			free_irq(priv->sfty_irq, dev);
> > +		fallthrough;
> >  	case REQ_IRQ_ERR_WOL:
> >  		free_irq(dev->irq, dev);
> >  		fallthrough;
> > @@ -3661,6 +3665,23 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
> >  		}
> >  	}
> >  
> > +	/* Request the common Safety Feature Correctible/Uncorrectible
> > +	 * Error line in case of another line is used
> > +	 */
> > +	if (priv->sfty_irq > 0 && priv->sfty_irq != dev->irq) {
> > +		int_name = priv->int_name_sfty;
> > +		sprintf(int_name, "%s:%s", dev->name, "safety");
> > +		ret = request_irq(priv->sfty_irq, stmmac_safety_interrupt,
> > +				  0, int_name, dev);
> > +		if (unlikely(ret < 0)) {
> > +			netdev_err(priv->dev,
> > +				   "%s: alloc sfty MSI %d (error: %d)\n",
> > +				   __func__, priv->sfty_irq, ret);
> > +			irq_err = REQ_IRQ_ERR_SFTY;
> > +			goto irq_error;
> > +		}
> > +	}
> > +
> >  	/* Request the Safety Feature Correctible Error line in
> >  	 * case of another line is used
> >  	 */
> > @@ -3798,6 +3819,21 @@ static int stmmac_request_irq_single(struct net_device *dev)
> >  		}
> >  	}
> >  
> > +	/* Request the common Safety Feature Correctible/Uncorrectible
> > +	 * Error line in case of another line is used
> > +	 */
> > +	if (priv->sfty_irq > 0 && priv->sfty_irq != dev->irq) {
> > +		ret = request_irq(priv->sfty_irq, stmmac_safety_interrupt,
> > +				  IRQF_SHARED, dev->name, dev);
> > +		if (unlikely(ret < 0)) {
> > +			netdev_err(priv->dev,
> > +				   "%s: ERROR: allocating the sfty IRQ %d (%d)\n",
> > +				   __func__, priv->sfty_irq, ret);
> > +			irq_err = REQ_IRQ_ERR_SFTY;
> > +			goto irq_error;
> > +		}
> > +	}
> > +
> >  	return 0;
> >  
> >  irq_error:
> > @@ -6022,8 +6058,8 @@ static irqreturn_t stmmac_interrupt(int irq, void *dev_id)
> >  	if (test_bit(STMMAC_DOWN, &priv->state))
> >  		return IRQ_HANDLED;
> >  
> > -	/* Check if a fatal error happened */
> > -	if (stmmac_safety_feat_interrupt(priv))
> > +	/* Check ASP error if it isn't delivered via an individual IRQ */
> > +	if (priv->sfty_irq <= 0 && stmmac_safety_feat_interrupt(priv))
> >  		return IRQ_HANDLED;
> >  
> >  	/* To handle Common interrupts */
> > @@ -7462,6 +7498,7 @@ int stmmac_dvr_probe(struct device *device,
> >  	priv->dev->irq = res->irq;
> >  	priv->wol_irq = res->wol_irq;
> >  	priv->lpi_irq = res->lpi_irq;
> > +	priv->sfty_irq = res->sfty_irq;
> >  	priv->sfty_ce_irq = res->sfty_ce_irq;
> >  	priv->sfty_ue_irq = res->sfty_ue_irq;
> >  	for (i = 0; i < MTL_MAX_RX_QUEUES; i++)
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > index 70eadc83ca68..ab250161fd79 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > @@ -743,6 +743,14 @@ int stmmac_get_platform_resources(struct platform_device *pdev,
> >  		dev_info(&pdev->dev, "IRQ eth_lpi not found\n");
> >  	}
> >  
> > +	stmmac_res->sfty_irq =
> > +		platform_get_irq_byname_optional(pdev, "sfty");
> > +	if (stmmac_res->sfty_irq < 0) {
> > +		if (stmmac_res->sfty_irq == -EPROBE_DEFER)
> > +			return -EPROBE_DEFER;

> > +		dev_info(&pdev->dev, "IRQ safety IRQ not found\n");
> 
> Serge had this comment on v9: https://lore.kernel.org/netdev/giimpexp3qk3byb725r3ot3aund2bwmi45yrctkydatm73d5af@e36xmjf2ehvu/
> 
>     s/IRQ safety IRQ/IRQ sfty
>     * Although I would have also converted this to just dev_dbg() since
>     * the IRQ line is optional and is present on a single platform you
>     * have.
> 
> 
>     With the subject and the log-message fixed feel free to add:
> 
>     Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
> 
>     -Serge(y)
> 
> If you would have changed the dev_info() here it would have been
> appropriate to add his "Reviewed-by:" tag, which makes your series more
> likely to get merged. I assume you just misunderstood/didn't see the
> request (I'd expect a comment somewhere about why you *don't* want to do
> that if you did see it but decided not to do it), but in the future my
> advice is for a minor change like this to just make it and take the
> Reviewed-by tag on your patch!

Right. Suraj likely has just missed that part, because having "IRQ
safety IRQ" statement sounds clumsy and not looking alike the others
optional IRQ info-messages, meanwhile having "IRQ sfty" instead would
be more correct.

Anyway, Suraj, could you please at least fix the info-string and
resubmit the series? With that fixed feel free to add my tag:

Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

Note I am not insisting in using dev_dbg() instead of dev_info() since
from one side the sfty IRQ line getting procedure would look alike to
the others optional IRQs retrieved in this method, from another side
using dbg log-level here and info-level for others IRQ wouldn't look
coherent. So it seems reasonable to use info-level everywhere and
convert to dbg-level at once (eventually).

-Serge(y)

> 
> > +	}
> > +
> >  	stmmac_res->addr = devm_platform_ioremap_resource(pdev, 0);
> >  
> >  	return PTR_ERR_OR_ZERO(stmmac_res->addr);
> > -- 
> > 2.25.1
> > 
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
