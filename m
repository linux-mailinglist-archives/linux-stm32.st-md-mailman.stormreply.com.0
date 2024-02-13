Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8B08526BA
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Feb 2024 02:40:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3122C6C83D;
	Tue, 13 Feb 2024 01:40:29 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1ED4C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Feb 2024 01:40:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id EFD2CCE18E7;
 Tue, 13 Feb 2024 01:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 31713C433C7;
 Tue, 13 Feb 2024 01:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707788426;
 bh=C7XIxg2//9H9lNyyL4lVnFIE3rkFS9Y7qI8j3SBXhMY=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=CweQf6meCbweoJAM0Jm8E32JxjtvvfbRFeSGess8IGVjuSH/MWw5bTo+Nd/wams88
 ek/Mb8hL8gnhB92iQAg3F8GPwXy046WZ6FIJoffiKQ4Xei4EGm0MuiwaEKKAZFA98T
 Cr9pH7x0gwOEFOe0Mp9jz3Pky6uTDTZqprDDeXwtOT9GOTbQXBKTwty3gNbvrMTLmY
 83ZT4Z7PXJEcXz+rPfyrUBlX/kBhO0LnZ4rs6d1OdUdj2vRsru8kBX6ikPMMNZdVmW
 Un+hZbI886lyEOlyMS9W1LRuOBTC0jUKnlnUCfmY88guD7CvsZznKUqvrTFm9qSm9U
 0lt7L9c/WLUKg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 17A84D84BC6; Tue, 13 Feb 2024 01:40:26 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <170778842609.15795.7467205079881432963.git-patchwork-notify@kernel.org>
Date: Tue, 13 Feb 2024 01:40:26 +0000
References: <20240208-xgmac-const-v1-1-e69a1eeabfc8@kernel.org>
In-Reply-To: <20240208-xgmac-const-v1-1-e69a1eeabfc8@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: jonathanh@nvidia.com, lkp@intel.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, fancer.lancer@gmail.com,
 0x1207@gmail.com, edumazet@google.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: xgmac: use #define for
	string constants
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

On Thu, 08 Feb 2024 09:48:27 +0000 you wrote:
> The cited commit introduces and uses the string constants dpp_tx_err and
> dpp_rx_err. These are assigned to constant fields of the array
> dwxgmac3_error_desc.
> 
> It has been reported that on GCC 6 and 7.5.0 this results in warnings
> such as:
> 
> [...]

Here is the summary with links:
  - [net] net: stmmac: xgmac: use #define for string constants
    https://git.kernel.org/netdev/net/c/1692b9775e74

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
