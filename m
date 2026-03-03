Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKsmH635pmk7bgAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 03 Mar 2026 16:09:33 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A931F2153
	for <lists+linux-stm32@lfdr.de>; Tue, 03 Mar 2026 16:09:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4A06C87ECC;
	Tue,  3 Mar 2026 15:09:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 52108C87EC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Mar 2026 15:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=sLOteAlb1KnKUFn91vnOM93Z12m5uOFjMDhUK2pQp74=; b=ec9wJZPOETfaffdcB7XpMYnyGK
 hlm6bcbwHN7kWP8pl3Nvd7urjmB3xujb+NzbMIt2LL48LIsAR6l+Pmugw/+uTG7XeWv+A/kk8QXf7
 6MpItIm8xbESf6pExqvZu3+msETgeeOWNXV/kdsip36+4t6BkA20g6BKIk2kupwRuQqsZ4S3aASMK
 YArckOaNq1UrtqCl5wxWVWZIn4q8T2ndxWVrMWSiELlueUrO85eWDISVvwRYo37tT51fWQL8dMz1a
 8LaL/hEN5WG7eWCDIMcBuzcVD8tQ35A8fyNTS5spcj0TwY7Ql+TjGYnpA0MFChDMHVOkSENjVZlZo
 515Q01xg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1vxRNG-0000000FO6L-3qh5;
 Tue, 03 Mar 2026 15:09:26 +0000
Date: Tue, 3 Mar 2026 07:09:26 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Joachim Vandersmissen <git@jvdsn.com>
Message-ID: <aab5ptuamQ7d_tTi@infradead.org>
References: <20260303060509.246038-1-git@jvdsn.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260303060509.246038-1-git@jvdsn.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Herbert Xu <herbert@gondor.apana.org.au>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] crypto: testmgr - block Crypto API
	xxhash64 in FIPS mode
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
X-Rspamd-Queue-Id: 17A931F2153
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[infradead.org:s=bombadil.20210309];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:git@jvdsn.com,m:herbert@gondor.apana.org.au,m:linux-kernel@vger.kernel.org,m:davem@davemloft.net,m:linux-crypto@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[hch@infradead.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[gondor.apana.org.au,vger.kernel.org,davemloft.net,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.508];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@infradead.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[infradead.org:-];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:mid,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 12:05:09AM -0600, Joachim Vandersmissen wrote:
> xxhash64 is not a cryptographic hash algorithm, but is offered in the
> same API (shash) as actual cryptographic hash algorithms such as
> SHA-256. The Cryptographic Module Validation Program (CMVP), managing
> FIPS certification, believes that this could cause confusion. xxhash64
> must therefore be blocked in FIPS mode.
> 
> The only usage of xxhash64 in the kernel is btrfs. Commit fe11ac191ce0
> ("btrfs: switch to library APIs for checksums") recently modified the
> btrfs code to use the lib/crypto API, avoiding the Kernel Cryptographic
> API. Consequently, the removal of xxhash64 from the Crypto API in FIPS
> mode should now have no impact on btrfs usage.

It sounds like xxhash should be removed the crypto API entirely.
There's no user of it, it's not crypto, and doing xxhash through
the userspace crypto API socket is so stupid that I doubt anyone
attempted it.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
