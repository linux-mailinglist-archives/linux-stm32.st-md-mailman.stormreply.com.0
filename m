Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AC52F2B559F
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Nov 2020 01:20:10 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A1C4C3FAD7;
	Tue, 17 Nov 2020 00:20:10 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0177DC36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Nov 2020 00:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605572405;
 bh=25vUk7yO2qnrkC0/w/M4EXstmgZtbuRhKhxNkt5NBJ4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=d0Aq1m6s6KbrfvkIt5/gkjcbRbQFsG202eztDSmZWDSCxxluHWTnhZbxgd4u2WorZ
 +No9tZ/qzq447y+WabhpteRO49PuWaKc6HI9UmtMgEiA23UmLTNnIhLELQdNCY1Dz1
 YwONCxdll37wtNGchosUuSolgzhRddzqHgFX1I38=
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <160557240545.2440.6875630063431997815.git-patchwork-notify@kernel.org>
Date: Tue, 17 Nov 2020 00:20:05 +0000
References: <20201115074210.23605-1-vee.khee.wong@intel.com>
In-Reply-To: <20201115074210.23605-1-vee.khee.wong@intel.com>
To: Wong Vee Khee <vee.khee.wong@intel.com>
Cc: weifeng.voon@intel.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 boon.leong.ong@intel.com, peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 net 1/1] net: stmmac: Use
 rtnl_lock/unlock on netif_set_real_num_rx_queues() call
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

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Sun, 15 Nov 2020 15:42:10 +0800 you wrote:
> Fix an issue where dump stack is printed on suspend resume flow due to
> netif_set_real_num_rx_queues() is not called with rtnl_lock held().
> 
> Fixes: 686cff3d7022 ("net: stmmac: Fix incorrect location to set real_num_rx|tx_queues")
> Reported-by: Christophe ROULLIER <christophe.roullier@st.com>
> Tested-by: Christophe ROULLIER <christophe.roullier@st.com>
> Cc: Alexandre TORGUE <alexandre.torgue@st.com>
> Reviewed-by: Ong Boon Leong <boon.leong.ong@intel.com>
> Signed-off-by: Wong Vee Khee <vee.khee.wong@intel.com>
> 
> [...]

Here is the summary with links:
  - [v2,net,1/1] net: stmmac: Use rtnl_lock/unlock on netif_set_real_num_rx_queues() call
    https://git.kernel.org/netdev/net/c/8e5debed3901

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
