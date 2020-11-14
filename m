Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2C62B2A06
	for <lists+linux-stm32@lfdr.de>; Sat, 14 Nov 2020 01:40:09 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2CB78C3FAE2;
	Sat, 14 Nov 2020 00:40:09 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 41BD3C35E3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Nov 2020 00:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605314405;
 bh=xAg9nuWRDww5yEWzkrEMowKkStHRVPFNcyOOq3vc5i8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=bNlcny4V0YjrgOHdmzCWD17HCxawZwc2xO7xT+fhJnoHRDVC15M1C/sxrwxAZKQBi
 1pM6f6o6ufU26Ry8jNxEdvESaTyt5P5UktKYNj/DwrcpMQ5TmN3SN8smsJNdOPSnSI
 5Hsu5dxvrYCBp3AG949ZE9nZoeTW3flCxESBrQmg=
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <160531440558.7757.14538401894553749571.git-patchwork-notify@kernel.org>
Date: Sat, 14 Nov 2020 00:40:05 +0000
References: <20201112092606.5173aa6f@xhacker.debian>
In-Reply-To: <20201112092606.5173aa6f@xhacker.debian>
To: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Cc: p.zabel@pengutronix.de, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 net-next] net: stmmac: platform: use
 optional clk/reset get APIs
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

On Thu, 12 Nov 2020 09:27:37 +0800 you wrote:
> Use the devm_reset_control_get_optional() and devm_clk_get_optional()
> rather than open coding them.
> 
> Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
> ---
> Since v1:
>  - keep wrapped as suggested by Jakub
> 
> [...]

Here is the summary with links:
  - [v2,net-next] net: stmmac: platform: use optional clk/reset get APIs
    https://git.kernel.org/netdev/net-next/c/bb3222f71b57

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
