Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id rMg0JwzKhWlAGgQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 06 Feb 2026 12:01:32 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E29FCF32
	for <lists+linux-stm32@lfdr.de>; Fri, 06 Feb 2026 12:01:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74C2EC87EDE;
	Fri,  6 Feb 2026 11:01:24 +0000 (UTC)
Received: from abb.hmeau.com (abb.hmeau.com [180.181.231.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9823C290A0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Feb 2026 11:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
 from:content-type:reply-to; bh=kO1AGNsvdxqYmQaD/xccSvvXSgaUptV5c7qiHvmiuEY=; 
 b=WCgCZ16hLztt7nzPGrL/KLwtDb2Fjq7cAgXGmSctobAE9SwTH+makLE4Zqh1Lvk550DZSe4bY3M
 8VVi0BBRs/TeGqhlGfqdEAUSypCinDMmYeEYJBhM/l2AVsV8BPgOPZIVmPOIziJK/ychsmiXcjsyy
 hcsK+T9SfWE2OxNbitSAwnW7rJ/t1PEZ2ZCDt6Z4+hfjuTbxn0ok+yApAmUFp5lO9hqb6COYS12AQ
 eCpjufUYFahOwxWHImUWOBODo0sSKCwRaSeFp83CQN6L1/He9fu3AmVJ5u8nKzBwcOc/vP+nFqTAK
 k3OHBBjl4tNEak9rhYGcyxQFAxEZ+SQ9oksQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
 id 1voJaJ-004zWo-1i; Fri, 06 Feb 2026 19:01:12 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Fri, 06 Feb 2026 19:01:11 +0800
Date: Fri, 6 Feb 2026 19:01:11 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Message-ID: <aYXJ9-TZm6gq7ALj@gondor.apana.org.au>
References: <20260131174353.4053-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260131174353.4053-1-olek2@wp.pl>
Cc: linux-kernel@vger.kernel.org, davem@davemloft.net,
 linux-crypto@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] crypto: testmgr - Add test vectors for
 authenc(hmac(sha224), cbc(aes))
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[apana.org.au : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gondor.apana.org.au:s=h01];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:olek2@wp.pl,m:linux-kernel@vger.kernel.org,m:davem@davemloft.net,m:linux-crypto@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	RSPAMD_URIBL_FAIL(0.00)[wp.pl:query timed out];
	MIME_TRACE(0.00)[0:+];
	ASN_FAIL(0.00)[89.6.209.52.asn.rspamd.com:server fail];
	FREEMAIL_TO(0.00)[wp.pl];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[herbert@gondor.apana.org.au,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gondor.apana.org.au:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[herbert@gondor.apana.org.au,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,davemloft.net,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RSPAMD_EMAILBL_FAIL(0.00)[olek2.wp.pl:server fail];
	TAGGED_RCPT(0.00)[linux-stm32];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gondor.apana.org.au:mid,apana.org.au:url,apana.org.au:email,wp.pl:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: C6E29FCF32
X-Rspamd-Action: no action

On Sat, Jan 31, 2026 at 06:43:03PM +0100, Aleksander Jan Bajkowski wrote:
> Test vectors were generated starting from existing CBC(AES) test vectors
> (RFC3602, NIST SP800-38A) and adding HMAC(SHA224) computed with Python
> script. Then, the results were double-checked on Mediatek MT7981 (safexcel)
> and NXP P2020 (talitos). Both platforms pass self-tests.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
> v2:
>  - typo in commit name
> ---
>  crypto/testmgr.c |   7 ++
>  crypto/testmgr.h | 285 +++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 292 insertions(+)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
