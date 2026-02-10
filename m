Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BDNJABni2kMUQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Feb 2026 18:12:32 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A2D11DADC
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Feb 2026 18:12:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB36FC87EC0;
	Tue, 10 Feb 2026 17:12:31 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96E95C1A97F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Feb 2026 17:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mzYF97sVWz63m1CUxZf+jl+Hhjnz8guVOlV5+MbrsME=; b=eR2SFbnI4lfCWYT1cmVHQL6SgG
 rkwXF+klYabsm6Z8drPNbxY5lCHy5UDtoDUyIbk8k4bkjUYCPQd6mhuVxaXlvC2WB454hmU/RXBnE
 paJhrdsndFkbykNv8/uEnSfLJnpMBDfDwP4/kfpQoVxwaPrnJj2qGDKQUgeXleafN9uRJ6KB1izT6
 B9Fyw7AL9cgLv/2DzrsdO5ebbUbRC+1m6eRDWKFX4IFp7saMMQijwOi8QniOzBpVTezDN8kP/gYIX
 nt7vaZMESAfi7iEyd7/yO16UiTBbbDZrCpBegIn53yo5+TBUJrhsPGPWdDJa/7ThDQfBPfrisXpqp
 uhM/QYaQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57276)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vprHc-000000002nw-193h;
 Tue, 10 Feb 2026 17:12:16 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vprHW-000000002wr-3vpe; Tue, 10 Feb 2026 17:12:11 +0000
Date: Tue, 10 Feb 2026 17:12:10 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Florian Bezdeka <florian.bezdeka@siemens.com>
Message-ID: <aYtm6pCnw0hdWdNx@shell.armlinux.org.uk>
References: <20260210-flo-net-stmmac-default-affinity-core-v1-0-4e76612444e1@siemens.com>
 <20260210-flo-net-stmmac-default-affinity-core-v1-1-4e76612444e1@siemens.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260210-flo-net-stmmac-default-affinity-core-v1-1-4e76612444e1@siemens.com>
Cc: linux-kernel@vger.kernel.org, Voon Weifeng <weifeng.voon@intel.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/2] net: stmmac: intel: Fix IRQ
	vector leak
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
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:florian.bezdeka@siemens.com,m:linux-kernel@vger.kernel.org,m:weifeng.voon@intel.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:boon.leong.ong@intel.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,intel.com,st-md-mailman.stormreply.com,lunn.ch,google.com,gmail.com,kernel.org,redhat.com,davemloft.net,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email,armlinux.org.uk:url]
X-Rspamd-Queue-Id: 32A2D11DADC
X-Rspamd-Action: no action

Note that net-next is currently closed. Patches for net-next should
be sent RFC. Please see the netdev *whatever it is* documentation (I
can never remember the name of the renamed document nor it's URL).
It's somewhere on docs.kernel.org and is in Documentation/ somewhere.
I'm getting tired of having to do a google search every single time
I respond to someone about this.

On Tue, Feb 10, 2026 at 05:28:14PM +0100, Florian Bezdeka wrote:
> The IRQ vectors allocated in stmmac_config_multi_msi() or
> stmmac_config_single_msi() where never cleaned up.

Please refer to:

https://lore.kernel.org/netdev/27fec7d0ed633218a7787be3edce63c3038c63e2.camel@mailbox.org/
https://lore.kernel.org/netdev/7e024db2557a4d5822a0dd409ae678d10d815d9c.camel@mailbox.org/

and the associated discussion in that thread.

PCI is weird. If pcim_enable_device() is used, it switches all sorts of
other functions to managed mode. The missing cleanup here isn't
actually missing, it's buried in the depths of PCI code. So, this is
not a bug, and thus:

> 
> Fixes: b42446b9b37b ("stmmac: intel: add support for multi-vector msi and msi-x")

this is not a fix.

However, if you look at Philipp's replies, there is a desire to get
rid of this PCI behaviour, so your patch is useful - it just needs not
to be dressed up as a fix.

I am keen that we cut down on the duplication between drivers. Having
_four_ stmmac PCI drivers all using MSI but no sharing any code is
silly.

Please consider what you can do to improve the current situation with
these stmmac PCI drivers.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
