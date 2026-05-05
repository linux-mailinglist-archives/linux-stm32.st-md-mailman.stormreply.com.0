Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCtwN2C3+WmNBAMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 05 May 2026 11:24:48 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7076B4C9949
	for <lists+linux-stm32@lfdr.de>; Tue, 05 May 2026 11:24:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2B68C87ED0;
	Tue,  5 May 2026 09:24:47 +0000 (UTC)
Received: from abb.hmeau.com (abb.hmeau.com [180.181.231.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DEEE6C36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 May 2026 09:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
 from:content-type:reply-to; bh=pa4FvNdcfKy9+gkU9d/DdDn+rwcZnnR9EEGoAOReuwQ=; 
 b=rDHkQJlx5WZGzILUr6NQ+0xhJ1pzanh6aAU9u4D3ovZJZDZ2h0Ifd6BZHc9B0aGpr7QLELhGaVA
 V1ZgeIF+OdqwaTRs+8K+44Gw7vGRAvYaspZ0WoeID3F0UhmCwCN9fxjNXXURbVKfdM+e4ivcwXSh8
 Zfkz+VphiaWtIJUBcsGe9Hc8DEBVbjNd1+prK+PBxdMm3HN8TzxwtcqfGsjkFtM3o9fGAvLtXE1V4
 MOAD7uDV74PiROidTopAR1XZCjh7Mw/6tll/vcpJWCO6yXfDyCpCtn+LiXzS6cRvbhO5SKBHAHIYQ
 VjIpDKNxotb35lqeaBWAInaSFIh8ncq9PRPA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
 id 1wKC13-00BNpf-2b; Tue, 05 May 2026 17:24:34 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Tue, 05 May 2026 17:24:33 +0800
Date: Tue, 5 May 2026 17:24:33 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Jeff Barnes <jeffbarnes@linux.microsoft.com>
Message-ID: <afm3UY1ddNQowmSc@gondor.apana.org.au>
References: <20260423-disallow_rsa_sha1_signing_in_fips_mode-v2-1-a5fe72dd8a71@linux.microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260423-disallow_rsa_sha1_signing_in_fips_mode-v2-1-a5fe72dd8a71@linux.microsoft.com>
Cc: linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 linux-crypto@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] crypto: testmgr - disallow RSA PKCS#1
 SHA-1 sig algs in FIPS mode
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
X-Rspamd-Queue-Id: 7076B4C9949
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[apana.org.au : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gondor.apana.org.au:s=h01];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:jeffbarnes@linux.microsoft.com,m:linux-kernel@vger.kernel.org,m:davem@davemloft.net,m:linux-crypto@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,davemloft.net,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[herbert@gondor.apana.org.au,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gondor.apana.org.au:-];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.819];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[herbert@gondor.apana.org.au,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_SENDER_MAILLIST(0.00)[]

On Thu, Apr 23, 2026 at 11:21:41AM -0400, Jeff Barnes wrote:
> When booted with fips=1, RSA signature generation using SHA-1 must not be
> available.  However, pkcs1pad(rsa,sha1) can currently be instantiated
> because it is not present in alg_test_descs; alg_test() falls through the
> no_test path and succeeds, after which the algorithm appears in
> /proc/crypto as fips-capable.
> 
> Add explicit alg_test_descs entries for pkcs1pad(rsa,sha1) and
> pkcs1(rsa,sha1) without marking them fips_allowed, so they are treated as
> not FIPS-allowed when fips=1 is enabled.
> 
> Include both names to cover kernels where RSA sign/verify is provided via
> the pkcs1(...) signature template, while pkcs1pad(...) remains for the
> traditional wrapper naming and/or RSAES operations.
> 
> Signed-off-by: Jeff Barnes <jeffbarnes@linux.microsoft.com>
> ---
> This series fixes an issue where SHA-1 RSA signature generation remains
> available when booted with fips=1.
> 
> On a FIPS-enabled system, pkcs1pad(rsa,sha1) can be instantiated even
> though SHA-1 must not be available for signature generation. The reason
> is that the algorithm is not listed in crypto/testmgr.c's alg_test_descs,
> so alg_test() falls through the no_test path and succeeds. Once
> instantiated, /proc/crypto reports the algorithm as "fips: yes".
> 
> This patch adds explicit alg_test_descs entries for:
> 
>   - pkcs1pad(rsa,sha1)
>   - pkcs1(rsa,sha1)
> 
> without setting fips=1, so they are treated as not FIPS-allowed in
> FIPS mode.
> 
> Both names are covered to handle kernels where RSA signature operations
> are provided via the pkcs1(...) signature template, while pkcs1pad(...)
> remains for the historical wrapper naming and/or RSAES operations.
> 
> Reproducer / evidence (current behavior):
>   1) Boot with fips=1 (confirm /proc/sys/crypto/fips_enabled == 1)
>   2) Allocate the transform:
>        crypto_alloc_akcipher("pkcs1pad(rsa,sha1)", 0, 0)
>   3) Observe that /proc/crypto now contains:
>        name   : pkcs1pad(rsa,sha1)
>        fips   : yes
>        selftest: passed
>   4) A simple in-kernel demo module can instantiate the transform and reach
>      the signing path in FIPS mode.
> 
> With this change, attempts to instantiate these SHA-1 RSA signing
> templates in FIPS mode are rejected, preventing SHA-1 signature
> generation in approved mode.
> 
> Thanks for taking a look.
> ---
> Changes in v2:
> - Rewrap commit message body to conform to 75-column limit
> - Fix From/Signed-off-by address mismatch
> Link to v1: https://lore.kernel.org/r/20260422-disallow_rsa_sha1_signing_in_fips_mode-v1-1-1359bc7d41be@microsoft.com
> ---
>  crypto/testmgr.c | 6 ++++++
>  1 file changed, 6 insertions(+)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
