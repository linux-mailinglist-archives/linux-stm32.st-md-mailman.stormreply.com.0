Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E82EB90C8C7
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Jun 2024 13:15:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F922C78001;
	Tue, 18 Jun 2024 11:15:21 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D08C6C5E2D0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jun 2024 11:13:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 15CD9CE1A44;
 Tue, 18 Jun 2024 11:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 47FE7C4AF1D;
 Tue, 18 Jun 2024 11:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718709029;
 bh=ZnuUGO1V5dgAr50dQHqP8zamCWt5ncuEUCcFdKnzkxw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=O+kLIm/DLWpPpvc2nsol5s1ELTii1flcH8DUMQcQ/o+KsDTIYT5DBr6NFNP7VP9WD
 V95bIV3aMlEoUqXx3S4GUd/CfEhJDEDjt44gXbd3JFLodjn24q/Ty+kthNOGTCaUjK
 MN9zrcCN2KjIBh2S9TMmF0fYjwyreLatg/eMr6FEx9R/z+Wg03Rywn4grGRMsFiYiE
 TDKXKkDyMElIghxJlY3qRvaJSo9rh5Z4dltfJV/l7ILFRkEE0aNfDjjGf47OjiR90K
 gOt7ko9bJe7RaVDba/Hq9+BkbthrLK6rzwYtZyV8Mk6Pz9HEEEIgb9F4GNa6OwtaLk
 BsqyGoXE7w3bA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 2B72CC4361C; Tue, 18 Jun 2024 11:10:29 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171870902917.19855.10479250301779213025.git-patchwork-notify@kernel.org>
Date: Tue, 18 Jun 2024 11:10:29 +0000
References: <20240615095611.517323-1-0x1207@gmail.com>
In-Reply-To: <20240615095611.517323-1-0x1207@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Cc: vadim.fedorenko@linux.dev, linux-kernel@vger.kernel.org,
 jpinto@synopsys.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux@armlinux.org.uk,
 vinschen@redhat.com, edumazet@google.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, xfr@outlook.com, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org, rock.xu@nio.com
Subject: Re: [Linux-stm32] [PATCH net-next v4] net: stmmac: Enable TSO on
	VLANs
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

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Sat, 15 Jun 2024 17:56:11 +0800 you wrote:
> The TSO engine works well when the frames are not VLAN Tagged.
> But it will produce broken segments when frames are VLAN Tagged.
> 
> The first segment is all good, while the second segment to the
> last segment are broken, they lack of required VLAN tag.
> 
> An example here:
> ========
> // 1st segment of a VLAN Tagged TSO frame, nothing wrong.
> MacSrc > MacDst, ethertype 802.1Q (0x8100), length 1518: vlan 100, p 1, ethertype IPv4 (0x0800), HostA:42643 > HostB:5201: Flags [.], seq 1:1449
> 
> [...]

Here is the summary with links:
  - [net-next,v4] net: stmmac: Enable TSO on VLANs
    https://git.kernel.org/netdev/net-next/c/041cc86b3653

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
