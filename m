Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0E13A4A0A
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Jun 2021 22:20:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A01BC58D5B;
	Fri, 11 Jun 2021 20:20:12 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86AEEC57B55
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jun 2021 20:20:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7787C610F8;
 Fri, 11 Jun 2021 20:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623442808;
 bh=pVS9xlrEg0zVzKIXcPSj83xXtf8S5iW20XhqZRC3q5E=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=CjWFaqchQI913uhKgOlQ0EJl31WfkghY/oRK0GY4OfdCng9bwbOduoA95arl+S8uV
 1/u+FHY7NG4FpKsR2VjDtOariIL94YGhKB7MpDk/qTncYwgeC0jmeJi+ET+mJiwrEN
 gnUusFPfWhfNzaVT0fEoigbZMxispKn0YVFV37K5AX6Lr44CJ0pXtZmJuhZ6BJqbzb
 DXBoKgqHf1YtK5m8pmlQDqsS8pZ38IICTtfRD5n7UjkDTNZy4SlCxcRRYlnSD9AxB6
 +haR2MnhQIKhw3m12wkmNccPy/wk0wuT7HMTTxXVCidxK81CZNgQ8txRAqabQzVZ6O
 HsdQlTmpvXshg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 66F2960A49;
 Fri, 11 Jun 2021 20:20:08 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162344280841.13501.12129405164687324305.git-patchwork-notify@kernel.org>
Date: Fri, 11 Jun 2021 20:20:08 +0000
References: <20210611090238.1157557-1-vee.khee.wong@linux.intel.com>
In-Reply-To: <20210611090238.1157557-1-vee.khee.wong@linux.intel.com>
To: Wong Vee Khee <vee.khee.wong@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1 1/1] net: stmmac: Fix
	potential integer overflow
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

This patch was applied to netdev/net-next.git (refs/heads/master):

On Fri, 11 Jun 2021 17:02:38 +0800 you wrote:
> The commit d96febedfde2 ("net: stmmac: arrange Tx tail pointer update
> to stmmac_flush_tx_descriptors") introduced the following coverity
> warning:-
> 
>   1. Unintentional integer overflow (OVERFLOW_BEFORE_WIDEN)
>      overflow_before_widen: Potentially overflowing expression
>      'tx_q->cur_tx * desc_size' with type 'unsigned int' (32 bits,
>      unsigned) is evaluated using 32-bit arithmetic, and then used in a
>      context that expects an expression of type dma_addr_t (64 bits,
>      unsigned).
> 
> [...]

Here is the summary with links:
  - [net-next,v1,1/1] net: stmmac: Fix potential integer overflow
    https://git.kernel.org/netdev/net-next/c/52e597d3e2e6

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
