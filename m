Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A5C6D8D49
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Apr 2023 04:10:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 452F8C6A616;
	Thu,  6 Apr 2023 02:10:21 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C3E9C6A612
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Apr 2023 02:10:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4789C62CFE;
 Thu,  6 Apr 2023 02:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46B01C433A0;
 Thu,  6 Apr 2023 02:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680747018;
 bh=84dnOHxJLvRLAV3cCIz8QrnxN5Q05YNcM1cDzpVJ7X8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=tIt9Zq8skri0IOIteO900wuOHhMMbx+jOivszbUExBIwoAoh0REsczXmnChxD7nDq
 tGFIrNrZ/GErki4n8AIiVkXJ4gVeR/Ur7RoQF85jX9EhQRZ/WRRT8qC5Vs5ESs4Hsd
 rBc5H6d0r/vCyHnGDNgCEnhT6rBS77lvI9ZP5Hf9pUDv/ulnQEPjD5R0ke7HEf0JFN
 xkRDUrOjTCD9BTd6UaFn8XTnYlVNR3ckxOhKlW9iyPs2XA18gzwhZRWre3H4wGFmQW
 hwXyPOOkrz1WapLjQ436gT0LL9rup1y5aR7K8cuV2CwOP643e6PSJApt4BZRiyEyt1
 Uv7ZlWNic1h5A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 0ECD8E2A033; Thu,  6 Apr 2023 02:10:18 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <168074701805.16861.13421664747148882489.git-patchwork-notify@kernel.org>
Date: Thu, 06 Apr 2023 02:10:18 +0000
References: <20230404044823.3226144-1-yoong.siang.song@intel.com>
In-Reply-To: <20230404044823.3226144-1-yoong.siang.song@intel.com>
To: Song Yoong Siang <yoong.siang.song@intel.com>
Cc: linux-kernel@vger.kernel.org, hawk@kernel.org, daniel@iogearbox.net,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 john.fastabend@gmail.com, stable@vger.kernel.org, ast@kernel.org,
 ansuelsmth@gmail.com, edumazet@google.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, peppe.cavallaro@st.com,
 bpf@vger.kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: Add queue reset into
 stmmac_xdp_open() function
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue,  4 Apr 2023 12:48:23 +0800 you wrote:
> Queue reset was moved out from __init_dma_rx_desc_rings() and
> __init_dma_tx_desc_rings() functions. Thus, the driver fails to transmit
> and receive packet after XDP prog setup.
> 
> This commit adds the missing queue reset into stmmac_xdp_open() function.
> 
> Fixes: f9ec5723c3db ("net: ethernet: stmicro: stmmac: move queue reset to dedicated functions")
> Cc: <stable@vger.kernel.org> # 6.0+
> Signed-off-by: Song Yoong Siang <yoong.siang.song@intel.com>
> 
> [...]

Here is the summary with links:
  - [net,1/1] net: stmmac: Add queue reset into stmmac_xdp_open() function
    https://git.kernel.org/netdev/net/c/24e3fce00c0b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
