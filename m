Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AO/bAqAmpmnwLAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 03 Mar 2026 01:09:04 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0DA1E6FBA
	for <lists+linux-stm32@lfdr.de>; Tue, 03 Mar 2026 01:09:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC2A5C35E3C;
	Tue,  3 Mar 2026 00:09:02 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D387C35E2B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Mar 2026 00:09:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 363564054A;
 Tue,  3 Mar 2026 00:09:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 484D8C19423;
 Tue,  3 Mar 2026 00:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772496540;
 bh=Z7qzH+D+x67to5sjz18CPohudnWYBfSkLMEK4/Me4F0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WFrjQ/5kV8TOTrHmKgXNQTQUMy/UkeRyUyE2IFWAdlTmOlpJbQiz658attUr4F6Bq
 gDYAJ+RWG80dC2BGEBS3VSN1UPvs/orq0XSoy45j8LuzhiXPJqHVzblZAIT7o+nRQA
 jcWXgYAW4dPfjJzh6MfHbm4DEKsLjVuRtDXJBjJPAsUmG7X4mVpMFN04zY9EDCNvKX
 BugFfMHWV2ub1B4bU1MSIzaaEw7LK0AuYl1LtQzu+0oChW72UtdThQHpud1b5HopLW
 T7Vx/n4KSI18dfpe8MFU/mhM5pYs0slgEdpk6mJC2e6izNI4p+gj7+/EaXEJZVH8P4
 bd6tWDwBX7DIw==
Date: Mon, 2 Mar 2026 16:08:58 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Message-ID: <20260302160858.2fe0fa3b@kernel.org>
In-Reply-To: <TY7P301MB1984067560FD51D7E2424CA2D37EA@TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM>
References: <20260225142414.130144-1-ovidiu.panait.rb@renesas.com>
 <20260225142414.130144-5-ovidiu.panait.rb@renesas.com>
 <20260228110408.384420e1@kernel.org>
 <TY7P301MB1984067560FD51D7E2424CA2D37EA@TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kim.tatt.chuah@intel.com" <kim.tatt.chuah@intel.com>,
 "hayashi.kunihiko@socionext.com" <hayashi.kunihiko@socionext.com>,
 "vladimir.oltean@nxp.com" <vladimir.oltean@nxp.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "rohan.g.thomas@altera.com" <rohan.g.thomas@altera.com>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
 "edumazet@google.com" <edumazet@google.com>,
 "boon.khai.ng@altera.com" <boon.khai.ng@altera.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "boon.leong.ong@intel.com" <boon.leong.ong@intel.com>,
 "pabeni@redhat.com" <pabeni@redhat.com>,
 "rmk+kernel@armlinux.org.uk" <rmk+kernel@armlinux.org.uk>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net-next v2 4/5] net: stmmac: Add write_hw
 parameter to VLAN filter operations
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
X-Rspamd-Queue-Id: 3D0DA1E6FBA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,intel.com,socionext.com,nxp.com,st-md-mailman.stormreply.com,altera.com,armlinux.org.uk,lunn.ch,google.com,gmail.com,redhat.com,davemloft.net,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:ovidiu.panait.rb@renesas.com,m:linux-kernel@vger.kernel.org,m:kim.tatt.chuah@intel.com,m:hayashi.kunihiko@socionext.com,m:vladimir.oltean@nxp.com,m:linux-stm32@st-md-mailman.stormreply.com,m:rohan.g.thomas@altera.com,m:linux@armlinux.org.uk,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:boon.leong.ong@intel.com,m:pabeni@redhat.com,m:rmk+kernel@armlinux.org.uk,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.817];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email]
X-Rspamd-Action: no action

On Mon, 2 Mar 2026 21:59:00 +0000 Ovidiu Panait wrote:
> > I wonder if instead of passing attributes like this around the driver
> > shouldn't simply maintain a flag (or have other way to test) whether
> > the clock to block X is currently enabled? It feels more like a global
> > state / property than trickiness directly related to VLAN config.
> 
> I'll drop the write_hw logic and instead just check netif_running()
> directly, to avoid passing attributes around.

SG, tho - be careful with netif_running() in context of open / close 
code paths.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
