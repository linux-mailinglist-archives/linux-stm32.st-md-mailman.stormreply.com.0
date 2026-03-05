Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kB0vDyKfqWnGAwEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 05 Mar 2026 16:20:02 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B9D2145C9
	for <lists+linux-stm32@lfdr.de>; Thu, 05 Mar 2026 16:20:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1739BC8F26E;
	Thu,  5 Mar 2026 15:20:01 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1C20C8F26D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Mar 2026 15:19:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BE0C44072B;
 Thu,  5 Mar 2026 15:19:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E616BC116C6;
 Thu,  5 Mar 2026 15:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772723997;
 bh=fiPz7wtqOY5BeMkxwRsGcfzBJ/wpg9ehDqfpzlZwBLQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cy/zFlEmHAifNQfbSTWPYDYipTTH6trB82Oy0edkNFgF3YpPGscbwDmMl6vOh2a1o
 cpLko/5dWTKLyg07VjmS9LvqLoqnVHOa10DVNy56/V8v9skgkhMOnmKQiBd13OF6ka
 /p85yoP6L6p3fmrqnArS85XXxfzOKNwC6EDHgH+oBU82lczxgd0IXLvSjUnlBq/k+l
 +YQNjeZKi1l1nUxwuU4utBs0zt/8j5Bey0RfbuahW3/7fg8yk9OFdVfa18aPtLZbkr
 f0hmeSriiIJz++KYt3Q7i1jDkiLdKpJbo3FOMMZWy/DCGjGDbww8vzd28fbZQEWa+C
 u0XPYXxW/UvsA==
Date: Thu, 5 Mar 2026 07:19:56 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20260305071956.08d49615@kernel.org>
In-Reply-To: <aaly2p34HoJAIJbx@shell.armlinux.org.uk>
References: <aald--qJquWGIvmO@shell.armlinux.org.uk>
 <E1vy69y-0000000Btwd-3oq7@rmk-PC.armlinux.org.uk>
 <aaly2p34HoJAIJbx@shell.armlinux.org.uk>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Chen-Yu Tsai <wens@kernel.org>,
 linux-sunxi@lists.linux.dev, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 1/8] net: stmmac: mdio:
 convert MDC clock divisor selection to tables
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
X-Rspamd-Queue-Id: C4B9D2145C9
X-Rspamd-Server: lfdr
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
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:andrew@lunn.ch,m:pabeni@redhat.com,m:samuel@sholland.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:wens@kernel.org,m:linux-sunxi@lists.linux.dev,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	NEURAL_HAM(-0.00)[-0.704];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Thu, 5 Mar 2026 12:11:06 +0000 Russell King (Oracle) wrote:
> On Thu, Mar 05, 2026 at 10:42:26AM +0000, Russell King (Oracle) wrote:
> > Convert the MDC clock divisor selection to tabular format.
> > 
> > Note that there is a change for 300MHz, but this is not a problem,
> > as the MDC clock remains within the useable ranges, which are:  
> 
> I notice that checkpatch complains about "useable", which it should
> not do. "useable" is perfectly correct, especially in British English.
> As I'm British, I won't be fixing this checkpatch complaint.

Yesterday it reported a warning that someone repeated the word 'very'.
As in "this is very very wrong". checkpatch, eh? gold.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
