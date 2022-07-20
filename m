Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B06D857AB4C
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Jul 2022 03:07:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55EC8C640F5;
	Wed, 20 Jul 2022 01:07:09 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9DBB0C03FC9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Jul 2022 01:07:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2A1BD61724;
 Wed, 20 Jul 2022 01:07:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26920C341CA;
 Wed, 20 Jul 2022 01:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658279226;
 bh=VZKQyUqkgOyxor/CL4FV3kbbmHu2L+VLW6W/lsqp7cU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ecce4uPTOaJ7kVbgFxANyF8ec/qlzYu22XOUCG8lM6f6LZmPKb0D098n+do+fLQWi
 TWUCc0v2qMOkPdEXf4nJ79DrdbyZaCDY6PWVkieUkH9wsv9l4KeOZS4rErVA0PKJtX
 CDhQlBc73y4KlP4UeThiBzOZj3bG0BKF+ZG0s9PWGxDvW0XZ4UjSackLrDeEWVVyno
 Qx9K0ZKUUQcHtFaxdCET2qNY7ImAHhZz6JBXBRMA0GOk3CHok+sNu8wuyO5dsP0Zmn
 OQp3dkMorYONzOH8Gll/+0GYtWXhg/GSKyXwGkfBm05ODVfBVveVe5xeFxei3cT9g9
 R7InpEGCGkcHg==
Date: Tue, 19 Jul 2022 18:07:05 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Message-ID: <20220719180705.45208cb0@kernel.org>
In-Reply-To: <20220719013219.11843-5-ansuelsmth@gmail.com>
References: <20220719013219.11843-1-ansuelsmth@gmail.com>
 <20220719013219.11843-5-ansuelsmth@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David
 S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [net-next PATCH v4 4/5] net: ethernet: stmicro:
 stmmac: generate stmmac dma conf before open
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

On Tue, 19 Jul 2022 03:32:18 +0200 Christian Marangi wrote:
> Rework the driver to generate the stmmac dma_conf before stmmac_open.
> This permits a function to first check if it's possible to allocate a
> new dma_config and then pass it directly to __stmmac_open and "open" the
> interface with the new configuration.

You missed one kdoc:

> @@ -1711,9 +1744,11 @@ static int init_dma_rx_desc_rings(struct net_device *dev, gfp_t flags)
>   * and allocates the socket buffers. It supports the chained and ring
>   * modes.
>   */
> -static int __init_dma_tx_desc_rings(struct stmmac_priv *priv, u32 queue)
> +static int __init_dma_tx_desc_rings(struct stmmac_priv *priv,
> +				    struct stmmac_dma_conf *dma_conf,
> +				    u32 queue)
>  {

drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1750: warning: Function parameter or member 'dma_conf' not described in '__init_dma_tx_desc_rings'
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
