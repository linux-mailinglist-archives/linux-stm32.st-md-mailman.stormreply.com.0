Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EF22AB1D7
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Nov 2020 08:44:17 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F206BC424B7;
	Mon,  9 Nov 2020 07:44:16 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0329C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  8 Nov 2020 00:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604794804;
 bh=VrFPOva6ikR5xt+0caMzsE0TfHfCkHNpLJdyh/JG3pI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=0HmQTEeCv2ziNYxuqrYU2UrNJDDXbn4b3k6yIeCWPlPtTCZu8l3J78z1rt10bIgWP
 dVwEzO5egm4qEw9DBvgXUVLEMhuqZFPhuXiQCxfLnrorKvXjBQ99NVgo8hFISQE3lB
 hmUCQWZTHLFzzIzKg98L02vCmtA46gtZopjOsLb8=
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <160479480419.12285.2221862141442440852.git-patchwork-notify@kernel.org>
Date: Sun, 08 Nov 2020 00:20:04 +0000
References: <20201106094341.4241-1-vee.khee.wong@intel.com>
In-Reply-To: <20201106094341.4241-1-vee.khee.wong@intel.com>
To: Wong Vee Khee <vee.khee.wong@intel.com>
X-Mailman-Approved-At: Mon, 09 Nov 2020 07:44:13 +0000
Cc: weifeng.voon@intel.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 boon.leong.ong@intel.com, peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/1] stmmac: intel: change all
 EHL/TGL to auto detect phy addr
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

On Fri,  6 Nov 2020 17:43:41 +0800 you wrote:
> From: Voon Weifeng <weifeng.voon@intel.com>
> 
> Set all EHL/TGL phy_addr to -1 so that the driver will automatically
> detect it at run-time by probing all the possible 32 addresses.
> 
> Signed-off-by: Voon Weifeng <weifeng.voon@intel.com>
> Signed-off-by: Wong Vee Khee <vee.khee.wong@intel.com>
> 
> [...]

Here is the summary with links:
  - [net-next,1/1] stmmac: intel: change all EHL/TGL to auto detect phy addr
    https://git.kernel.org/netdev/net-next/c/bff6f1db91e3

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
