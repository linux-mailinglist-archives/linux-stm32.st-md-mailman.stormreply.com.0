Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EA2992877
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Oct 2024 11:45:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD924C78030;
	Mon,  7 Oct 2024 09:45:22 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36CD7C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Sep 2024 18:47:51 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-205659dc63aso12818055ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Sep 2024 11:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1727376470; x=1727981270;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+KusUymBZTpYYnq4WmcbbE/FZsVAjrJbZNZbABf3CAo=;
 b=gaEG8in2mlT9R69O5787w+OpM3gLOFqjTvTsiwmO9KOUo4wx4uimaRmgIKE8lZDlM/
 sl8YlPYkkSoQiikZbAwdrFZS7hBgUaeXEXKgKfUH6Dn+8BTc1vNq83zlgS3lFd177g84
 XMbzag41rm78bgoiDX0XPkYLtAAv1mWzVOVZfW8R1gNltsjvw221b75PEKwUpJHfW/0k
 bSyEtRfVcc5yY/BQOa4w3e6Dwrqjij9xIqXQTjaP9drH9PQNbtKQppgxj6sZuyoVTRMp
 LFKK4u0NBDleHo1Wz/5k0NnjCw7PQOFq6DT1gvLMjklFAbNKJRJ09UgsIlmFpw5yT/Lw
 glJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727376470; x=1727981270;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+KusUymBZTpYYnq4WmcbbE/FZsVAjrJbZNZbABf3CAo=;
 b=XlGT4sRwh4PxzKi3xx0nKShJX/bF7neMKVdm4AZKaqZSGeufeLey644CCtHf3Vi2gz
 8bY4QR/xDb3v5k5rY9+yXxdAbmQhUgqvuWRMCVo+sWdA2mfvaWYfifMvyQ6pRlW1JuC5
 Bdb3xs2lXcVl3ULC0nQlEpXOQbdUf9cgAnN3R+ceXKHwpLftkCW6L9GTGQqlPGJF8Kzs
 gT9SUX7dn5HB+hKH9GulzLZERClhjGr4k7I5Ae/DJPje57Gs/8WKzqucJ/pWCM5fqR1v
 ujQKTv8yZPXlQYTY2HPgePoi1GZDkhPwOoZQ6xFvavw/nzkEJnzcK/Gcj1E5SXDVqHtL
 41Dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWuVF5BtoMdnj8glrtVE7YbekQdXEJxY5YmUdiJgbO8Acc3ysUr8N+HVaNimVmzFgxYdQcfUWg27Ky/A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yysy3yooHgjc/g7psmIEM+pzOkw3/68iFdgnHd+U9pPzgXOsd8Y
 Wcc5FjBSigpovdcj4v87WlpfIwjL9NURXj6+GtaWwJemdgmbOVrUE/U2JMDr7s0=
X-Google-Smtp-Source: AGHT+IGNxuTgkN1leT2RdvlA5PUTH+t79/qJCqmKY/KS0CmrWCtetVvj/vYEI9+Bz4MIXVKD0WkcsQ==
X-Received: by 2002:a17:903:2285:b0:207:7952:e6d4 with SMTP id
 d9443c01a7336-20b367ca162mr9258295ad.4.1727376469796; 
 Thu, 26 Sep 2024 11:47:49 -0700 (PDT)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20b37e4ee7bsm1571565ad.234.2024.09.26.11.47.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 11:47:49 -0700 (PDT)
Date: Thu, 26 Sep 2024 11:47:47 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <ZvWsUxyBoiHws1TE@x1>
References: <20240926-th1520-dwmac-v2-0-f34f28ad1dc9@tenstorrent.com>
 <20240926-th1520-dwmac-v2-2-f34f28ad1dc9@tenstorrent.com>
 <a64eb154-30b9-4321-b3ef-2bcb1e861800@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a64eb154-30b9-4321-b3ef-2bcb1e861800@lunn.ch>
X-Mailman-Approved-At: Mon, 07 Oct 2024 09:45:20 +0000
Cc: Eric Dumazet <edumazet@google.com>, Guo Ren <guoren@kernel.org>,
 Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Drew Fustini <drew@pdp7.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 "David S. Miller" <davem@davemloft.net>, Fu Wei <wefu@redhat.com>
Subject: Re: [Linux-stm32] [PATCH v2 2/3] net: stmmac: Add glue layer for
	T-HEAD TH1520 SoC
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

On Thu, Sep 26, 2024 at 08:32:00PM +0200, Andrew Lunn wrote:
> > +static int thead_dwmac_init(struct platform_device *pdev, void *priv)
> > +{
> > +	struct thead_dwmac *dwmac = priv;
> > +	int ret;
> > +
> > +	ret = thead_dwmac_set_phy_if(dwmac->plat);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = thead_dwmac_set_txclk_dir(dwmac->plat);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = regmap_write(dwmac->apb_regmap, GMAC_RXCLK_DELAY_CTRL,
> > +			   GMAC_RXCLK_DELAY_VAL(dwmac->rx_delay));
> > +	if (ret)
> > +		return dev_err_probe(dwmac->dev, ret,
> > +				     "failed to set GMAC RX clock delay\n");
> > +
> > +	ret = regmap_write(dwmac->apb_regmap, GMAC_TXCLK_DELAY_CTRL,
> > +			   GMAC_TXCLK_DELAY_VAL(dwmac->tx_delay));
> > +	if (ret)
> > +		return dev_err_probe(dwmac->dev, ret,
> > +				     "failed to set GMAC TX clock delay\n");
> > +
> > +	thead_dwmac_fix_speed(dwmac, SPEED_1000, 0);
> 
> Is this needed? I would expect this to be called when the PHY has link
> and you know the link speed. So why set it here?

Good point.  I've removed this line and the probe still completes okay
and the Ethernet connection is working okay.

> > +
> > +	return thead_dwmac_enable_clk(dwmac->plat);
> > +}
> > +
> > +static int thead_dwmac_probe(struct platform_device *pdev)
> > +{
> > +	struct device_node *np = pdev->dev.of_node;
> > +	struct stmmac_resources stmmac_res;
> > +	struct plat_stmmacenet_data *plat;
> > +	struct thead_dwmac *dwmac;
> > +	void __iomem *apb;
> > +	u32 delay;
> > +	int ret;
> > +
> > +	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
> > +	if (ret)
> > +		return dev_err_probe(&pdev->dev, ret,
> > +				     "failed to get resources\n");
> > +
> > +	plat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
> > +	if (IS_ERR(plat))
> > +		return dev_err_probe(&pdev->dev, PTR_ERR(plat),
> > +				     "dt configuration failed\n");
> > +
> > +	dwmac = devm_kzalloc(&pdev->dev, sizeof(*dwmac), GFP_KERNEL);
> > +	if (!dwmac)
> > +		return -ENOMEM;
> > +
> > +	/* hardware default is 0 for the rx and tx internal clock delay */
> > +	dwmac->rx_delay = 0;
> > +	dwmac->tx_delay = 0;
> > +
> > +	/* rx and tx internal delay properties are optional */
> > +	if (!of_property_read_u32(np, "thead,rx-internal-delay", &delay)) {
> > +		if (delay > GMAC_RXCLK_DELAY_MASK)
> > +			dev_warn(&pdev->dev,
> > +				 "thead,rx-internal-delay (%u) exceeds max (%lu)\n",
> > +				 delay, GMAC_RXCLK_DELAY_MASK);
> > +		else
> > +			dwmac->rx_delay = delay;
> > +	}
> > +
> 
> So you keep going, with an invalid value? It is better to use
> dev_err() and return -EINVAL. The DT write will then correct their
> error when the device fails to probe.

My intention was to keep the default of 0 if the dt property exists and
exceeds the max value. I had considered failing the probe but I wasn't
sure that was too severe of a reaction to a bad value for the delay.

> 
> If you decide to keep this... I'm not sure these properties are
> needed.

Given your reply to the cover letter, I think it does make sense for me
to remove handling of these delay properties since the units of the
delay bit field are unknown and the hardware I have is okay with the
default delay.

> 
> > +MODULE_AUTHOR("Jisheng Zhang <jszhang@kernel.org>");
> 
> Please add a second author, if you have taken over this driver.

Yes, Jisheng is no longer working on it, so I will add myself.

Thanks,
Drew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
