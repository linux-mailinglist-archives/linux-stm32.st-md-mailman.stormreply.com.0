Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FD0858561
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Feb 2024 19:40:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C066BC65E42;
	Fri, 16 Feb 2024 18:40:02 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C18D6C6410C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Feb 2024 18:40:01 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-51197ca63f5so1474045e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Feb 2024 10:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708108801; x=1708713601;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=78yCkR98MtM+p4wYvsxZI+i3GmUiyMdPBkkAbm+jo8c=;
 b=H7Bkw7mh61PxBOxD16JXPyf2EJWgqaF87wS+ruHqdY8uxmk7VAm8zQsNEfstKJFKOo
 gkQNPTwRyxqREuckWeZbJkI9NfwxuCdy+s9SddvU0prSKjKHmti2V7X59/cD3GYOL+/V
 PvoxVFGrtMdUoK5tbmOYXVLjkYNCBviXoH4Jdy+lEj1qqdl7Z+GtyBtqz5R4XmrLTSQW
 jAVFNanIYKHRX2nSx0KJTz1m6F6y2+X4aOgjGvd9E9LBantA7OMlmN+oxjsEB8rfEfS1
 8XMjD3RdOzMqtlbccEq8r7yMDKWwwy4x3BXegeZlrDKfemuENSVPl3ca7vvOb8byLAZZ
 QJoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708108801; x=1708713601;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=78yCkR98MtM+p4wYvsxZI+i3GmUiyMdPBkkAbm+jo8c=;
 b=iY2htMHf2ycqV7V54ACAGaPSWbfArKCTX9fsKunQUzSeV2aQMvQsDtBs39KzG8nFkF
 yGsoC6KlazLKZnEqS6iedVYrs2/pEX/MVOJ4cHRZtzvE5E8I+M7dipdXJmqOLwCiuQRV
 PhKK53yXHudMWlFudRlUzllktKYklvqv4f9Z//NXbHWi/PWvwqzv0AWFV2oMGmArSEqZ
 stl1aO4NTmetwVRSKAoFJON0+WM8kqDqgYyYSPN2Mctay6DUt/nvGSzqylUxtHrmoov0
 fLe+AUBlJ71vkGWMSb7CzW2itVeg6kipApvFdrXMUbb2S4jSGtN8D1r/0aZpgZb5eqr8
 CqlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcslJFToypywxJuz7qgnm9Pg34DO0HYb8qov9BvgaEcWf7L7mLZION15Kdzd+FUlFyPx/4c3urQjws5Ob7EmsKEbrAXs5zi4npwHtJf0KECTt9FvrQQSIs
X-Gm-Message-State: AOJu0Yz3GrMsoIYgXn0LSQj9iQiImDV/KKBn617Oj9DfUxyFXwBmO/ba
 La6AK0q2ixwVQAwL8ryJkb4kJw6ykPSUt9HHfQnOgokqywEv2geZ
X-Google-Smtp-Source: AGHT+IEvHkxvQ6cNkCmZuYs+2CZMXFD63NlZarr3kAV6W5xtYY+lZFIlRQZFKvqM4Pp1UmjhNiMPnA==
X-Received: by 2002:ac2:5197:0:b0:512:851d:82c5 with SMTP id
 u23-20020ac25197000000b00512851d82c5mr3905235lfi.0.1708108800548; 
 Fri, 16 Feb 2024 10:40:00 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 x8-20020ac24888000000b005129e5d7f11sm39651lfc.125.2024.02.16.10.39.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 10:40:00 -0800 (PST)
Date: Fri, 16 Feb 2024 21:39:57 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Pavel Sakharov <p.sakharov@ispras.ru>
Message-ID: <52l2oudptsknq7tkorvz6o3h2t2gzstkk34oorks3eul5k22br@kqm674m5cwyy>
References: <20240206150704.GD1104779@kernel.org>
 <20240214092718.331891-1-p.sakharov@ispras.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240214092718.331891-1-p.sakharov@ispras.ru>
Cc: linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Alexey Khoroshilov <khoroshilov@ispras.ru>, Simon Horman <horms@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 lvc-project@linuxtesting.org
Subject: Re: [Linux-stm32] [PATCH net v2] net: stmmac: Fix incorrect
 dereference in interrupt handlers
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

On Wed, Feb 14, 2024 at 12:27:17PM +0300, Pavel Sakharov wrote:
> If 'dev' or 'data' is NULL, the 'priv' variable has an incorrect address
> when dereferencing calling netdev_err().
> 
> Since we get as 'dev_id' or 'data' what was passed as the 'dev' argument
> to request_irq() during interrupt initialization (that is, the net_device
> and rx/tx queue pointers initialized at the time of the call) and since
> there are usually no checks for the 'dev_id' argument in such handlers
> in other drivers, remove these checks from the handlers in stmmac driver.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.

LGTM. Thanks!

Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

> 
> Fixes: 8532f613bc78 ("net: stmmac: introduce MSI Interrupt routines for mac, safety, RX & TX")
> Signed-off-by: Pavel Sakharov <p.sakharov@ispras.ru>
> ---
> v2: Drop the second argument checks in the handlers as suggested by Serge Semin <fancer.lancer@gmail.com>.
> 
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 20 -------------------
>  1 file changed, 20 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 75d029704503..e80d77bd9f1f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -6059,11 +6059,6 @@ static irqreturn_t stmmac_mac_interrupt(int irq, void *dev_id)
>  	struct net_device *dev = (struct net_device *)dev_id;
>  	struct stmmac_priv *priv = netdev_priv(dev);
>  
> -	if (unlikely(!dev)) {
> -		netdev_err(priv->dev, "%s: invalid dev pointer\n", __func__);
> -		return IRQ_NONE;
> -	}
> -
>  	/* Check if adapter is up */
>  	if (test_bit(STMMAC_DOWN, &priv->state))
>  		return IRQ_HANDLED;
> @@ -6079,11 +6074,6 @@ static irqreturn_t stmmac_safety_interrupt(int irq, void *dev_id)
>  	struct net_device *dev = (struct net_device *)dev_id;
>  	struct stmmac_priv *priv = netdev_priv(dev);
>  
> -	if (unlikely(!dev)) {
> -		netdev_err(priv->dev, "%s: invalid dev pointer\n", __func__);
> -		return IRQ_NONE;
> -	}
> -
>  	/* Check if adapter is up */
>  	if (test_bit(STMMAC_DOWN, &priv->state))
>  		return IRQ_HANDLED;
> @@ -6105,11 +6095,6 @@ static irqreturn_t stmmac_msi_intr_tx(int irq, void *data)
>  	dma_conf = container_of(tx_q, struct stmmac_dma_conf, tx_queue[chan]);
>  	priv = container_of(dma_conf, struct stmmac_priv, dma_conf);
>  
> -	if (unlikely(!data)) {
> -		netdev_err(priv->dev, "%s: invalid dev pointer\n", __func__);
> -		return IRQ_NONE;
> -	}
> -
>  	/* Check if adapter is up */
>  	if (test_bit(STMMAC_DOWN, &priv->state))
>  		return IRQ_HANDLED;
> @@ -6136,11 +6121,6 @@ static irqreturn_t stmmac_msi_intr_rx(int irq, void *data)
>  	dma_conf = container_of(rx_q, struct stmmac_dma_conf, rx_queue[chan]);
>  	priv = container_of(dma_conf, struct stmmac_priv, dma_conf);
>  
> -	if (unlikely(!data)) {
> -		netdev_err(priv->dev, "%s: invalid dev pointer\n", __func__);
> -		return IRQ_NONE;
> -	}
> -
>  	/* Check if adapter is up */
>  	if (test_bit(STMMAC_DOWN, &priv->state))
>  		return IRQ_HANDLED;
> -- 
> 2.43.0
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
