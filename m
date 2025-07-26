Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B48F1B12BD7
	for <lists+linux-stm32@lfdr.de>; Sat, 26 Jul 2025 20:29:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A94C3C349C2;
	Sat, 26 Jul 2025 18:29:57 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80F8CC349C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Jul 2025 18:29:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 29900A540BD;
 Sat, 26 Jul 2025 18:29:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3188C4CEF1;
 Sat, 26 Jul 2025 18:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753554593;
 bh=mxo9qya/kzvBI7JkhII6DI4w28F8yzccAxoPm1FQ4Mc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=tYiVri0QD33QM0ljryw3G6aNP5+B/csvJqrOIvwmx3AGsJOo0dNaKCdXW+m5ViZWb
 d+8uVdUCbGDy6ghfyIxWQFonT0WxCz4jiwY060cGdSgUsPJGJu3gNZOYFAT8RwpOS9
 hch5tpQjrTyOp+XvpgKOSsI7YIThcvX+LoYdE2Z+tYZMhAO5/ufBUzpDkNKIUSP4XU
 +HWtSCSpf6lBjv8lJFVZMhen5K/qrqRsnPa28RxqESE55KXpCENEMhgmjmmafx9cyW
 UpSa8+g9qabVPejG3TF62QGmLEo+cYPCgutZmJe5dtiJJk9FelzYMCzjGZFhcFTVck
 qbhbn3aEppxUw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33D39383BF4E; Sat, 26 Jul 2025 18:30:12 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175355461105.3662765.16598122698049376540.git-patchwork-notify@kernel.org>
Date: Sat, 26 Jul 2025 18:30:11 +0000
References: <20250723142327.85187-1-kerneljasonxing@gmail.com>
In-Reply-To: <20250723142327.85187-1-kerneljasonxing@gmail.com>
To: Jason Xing <kerneljasonxing@gmail.com>
Cc: edumazet@google.com, anthony.l.nguyen@intel.com,
 linux-stm32@st-md-mailman.stormreply.com, daniel@iogearbox.net,
 przemyslaw.kitszel@intel.com, john.fastabend@gmail.com, sdf@fomichev.me,
 intel-wired-lan@lists.osuosl.org, kuba@kernel.org, pabeni@redhat.com,
 kernelxing@tencent.com, maciej.fijalkowski@intel.com, hawk@kernel.org,
 ast@kernel.org, magnus.karlsson@intel.com, netdev@vger.kernel.org,
 andrew+netdev@lunn.ch, bjorn@kernel.org, mcoquelin.stm32@gmail.com,
 jonathan.lemon@gmail.com, bpf@vger.kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net v3 0/2] xsk: fix negative overflow
 issues in zerocopy xmit
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

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 23 Jul 2025 22:23:25 +0800 you wrote:
> From: Jason Xing <kernelxing@tencent.com>
> 
> Fix two negative overflow issues around {stmmac_xdp|igb}_xmit_zc().
> 
> Jason Xing (2):
>   stmmac: xsk: fix negative overflow of budget in zerocopy mode
>   igb: xsk: solve negative overflow of nb_pkts in zerocopy mode
> 
> [...]

Here is the summary with links:
  - [net,v3,1/2] stmmac: xsk: fix negative overflow of budget in zerocopy mode
    https://git.kernel.org/netdev/net/c/2764ab51d5f0
  - [net,v3,2/2] igb: xsk: solve negative overflow of nb_pkts in zerocopy mode
    https://git.kernel.org/netdev/net/c/3b7c13dfdcc2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
