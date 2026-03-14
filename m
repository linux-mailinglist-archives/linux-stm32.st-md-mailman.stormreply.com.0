Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 39yxBXvotGnBuAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 14 Mar 2026 05:47:55 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A711428B9A8
	for <lists+linux-stm32@lfdr.de>; Sat, 14 Mar 2026 05:47:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4EE28C87EDB;
	Sat, 14 Mar 2026 04:47:54 +0000 (UTC)
Received: from abb.hmeau.com (abb.hmeau.com [180.181.231.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25713C87ED5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Mar 2026 04:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
 from:content-type:reply-to; bh=eoJtzYYgY9ROmVqLSa14oImeMikAFUZjBqozvLekkp4=; 
 b=sgGlgfu80E9Jj7lsC4CJQDWV6R+z7gOOFt15wVRHjbzGaPlWhhOJhflKvyPIFnondLh9UNaR7np
 E33oUujwnMIohz/fPKoozRCkUq/XcNGyEtacrTL/+f0GC2QFh1xw3rUgogEzzp4ytCJ5sMjzwGips
 0cJif27HDNgPcts+JxUfUNCvYGiUI9+GgDOYwo2MxZXyDnJzdkqSlM6Z1gV3DF4694lGrdESNnfTi
 kRkfabbiq5azJEY1qYRF9FElPAmcZtnz+v3O/4da7rLAf2wy9fewTu59Mo032BvJ3DRa289dExIgt
 BRO8QT+nRFuJInRKtMav/8KDR80An4M7RazQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
 id 1w1GuY-00EKsT-1L; Sat, 14 Mar 2026 12:47:39 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Sat, 14 Mar 2026 13:47:38 +0900
Date: Sat, 14 Mar 2026 13:47:38 +0900
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Message-ID: <abToanZh-mkEjmJ-@gondor.apana.org.au>
References: <20260303184916.69132-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260303184916.69132-1-olek2@wp.pl>
Cc: linux-kernel@vger.kernel.org, davem@davemloft.net,
 linux-crypto@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4] crypto: testmgr - Add test vectors for
 authenc(hmac(md5), cbc(aes))
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
X-Spamd-Result: default: False [4.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[apana.org.au : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[gondor.apana.org.au:s=h01];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:olek2@wp.pl,m:linux-kernel@vger.kernel.org,m:davem@davemloft.net,m:linux-crypto@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[herbert@gondor.apana.org.au,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[wp.pl];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gondor.apana.org.au:-];
	NEURAL_HAM(-0.00)[-0.999];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[herbert@gondor.apana.org.au,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,davemloft.net,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[apana.org.au:email,apana.org.au:url,stormreply.com:email,stormreply.com:url,wp.pl:email,gondor.apana.org.au:mid,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: A711428B9A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 03, 2026 at 07:48:44PM +0100, Aleksander Jan Bajkowski wrote:
> Test vectors were generated starting from existing CBC(AES) test vectors
> (RFC3602, NIST SP800-38A) and adding HMAC(MD5) computed with Python
> script. Then, the results were double-checked on Mediatek MT7981 (safexcel)
> and NXP P2020 (talitos). Both platforms pass self-tests.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
> v4:
> - rename aes-generic -> aes-lib
> v3:
> - correct sha384 -> md5 in description
> v2:
> - rebase and resolve conflicts
> ---
>  crypto/testmgr.c |   7 ++
>  crypto/testmgr.h | 255 +++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 262 insertions(+)

The previous patch has already been applied.  Please redo this
as an incremental patch.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
