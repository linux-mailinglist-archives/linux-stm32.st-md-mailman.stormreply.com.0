Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D0C367228
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Apr 2021 20:00:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0DF07C58D5C;
	Wed, 21 Apr 2021 18:00:15 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2DE50C58D5B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Apr 2021 18:00:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id DE0EF61455;
 Wed, 21 Apr 2021 18:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619028009;
 bh=GwJ42hMLPs33IaF7uYQo8+5jI0y402wG5bF38sdSi+Y=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=pagvPWzT/qdG/cXCi1gk6EzMz8jUuhYdUJsMXwJp/H5aq0UR3G9DxFByGKgVu9cOa
 GlsXK3gDW6vTftVd6ORuHc4spHRYUlaj+201WUYyDrfs+2mlVYKe7CdGYxC639Wmop
 opXlm64SOd8fEoFj+MU/Mivt6blWsM1crZS6iGLyuyXO3wKl6c79jBl8k3TTRjaLTg
 Y2FLedmryYkWXaXScYFetcQ7tS/suZPhqYK97A9LrXWihaQM3yAf7nE5KYRD1wMBY4
 BvM6oWtXFwPmlOfInSEAAVjm+0Qz/+c9Qg8+DgH6jIAXYLsydQ4VgBz6JnkONb3R+B
 CFnLF2AmKdUzA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id D961E60A3C;
 Wed, 21 Apr 2021 18:00:09 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161902800988.24373.17521808313438955421.git-patchwork-notify@kernel.org>
Date: Wed, 21 Apr 2021 18:00:09 +0000
References: <20210421084606.20851-1-boon.leong.ong@intel.com>
In-Reply-To: <20210421084606.20851-1-boon.leong.ong@intel.com>
To: Ong Boon Leong <boon.leong.ong@intel.com>
Cc: alexandre.torgue@st.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/1] stmmac: intel: set TSO/TBS
 TX Queues default settings
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

On Wed, 21 Apr 2021 16:46:06 +0800 you wrote:
> TSO and TBS cannot coexist, for now we set Intel mGbE controller to use
> below TX Queue mapping: TxQ0 uses TSO and the rest of TXQs supports TBS.
> 
> Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 3 +++
>  1 file changed, 3 insertions(+)

Here is the summary with links:
  - [net-next,1/1] stmmac: intel: set TSO/TBS TX Queues default settings
    https://git.kernel.org/netdev/net-next/c/17cb00704c21

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
