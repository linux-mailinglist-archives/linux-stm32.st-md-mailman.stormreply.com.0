Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CAED237033A
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Apr 2021 23:50:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 81CF5C58D7B;
	Fri, 30 Apr 2021 21:50:13 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67615C57B74
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Apr 2021 21:50:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 47B946105A;
 Fri, 30 Apr 2021 21:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619819409;
 bh=miG+q2c09nliVQBuE8bGiLgfU/PPdRkcr8VnkO3Dbgc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=KUPsi3VDWBKQASaNCGYZDkStesqGqnV9LL3iOXBdrRYESqaLHrADp2kIYzoKc0csk
 zYbQFhiCjwawvrFYSX8fLmLf90Xry2UKDFRuqkzrkM5DOkPlYGqBz+NrBGdDVlA5pE
 MLZng4wzK8gxpHSNDeHWcQOfd/a0Fi3/yucoHOCRfI0n8Q2KvtPEIYBAY6ygCkE0jy
 BbRFqbrooNXEoisme+OKUGJ3UT0apxAhgTccZKM9fw2rgcjjeTQgk8Xm7GHqDHhbFG
 TulUvvXTUXqo3Lxje1QjR4LjZjQMa71FP4BN9UINwPGhwtGYp6pfL1eTMM7NZSphZh
 5urGLKPHp4CnA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 375B760A23;
 Fri, 30 Apr 2021 21:50:09 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161981940922.13877.7364921069521536310.git-patchwork-notify@kernel.org>
Date: Fri, 30 Apr 2021 21:50:09 +0000
References: <20210429230104.16977-1-mohammad.athari.ismail@intel.com>
In-Reply-To: <20210429230104.16977-1-mohammad.athari.ismail@intel.com>
To: Ismail@ci.codeaurora.org,
 Mohammad Athari <mohammad.athari.ismail@intel.com>
Cc: alexandre.torgue@st.com, weifeng.voon@intel.com, vee.khee.wong@intel.com,
 netdev@vger.kernel.org, tee.min.tan@intel.com, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, boon.leong.ong@intel.com,
 peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: cleared __FPE_REMOVING
 bit in stmmac_fpe_start_wq()
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

On Fri, 30 Apr 2021 07:01:04 +0800 you wrote:
> From: Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>
> 
> An issue found when network interface is down and up again, FPE handshake
> fails to trigger. This is due to __FPE_REMOVING bit remains being set in
> stmmac_fpe_stop_wq() but not cleared in stmmac_fpe_start_wq(). This
> cause FPE workqueue task, stmmac_fpe_lp_task() not able to be executed.
> 
> [...]

Here is the summary with links:
  - [net] net: stmmac: cleared __FPE_REMOVING bit in stmmac_fpe_start_wq()
    https://git.kernel.org/netdev/net/c/db7c691d7f4d

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
