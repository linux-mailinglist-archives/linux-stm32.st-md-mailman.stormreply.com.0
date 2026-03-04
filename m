Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMYCIQovqGlPpQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 04 Mar 2026 14:09:30 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B775200174
	for <lists+linux-stm32@lfdr.de>; Wed, 04 Mar 2026 14:09:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7359DC87ED1;
	Wed,  4 Mar 2026 13:09:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61168C030D6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Mar 2026 13:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=inLNF6s7jzPXaIKhV0kcRGT2D6va2Ay+1uYeLl1r+fg=; b=EiFqWqMK7BsfbFMDk0QUaeMYaa
 GfT6HtqtizS422bakpkmyn0Aztqg27IwW4FyhoQg1VWdiEW6Rk7ZrrVio++m9/Gn73x7oXfXPek1b
 rqIBQAHqn3R4aheoao58W48/y2JeppyBTmktoNbBUtfO47qeq6Y9a03Hyq2esSa3ChmJUn862OrHl
 EjJwBJwrKQAdX5x5lvpnlS3iuAZdxJkdckSWjecvYtX4zbvYgRfe+MK5DW3mET7d58HgAtpVFIeYz
 JvkhHkMLU3oMk+WCjhs9In+uq3nDeoh9bzKy5cTuMIA+0cyctHPNTrl+0lxNSFMqC65vO0k7gQhNH
 V9p/CX8g==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1vxlyf-0000000HE1n-0n19;
 Wed, 04 Mar 2026 13:09:25 +0000
Date: Wed, 4 Mar 2026 05:09:25 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <aagvBY-XMfPIqkDO@infradead.org>
References: <20260303060509.246038-1-git@jvdsn.com>
 <aab5ptuamQ7d_tTi@infradead.org> <20260303193102.GA2846@sol>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260303193102.GA2846@sol>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: dm-devel@lists.linux.dev, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Christoph Hellwig <hch@infradead.org>, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Joachim Vandersmissen <git@jvdsn.com>
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
X-Rspamd-Queue-Id: 0B775200174
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
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:dm-devel@lists.linux.dev,m:herbert@gondor.apana.org.au,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:hch@infradead.org,m:linux-crypto@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:git@jvdsn.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[hch@infradead.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,gondor.apana.org.au,vger.kernel.org,st-md-mailman.stormreply.com,infradead.org,gmail.com,davemloft.net,lists.infradead.org,jvdsn.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.639];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@infradead.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[infradead.org:-];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:mid,stormreply.com:url,stormreply.com:email]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 11:31:02AM -0800, Eric Biggers wrote:
> > It sounds like xxhash should be removed the crypto API entirely.
> > There's no user of it, it's not crypto, and doing xxhash through
> > the userspace crypto API socket is so stupid that I doubt anyone
> > attempted it.
> 
> dm-integrity, which uses crypto_shash and accepts arbitrary hash
> algorithm strings from userspace, might be relying on "xxhash64" being
> supported in crypto_shash.  The integritysetup man page specifically
> mentions xxhash64:

Oh, ok.  So at least for now we need it, although it would be nice to
convert dm-integrity to lib/crypto/ and limit it to the advertised
algorithms (including xxhash).

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
