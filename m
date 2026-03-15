Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBgwDqgAtmn78AAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 15 Mar 2026 01:43:20 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B885428FA9B
	for <lists+linux-stm32@lfdr.de>; Sun, 15 Mar 2026 01:43:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B049C055F4;
	Sun, 15 Mar 2026 00:43:19 +0000 (UTC)
Received: from smtp.jvdsn.com (smtp.jvdsn.com [129.153.194.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC95DC36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 15 Mar 2026 00:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=jvdsn.com; s=mail;
 t=1773535396; bh=LU1uB/HE/c/73zPowr6km/30RYw7pRFXyU+zsrSKI7Q=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=AL1xq9CHRXZnZYKrXiPg8HC0aDmz6xDNbxJnMgiI4k1KnR4DtrDcPBUcPTCpP26+Q
 Cs5iJ1A1EwiJu2XFsfvxB1e0+MLDNgt1MavHb3UUtDmwWL/UqfdX7At6lCt6WQuBVq
 /6e40lRRX99Q1HD8Vu7kYatWyOR9uu01tTvcL2/ahsPHwQYsZILfbyosb6+9vR+4D5
 kMx2tc0J9m68A1pp4K45Pe6OT6LVU3LrfdcEsAKLfMgYBM9mHqS2xjgncHqwvw/IF8
 TSzNQzLfuJ1/6wMvVO/MsGJYj9+G2oSE7z3RoAADQ9wP+n4ODySKTFoP3CHfRt3gKz
 KZ4YXmGfqG8mw==
Message-ID: <64592fee-1956-4a70-a751-9ac3335cfc27@jvdsn.com>
Date: Sat, 14 Mar 2026 19:43:15 -0500
MIME-Version: 1.0
To: Herbert Xu <herbert@gondor.apana.org.au>,
 Joachim Vandersmissen <git@jvdsn.com>
References: <20260303060509.246038-1-git@jvdsn.com>
 <abTuFto8Tc3mhRRe@gondor.apana.org.au>
Content-Language: en-US
From: Joachim Vandersmissen <git@jvdsn.com>
In-Reply-To: <abTuFto8Tc3mhRRe@gondor.apana.org.au>
Cc: linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
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
	FREEMAIL_CC(0.00)[vger.kernel.org,davemloft.net,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[git@jvdsn.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:herbert@gondor.apana.org.au,m:git@jvdsn.com,m:linux-kernel@vger.kernel.org,m:davem@davemloft.net,m:linux-crypto@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: B885428FA9B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Herbert,

I don't think this one can be applied yet since dm-integrity still uses 
xxhash64 through the crypto API. This would break fips=1 systems that 
use it.

Kind regards,
Joachim

On 3/14/26 12:11 AM, Herbert Xu wrote:
> On Tue, Mar 03, 2026 at 12:05:09AM -0600, Joachim Vandersmissen wrote:
>> xxhash64 is not a cryptographic hash algorithm, but is offered in the
>> same API (shash) as actual cryptographic hash algorithms such as
>> SHA-256. The Cryptographic Module Validation Program (CMVP), managing
>> FIPS certification, believes that this could cause confusion. xxhash64
>> must therefore be blocked in FIPS mode.
>>
>> The only usage of xxhash64 in the kernel is btrfs. Commit fe11ac191ce0
>> ("btrfs: switch to library APIs for checksums") recently modified the
>> btrfs code to use the lib/crypto API, avoiding the Kernel Cryptographic
>> API. Consequently, the removal of xxhash64 from the Crypto API in FIPS
>> mode should now have no impact on btrfs usage.
>>
>> Signed-off-by: Joachim Vandersmissen <git@jvdsn.com>
>> ---
>>   crypto/testmgr.c | 1 -
>>   1 file changed, 1 deletion(-)
> Patch applied.  Thanks.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
