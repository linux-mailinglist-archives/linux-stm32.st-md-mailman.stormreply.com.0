Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAxGNBt/p2kyiAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 04 Mar 2026 01:38:51 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 694AD1F8F1C
	for <lists+linux-stm32@lfdr.de>; Wed, 04 Mar 2026 01:38:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F001C5A4C5;
	Wed,  4 Mar 2026 00:38:51 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D85CCC055F4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Mar 2026 00:38:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9AF3041675;
 Wed,  4 Mar 2026 00:38:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33080C116C6;
 Wed,  4 Mar 2026 00:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772584728;
 bh=ghDmKoa2dUlX6/OtOt3rrcXErN7aJJ5211rIBAkODmw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tEWdoz5OeaSpQx6c/ENjos95U5KxI/Jl98SqspTWYj3JuCPx8u10usnjYZyhNfXsZ
 v9Y8yc0cRsOCu3g4v71FRmk4/3ZGq3w/PpuMbj6vD4Kzmk5ZoWkIoKPu7hEp2oqFlb
 1VLOi+5HRdjjE21UT8wHg2ILz+0qW9818yapzRb+8Fwcy3JKAiMT49mUwYa1SNdaFm
 qCSMPXpomA/If4KmiZI3CAmba4Nm5jBLyIGAtVhbzJevqUAVOCBsK1sVz374yCZIVC
 Bgd7V4HY8JQiMkVu1thvTZ1zJ+j1xtktAnESJIiMcYuDV5maJYvwmJ1eXFbDNo/eIi
 Cnd/Bg5opJH+w==
Date: Tue, 3 Mar 2026 16:38:46 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: lizhi2@eswincomputing.com
Message-ID: <20260303163846.156d18f7@kernel.org>
In-Reply-To: <20260303061637.872-1-lizhi2@eswincomputing.com>
References: <20260303061525.846-1-lizhi2@eswincomputing.com>
 <20260303061637.872-1-lizhi2@eswincomputing.com>
MIME-Version: 1.0
Cc: edumazet@google.com, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 weishangjuan@eswincomputing.com, alex@ghiti.fr, ningyu@eswincomputing.com,
 pritesh.patel@einfochips.com, pabeni@redhat.com, devicetree@vger.kernel.org,
 conor+dt@kernel.org, aou@eecs.berkeley.edu, rmk+kernel@armlinux.org.uk,
 wens@kernel.org, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 pinkesh.vaghela@einfochips.com, linmin@eswincomputing.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 palmer@dabbelt.com, mcoquelin.stm32@gmail.com, pjw@kernel.org,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v3 1/3] dt-bindings: ethernet:
 eswin: add clock sampling control
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
X-Rspamd-Queue-Id: 694AD1F8F1C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_CC(0.00)[google.com,lists.infradead.org,st-md-mailman.stormreply.com,kernel.org,eswincomputing.com,ghiti.fr,einfochips.com,redhat.com,vger.kernel.org,eecs.berkeley.edu,armlinux.org.uk,lunn.ch,dabbelt.com,gmail.com,davemloft.net];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_RECIPIENTS(0.00)[m:lizhi2@eswincomputing.com,m:edumazet@google.com,m:linux-riscv@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:weishangjuan@eswincomputing.com,m:alex@ghiti.fr,m:ningyu@eswincomputing.com,m:pritesh.patel@einfochips.com,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:aou@eecs.berkeley.edu,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:krzk+dt@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:pinkesh.vaghela@einfochips.com,m:linmin@eswincomputing.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:palmer@dabbelt.com,m:mcoquelin.stm32@gmail.com,m:pjw@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:krzk@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.863];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[eswincomputing.com:email]
X-Rspamd-Action: no action

On Tue,  3 Mar 2026 14:16:37 +0800 lizhi2@eswincomputing.com wrote:
> There are currently no in-tree users of the EIC7700 Ethernet driver, so
> these changes are safe.

What do you mean by this sentence? The commit under Fixes was part of
Linux v6.19 already.

> Fixes: 888bd0eca93c ("dt-bindings: ethernet: eswin: Document for EIC7700 SoC")
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
