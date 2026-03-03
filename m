Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHcJKDE3p2lwfwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 03 Mar 2026 20:32:01 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3C81F6035
	for <lists+linux-stm32@lfdr.de>; Tue, 03 Mar 2026 20:32:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13DD0C87ECE;
	Tue,  3 Mar 2026 19:32:01 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F76BC87ED1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Mar 2026 19:31:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 755DC444B8;
 Tue,  3 Mar 2026 19:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAD2DC2BCB2;
 Tue,  3 Mar 2026 19:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772566318;
 bh=i9EZozHW8XRAVLe8EAr2xfM/6NutGAKezx67stLre7Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LBMtiYqdzTeup8FJVWXxT6ukyG6zRobBUe/9Mx8IhAhFrfRxHAAIym3RpikfeMD8m
 v+A2VcjZ21cSREjyMLdsu4gGu0wL0kRMhC4IlX1qyyeULlbBGl5uw6UGuBBquOolxm
 Row+8ruBmAX+JL+HmOC80eEVQkVtrtMP8DP02cDIuI7a5crnsN/KD8SglZtR0sV8T2
 FSzBQStrg4lKjjyetLh5Js0XceJBji3eyotTabSoV8O5Bg2+oeRAjkkb6HQGmyyYd8
 IiX+5wsaOMUgS37UEGItnTYawAACGA3cYTgx4ebBRCK2MxWOXqEBOSJPb1mhDQEhyr
 p8K4qxyCPAlBg==
Date: Tue, 3 Mar 2026 11:31:02 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20260303193102.GA2846@sol>
References: <20260303060509.246038-1-git@jvdsn.com>
 <aab5ptuamQ7d_tTi@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aab5ptuamQ7d_tTi@infradead.org>
Cc: dm-devel@lists.linux.dev, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-crypto@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
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
X-Rspamd-Queue-Id: 4D3C81F6035
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[ebiggers@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@infradead.org,m:dm-devel@lists.linux.dev,m:herbert@gondor.apana.org.au,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-crypto@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:git@jvdsn.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	NEURAL_HAM(-0.00)[-0.758];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[ebiggers@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,gondor.apana.org.au,vger.kernel.org,st-md-mailman.stormreply.com,gmail.com,davemloft.net,lists.infradead.org,jvdsn.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,linux.dev:email]
X-Rspamd-Action: no action

[+Cc dm-devel@lists.linux.dev]

On Tue, Mar 03, 2026 at 07:09:26AM -0800, Christoph Hellwig wrote:
> On Tue, Mar 03, 2026 at 12:05:09AM -0600, Joachim Vandersmissen wrote:
> > xxhash64 is not a cryptographic hash algorithm, but is offered in the
> > same API (shash) as actual cryptographic hash algorithms such as
> > SHA-256. The Cryptographic Module Validation Program (CMVP), managing
> > FIPS certification, believes that this could cause confusion. xxhash64
> > must therefore be blocked in FIPS mode.
> > 
> > The only usage of xxhash64 in the kernel is btrfs. Commit fe11ac191ce0
> > ("btrfs: switch to library APIs for checksums") recently modified the
> > btrfs code to use the lib/crypto API, avoiding the Kernel Cryptographic
> > API. Consequently, the removal of xxhash64 from the Crypto API in FIPS
> > mode should now have no impact on btrfs usage.
> 
> It sounds like xxhash should be removed the crypto API entirely.
> There's no user of it, it's not crypto, and doing xxhash through
> the userspace crypto API socket is so stupid that I doubt anyone
> attempted it.

dm-integrity, which uses crypto_shash and accepts arbitrary hash
algorithm strings from userspace, might be relying on "xxhash64" being
supported in crypto_shash.  The integritysetup man page specifically
mentions xxhash64:

     --integrity, -I algorithm
         Use  internal  integrity  calculation (standalone mode). The integrity
         algorithm can be CRC (crc32c/crc32), a non-cryptographic hash function
         (xxhash64) or a hash function (sha1, sha256).

         For HMAC (hmac-sha256), you must specify  an  integrity  key  and  its
         size.

Maybe the device-mapper maintainers have some insight into whether
anyone is actually using xxhash64 with dm-integrity.

If yes, then dm-integrity could still switch to using the library API
for it.  dm-integrity would just need to gain some helper functions that
call either the xxhash64 library or crypto_shash depending on the
configured algorithm.  If the full set of algorithms being used can be
determined, then dm-integrity could even switch to the library APIs
entirely, like many other kernel subsystems such as btrfs have.

- Eric
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
