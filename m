Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7E055F459
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Jun 2022 05:54:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C9782C5F1EF;
	Wed, 29 Jun 2022 03:54:40 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32501C5F1D5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jun 2022 03:54:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 845CEB82142;
 Wed, 29 Jun 2022 03:54:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C218AC34114;
 Wed, 29 Jun 2022 03:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656474877;
 bh=uGe21oy82tSdMA/YvpYvQVzqQbNQiBgl0vADr1AFTdY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lNSlP1p+ukhqJtiPg2ozJ5MLFhq2KeadAUOnIaxqNjPNALtINmszC1a778vlk/+Jv
 QAi+R+5uceMsmtAbOx35LGxwwsPcG0N2aZ+xHf4OAHNKpYqjQWLHKDy+z8GsRcpjI2
 XfxkCtqrEMAYKbPBm+8t/6UpYntRTKDFFD3oQXjdANESi/s6807MUxASlB3AZJguBc
 ulLXwIGHyiIFe+nY3V7+XDNQVP4q316rjalagSZzFQqTObTNvShUZ5jr84p16jxDJo
 9ztfUwwO77UzYDDz5UlTNYCA8E+GCGUhlAfZE0N8k8A/72C6N87rVJhy9/HJOQ0JE0
 u89rPBXslFfCg==
Date: Tue, 28 Jun 2022 20:54:35 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Message-ID: <20220628205435.44b0c78c@kernel.org>
In-Reply-To: <20220628013342.13581-3-ansuelsmth@gmail.com>
References: <20220628013342.13581-1-ansuelsmth@gmail.com>
 <20220628013342.13581-3-ansuelsmth@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David
 S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [net-next PATCH RFC 2/5] net: ethernet: stmicro:
 stmmac: first disable all queues in release
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

On Tue, 28 Jun 2022 03:33:39 +0200 Christian Marangi wrote:
> +	stmmac_disable_all_queues(priv);
> +
> +	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
> +		hrtimer_cancel(&priv->tx_queue[chan].txtimer);

IIRC this hrtimer is to check for completions. Canceling it before
netif_tx_disable() looks odd, presumably until the queues are stopped
the timer can get scheduled again, no?

>  	netif_tx_disable(dev);
>  
>  	if (device_may_wakeup(priv->device))
> @@ -3764,11 +3769,6 @@ static int stmmac_release(struct net_device *dev)
>  	phylink_stop(priv->phylink);
>  	phylink_disconnect_phy(priv->phylink);
>  
> -	stmmac_disable_all_queues(priv);
> -
> -	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
> -		hrtimer_cancel(&priv->tx_queue[chan].txtimer);
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
