Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B67CB8C32F7
	for <lists+linux-stm32@lfdr.de>; Sat, 11 May 2024 19:41:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75A3FC6907A;
	Sat, 11 May 2024 17:41:31 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8381C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 May 2024 17:41:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 15A18CE0622;
 Sat, 11 May 2024 17:41:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80238C2BBFC;
 Sat, 11 May 2024 17:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715449280;
 bh=Dlo88TYjJ2dqpMbh1XVRqvHEvnVqfca8m0hFFGpWvgI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NEeFkol3mXfZbArM4ITEYgwWMmg7Z6pFFK8e0IQqzNP0sCFg9u3/pIwrZBWBAYdXS
 5YMDxVVF7OWz40LLpfVEv6D9TXoJzxf1qWJysoWgJjgrasdtG9ULu50TxYjc8uL3Hx
 7uHepVIOL4zkj9bfM1s9MisdLQrGjJpGOVa69fqz4wUq4UISYVIwjFwM4EPO8a2X91
 XVLq1kJX8yC0GeWWrODGAdBWZ22gIuWM5v84v4WiMTLXr90GKcLZ736o5ksBC4E1AN
 uj0hP3khmqYOLNwKDlz4odl0JrptzAqcWHsANlZnrgzvOqMrmKHmkfGyWqLjT2hMkT
 WsnL8dZE68vIA==
Date: Sat, 11 May 2024 18:41:12 +0100
From: Simon Horman <horms@kernel.org>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Message-ID: <20240511174112.GS2347895@kernel.org>
References: <20240510122155.3394723-1-xiaolei.wang@windriver.com>
 <20240510122155.3394723-3-xiaolei.wang@windriver.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240510122155.3394723-3-xiaolei.wang@windriver.com>
Cc: linux-kernel@vger.kernel.org, bartosz.golaszewski@linaro.org,
 netdev@vger.kernel.org, richardcochran@gmail.com, fancer.lancer@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 rohan.g.thomas@intel.com, pabeni@redhat.com, rmk+kernel@armlinux.org.uk,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org, ahalaney@redhat.com
Subject: Re: [Linux-stm32] [net PATCH v5 2/2] net: stmmac: move the EST
 structure to struct stmmac_priv
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

On Fri, May 10, 2024 at 08:21:55PM +0800, Xiaolei Wang wrote:
> Move the EST structure to struct stmmac_priv, because the
> EST configs don't look like platform config, but EST is
> enabled in runtime with the settings retrieved for the TC
> TAPRIO feature also in runtime. So it's better to have the
> EST-data preserved in the driver private data instead of
> the platform data storage.
> 
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>

Patch 1/2 of this series is a fix for net, with a Fixes tag.
IMHO, it looks good.

This patch, however, is a clean-up/enhancement.
It doesn't have a Fixes tag, which is good.
But I think it should be targeted at net-next
(once patch 1/2 has been accepted into net, and
net has been merged into net-next; also, given the timing,
once net-next reopens as It's likely to close rather soon
for the merge window).

Perhaps it is possible for the maintainers to pick up
patch 1/2, leaving this patch as follow-up.

The above notwithstanding, this patch looks good to me.

Reviewed-by: Simon Horman <horms@kernel.org>

-- 
pw-bot: under-review



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
