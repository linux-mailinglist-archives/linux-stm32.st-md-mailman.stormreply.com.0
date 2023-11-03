Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 384387DFFF5
	for <lists+linux-stm32@lfdr.de>; Fri,  3 Nov 2023 10:20:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD3B3C6B44D;
	Fri,  3 Nov 2023 09:20:29 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03A91C6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Nov 2023 09:20:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C01DBCE225E;
 Fri,  3 Nov 2023 09:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AD109C433CB;
 Fri,  3 Nov 2023 09:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699003223;
 bh=89TbsSiluHz4CNriX3OAzekwzCM5uTxxSUvf2oTXa34=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=sqB2O09bxp2xTGfqpa2Q9qJPPULBI/7K6WKuSLhdxJKrPxI31or3SZlsGvKoJo/gj
 5xxu5L76j/JxVLRDC2phsoGH5WQeNGwAYjkA3KHOvEWB5ie4mRAdl1PiPSXNWuReGr
 Pp4uZzL8vDEKgRJbbjhKyG2phH2YCeR+Lw1587PYYnsT8e0/+5SEMjabOuoE0jEwLn
 n1n4iufPu78h20j1ZCLQ9U/s7q8YxgK6khG7P+jyXlMyEMJwtdkAytRyCi9gFa47RP
 B9aCBFs9OuaVFRNlDz2FfrbUddqh3x23kgPKNlE16sKufO0FTYi/D685q3khINa0v1
 ZZaH7/HlwjBtw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 89DC0E00088; Fri,  3 Nov 2023 09:20:23 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169900322356.11636.3563922436510557327.git-patchwork-notify@kernel.org>
Date: Fri, 03 Nov 2023 09:20:23 +0000
References: <20231031022729.2347871-1-0x1207@gmail.com>
In-Reply-To: <20231031022729.2347871-1-0x1207@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Cc: linux-kernel@vger.kernel.org, horms@kernel.org, jpinto@synopsys.com,
 netdev@vger.kernel.org, fancer.lancer@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, xfr@outlook.com,
 jacob.e.keller@intel.com, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org, rock.xu@nio.com
Subject: Re: [Linux-stm32] [PATCH net v3] net: stmmac: xgmac: Enable support
 for multiple Flexible PPS outputs
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
by David S. Miller <davem@davemloft.net>:

On Tue, 31 Oct 2023 10:27:29 +0800 you wrote:
> From XGMAC Core 3.20 and later, each Flexible PPS has individual PPSEN bit
> to select Fixed mode or Flexible mode. The PPSEN must be set, or it stays
> in Fixed PPS mode by default.
> XGMAC Core prior 3.20, only PPSEN0(bit 4) is writable. PPSEN{1,2,3} are
> read-only reserved, and they are already in Flexible mode by default, our
> new code always set PPSEN{1,2,3} do not make things worse ;-)
> 
> [...]

Here is the summary with links:
  - [net,v3] net: stmmac: xgmac: Enable support for multiple Flexible PPS outputs
    https://git.kernel.org/netdev/net/c/db456d90a4c1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
