Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHp0MWxPhmlpLwQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 06 Feb 2026 21:30:36 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD1D1031F2
	for <lists+linux-stm32@lfdr.de>; Fri, 06 Feb 2026 21:30:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E60C1C87EDD;
	Fri,  6 Feb 2026 20:30:35 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82329C58D7A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Feb 2026 20:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4YHH0YAMAHnJ5UGh8pphcs9yAuxrmD7yQeFh/XrEM1k=; b=cUM2ujHWceUzMbW20cIxqA4llS
 NkE8BDAwqzDmYlfweI9LHAUpWYlxzdrvLA5m1wdr0Z8+TZA5w10hCD+WxkQyEgPtUUEnq6GnJiU4O
 wvjdWjQJfmNXBJtzVpEL8q07G8B+obm9lIEThmhNkdCtmQZUAGs0j8PRgQtQcGwV6VHukgdN4P25b
 euMdVvZOmk2Z3Ol28RZgeWSFM2HOIFBjngDcaebtXbfDdzeloV790c2+Bj9G7f+PMqOWXBQQtPlVu
 z9kyVPyVhCuw6ZoRtG+Uj33nOwDBjz95xY11XTce8Ny/irboMl+80x5OPmDmfd34eHK2NLxH/3c40
 Rz9IKV0w==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42876)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1voST3-000000008Oi-39Cq;
 Fri, 06 Feb 2026 20:30:17 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1voSSy-000000007cx-01gv; Fri, 06 Feb 2026 20:30:12 +0000
Date: Fri, 6 Feb 2026 20:30:11 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jie Zhang <jzhang918@gmail.com>
Message-ID: <aYZPUx2WrIkPmvIU@shell.armlinux.org.uk>
References: <20260206195643.11333-1-jie.zhang@analog.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260206195643.11333-1-jie.zhang@analog.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, jie.zhang@analog.com, horms@kernel.org,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Jacob Keller <jacob.e.keller@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v2] net: stmmac: fix oops when split
	header is enabled
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
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:jzhang918@gmail.com,m:Jose.Abreu@synopsys.com,m:linux-kernel@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:jie.zhang@analog.com,m:horms@kernel.org,m:vladimir.oltean@nxp.com,m:jacob.e.keller@intel.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[synopsys.com,vger.kernel.org,gmail.com,st-md-mailman.stormreply.com,lunn.ch,google.com,analog.com,kernel.org,nxp.com,intel.com,redhat.com,davemloft.net,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.965];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[analog.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,intel.com:email]
X-Rspamd-Queue-Id: 5FD1D1031F2
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 02:56:38PM -0500, Jie Zhang wrote:
> For GMAC4, when split header is enabled, in some rare cases, the
> hardware does not fill buf2 of the first descriptor with payload.
> Thus we cannot assume buf2 is always fully filled if it is not
> the last descriptor. Otherwise, the length of buf2 of the second
> descriptor will be calculated wrong and cause an oops:
> 
> Unable to handle kernel paging request at virtual address ffff00019246bfc0
> ...
> x2 : 0000000000000040 x1 : ffff00019246bfc0 x0 : ffff00009246c000
> Call trace:
>  dcache_inval_poc+0x28/0x58 (P)
>  dma_direct_sync_single_for_cpu+0x38/0x6c
>  __dma_sync_single_for_cpu+0x34/0x6c
>  stmmac_napi_poll_rx+0x8f0/0xb60
>  __napi_poll.constprop.0+0x30/0x144
>  net_rx_action+0x160/0x274
>  handle_softirqs+0x1b8/0x1fc
> ...
> 
> To fix this, the PL bit-field in RDES3 register is used for all
> descriptors, whether it is the last descriptor or not.
> 
> Fixes: ec222003bd94 ("net: stmmac: Prepare to add Split Header support")
> Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
> Signed-off-by: Jie Zhang <jie.zhang@analog.com>
> ---
> v2:
> 1. Update for the latest net HEAD
> 2. Reduce crash dump message in commit message
> 3. Add Fixes tag
> v1 link: https://lore.kernel.org/all/20251202025421.4560-1-jie.zhang@analog.com/

I was trying to work out whether this was a re-post of a patch that had
already been merged and it was the result of someone inappropriately
re-posting old patches, or whether it was something to take seriously.

That is because of this in the patch:

> +	/* Not GMAC4 and not last descriptor */
> +	if (!priv->plat->has_gmac4 && (status & rx_not_ls))

Commit 26ab9830beab ("net: stmmac: replace has_xxxx with core_type"):

diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 99022620457a..151c81c560c8 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
...
+       enum dwmac_core_type core_type;
...
-       int has_gmac4;

So, has_gmac4 no longer exists, and hasn't done since October last
year.

Thus, it seems your patch has been generated against an old kernel.
As you are submitting for netdev, it is a good idea to ensure that
patches apply to the net-next tree and/or net tree depending on
which one you are targetting, and have been tested against that
tree.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
