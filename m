Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF3E3ED44F
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Aug 2021 14:50:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D968CC57B6D;
	Mon, 16 Aug 2021 12:50:09 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E7DE6C5719E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Aug 2021 12:50:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 4D75F63284;
 Mon, 16 Aug 2021 12:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629118206;
 bh=c7ZFtzH6Mc72jNZYOrzmCuWao+Zj9ly03lg/CvEWra4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=LCVInPQ7N/DSmGhQaKyWgvutzB75xFVN/YCuT+fRlrm0eNrZ/j+9yL+6D09UfSMHC
 MiVC1pD7FF98iglR3SJRsD9aKWHtLg5wPekH50yS+IVgko8YwAwREa2RqYNGwEepNj
 V6LVNTjpjFlGY7dc9539I4HM8mfRUHF1AEvU9obrajePzGfUSzYIUX5wdBENQjL53E
 jBuXury7LQb3eloRL+F/vlMS7WPzNmbM6kRmDo4kf/MLFsI7BayKI0PdTxzoNBcZzF
 /B4/1fXabRjYcMIC3opCo8597DKS5WtH0Uv86Tb2x8w01QqFwOQ5as1Muvux8pLgl9
 +yMD/jPHfsl3w==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 45EAD604EB;
 Mon, 16 Aug 2021 12:50:06 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162911820628.2793.5855796807565496042.git-patchwork-notify@kernel.org>
Date: Mon, 16 Aug 2021 12:50:06 +0000
References: <cover.1629092894.git.vijayakannan.ayyathurai@intel.com>
In-Reply-To: <cover.1629092894.git.vijayakannan.ayyathurai@intel.com>
To: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>
Cc: linux-kernel@vger.kernel.org, weifeng.voon@intel.com,
 vee.khee.wong@intel.com, netdev@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, peppe.cavallaro@st.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1 0/3] net: stmmac: Add ethtool
	per-queue statistic
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

This series was applied to netdev/net-next.git (refs/heads/master):

On Mon, 16 Aug 2021 14:15:57 +0800 you wrote:
> Adding generic ethtool per-queue statistic framework to display the
> statistics for each rx/tx queue. In future, users can avail it to add
> more per-queue specific counters. Number of rx/tx queues displayed is
> depending on the available rx/tx queues in that particular MAC config
> and this number is limited up to the MTL_MAX_{RX|TX}_QUEUES defined
> in the driver.
> 
> [...]

Here is the summary with links:
  - [net-next,v1,1/3] net: stmmac: fix INTR TBU status affecting irq count statistic
    https://git.kernel.org/netdev/net-next/c/1975df880b95
  - [net-next,v1,2/3] net: stmmac: add ethtool per-queue statistic framework
    https://git.kernel.org/netdev/net-next/c/68e9c5dee1cf
  - [net-next,v1,3/3] net: stmmac: add ethtool per-queue irq statistic support
    https://git.kernel.org/netdev/net-next/c/af9bf70154eb

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
