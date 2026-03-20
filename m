Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEHXKokXwWn5QQQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Mar 2026 11:35:53 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 489B42F031C
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Mar 2026 11:35:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CEC93C87EC8;
	Mon, 23 Mar 2026 10:35:52 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4C84C36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Mar 2026 09:04:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8C79F6013A;
 Fri, 20 Mar 2026 09:04:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4994C4CEF7;
 Fri, 20 Mar 2026 09:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773997461;
 bh=xUkj9g/+sF9hLqzuMN/RQEM4VIjN8lYjJ0chPrZqsI0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=B13IVhIdYsDkKyGIkMxVS9c/MB3na1dxWmD0JTg3kt1A0lhM0cflQ92WWV6Js5LeS
 mHe13DWUJR5o+yDFAZOCmxw3i0bPJlOJgVHJ/QPFovh12DIRNBnKacZWOcVoKB8qOo
 jMCWFi/p6eYXV0bK0XOZLgLgLAuFIsYAKcaxfUybbTZBT+wEoUdWaAeBLsoHCRBqiL
 eBccbPQBi8UjNZolplSiY0MmlMnURPDpu97rlfs2uurYNAkoP8m4/OWEvKLm1SvvcT
 D+KqgdsoGOXFxyKvjEcc+NeDCPpo99dSE0Ac67ihP1IHS04RJ/SEcHdk0hC0lKmzDw
 nJWpyCes5UvTg==
From: Thomas Gleixner <tglx@kernel.org>
To: Rosen Penev <rosenp@gmail.com>, linux-stm32@st-md-mailman.stormreply.com
In-Reply-To: <20260320040443.46038-1-rosenp@gmail.com>
References: <20260320040443.46038-1-rosenp@gmail.com>
Date: Fri, 20 Mar 2026 10:04:18 +0100
Message-ID: <87cy0ylvn1.ffs@tglx>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 23 Mar 2026 10:35:52 +0000
Cc: "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "open list:IRQCHIP DRIVERS" <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH] irqchip/stm32-exti: Use kzalloc_flex
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
X-Spamd-Result: default: False [10.29 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	DATE_IN_PAST(1.00)[73];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rosenp@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelin.stm32@gmail.com,m:linux-kernel@vger.kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tglx@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_TO(0.00)[gmail.com,st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lists.infradead.org,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 489B42F031C
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

On Thu, Mar 19 2026 at 21:04, Rosen Penev wrote:

This is not a new submission. It's either V3 or a resend of V2. Please
follow the documented process.

Also this still applies:

     https://lore.kernel.org/87ms0erbx4.ffs@tglx

> Simplifies allocations by using a flexible array member in these structs.

Simplify ...

> No need for a second kfree.

That's redundant information and can be seen from the patch. No?

Thanks,

        tglx
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
