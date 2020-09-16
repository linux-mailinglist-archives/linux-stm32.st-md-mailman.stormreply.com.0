Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CC926CEB5
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Sep 2020 00:25:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77367C3FAE1;
	Wed, 16 Sep 2020 22:25:55 +0000 (UTC)
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99061C3FADE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Sep 2020 22:25:54 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 25F8713624E0E;
 Wed, 16 Sep 2020 15:09:04 -0700 (PDT)
Date: Wed, 16 Sep 2020 15:25:50 -0700 (PDT)
Message-Id: <20200916.152550.1833517348137875378.davem@davemloft.net>
To: vee.khee.wong@intel.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200916074020.25491-1-vee.khee.wong@intel.com>
References: <20200916074020.25491-1-vee.khee.wong@intel.com>
X-Mailer: Mew version 6.8 on Emacs 27.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [2620:137:e000::1:9]);
 Wed, 16 Sep 2020 15:09:04 -0700 (PDT)
Cc: yoong.siang.song@intel.com, weifeng.voon@intel.com, netdev@vger.kernel.org,
 linux@armlinux.org.uk, linux-kernel@vger.kernel.org, chen.yong.seow@intel.com,
 joabreu@synopsys.com, sadhishkhanna.vijaya.balan@intel.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, boon.leong.ong@intel.com,
 peppe.cavallaro@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: Add support to
 Ethtool get/set ring parameters
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

From: Wong Vee Khee <vee.khee.wong@intel.com>
Date: Wed, 16 Sep 2020 15:40:20 +0800

> +int stmmac_reinit_ringparam(struct net_device *dev, u32 rx_size, u32 tx_size)
> +{
> +	struct stmmac_priv *priv = netdev_priv(dev);
> +	int ret = 0;
> +
> +	if (netif_running(dev))
> +		stmmac_release(dev);
 ...
> +	if (netif_running(dev))
> +		ret = stmmac_open(dev);
> +

I've applied this patch but this approach is so fragile, but everyone
does it initially because it is so easy.

The problem here is that for so many reasons the stmmac_open() can
fail, and instead of just the ringparam() operation failing, the
interface becomes down and unusable.

Can you please eventually implement this properly?  Allocate the new
ring resources, and only commit the new configuration if it is
guaranteed to succeed.  Otherwise, backout the ringparam change
and keep the old configuration.

This way the device stays up regardless of whether the resources
(memory, DMA mappings, etc.) can be allocated fully.

Right now, if you do a ringparam under hard memory pressure, this will
take the inteface down as stmmac_open() fails.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
