Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF80984298
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Sep 2024 11:50:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE5AEC78017;
	Tue, 24 Sep 2024 09:50:34 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1356AC78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Sep 2024 09:50:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C99D25C5A77;
 Tue, 24 Sep 2024 09:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E62CC4CEC4;
 Tue, 24 Sep 2024 09:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727171425;
 bh=BurBzI8ngKah39LvdFErebusrYUIIpd4vTRNgU0ne18=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=ckcSzzabzQRvieGmBOhpLCQHIKlOLNnNCe/Wv/ASZKQ43J9WkjJM1qe55/8img+Kz
 xHg/VsXpn+QkGkHTeN/9qUFrA+p54ADKDutClX5MWiR36zVNrlCP7hwHkVpZtosRbx
 cfCjymuiHTfIdaBMewt1uYyfnFObls5HqB2qUR3kzf7nBfPqI2hicNXSlZ3tpaGH3h
 r4Y/M9yBTSjCv2vpC6/OpgA9hcJ1VRdovnPBxoA/BwP/uTrzbacl0ziar3k/Apb1HS
 Fzspy0pZDgCrmRkqeAZKv+NXDAd9uFsSkFaqnTtjRC+TIYykVdLRD2fY6/nApOpjtl
 24s0Z83qSprWg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EAFAB3806655; Tue, 24 Sep 2024 09:50:28 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <172717142776.3968801.9111597655574522093.git-patchwork-notify@kernel.org>
Date: Tue, 24 Sep 2024 09:50:27 +0000
References: <20240918061422.1589662-1-khai.wen.tan@linux.intel.com>
In-Reply-To: <20240918061422.1589662-1-khai.wen.tan@linux.intel.com>
To: KhaiWenTan <khai.wen.tan@linux.intel.com>
Cc: xiaolei.wang@windriver.com, linux-kernel@vger.kernel.org, horms@kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 edumazet@google.com, joabreu@synopsys.com, yong.liang.choong@linux.intel.com,
 mcoquelin.stm32@gmail.com, khai.wen.tan@intel.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v2 1/1] net: stmmac: Fix zero-division
 error when disabling tc cbs
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
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 18 Sep 2024 14:14:22 +0800 you wrote:
> The commit b8c43360f6e4 ("net: stmmac: No need to calculate speed divider
> when offload is disabled") allows the "port_transmit_rate_kbps" to be
> set to a value of 0, which is then passed to the "div_s64" function when
> tc-cbs is disabled. This leads to a zero-division error.
> 
> When tc-cbs is disabled, the idleslope, sendslope, and credit values the
> credit values are not required to be configured. Therefore, adding a return
> statement after setting the txQ mode to DCB when tc-cbs is disabled would
> prevent a zero-division error.
> 
> [...]

Here is the summary with links:
  - [net,v2,1/1] net: stmmac: Fix zero-division error when disabling tc cbs
    https://git.kernel.org/netdev/net/c/675faf5a14c1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
