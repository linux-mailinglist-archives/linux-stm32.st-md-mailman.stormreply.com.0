Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 160452B3188
	for <lists+linux-stm32@lfdr.de>; Sun, 15 Nov 2020 01:10:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5F35C5660F;
	Sun, 15 Nov 2020 00:10:07 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 623AEC3089F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 15 Nov 2020 00:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605399004;
 bh=uUKVVimvuZudJEMDjKpPdA9M2QalJ+mdThNBWwucmdw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=OSXvUaYcXiW89UaUavuc2MFpCvyfCpo1TbCCeTCY5PZ7VCFnoUdd7o1y9xH125Gv3
 4RIgb6DNdpxHb55o3JQ6K4LowC92OXL/M4tMrOozPB/BtuuvLP/CUwca7PYHZXGgbR
 loaQsCsIs0YgGmjIVPOjEd5R5v3V+xfgJTA39sZ8=
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <160539900468.21843.5491714824652750943.git-patchwork-notify@kernel.org>
Date: Sun, 15 Nov 2020 00:10:04 +0000
References: <20201113090902.5c7aab1a@xhacker.debian>
In-Reply-To: <20201113090902.5c7aab1a@xhacker.debian>
To: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, peppe.cavallaro@st.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: dwmac_lib: enlarge dma reset
	timeout
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

On Fri, 13 Nov 2020 09:09:02 +0800 you wrote:
> If the phy enables power saving technology, the dwmac's software reset
> needs more time to complete, enlarge dma reset timeout to 200000us.
> 
> Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - net: stmmac: dwmac_lib: enlarge dma reset timeout
    https://git.kernel.org/netdev/net/c/56311a315da7

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
