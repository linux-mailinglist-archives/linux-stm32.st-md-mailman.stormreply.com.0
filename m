Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E23D577F84
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Jul 2022 12:20:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D01BFC0AA15;
	Mon, 18 Jul 2022 10:20:16 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC6E9C03FDB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Jul 2022 10:20:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B129A60E92;
 Mon, 18 Jul 2022 10:20:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1CD87C341CE;
 Mon, 18 Jul 2022 10:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658139613;
 bh=E6qUE/0FVI0925eqyIBrCUBMqK+zwWphena0m6VhbnE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=OXZHYC+qEMDbyEcHGefefVFx5QQEh19SO3NL1NUvgctLhdghYRDVb9FY035wu/N+O
 6u6vYyd+HGT+B4XfoPk0KftlyAiu7yvGfNYsGoaFFVUJoi0UujqsNPMXSgy8cv1l63
 8uxlKTvqrjlgx5v5I4amneLgPlkvK2rrxgqG/cUulwCxCDZVjfYTx5FevIm7bprTs4
 w4LjLt3jiGqRXAjK1pwEfSQcC/gjsiqFNtHl2bIAIK3avwbb7PnS0TMyX6f2oIKXEX
 dpT2g+hYqJAD6zl+WgvR/xX42fSQGIstkL2sNApHO04H1X9iO36z2WzNTqiQHk7rYL
 +yvHBh5D2/5Bw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 01866E451AD; Mon, 18 Jul 2022 10:20:13 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <165813961300.9736.8038169452034701746.git-patchwork-notify@kernel.org>
Date: Mon, 18 Jul 2022 10:20:13 +0000
References: <20220714075428.1060984-1-vee.khee.wong@linux.intel.com>
In-Reply-To: <20220714075428.1060984-1-vee.khee.wong@linux.intel.com>
To: Wong Vee Khee <vee.khee.wong@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 richardcochran@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/1] net: stmmac: switch to use interrupt
 for hw crosstimestamping
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

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Thu, 14 Jul 2022 15:54:27 +0800 you wrote:
> Using current implementation of polling mode, there is high chances we
> will hit into timeout error when running phc2sys. Hence, update the
> implementation of hardware crosstimestamping to use the MAC interrupt
> service routine instead of polling for TSIS bit in the MAC Timestamp
> Interrupt Status register to be set.
> 
> Cc: Richard Cochran <richardcochran@gmail.com>
> Signed-off-by: Wong Vee Khee <vee.khee.wong@linux.intel.com>
> 
> [...]

Here is the summary with links:
  - [1/1] net: stmmac: switch to use interrupt for hw crosstimestamping
    https://git.kernel.org/netdev/net/c/76c16d3e1944

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
