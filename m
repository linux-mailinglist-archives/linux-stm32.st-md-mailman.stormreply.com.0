Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADeGOL8euml8RwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Mar 2026 04:40:47 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C23842B58A5
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Mar 2026 04:40:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85B76C8F262;
	Wed, 18 Mar 2026 03:40:47 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C527CC8F262
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2026 03:40:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3ED74406EF;
 Wed, 18 Mar 2026 03:40:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 170E8C19421;
 Wed, 18 Mar 2026 03:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773805244;
 bh=b5OWkuV535Oj1V56MTHDGF5WH37w+G2cepaHZkvA+6A=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=OZlImp5de0YUVbmDOxamq0jULzuXJ18Plsj/DYYr1d9yzVnU6jnkLIdgBgapY5l+Z
 9z/5aKPq8GfU/o4Ld5wUT8/Ii6U5HAKgU1f410onFyYmJkWpepDrCDRmQMOZD1VY/H
 16gKyCAwyP9sjqfzKI/7vuK50XPkT5mJwMRAU+mEVIMka9P3FSPwfFAjz697NEmuX9
 F0xrbH4WwthbEiRhnluec/iydIpOUqNsL4LAs2ZPidcH1ZSlPAd6Fnc1oICkd/Bpjp
 ZvzxCB2LilAYUWlnZt82XHcqnEBkQ8JhkTS3CHM+ye6UiSkWyLw4plYFKqJ9ZGURar
 Km0HUg2O2yMXg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 3FFCF3808200; Wed, 18 Mar 2026 03:40:37 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177380523578.113469.12534429691494800323.git-patchwork-notify@kernel.org>
Date: Wed, 18 Mar 2026 03:40:35 +0000
References: <20260316010041.164360-1-inochiama@gmail.com>
In-Reply-To: <20260316010041.164360-1-inochiama@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: me@ziyao.cc, looong.bin@gmail.com, linux-kernel@vger.kernel.org,
 edumazet@google.com, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 weishangjuan@eswincomputing.com, alex@ghiti.fr, siyanteng@cqsoftware.com.cn,
 joabreu@synopsys.com, vladimir.oltean@nxp.com, kuba@kernel.org,
 pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 aou@eecs.berkeley.edu, richardcochran@gmail.com, dlan@kernel.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com, rmk+kernel@armlinux.org.uk,
 peppe.cavallaro@st.com, wens@kernel.org, spacemit@lists.linux.dev,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, dlan@gentoo.org,
 netdev@vger.kernel.org, quentin.schulz@cherry.de, lizhi2@eswincomputing.com,
 andrew+netdev@lunn.ch, palmer@dabbelt.com, boon.khai.ng@altera.com,
 mcoquelin.stm32@gmail.com, pjw@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v10 0/4] riscv: spacemit: Add
 ethernet support for K3
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
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[netdevbpf];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:inochiama@gmail.com,m:me@ziyao.cc,m:looong.bin@gmail.com,m:linux-kernel@vger.kernel.org,m:edumazet@google.com,m:linux-riscv@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:weishangjuan@eswincomputing.com,m:alex@ghiti.fr,m:siyanteng@cqsoftware.com.cn,m:joabreu@synopsys.com,m:vladimir.oltean@nxp.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:aou@eecs.berkeley.edu,m:richardcochran@gmail.com,m:dlan@kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:rmk+kernel@armlinux.org.uk,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:spacemit@lists.linux.dev,m:krzk+dt@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:dlan@gentoo.org,m:netdev@vger.kernel.org,m:quentin.schulz@cherry.de,m:lizhi2@eswincomputing.com,m:andrew+netdev@lunn.ch,m:palmer@dabbelt.com,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:pjw@kernel.org,m:davem@davemloft.net,m:looongbin@gmail.com,m:conor@kernel.org,m
 :rmk@armlinux.org.uk,m:krzk@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[37];
	FREEMAIL_CC(0.00)[ziyao.cc,gmail.com,vger.kernel.org,google.com,lists.infradead.org,st-md-mailman.stormreply.com,kernel.org,eswincomputing.com,ghiti.fr,cqsoftware.com.cn,synopsys.com,nxp.com,redhat.com,eecs.berkeley.edu,bp.renesas.com,armlinux.org.uk,st.com,lists.linux.dev,gentoo.org,cherry.de,lunn.ch,dabbelt.com,altera.com,davemloft.net];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.843];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: C23842B58A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 16 Mar 2026 09:00:36 +0800 you wrote:
> Add initial support for ethernet controller of the Spacemit K3 SoC.
> This ethernet controller is almost a standard Synopsys DesignWare
> MAC (version 5.40a). This controller require a syscon device to
> configure some basic features, like interface type and internal delay.
> 
> Change from v9:
> - https://lore.kernel.org/netdev/20260312012232.373713-1-inochiama@gmail.com
> patch 3:
> 1. fix misaligned brace.
> 
> [...]

Here is the summary with links:
  - [net-next,v10,1/4] dt-bindings: net: Add support for Spacemit K3 dwmac
    https://git.kernel.org/netdev/net-next/c/bb30400a566c
  - [net-next,v10,2/4] net: stmmac: platform: Add snps,dwmac-5.40a IP compatible string
    https://git.kernel.org/netdev/net-next/c/d35aa97ea908
  - [net-next,v10,3/4] net: stmmac: Add glue layer for Spacemit K3 SoC
    https://git.kernel.org/netdev/net-next/c/30f0ba420ed3
  - [net-next,v10,4/4] MAINTAINERS: add entry for SpacemiT DWMAC glue layer
    https://git.kernel.org/netdev/net-next/c/25e7553a502b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
