Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKiGJXRpgWmvGAMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 03 Feb 2026 04:20:20 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EECD4100
	for <lists+linux-stm32@lfdr.de>; Tue, 03 Feb 2026 04:20:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 157F4C87EC8;
	Tue,  3 Feb 2026 03:20:20 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D640CC36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Feb 2026 03:20:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 89616444A8;
 Tue,  3 Feb 2026 03:20:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61F46C116D0;
 Tue,  3 Feb 2026 03:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770088817;
 bh=p+FiLRV+y9yrAkTwRKO1Fs+7DQQpdn3ZhTr9uVCv5u0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=WFr/7be7IU0hP9/394w9OwSBa7mSWQuGh/yeC0BaaQYaNsYilI+9C+oHWuoIYAIB0
 /I2eAkeBKSArSS37VUo3nNgSYl1jdV0PtcGFsxxN6H2e41W8DzNeLSUixoGeQJYvds
 EXDgBqVqpcWeybo7BszMNVngQr4EwhDTpqCTlWncvWWykU/tAGEkx2x/7gOFnSv41b
 T6K4ogCY7Retz8xrCt9jlhMuHhyLiKhGWpbuIMt1iUoCpKB48ywvuqzsF7RWq/G3q8
 rJtCyLwXMuEIE5LPdFjXhRwOrSXmdSoiI9qIxFvTFdjUmSeUaA3IRs8F4kf4NL3PNw
 YWjL3ZWlVxJKQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 541EE3808200; Tue,  3 Feb 2026 03:20:15 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177008881412.1295553.10983924810242410033.git-patchwork-notify@kernel.org>
Date: Tue, 03 Feb 2026 03:20:14 +0000
References: <20260131161250.5047-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260131161250.5047-1-biju.das.jz@bp.renesas.com>
To: Biju <biju.das.au@gmail.com>
Cc: geert+renesas@glider.be, edumazet@google.com,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 magnus.damm@gmail.com, joabreu@synopsys.com, kuba@kernel.org,
 pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 richardcochran@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 biju.das.jz@bp.renesas.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 andrew+netdev@lunn.ch, mcoquelin.stm32@gmail.com, krzk+dt@kernel.org,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v3 0/2] Add support for Renesas
	RZ/G3L GBETH
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[glider.be,google.com,st-md-mailman.stormreply.com,kernel.org,gmail.com,synopsys.com,redhat.com,vger.kernel.org,bp.renesas.com,st.com,lists.infradead.org,lunn.ch,davemloft.net];
	TAGGED_FROM(0.00)[netdevbpf];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:biju.das.au@gmail.com,m:geert+renesas@glider.be,m:edumazet@google.com,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:magnus.damm@gmail.com,m:joabreu@synopsys.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.jz@bp.renesas.com,m:peppe.cavallaro@st.com,m:linux-arm-kernel@lists.infradead.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:andrew+netdev@lunn.ch,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:davem@davemloft.net,m:bijudasau@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas,dt,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 56EECD4100
X-Rspamd-Action: no action

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat, 31 Jan 2026 16:12:41 +0000 you wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> The Renesas RZ/G3L GBETH IP uses Synopsys DesignWare MAC version 5.30
> compared to other Renesas SoC such as RZ/V2H that use MAC version 5.20.
> 
> The RZ/G3L GBETH requires an extra clock compared to RZ/G3E and has pps
> interrupts. Document the Renesas RZ/G3L GBETH IP in bindings and add
> support for the RZ/G3L GBETH in dwmac-renesas-gbeth glue driver.
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/2] dt-bindings: net: renesas,rzv2h-gbeth: Document Renesas RZ/G3L SoC
    https://git.kernel.org/netdev/net-next/c/3ac2aa31b489
  - [net-next,v3,2/2] net: stmmac: dwmac-renesas-gbeth: Add support for RZ/G3L SoC
    https://git.kernel.org/netdev/net-next/c/1ba377008420

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
