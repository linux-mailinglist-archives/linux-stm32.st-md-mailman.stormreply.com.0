Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A17089B624B
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Oct 2024 12:51:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59EB3C78023;
	Wed, 30 Oct 2024 11:51:41 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA7B1C6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Oct 2024 11:51:33 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4314ff68358so8010045e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Oct 2024 04:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730289093; x=1730893893;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zr8em/6KB2VzZDWr+lWK7JictXqq7aOltFeo+p/9gI8=;
 b=bh4ELHuF9gOiUP/THcjN6UzdfJBGevm47kvgm32HTLXVyPurkAdftdjwQ4RRAWuGGY
 lB9JiPl5lFZhQJj7DyabJAXBW7XMv1HrlqasAwwVglua5KyFRqagPVHXXZCFDc6V+IPf
 ukD9ZdI0yhrt72A5AbD4/1CF9dQfM1yFAfgm+Pco72IaSzrUG6r3HFCU6oQUgJo5g45S
 0XfZcFUf/XiokbrA3e4J+xcSG9oUBngH9b4QxNu6rjMJcy4DTV8GlResEbPsuk2R94aj
 r/CKJKt2Chtk5FUayscXoxyykEUA3CLLwnUmBAKb8A6PKYsISBbeq+1Q9uyeLZhvAkS8
 dEXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730289093; x=1730893893;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zr8em/6KB2VzZDWr+lWK7JictXqq7aOltFeo+p/9gI8=;
 b=KKXbAC0hojRifv7rwm3D4EY0J4jM2Ff4uIA63+v4YA2relYJNbTTUjZKOyK1+mB4o+
 vsofRc0zhUXBN2OdLa09Rb9Om4/9jz0MprjCyNI/m6EGvECcZw/mTJJXSJvcCkBNo4TC
 0kRD0F3Cu/3KdaDfvTFiK+sgtsUi/R2fv5nb8F3iV19hCDBtAQlQDeAMNcxs3w+qmWRO
 ehuA1ID/GWuVr/DeLNdjwFYvPQBg5TdWApqIgwqioCxudNekAYAqzDw8A/a0/AeGggut
 2ti38A/HNEdCSgSxA2oGrGpyDOXiSrfMVuKfVXLiCT4AjKfMxHNmm4K/B5DWV1LC13xW
 wIqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjz03lwqFZ44z27DAWmZ2pOLwxjlIOPqzfhKoa1izmG8696AN5DvCKaCq0Cn1irce6kQubnPITI4vnvw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx4g1kWvyqzlEeMTxKoGUYDDd6vPleMD2RDyefXdTjHE9l1FzmS
 CpNWv7jyXI8wDY2TGIW3TRI4KxQwXnvpvyhZ2kfQLmFffizvdU1O
X-Google-Smtp-Source: AGHT+IHfOnqANP7C09P+cywgl9OXz0QiH/fs1DGqvzLpja17LiaKIrBmvdJfRFGCtH5Hajte3gqlzQ==
X-Received: by 2002:a5d:64cf:0:b0:37e:d92f:8272 with SMTP id
 ffacd0b85a97d-38061222801mr5875538f8f.6.1730289093192; 
 Wed, 30 Oct 2024 04:51:33 -0700 (PDT)
Received: from skbuf ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b70d5csm15250055f8f.89.2024.10.30.04.51.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2024 04:51:32 -0700 (PDT)
Date: Wed, 30 Oct 2024 13:51:30 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20241030115130.pnfoy5iiioha5oxk@skbuf>
References: <cover.1730263957.git.0x1207@gmail.com>
 <cover.1730263957.git.0x1207@gmail.com>
 <7d6db0a3e995163b6f2ff69f88b650eea812ce5d.1730263957.git.0x1207@gmail.com>
 <7d6db0a3e995163b6f2ff69f88b650eea812ce5d.1730263957.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7d6db0a3e995163b6f2ff69f88b650eea812ce5d.1730263957.git.0x1207@gmail.com>
 <7d6db0a3e995163b6f2ff69f88b650eea812ce5d.1730263957.git.0x1207@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Simon Horman <horms@kernel.org>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v6 5/6] net: stmmac: xgmac:
	Complete FPE support
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

On Wed, Oct 30, 2024 at 01:36:14PM +0800, Furong Xu wrote:
> +int dwxgmac3_fpe_map_preemption_class(struct net_device *ndev,
> +				      struct netlink_ext_ack *extack, u32 pclass)
> +{
> +	u32 val, offset, count, preemptible_txqs = 0;
> +	struct stmmac_priv *priv = netdev_priv(ndev);
> +	u32 num_tc = ndev->num_tc;

Curiously, struct net_device :: num_tc is s16. Just use netdev_get_num_tc()
and store it as int...

> +
> +	if (!num_tc) {
> +		/* Restore default TC:Queue mapping */
> +		for (u32 i = 0; i < priv->plat->tx_queues_to_use; i++) {
> +			val = readl(priv->ioaddr + XGMAC_MTL_TXQ_OPMODE(i));
> +			writel(u32_replace_bits(val, i, XGMAC_Q2TCMAP),
> +			       priv->ioaddr + XGMAC_MTL_TXQ_OPMODE(i));
> +		}
> +	}
> +
> +	/* Synopsys Databook:
> +	 * "All Queues within a traffic class are selected in a round robin
> +	 * fashion (when packets are available) when the traffic class is
> +	 * selected by the scheduler for packet transmission. This is true for
> +	 * any of the scheduling algorithms."
> +	 */
> +	for (u32 tc = 0; tc < num_tc; tc++) {
> +		count = ndev->tc_to_txq[tc].count;
> +		offset = ndev->tc_to_txq[tc].offset;
> +
> +		if (pclass & BIT(tc))
> +			preemptible_txqs |= GENMASK(offset + count - 1, offset);
> +
> +		for (u32 i = 0; i < count; i++) {
> +			val = readl(priv->ioaddr + XGMAC_MTL_TXQ_OPMODE(offset + i));
> +			writel(u32_replace_bits(val, tc, XGMAC_Q2TCMAP),
> +			       priv->ioaddr + XGMAC_MTL_TXQ_OPMODE(offset + i));
> +		}
> +	}
> +
> +	val = readl(priv->ioaddr + XGMAC_MTL_FPE_CTRL_STS);
> +	writel(u32_replace_bits(val, preemptible_txqs, FPE_MTL_PREEMPTION_CLASS),
> +	       priv->ioaddr + XGMAC_MTL_FPE_CTRL_STS);
> +
> +	return 0;
> +}
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
