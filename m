Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 73ECF364E6D
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Apr 2021 01:10:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C285C57196;
	Mon, 19 Apr 2021 23:10:19 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6EF30C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Apr 2021 23:10:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 6E1CA613C1;
 Mon, 19 Apr 2021 23:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618873815;
 bh=vzQ9QnuNO52P7Ce9F6gK8HWE8RMuh4kNY3FvdCfekg4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=P91NzjyfnyjbIwGT5gPw7AqI5XtsdRdSOnmINievkC32MpnRPndsXcbezkWIupHSV
 Z2IrRNsT2qO6xIIMbeXmlu6+xwxFWdTlqp2RUPTJsJ3t8+4grnzLYs3spb6WUKoDL4
 HFuWNIfuobzo05jlhpycf1PNMiXUv+VOn2noEXZSyTAZu75auFuozbio8WCwnkFyw/
 41d2sCOaO8D/dB9lhxZSib//UucfqNqXKXigSNNMNFAhpC+aFjQjcqdvmQsZP7HlRI
 Rt6SXKjVZXlXDHk6gfLJBlzVX2s0bccPaj1emCdntiVEqcNT7NymLpBJWpimaLxwkv
 SERvqyVKFswjA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 60DAB60A37;
 Mon, 19 Apr 2021 23:10:15 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161887381539.661.5024854346370869109.git-patchwork-notify@kernel.org>
Date: Mon, 19 Apr 2021 23:10:15 +0000
References: <20210419112530.20395-1-vee.khee.wong@linux.intel.com>
In-Reply-To: <20210419112530.20395-1-vee.khee.wong@linux.intel.com>
To: Wong Vee Khee <vee.khee.wong@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 boon.leong.ong@intel.com, peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/1] net: stmmac: fix memory leak
	during driver probe
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

On Mon, 19 Apr 2021 19:25:30 +0800 you wrote:
> On driver probe, kmemleak reported the following memory leak which was
> due to allocated bitmap that was not being freed in stmmac_dvr_probe().
> 
> unreferenced object 0xffff9276014b13c0 (size 8):
>   comm "systemd-udevd", pid 2143, jiffies 4294681112 (age 116.720s)
>   hex dump (first 8 bytes):
>     00 00 00 00 00 00 00 00                          ........
>   backtrace:
>     [<00000000c51e34b2>] stmmac_dvr_probe+0x1c0/0x440 [stmmac]
>     [<00000000b530eb41>] intel_eth_pci_probe.cold+0x2b/0x14e [dwmac_intel]
>     [<00000000b10f8929>] pci_device_probe+0xd2/0x150
>     [<00000000fb254c74>] really_probe+0xf8/0x410
>     [<0000000034128a59>] driver_probe_device+0x5d/0x150
>     [<00000000016104d5>] device_driver_attach+0x53/0x60
>     [<00000000cb18cd07>] __driver_attach+0x96/0x140
>     [<00000000da9ffd5c>] bus_for_each_dev+0x7a/0xc0
>     [<00000000af061a88>] bus_add_driver+0x184/0x1f0
>     [<000000008be5c1c5>] driver_register+0x6c/0xc0
>     [<0000000052b18a9e>] do_one_initcall+0x4d/0x210
>     [<00000000154d4f07>] do_init_module+0x5c/0x230
>     [<000000009b648d09>] load_module+0x2a5a/0x2d40
>     [<000000000d86b76d>] __do_sys_finit_module+0xb5/0x120
>     [<000000002b0cef95>] do_syscall_64+0x33/0x40
>     [<0000000067b45bbb>] entry_SYSCALL_64_after_hwframe+0x44/0xa9
> 
> [...]

Here is the summary with links:
  - [net-next,1/1] net: stmmac: fix memory leak during driver probe
    https://git.kernel.org/netdev/net-next/c/d7f576dc9836

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
