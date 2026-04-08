Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFjbFyAN1mmfAwgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Apr 2026 10:09:04 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 754073B8C2E
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Apr 2026 10:08:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2600EC87EC5;
	Wed,  8 Apr 2026 08:08:57 +0000 (UTC)
Received: from abb.hmeau.com (abb.hmeau.com [180.181.231.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3A968C87EBC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Apr 2026 08:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
 from:content-type:reply-to; bh=l8aaaehgysH2hcfIZINOSwreJrwK4RdOvdUPlIC0mwY=; 
 b=slUEtJ/asWbPK7wnHP/gklNlHvd8xYUVOgV7KqsctVF0ppZufBjaEoKrx4uKCIFoT0WdMnVKWh+
 bJAWhVlVJTOA2HTDu1xujmh/z0mzsLtscPH+w7p04GhBOG4vIVpWC43em4L/bs3MVLhwN2L8J8SDD
 repz4041mk82cl6wgKpsEeZ6FX6WL3UWSpv4kYaVUjqnQLkCk0+Gg/R9BK+mz4c4CLwahZtGZaFmS
 A+uTUvQhzSAR8Zjjo65NbuJaSYXxhjM/0tPbVstNxH5expWzTHbzCIX3xFDHfAxqIZzmlbFLLjFjW
 kzGcG3agrG34DXtK3DBleJ1Bz6moytH7I1Hw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
 id 1wANYN-004dIK-1B; Wed, 08 Apr 2026 16:08:43 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Wed, 08 Apr 2026 16:08:42 +0800
Date: Wed, 8 Apr 2026 16:08:42 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>
Message-ID: <adYNClYB6RY820Xl@gondor.apana.org.au>
References: <20260407192859.270745-1-hamzamahfooz@linux.microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260407192859.270745-1-hamzamahfooz@linux.microsoft.com>
Cc: Jeff Barnes <jeffbarnes@linux.microsoft.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Paul Monson <paul.monson@capgemini.com>
Subject: Re: [Linux-stm32] [PATCH] crypto: tstmgr - guard xxhash tests
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
	DMARC_POLICY_QUARANTINE(1.50)[apana.org.au : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gondor.apana.org.au:s=h01];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.microsoft.com,vger.kernel.org,davemloft.net,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org,capgemini.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:hamzamahfooz@linux.microsoft.com,m:jeffbarnes@linux.microsoft.com,m:linux-kernel@vger.kernel.org,m:davem@davemloft.net,m:linux-crypto@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:paul.monson@capgemini.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gondor.apana.org.au:-];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[herbert@gondor.apana.org.au,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RBL_SEM_FAIL(0.00)[52.209.6.89:query timed out];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	SEM_URIBL_FRESH15_UNKNOWN_FAIL(0.00)[stormreply.com:query timed out];
	SEM_URIBL_UNKNOWN_FAIL(0.00)[capgemini.com:query timed out];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[herbert@gondor.apana.org.au,linux-stm32-bounces@st-md-mailman.stormreply.com];
	NEURAL_SPAM(0.00)[0.726];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[capgemini.com:email,apana.org.au:email,apana.org.au:url]
X-Rspamd-Queue-Id: 754073B8C2E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 07, 2026 at 12:28:59PM -0700, Hamza Mahfooz wrote:
> If the kernel isn't built with CONFIG_CRYPTO_XXHASH and booted with FIPS
> mode enabled it will currently panic. So, only benchmark xxhash64 if
> CRYPTO_XXHASH is enabled.
> 
> Cc: Jeff Barnes <jeffbarnes@linux.microsoft.com>
> Cc: Paul Monson <paul.monson@capgemini.com>
> Signed-off-by: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>
> ---
>  crypto/testmgr.c | 2 ++
>  1 file changed, 2 insertions(+)

Please show me the panic.  Normally it's not an issue if an algorithm
is not present while the test vectors are.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
