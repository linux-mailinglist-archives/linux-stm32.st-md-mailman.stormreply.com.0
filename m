Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAoIDr4euml8RwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Mar 2026 04:40:46 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C938E2B589E
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Mar 2026 04:40:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74792C87ED8;
	Wed, 18 Mar 2026 03:40:45 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EDA39C36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2026 03:40:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E611860054;
 Wed, 18 Mar 2026 03:40:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98B69C19421;
 Wed, 18 Mar 2026 03:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773805242;
 bh=ci1TLeG+Q5wv5yzhht4iMsaCcAqoSh8bQP++IRr5860=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=TXIHu+hM0Lmy2qrU8gxrRdmeIqAmHvUXGdeiRO3cplllQ9CCZFrUiSsraDSRzmWkO
 2AigU3LiEXukj8PNRUAJjufPSJy9GmZ7lslsliwlNPIq0LAM8PW8Et6ziw4+7/cXNd
 TMXnvCAxjYO25M4dmPRelp0MNPNGaTLhYGeyYCcWzXm45TW9AgqXoFyq2k5WJtQuLp
 AsYjPdQNOf3R+penE6+IpDsACWjbETVvLuo2u+1Rw2XYXaCaauZfnMyTbwcgvJrIRg
 D1o3D11tWuX3hEE7DeURO5qlWQlOgVsRmJXCEDu6XB+yUeILlXGsDFoc734jbG5LWn
 usq2LTIj8TbPA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 BA0D13808200; Wed, 18 Mar 2026 03:40:35 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177380523454.113469.14485009686148036566.git-patchwork-notify@kernel.org>
Date: Wed, 18 Mar 2026 03:40:34 +0000
References: <abUtGH9KB03PH5Ne@shell.armlinux.org.uk>
In-Reply-To: <abUtGH9KB03PH5Ne@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hawk@kernel.org, daniel@iogearbox.net,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 ast@kernel.org, andrew+netdev@lunn.ch, edumazet@google.com, sdf@fomichev.me,
 kuba@kernel.org, bpf@vger.kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v4 00/15] net: stmmac: clean up
 descriptor handling part 1
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
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	TAGGED_FROM(0.00)[netdevbpf];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:andrew@lunn.ch,m:hawk@kernel.org,m:daniel@iogearbox.net,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:ast@kernel.org,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:sdf@fomichev.me,m:kuba@kernel.org,m:bpf@vger.kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.416];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: C938E2B589E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat, 14 Mar 2026 09:40:40 +0000 you wrote:
> Hi,
> 
> Part 1 of cleaning up the stmmac descriptor handling. Rearrange the
> struct stmmac_tx_info to pack better, and introduce helpers for
> duplicated code handing the transmit and receive descriptors. Remove
> unnecessary struct members that are only transitorily used.
> 
> [...]

Here is the summary with links:
  - [net-next,v4,01/15] net: stmmac: rearrange stmmac_tx_info members to pack better
    https://git.kernel.org/netdev/net-next/c/12b4b16c0c7e
  - [net-next,v4,02/15] net: stmmac: helpers for filling tx_q->tx_skbuff_dma
    https://git.kernel.org/netdev/net-next/c/a4b1590ee0f0
  - [net-next,v4,03/15] net: stmmac: clean up stmmac_clear_rx_descriptors()
    https://git.kernel.org/netdev/net-next/c/ee19df4d3bb7
  - [net-next,v4,04/15] net: stmmac: add helper to get hardware receive descriptor
    https://git.kernel.org/netdev/net-next/c/ee1b6a94ba12
  - [net-next,v4,05/15] net: stmmac: add helper to get size of a receive descriptor
    https://git.kernel.org/netdev/net-next/c/4f6280c450ba
  - [net-next,v4,06/15] net: stmmac: add helper to set receive tail pointer
    https://git.kernel.org/netdev/net-next/c/e9d0cafa9d60
  - [net-next,v4,07/15] net: stmmac: remove rx_tail_addr
    https://git.kernel.org/netdev/net-next/c/bea37bda7f75
  - [net-next,v4,08/15] net: stmmac: use consistent tests for receive buffer size
    https://git.kernel.org/netdev/net-next/c/0b3d09031437
  - [net-next,v4,09/15] net: stmmac: add helper to set receive buffer size
    https://git.kernel.org/netdev/net-next/c/a32734d25d87
  - [net-next,v4,10/15] net: stmmac: simplify stmmac_set_queue_rx_buf_size()
    https://git.kernel.org/netdev/net-next/c/337191f37748
  - [net-next,v4,11/15] net: stmmac: add helper to get hardware transmit descriptor
    https://git.kernel.org/netdev/net-next/c/c493261de1c4
  - [net-next,v4,12/15] net: stmmac: add helper to get size of a transmit descriptor
    https://git.kernel.org/netdev/net-next/c/2c3525ad09e9
  - [net-next,v4,13/15] net: stmmac: add helper to set transmit tail pointer
    https://git.kernel.org/netdev/net-next/c/b2fd52d90b8a
  - [net-next,v4,14/15] net: stmmac: remove tx_tail_addr
    https://git.kernel.org/netdev/net-next/c/0da7809235d9
  - [net-next,v4,15/15] net: stmmac: use queue rather than ->queue_index
    https://git.kernel.org/netdev/net-next/c/8cde3c87039b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
