Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EA8819E0E
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Dec 2023 12:30:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F01CBC6B477;
	Wed, 20 Dec 2023 11:30:27 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA2ECC6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Dec 2023 11:30:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4995DCE1CA7;
 Wed, 20 Dec 2023 11:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8006FC433CC;
 Wed, 20 Dec 2023 11:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703071823;
 bh=jGs8fvqIvPHxe9ticGgz2ZJC1iFH9Jgyqjbpp+xZufk=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=IIA68s/0NIXvoLtoZizGk86/lW0rKIpKMsIwqYnCJK/L75SVhRtrqfxk6C56+MXp2
 LMI83I3e0BkiXBDUgaiNRIavxTl6x0iIS8cli9OaBgU4+PsnRpDGVSyocPJAnHa6b+
 g4W/KXdQRPCR4jAi6vrzeQpUYaPjJ2kBhDzab4POqXCF+qTEPXVrofEiHOnlDwPCzP
 Q+uvsiqcRF4DK24x2TWquCfI4uA05UxbLkzMuYA+t7DcRNes2vO55bZzIR2hVMR7SZ
 jq40ATMGVYKkOE6sego0nALG1YT47sDrlcCY9Q511QS3aNY4E7mjHLPN+U1xlPDPY9
 6g3KDdLFPmWoA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 675F6D8C983; Wed, 20 Dec 2023 11:30:23 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <170307182341.15860.4221212163118330561.git-patchwork-notify@kernel.org>
Date: Wed, 20 Dec 2023 11:30:23 +0000
References: <1702885892-30369-1-git-send-email-jun.ann.lai@intel.com>
In-Reply-To: <1702885892-30369-1-git-send-email-jun.ann.lai@intel.com>
To: Lai Peter Jun Ann <jun.ann.lai@intel.com>
Cc: linux-kernel@vger.kernel.org, yoong.siang.song@intel.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v2 1/1] net: stmmac: fix incorrect
 flag check in timestamp interrupt
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

On Mon, 18 Dec 2023 15:51:32 +0800 you wrote:
> The driver should continue get the timestamp if STMMAC_FLAG_EXT_SNAPSHOT_EN
> flag is set.
> 
> Fixes: aa5513f5d95f ("net: stmmac: replace the ext_snapshot_en field with a flag")
> Cc: <stable@vger.kernel.org> # 6.6
> Signed-off-by: Song Yoong Siang <yoong.siang.song@intel.com>
> Signed-off-by: Lai Peter Jun Ann <jun.ann.lai@intel.com>
> 
> [...]

Here is the summary with links:
  - [net,v2,1/1] net: stmmac: fix incorrect flag check in timestamp interrupt
    https://git.kernel.org/netdev/net/c/bd7f77dae695

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
