Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E840597DE4
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Aug 2022 07:10:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3E8CC640F2;
	Thu, 18 Aug 2022 05:10:25 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5D94C5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Aug 2022 05:10:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 02AE2CE1D98;
 Thu, 18 Aug 2022 05:10:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C2BBFC43470;
 Thu, 18 Aug 2022 05:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660799420;
 bh=11zX6vF+Xhwyj3bw3smHsrqTuBdtxH0Qf0wfKSmzhcA=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=NVs4RE0D/dKYILmBv7bJiqO5X2xXxz5j60hFei/kUeqhwRbCekjKGj7jUs9XoD+Wq
 muBTgXxSu8ZykpgAKZkupLemZiEOKHtfgCAsAMsFIHUKaBOCa9Z2XSGSnJA09tDetS
 4MS0KMxvKVk3hFmiNlrZ664x38qmNtZFP16MHRTDICCBoxWvcq3QIQ/dIlaoqys1IM
 JnM9H0XWjC17pG6HdjyPJupRUMz1QzlaHZG7PMKXpmV2VcIKXdnJi/Orm+xStCLPTn
 ut+k27DvGBHqvI3fm/oD9zXdsyt5F+X/EPpdl6ty5r8P80uCI3n1JyIQdzbzWXuDNS
 3U7Lz7tXoHcgw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 A08FFC4166F; Thu, 18 Aug 2022 05:10:20 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <166079942065.2023.3273607111868789477.git-patchwork-notify@kernel.org>
Date: Thu, 18 Aug 2022 05:10:20 +0000
References: <20220817064324.10025-1-veekhee@gmail.com>
In-Reply-To: <20220817064324.10025-1-veekhee@gmail.com>
To: Wong Vee Khee <veekhee@gmail.com>
Cc: netdev@vger.kernel.org, kurt@linutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, veekhee@apple.com,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, peppe.cavallaro@st.com, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [net-next v2 1/1] stmmac: intel: remove unused
	'has_crossts' flag
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

This patch was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 17 Aug 2022 14:43:24 +0800 you wrote:
> From: Wong Vee Khee <veekhee@apple.com>
> 
> The 'has_crossts' flag was not used anywhere in the stmmac driver,
> removing it from both header file and dwmac-intel driver.
> 
> Signed-off-by: Wong Vee Khee <veekhee@apple.com>
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/1] stmmac: intel: remove unused 'has_crossts' flag
    https://git.kernel.org/netdev/net-next/c/e34cfee65ec8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
