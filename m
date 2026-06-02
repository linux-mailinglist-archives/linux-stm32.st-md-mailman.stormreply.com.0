Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCUHEZ1JHmq+iQkAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 02 Jun 2026 05:10:21 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1B9627922
	for <lists+linux-stm32@lfdr.de>; Tue, 02 Jun 2026 05:10:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3810C5663A;
	Tue,  2 Jun 2026 03:10:19 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5846DC0693F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Jun 2026 03:10:18 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 3B0AD6001D;
 Tue,  2 Jun 2026 03:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E398A1F00893;
 Tue,  2 Jun 2026 03:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1780369816;
 bh=MVK+ez5S2h1Xv9Lonr2tNkxvedzyuxQASoNieH4/EYg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc;
 b=YqPyqP/60tv2uyAFgYdzz7jaGWJRnWBVlMjNMsmz1lQOuI4I0deSQQKOts3XB1Dkz
 zITfa5yzWyGjZLK8EsvUwJWsG1eeejTLRxVmHF5V3mpAtuAVtUQvsjv+fpl1g11IDh
 0mBVtn+v0o90ic5uWHZVhTns3W6LAvmgetb8r4oykt/9Rh0CFo4ph+fPsK0tdwtLcB
 4yjmujjZMgVwIH4W1/rbNImAuRamPkrZKYkosrCjxQk0q4S9FcQzsG6Fx1O1BDQdUx
 0crfvLRfn2exVJSkNbQr5A0I8X8JG74bG870l6ODXWjsFwBYclmCYxPhNHCot2fyrf
 0UdvjHsHuQcTw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 56AB938119F9; Tue,  2 Jun 2026 03:10:20 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178036981914.224606.5617424802966318344.git-patchwork-notify@kernel.org>
Date: Tue, 02 Jun 2026 03:10:19 +0000
References: <20260527084108.121416-1-minda.chen@starfivetech.com>
In-Reply-To: <20260527084108.121416-1-minda.chen@starfivetech.com>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: devicetree@vger.kernel.org, emil.renner.berthing@canonical.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 conor@kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 edumazet@google.com, robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, krzk+dt@kernel.org, pabeni@redhat.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [net-next v5 0/4] Add StarFive jhb100 soc SGMII
	GMAC support
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
X-Spamd-Result: default: False [4.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[netdevbpf];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_CC(0.00)[vger.kernel.org,canonical.com,st-md-mailman.stormreply.com,kernel.org,lunn.ch,google.com,gmail.com,redhat.com,davemloft.net];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:minda.chen@starfivetech.com,m:devicetree@vger.kernel.org,m:emil.renner.berthing@canonical.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:conor@kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:robh+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:krzk+dt@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:andrew@lunn.ch,m:robh@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.478];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: CE1B9627922
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 27 May 2026 16:41:04 +0800 you wrote:
> jhb100 is a Starfive new RISC-V SoC for datacenter BMC (BaseBoard
> Managent Controller). Similar with Aspeed 27x0.
> 
> The jhb100 minimal system upstream is in progress:
> https://patchwork.kernel.org/project/linux-riscv/cover/20260508053632.818548-1-changhuang.liang@starfivetech.com/
> 
> jhb100 GMAC still using designware GMAC core like JH7100 and JH7110,
> and contains 2 SGMII interfaces, 1 RGMII/RMII interface, 1 RMII
> interface. In JH7100/JH7110 dwmac-starfive.c have supported RGMII/RMII
> interface. So require to add SGMII support to dwmac-starfive.c for JHB100.
> 
> [...]

Here is the summary with links:
  - [net-next,v5,1/4] dt-bindings: net: starfive,jh7110-dwmac: Remove jh8100
    https://git.kernel.org/netdev/net-next/c/106ce4a01c17
  - [net-next,v5,2/4] dt-bindings: net: starfive,jh7110-dwmac: Add jhb100 support
    https://git.kernel.org/netdev/net-next/c/64772e4d06a5
  - [net-next,v5,3/4] net: stmmac: starfive: Add jhb100 SGMII interface
    https://git.kernel.org/netdev/net-next/c/98182c748125
  - [net-next,v5,4/4] net: stmmac: starfive: Add STMMAC_FLAG_SPH_DISABLE flag
    https://git.kernel.org/netdev/net-next/c/7e9ea8de277a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
