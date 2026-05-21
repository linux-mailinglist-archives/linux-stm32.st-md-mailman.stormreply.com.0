Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FKfI/7ZDmrPCgYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 21 May 2026 12:10:06 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B0E5A2FCF
	for <lists+linux-stm32@lfdr.de>; Thu, 21 May 2026 12:10:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6CDEC87ED1;
	Thu, 21 May 2026 10:10:05 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F778C87ED0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 May 2026 10:10:04 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 0858D41B19;
 Thu, 21 May 2026 10:10:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D89531F000E9;
 Thu, 21 May 2026 10:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1779358202;
 bh=9R8ntL8OnsMLmlQawne1YSDG8cqsU2esjJuzaGlaegg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc;
 b=Ob366cd/ws5M953MPJx81mAfB5ttBr/S7oma5nDXTGUIZh+9wF2Nx9Tn9Sq/Zx/Vi
 3O0TXxK4Qqc4S49k9YhuthjpCrDa+JAeCC8p6Lh6D9UjHPVOOvzTjtw0mwp95+ug9A
 NB0UxO5YXWAUV3b18v9HzLFg4zwFK4l9nCvlwZadTZeOOphmgkF4nF+/6OggMEfTUF
 SX20DpLXHBoH8L5+egT6L2op0tyAzgZhhZwTPHlujMGqr0bmMljJg2GTyzcjQSTTTg
 QSc9NenKbvMNEJNL12cf2j0a9/KIeuYO/AJpVWvlxb+q306wyUKDTpm1+9S/9wOp7d
 xWHSjtdMR7DsQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 198143930D21; Thu, 21 May 2026 10:10:14 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177935821264.4013498.4647676520552839707.git-patchwork-notify@kernel.org>
Date: Thu, 21 May 2026 10:10:12 +0000
References: <20260518021919.404-1-lizhi2@eswincomputing.com>
In-Reply-To: <20260518021919.404-1-lizhi2@eswincomputing.com>
To: =?utf-8?b?5p2O5b+XIDxsaXpoaTJAZXN3aW5jb21wdXRpbmcuY29tPg==?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: edumazet@google.com, linux-stm32@st-md-mailman.stormreply.com,
 robh@kernel.org, pritesh.patel@einfochips.com, weishangjuan@eswincomputing.com,
 ningyu@eswincomputing.com, maxime.chevallier@bootlin.com, kuba@kernel.org,
 pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 rmk+kernel@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
 pinkesh.vaghela@einfochips.com, linmin@eswincomputing.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 mcoquelin.stm32@gmail.com, krzk+dt@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net v2 0/5] net: stmmac: eic7700: fix
 delay calculation and initialization ordering
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
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[google.com,st-md-mailman.stormreply.com,kernel.org,einfochips.com,eswincomputing.com,bootlin.com,redhat.com,vger.kernel.org,armlinux.org.uk,lists.infradead.org,lunn.ch,gmail.com,davemloft.net];
	TAGGED_FROM(0.00)[netdevbpf];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:=?utf-8?b?5p2O5b+XIDxsaXpoaTJAZXN3aW5jb21wdXRpbmcuY29tPg==?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,m:edumazet@google.com,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:pritesh.patel@einfochips.com,m:weishangjuan@eswincomputing.com,m:ningyu@eswincomputing.com,m:maxime.chevallier@bootlin.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:rmk+kernel@armlinux.org.uk,m:linux-arm-kernel@lists.infradead.org,m:pinkesh.vaghela@einfochips.com,m:linmin@eswincomputing.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:davem@davemloft.net,m:=?utf-8?b?5p2O5b@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.997];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,XIDxsaXpoaTJAZXN3aW5jb21wdXRpbmcuY29tPg==?=,dt,kernel,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[eswincomputing.com:email,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: 22B0E5A2FCF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This series was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Mon, 18 May 2026 10:19:19 +0800 you wrote:
> From: Zhi Li <lizhi2@eswincomputing.com>
> 
> v1 -> v2:
>   - Update eswin,eic7700-eth.yaml:
>     - Limit the binding changes to adding optional TXD and RXD delay register
>       offsets in eswin,hsp-sp-csr.
>     - Restore the original enum-based definitions for rx-internal-delay-ps
>       and tx-internal-delay-ps.
>     - Keep rx-internal-delay-ps and tx-internal-delay-ps as required
>       properties.
>     - Restore the original example content, with only the additional optional
>       TXD and RXD delay register offsets.
>     - Restore Acked-by from Conor Dooley for the binding change, which was
>       temporarily omitted in v1 during series restructuring and has been
>       reinstated now that the change is stable and properly isolated.
> 
> [...]

Here is the summary with links:
  - [net,v2,1/5] dt-bindings: ethernet: eswin: add optional TXD and RXD delay register offsets
    https://git.kernel.org/netdev/net/c/c36069c6f46c
  - [net,v2,2/5] net: stmmac: eswin: fix HSP CSR init ordering after clock enable
    https://git.kernel.org/netdev/net/c/23386defe949
  - [net,v2,3/5] net: stmmac: eswin: clear TXD and RXD delay registers during initialization
    https://git.kernel.org/netdev/net/c/6872fb088edc
  - [net,v2,4/5] net: stmmac: eswin: correct RGMII delay granularity to 20 ps
    https://git.kernel.org/netdev/net/c/6ffcef9bc1fc
  - [net,v2,5/5] net: stmmac: eswin: validate RGMII delay values
    https://git.kernel.org/netdev/net/c/c2e152f7ce32

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
