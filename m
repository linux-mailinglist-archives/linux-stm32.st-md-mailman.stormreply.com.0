Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UG5AEIouqWlN2wAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 05 Mar 2026 08:19:38 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBE320C82D
	for <lists+linux-stm32@lfdr.de>; Thu, 05 Mar 2026 08:19:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 915D4C8F26B;
	Thu,  5 Mar 2026 07:19:37 +0000 (UTC)
Received: from smtp.jvdsn.com (smtp.jvdsn.com [129.153.194.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9EDBFC87EBD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Mar 2026 07:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=jvdsn.com; s=mail;
 t=1772695175; bh=28Ie8QvorUqaeXyfBFib6Vpgd0CWzIv1/GxcOBEm6QM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=4I6+dhHDnhoRF7n6JWdDE9O8fP3gN5EuF5Xg0PY1SoG7hZdINWPSf07YIsZbAfKUk
 0RPU5iLbNHN5ZnGGUdWbVsEgJwbODOeQfmR0zkezNU4GngmeiKycX9nL4CzMY3a2ct
 /YG+DJ/Fq7W0L4DmDNuUvVgsDmUPMR5Y4X676dsBNeygIP+Ce/g/WyZI9+3pRxI4pP
 dNZ0TSX+Txu6tsTapGlZbfNVcNYCwDsTZ4ltdkSFo2Et32FQeyLliS+bY4IJqOzFY4
 oSFlKqqhbmeq4y352WuXhw6/4KcvQdyYp725I00E8PYmA85ikTdLWMLw2+RKW/2OIg
 ubv1nyl7WwjKA==
Message-ID: <952df8bf-0393-48a3-a844-e3acf13fd770@jvdsn.com>
Date: Thu, 5 Mar 2026 01:19:34 -0600
MIME-Version: 1.0
To: Christoph Hellwig <hch@infradead.org>, Eric Biggers <ebiggers@kernel.org>
References: <20260303060509.246038-1-git@jvdsn.com>
 <aab5ptuamQ7d_tTi@infradead.org> <20260303193102.GA2846@sol>
 <aagvBY-XMfPIqkDO@infradead.org>
Content-Language: en-US
From: Joachim Vandersmissen <git@jvdsn.com>
In-Reply-To: <aagvBY-XMfPIqkDO@infradead.org>
Cc: dm-devel@lists.linux.dev, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 linux-crypto@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Queue-Id: DFBE320C82D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[jvdsn.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[jvdsn.com:s=mail];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,gondor.apana.org.au,vger.kernel.org,davemloft.net,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[git@jvdsn.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@infradead.org,m:ebiggers@kernel.org,m:dm-devel@lists.linux.dev,m:herbert@gondor.apana.org.au,m:linux-kernel@vger.kernel.org,m:davem@davemloft.net,m:linux-crypto@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[jvdsn.com:-];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[git@jvdsn.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.930];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action

Thanks for the discussion below, it sounds like I need to ensure 
dm-integrity can use lib/crypto (at least for xxhash64) before blocking 
it in the crypto API.

On 3/4/26 7:09 AM, Christoph Hellwig wrote:
> On Tue, Mar 03, 2026 at 11:31:02AM -0800, Eric Biggers wrote:
>>> It sounds like xxhash should be removed the crypto API entirely.
>>> There's no user of it, it's not crypto, and doing xxhash through
>>> the userspace crypto API socket is so stupid that I doubt anyone
>>> attempted it.
>> dm-integrity, which uses crypto_shash and accepts arbitrary hash
>> algorithm strings from userspace, might be relying on "xxhash64" being
>> supported in crypto_shash.  The integritysetup man page specifically
>> mentions xxhash64:
> Oh, ok.  So at least for now we need it, although it would be nice to
> convert dm-integrity to lib/crypto/ and limit it to the advertised
> algorithms (including xxhash).
>
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
