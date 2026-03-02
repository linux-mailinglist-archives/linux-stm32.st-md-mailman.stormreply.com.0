Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CoFPIfQipmkiLAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 03 Mar 2026 00:53:24 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C141E6DAA
	for <lists+linux-stm32@lfdr.de>; Tue, 03 Mar 2026 00:53:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6DF6C35E3C;
	Mon,  2 Mar 2026 23:53:23 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC8DFC35E2B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Mar 2026 23:53:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 918DE434EE;
 Mon,  2 Mar 2026 23:53:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECB98C19423;
 Mon,  2 Mar 2026 23:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772495601;
 bh=44cMeGZr/l5eYry48qvh4fYrPN4/ezc2BGolvQEwZcg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NOD83Aq93vDhuSJZC6nInxhLwfcgbL1UQJR7sGFh7xp8XQFbyiN4RNNlhWX3PffNO
 s1W8+SJksbF8P/9tteHUOkLR8syoaongW5t7IFwOu4bWAlS8G8YL4eIFKKS5G9somd
 3eYp9zNhudI3RUjvasFNKuy7Nm4ygXLH6KKBs0+7VHhqEE2guVQrXZO9cH+IiRjPyY
 CyeOLmjGZm9IE6Bj3qFNeSgFfAVCK7ADrP9Nr6I6ypMyjERKzoEtXttAYOepNwbzFF
 Y48Kfv7x1MNIt+6BJNsivtW0YRDvrSEP/LLRNYcOABEyYh+oxqE0wA9acepL7BjAnq
 gFgt3cfiAqgcw==
Date: Mon, 2 Mar 2026 15:53:13 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Message-ID: <20260302235313.GD20209@quark>
References: <20260207145113.375192-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260207145113.375192-1-olek2@wp.pl>
Cc: herbert@gondor.apana.org.au, linux-kernel@vger.kernel.org,
 davem@davemloft.net, linux-crypto@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] crypto: testmgr - Add test vectors for
 authenc(hmac(md5), cbc(des))
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
X-Rspamd-Queue-Id: 25C141E6DAA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:olek2@wp.pl,m:herbert@gondor.apana.org.au,m:linux-kernel@vger.kernel.org,m:davem@davemloft.net,m:linux-crypto@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[wp.pl];
	FORGED_SENDER(0.00)[ebiggers@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	NEURAL_HAM(-0.00)[-0.362];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[ebiggers@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[gondor.apana.org.au,vger.kernel.org,davemloft.net,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Action: no action

On Sat, Feb 07, 2026 at 03:51:03PM +0100, Aleksander Jan Bajkowski wrote:
> Test vector was generated using a software implementation and then double
> checked on Mediatek MT7981 (safexcel) and NXP P2020 (talitos). Both
> platforms pass self-tests.

It would be better to just remove the support for these obsolete
algorithms from the drivers that support them.

- Eric
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
