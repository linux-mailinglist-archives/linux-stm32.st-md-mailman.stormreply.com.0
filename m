Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F9AB2E189
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Aug 2025 17:54:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 94FE0C349C6;
	Wed, 20 Aug 2025 15:54:50 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2868FC36B2D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Aug 2025 15:54:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E083B61138;
 Wed, 20 Aug 2025 15:54:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 121EAC116B1;
 Wed, 20 Aug 2025 15:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755705287;
 bh=rXsvCo54vmzimq+tMCxR9+qLXEc3s/ulFZc1gIen3Mo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sH8yFEBbP3jESsYJR2shssaXL3L7FXtsORvJgYtBft2gbooUWw3+0TObMw4bSfjuW
 DUsNrXXxfTEyvqtEv9Zli4Oex9ZeNbbfXmclMsgJFrbO4C7c5SxOWP6ef1W8idmFAB
 6RK7Cc0KzS6bQEm6M+Qhrv5OOEITnZAVIjL5CJEb2N2RSphl/OhDT/1bqrAqhIlL6F
 aHQHV3ClIhNAg/0nZtW1vS4b0PhFlDdbjPD3VHeZw4Avr1yZcsAFErFxZ2Fu9U8Wsq
 6EOJBz8pDevyDZRh1HJzC6rzlHd/YUi7H4eqDigJ9RtQ7OSWqqrvaesYsJ2R1NvanI
 N1/ZlK1b8nErw==
Date: Wed, 20 Aug 2025 08:54:46 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "G Thomas, Rohan" <rohan.g.thomas@altera.com>
Message-ID: <20250820085446.61c50069@kernel.org>
In-Reply-To: <22947f6b-03f3-4ee5-974b-aa4912ea37a3@altera.com>
References: <20250816-xgmac-minor-fixes-v2-0-699552cf8a7f@altera.com>
 <20250816-xgmac-minor-fixes-v2-3-699552cf8a7f@altera.com>
 <20250819182207.5d7b2faa@kernel.org>
 <22947f6b-03f3-4ee5-974b-aa4912ea37a3@altera.com>
MIME-Version: 1.0
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, linux-kernel@vger.kernel.org,
 Rohan G Thomas via B4 Relay <devnull+rohan.g.thomas.altera.com@kernel.org>,
 netdev@vger.kernel.org, Romain Gantois <romain.gantois@bootlin.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 3/3] net: stmmac: Set CIC bit
 only for TX queues with COE
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

On Wed, 20 Aug 2025 12:44:18 +0530 G Thomas, Rohan wrote:
> On 8/20/2025 6:52 AM, Jakub Kicinski wrote:
> > On Sat, 16 Aug 2025 00:55:25 +0800 Rohan G Thomas via B4 Relay wrote:  
> >> +	bool csum = !priv->plat->tx_queues_cfg[queue].coe_unsupported;  
> > 
> > Hopefully the slight pointer chasing here doesn't impact performance?
> > XDP itself doesn't support checksum so perhaps we could always pass
> > false?  
> 
> I'm not certain whether some XDP applications might be benefiting from
> checksum offloading currently

Checksum offload is not supported in real XDP, AFAIK, and in AF_XDP 
the driver must implement a checksum callback which stmmac does not do.
IOW it's not possible to use Tx checksum offload in stmmac today from
XDP.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
