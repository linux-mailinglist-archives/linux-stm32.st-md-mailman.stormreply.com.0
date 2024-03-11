Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EC5878996
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Mar 2024 21:41:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7F75C6DD9D;
	Mon, 11 Mar 2024 20:41:48 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8BADEC6B476
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Mar 2024 20:41:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5546460F94;
 Mon, 11 Mar 2024 20:41:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B796C433F1;
 Mon, 11 Mar 2024 20:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710189706;
 bh=zCrAyipAu34X8H/QzFwggTciVlrm34ebhAgGLc4sySE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Vy7t7w+Qcu/Nfn9x1re1G4djimbGTDqzBjtSLMjxQH8BHw089k+IxU0l7c5AuPUKf
 O9nLgJw8tC8t/m6Q9Hd39Qaemsb3mz2M1cOUiK2i87yCSK6hFQDfGyvWRhOIUBM4FA
 9CClBFeArVDmwTKE9lDes2z8YQrJjQ1d1lDwvDI5teoJ5GBQnXvGrMPUl5UYLbmfCC
 Uqls39WKbokTSujVmDMDixz6K2Dy1iPETb3WvVuLqzB7OAWzaBgvMpgy6JndIwFWif
 Wv0MuRdZPBBfBKEB8xlSp4CesRNyMmRx29QYlLijqiIfYDRsLOG6mn5Cn2IWPW2HzS
 jbF4ua2qJj7ug==
Date: Mon, 11 Mar 2024 13:41:44 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Piotr Wejman <piotrwejman90@gmail.com>
Message-ID: <20240311134144.7b1e1a34@kernel.org>
In-Reply-To: <20240303190339.52496-1-piotrwejman90@gmail.com>
References: <20240303190339.52496-1-piotrwejman90@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3] net: stmmac: fix rx queue priority
	assignment
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

On Sun,  3 Mar 2024 20:03:38 +0100 Piotr Wejman wrote:
> The driver should ensure that same priority is not mapped to multiple
> rx queues. Currently rx_queue_priority() function is adding
> priorities for a queue without clearing them from others.

Do you know what user-visible mis-behavior this may result in?

> From DesignWare Cores Ethernet Quality-of-Service
> Databook, section 17.1.29 MAC_RxQ_Ctrl2:
> "[...]The software must ensure that the content of this field is
> mutually exclusive to the PSRQ fields for other queues, that is,
> the same priority is not mapped to multiple Rx queues[...]"
> 
> After this patch, rx_queue_priority() function will:
> - assign desired priorities to a queue
> - remove those priorities from all other queues

But also you seem to remove clearing all other prios from the queue:

-	value &= ~GMAC_RXQCTRL_PSRQX_MASK(queue);

and 

-	value &= ~XGMAC_PSRQ(queue);

is that intentional? Commit message should explain why.

> The write sequence of CTRL2 and CTRL3 registers is done in the way to
> ensure this order.

Ensure which order? Looks like you're actually writing in the opposite
order than what I'd expect :S First the register you want to assign to,
and then the register you only clear from.

When you repost please include a Fixes tag.
-- 
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
