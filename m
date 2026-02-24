Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGN4OStvnWk9QAQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Feb 2026 10:28:11 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A48B6184936
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Feb 2026 10:28:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3ABFBC8F285;
	Tue, 24 Feb 2026 09:28:10 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53572C08D19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 09:28:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4C0D86091C;
 Tue, 24 Feb 2026 09:28:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFDE2C116D0;
 Tue, 24 Feb 2026 09:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771925287;
 bh=UjV+lVT62XoKCNm3uXANF9IwXBOBlVqxQ2pDtUbIBXc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OUZpqHl9KOq3NztIgVFQnBX5c8PRe87hioP2HSuqHpab1UHLsBZ1svI4vteAQLBs7
 OLLP0B1MFP/TXSaItgMk2liCMMbrwVVrCe+rnHoxFAEUmwjVdmFQDavW+rwWOqJ6wT
 7pDiHJ5lAQmlfqabozb2hCqOok6MNK0d4i2zEO/Bu11+ZHQITQfh5m1iXI/D5QprT8
 /NIQxW8w1xhBkngwn/+JQoxH43uRqFerkMTn1IqsD6LCH32ro2/JEbLk2R+8O+K3Lw
 ENg9Hux853QsTM7B6D/Kuz1Ct7LNCm+u4eznPQk+7+1lWUHYhmYn8qwwgBlHh3MKGp
 NbzsPIp6HJN3Q==
Date: Tue, 24 Feb 2026 09:28:02 +0000
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <aZ1vImgrq1yxBIyy@horms.kernel.org>
References: <E1vuUu4-0000000Afea-0j9B@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1vuUu4-0000000Afea-0j9B@rmk-PC.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: fix timestamping
 configuration after suspend/resume
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rmk+kernel@armlinux.org.uk,m:andrew@lunn.ch,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[horms@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.945];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[horms@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-stm32,kernel,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[horms.kernel.org:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,armlinux.org.uk:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: A48B6184936
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 12:19:08PM +0000, Russell King (Oracle) wrote:
> When stmmac_init_timestamping() is called, it clears the receive and
> transmit path booleans that allow timestamps to be read. These are
> never re-initialised until after userspace requests timestamping
> features to be enabled.
> 
> However, our copy of the timestamp configuration is not cleared, which
> means we return the old configuration to userspace when requested.
> This is inconsistent. Fix this by clearing the timestamp configuration.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> 
> I'm in two minds whether this should go via net or net-next - no one
> has noticed that getting the timestamp configuration after resume
> doesn't reflect the hardware state. Here's the commit that introduced
> the problem:
> 
> Fixes: d6228b7cdd6e ("net: stmmac: implement the SIOCGHWTSTAMP ioctl")

My feeling is that the bar is not if someone noticed or not.
So I would lean towards a fix for net in this case.

Regardless, feel free to include:

Reviewed-by: Simon Horman <horms@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
