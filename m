Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JJlD6JmyWm4xwUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 29 Mar 2026 19:51:30 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D74003536A9
	for <lists+linux-stm32@lfdr.de>; Sun, 29 Mar 2026 19:51:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F058EC8F269;
	Sun, 29 Mar 2026 17:42:28 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E81E9C87ECD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 29 Mar 2026 17:42:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D683660054;
 Sun, 29 Mar 2026 17:42:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD8E1C116C6;
 Sun, 29 Mar 2026 17:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774806145;
 bh=Dgjm5JDJVPVi105xPjT0M4xjKqbcapeMVq6MJrJMHiM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=K1jBwiTRDPR5JvC58W6u26L8/DtzjfHPUvIDFhoueqTs8Yyh8imbx+gyg0AEbJ/C0
 E/P0YqYGro7/VjB/9vvmPxzj73HJ4eBS1VwSEaZhQms+WwMizCdiV66lfek0iR+XlR
 5NYPjEn7exjhGjtri4rs0Qw5sqU9W1VtBOsvxmJGAlzVMVcHt/vdg3iMHgMk/Mu7i0
 JQlYlUt+FkmspPZR98PWwk1stUEgEOpZBI8PMzOWegLeUSUp8hly7TiljKmUZE3ftQ
 QXAio38VTVRmvs8A4BEgGzp86HFnRZCx//Kcbr6dkoDVJ3E+xD5Vhk3Y+qWRz05zRX
 wZwT7h1mgwS0Q==
Date: Sun, 29 Mar 2026 10:42:23 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20260329104223.358351ee@kernel.org>
In-Reply-To: <acjzmxY9xmBInSwm@shell.armlinux.org.uk>
References: <achJ1dfeT6Q8rBuX@shell.armlinux.org.uk>
 <E1w6bKj-0000000ELtf-3md9@rmk-PC.armlinux.org.uk>
 <acjzmxY9xmBInSwm@shell.armlinux.org.uk>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Ong Boon Leong <boon.leong.ong@intel.com>,
 Paolo Abeni <pabeni@redhat.com>, "David
 S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 01/10] net: stmmac: fix TSO
 support when some channels have TBS available
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:andrew@lunn.ch,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:boon.leong.ong@intel.com,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	FROM_HAS_DN(0.00)[];
	NEURAL_SPAM(0.00)[0.481];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: D74003536A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, 29 Mar 2026 10:40:43 +0100 Russell King (Oracle) wrote:
> On Sat, Mar 28, 2026 at 09:36:41PM +0000, Russell King (Oracle) wrote:
> > According to the STM32MP25xx manual, which is dwmac v5.3, TBS (time
> > based scheduling) is not permitted for channels which have hardware
> > TSO enabled. Intel's commit 5e6038b88a57 ("net: stmmac: fix TSO and
> > TBS feature enabling during driver open") concurs with this, but it
> > is incomplete.
> > 
> > This commit avoids enabling TSO support on the channels which have
> > TBS available, which, as far as the hardware is concerned, means we
> > do not set the TSE bit in the DMA channel's transmit control register.
> > 
> > However, the net device's features apply to all queues(channels), which
> > means these channels may still be handed TSO skbs to transmit, and the
> > driver will pass them to stmmac_tso_xmit(). This will generate the
> > descriptors for TSO, even though the channel has the TSE bit clear.
> > 
> > Fix this by checking whether the queue(channel) has TBS available,
> > and if it does, fall back to software GSO support.  
> 
> This is sufficient for the immediate issue of fixing the patch below,
> but I think there's another issue that also needs fixing here.
> 
> TSO requires the hardware to support checksum offload, and there is
> a comment in the driver:
> 
>         /* DWMAC IPs can be synthesized to support tx coe only for a few tx
>          * queues. In that case, checksum offloading for those queues that don't
>          * support tx coe needs to fallback to software checksum calculation.
>          *
>          * Packets that won't trigger the COE e.g. most DSA-tagged packets will
>          * also have to be checksummed in software.
>          */
> 
> So, it seems at the very least we need to add a check (in a subsequent
> patch) for priv->plat->tx_queues_cfg[queue].coe_unsupported to
> stmmac_channel_tso_permitted().
> 
> I'm also wondering about the stmmac_has_ip_ethertype() thing, which
> checks whether the skb can be checksummed by the hardware, and how that
> interacts with TSO, and whether that's yet another hole that needs
> plugging.

If the driver "un-advertises" checksum offload accordingly the core
should automatically clear TSO feature.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
