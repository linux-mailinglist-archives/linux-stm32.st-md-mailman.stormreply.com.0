Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1FC33FA27
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Mar 2021 21:55:50 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7DDDCC57B79;
	Wed, 17 Mar 2021 20:55:50 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 619E8C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Mar 2021 20:55:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3309264E90;
 Wed, 17 Mar 2021 20:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616014546;
 bh=8YHIy2QJi0Zbnx676evVVkiFT4TAs3P+dNjW2VdjjY4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=j/NREaNObGhuCT7gWW8ChdtLt63hXPXIvf2zC/G9cSWGW/JgIAzi6lYKt3hLJfpEG
 hQrw8seR3wePUKUt4+1rOVdW16PMnPzALHoEdTR0wV6zfFQvfDKumpDO8c4Q1gT8KP
 6DSMJ85gp6wDzmLWGXcm2sy+r9aUJGVVThh7kFgQQnbB5l1P0gcuKUCBrXjIKbdEog
 5vMjmUIBGo0SCzLXQZxz4jz+Y8qG+6mM5025rEsV4fu/XPfclMUxNVSRy4AaNBFkOC
 r11ZVNpLFMdV/HiLv0C4cnR0+K6BzyOMQDhd5xrtNIO7EdlV0ghztnfmHld4wGsBL9
 TpXUHdUm686Vw==
Date: Wed, 17 Mar 2021 13:55:44 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Ong Boon Leong <boon.leong.ong@intel.com>
Message-ID: <20210317135544.3da32504@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20210317010123.6304-2-boon.leong.ong@intel.com>
References: <20210317010123.6304-1-boon.leong.ong@intel.com>
 <20210317010123.6304-2-boon.leong.ong@intel.com>
MIME-Version: 1.0
Cc: Alexandre Torgue <alexandre.torgue@st.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, "David S .
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 1/1] net: stmmac: add
 per-queue TX & RX coalesce ethtool support
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

On Wed, 17 Mar 2021 09:01:23 +0800 Ong Boon Leong wrote:
> Extending the driver to support per-queue RX and TX coalesce settings in
> order to support below commands:
> 
> To show per-queue coalesce setting:-
>  $ ethtool --per-queue <DEVNAME> queue_mask <MASK> --show-coalesce
> 
> To set per-queue coalesce setting:-
>  $ ethtool --per-queue <DEVNAME> queue_mask <MASK> --coalesce \
>      [rx-usecs N] [rx-frames M] [tx-usecs P] [tx-frames Q]
> 
> Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>

Acked-by: Jakub Kicinski <kuba@kernel.org>

> +	if (queue < tx_cnt) {
> +		ec->tx_coalesce_usecs = priv->tx_coal_timer[queue];
> +		ec->tx_max_coalesced_frames = priv->tx_coal_frames[queue];
> +	} else {
> +		ec->tx_coalesce_usecs = 0;
> +		ec->tx_max_coalesced_frames = 0;

nit: I think the struct is initialized to 0 so there is no need to set
it explicitly.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
