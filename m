Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEE3322487
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Feb 2021 04:10:12 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0E48C57B59;
	Tue, 23 Feb 2021 03:10:11 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2759C57B55
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Feb 2021 03:10:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 587C864E42;
 Tue, 23 Feb 2021 03:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614049808;
 bh=psVkPdOZPQJQE9+OBrmjZ3/UJdCVQgZG5WjWrSN/dZ0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=c00EfgL4mKmTWr0n7R19EFAatZjZuwwnp5oFcPUlfUGXUxdIrXnN4Hr9+G2O7ZN2a
 t0/zlAKnsTaVqzFaNktbuiLzLrMI7CvaiivSBWyLIV8gMNFD5XovGftiPkwQ0WEfKv
 A9zyTRezGKtEgHYdubqcEEhrcemZ6guujsYa17qq22adY/TqDKAju+aS50aswQwtAa
 nC96qnqV08XmAB+NtFfjMBlXdob3PJIRvOZVMuf1TnmO3wMfwnO2RsnspVS5l8Xwg9
 G3gdnBDOxcjgnKTmXoLTX4a8TQ4lv+jPPW1rW7tKQTyh4MkVvpG3XnlLchQvhsWdeE
 FqSlK295I4FWw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 44DE6609CC;
 Tue, 23 Feb 2021 03:10:08 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161404980827.7081.5873991146634958711.git-patchwork-notify@kernel.org>
Date: Tue, 23 Feb 2021 03:10:08 +0000
References: <1613655653-11755-1-git-send-email-yoong.siang.song@intel.com>
In-Reply-To: <1613655653-11755-1-git-send-email-yoong.siang.song@intel.com>
To: Song Yoong Siang <yoong.siang.song@intel.com>
Cc: alexandre.torgue@st.com, weifeng.voon@intel.com, vee.khee.wong@intel.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, boon.leong.ong@intel.com,
 peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: fix CBS idleslope
 and sendslope calculation
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

On Thu, 18 Feb 2021 21:40:53 +0800 you wrote:
> From: "Song, Yoong Siang" <yoong.siang.song@intel.com>
> 
> When link speed is not 100 Mbps, port transmit rate and speed divider
> are set to 8 and 1000000 respectively. These values are incorrect for
> CBS idleslope and sendslope HW values calculation if the link speed is
> not 1 Gbps.
> 
> [...]

Here is the summary with links:
  - [net,1/1] net: stmmac: fix CBS idleslope and sendslope calculation
    https://git.kernel.org/netdev/net/c/24877687b375

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
