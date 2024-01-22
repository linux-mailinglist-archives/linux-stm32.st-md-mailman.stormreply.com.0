Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B21835EDE
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Jan 2024 11:00:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 173C3C6B457;
	Mon, 22 Jan 2024 10:00:44 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ABE9BC6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jan 2024 10:00:42 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-50e72e3d435so2571839e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jan 2024 02:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705917642; x=1706522442;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XJvUSmFKxVkc/aj2645yUF6Llh0UZojhKj6fnT1VtgE=;
 b=VTy1BXYkK0vepWU6lxjsNzw9ExzfrqgbP93S1JAuTrbBk2jm83gcWiFjaFysQwOUav
 IUm8kC16V5fkKcPXaPzHpPDY/Rz201zy6g1oYgm7Q8n9hUCCWu93pkDQf478eruAdmia
 bvaY1SMECiAio53xb3uANdmGuvRmKOF62QcRQ36JgJ8whruRIsVjd+geeHFmxHG6egPy
 HOnNg/shMxLM3yPtpoKPKkHJy6tiEU9sEE4mrc0aOd9vxeu3XFSbdbL64pJOndJXqkhu
 lt/N1hh8L89EUFnzc3IreSy9pwzq8G+lFSaTgujw/LtVKiJAtWBSe6MN+9/chETdBQeH
 8NVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705917642; x=1706522442;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XJvUSmFKxVkc/aj2645yUF6Llh0UZojhKj6fnT1VtgE=;
 b=TPOUcwB++RmKG+5rakSWb08yP3HQI2JFqncfYtM7P19x8YqmK91YiKSoROt9xfMfrt
 i2qyXJyMycL6Nej4AlfkSdjslm8o+2QTtdR6m7uxgJvDTsRuqByC3FylZDwFVVbY9zPR
 zTS3x8Vjh8TO4loCHFvMATlXexZx1f41pCwkrZrT0gPJmUTVEhDfxDH9w38C/q7BLVFZ
 cUQ+KHyL0sTflJ9JYAByFSxEXidODMtKzPRX5YHXqI/IAtlX6ZWHo6epbweOofavdnVw
 vP6Y3ZKa5hZLemiy7TKBqnmUlwIDvk4K/4Li2gM5xF3t1JwuJXj2aomRJj2lTXSet9Su
 gExA==
X-Gm-Message-State: AOJu0YzxVFeQuunRWu0aqhgr4FnnyjQxNM8cfbrADoimZg1pntBKNSGG
 RxIreAu1Wz6l7Xb8+aL1oaqma+VBm/5ZIcGFWWI7NFrBg9e1x8gC
X-Google-Smtp-Source: AGHT+IEssD/hfPPeOOMHxQJvdb3GjMChqufvu3VcLm9fhwD+pPdZrTLpsswyzYA4xoIoKlv/ESBQWQ==
X-Received: by 2002:ac2:42ca:0:b0:50e:3d3b:93fa with SMTP id
 n10-20020ac242ca000000b0050e3d3b93famr737632lfl.12.1705917641364; 
 Mon, 22 Jan 2024 02:00:41 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 k5-20020ac24565000000b0050f0c199448sm1937151lfm.168.2024.01.22.02.00.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 02:00:40 -0800 (PST)
Date: Mon, 22 Jan 2024 13:00:37 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Denis Kirjanov <dkirjanov@suse.de>, 
 Suraj Jaiswal <quic_jsuraj@quicinc.com>
Message-ID: <giimpexp3qk3byb725r3ot3aund2bwmi45yrctkydatm73d5af@e36xmjf2ehvu>
References: <20240110111649.2256450-1-quic_jsuraj@quicinc.com>
 <20240110111649.2256450-4-quic_jsuraj@quicinc.com>
 <633ff61d-f73d-4221-a2fd-79f913880761@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <633ff61d-f73d-4221-a2fd-79f913880761@suse.de>
Cc: Suraj Jaiswal <quic_jsuraj@quicinc.com>, Eric Dumazet <edumazet@google.com>,
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
Subject: Re: [Linux-stm32] [PATCH net-next v9 3/3] net: stmmac: Add driver
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

On Wed, Jan 10, 2024 at 03:07:30PM +0300, Denis Kirjanov wrote:
> 
> 
> On 1/10/24 14:16, Suraj Jaiswal wrote:
> > Add support to listen HW safety IRQ like ECC(error
> > correction code), DPP(data path parity), FSM(finite state
> > machine) fault in common IRQ line.
> 
> As I see .safety_feat_irq_status available not just in dwmac5 but 
> in dwxgmac2_core and that means that the subject line is not just about dwmac5

Right. Suraj, could you please fix the subject to be describing the
actual change? The commit message body more-or-less describes it
correctly.

> 
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

Well, I guess this is the best we can do with no IRQs handling part
refactoring.

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

s/IRQ safety IRQ/IRQ sfty
* Although I would have also converted this to just dev_dbg() since
* the IRQ line is optional and is present on a single platform you
* have.


With the subject and the log-message fixed feel free to add:

Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y) 

> > +	}
> > +
> >  	stmmac_res->addr = devm_platform_ioremap_resource(pdev, 0);
> >  
> >  	return PTR_ERR_OR_ZERO(stmmac_res->addr);
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
