Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B60F154D8A5
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Jun 2022 04:55:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6440FC5E2C6;
	Thu, 16 Jun 2022 02:55:12 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ADECAC0D2BC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jun 2022 02:55:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 441AB60ACC;
 Thu, 16 Jun 2022 02:55:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F5EEC3411A;
 Thu, 16 Jun 2022 02:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655348108;
 bh=1BlpwRvkLZuR8VuvYLx0fMXdHYTki1wa59EE8Nshua4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Xw9EFBNMUQdUtyk9AXz+7oZQwZf+rCY+TKRmJJUwzyA17ilqp4LtN+HbLgJpfJVTO
 apmCY2slsoj47DsA7FWCdCrZz/UUEuLH1UNpjpBEWQIhOAvgiPs1I7Y39diCnilsDV
 9Z85a00Mi2M2hjowQoICj0WplRdAsiDYfX7D+Muty/cgu+uxJLPY6rvnZ9NqrGJNyA
 rCqhzNxbJL7Kr3wAGpNKb7i6En+cNVZGiuVgkDn/Phuuxz0YNO5nSZFIoH0HmUm5nz
 Fw/rILwm/6yCvbRECgzMxba+ionnTXmJ9N6mrB9xIW/QAcD09JrMpEl+hx3x3IsFRF
 Ox7iLts9+2kZg==
Date: Wed, 15 Jun 2022 19:55:07 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Christian 'Ansuel' Marangi <ansuelsmth@gmail.com>
Message-ID: <20220615195507.52ee19df@kernel.org>
In-Reply-To: <20220614224141.23576-1-ansuelsmth@gmail.com>
References: <20220614224141.23576-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David
 S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [net-next PATCH] net: ethernet: stmicro: stmmac:
 permit MTU change with interface up
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

On Wed, 15 Jun 2022 00:41:41 +0200 Christian 'Ansuel' Marangi wrote:
> +	if (netif_running(dev)) {
> +		netdev_dbg(priv->dev, "restarting interface to change its MTU\n");
> +		stmmac_release(dev);
> +
> +		stmmac_open(dev);
> +		stmmac_set_filter(priv, priv->hw, dev);

What if stmmac_open() fails because the memory is low or is fragmented?

You'd need to invest more effort into this change and try to allocate
all the resources before shutting the device down.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
