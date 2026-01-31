Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OB8hFCBvfWmTSAIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 31 Jan 2026 03:55:28 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC22C065A
	for <lists+linux-stm32@lfdr.de>; Sat, 31 Jan 2026 03:55:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 738E1C5663A;
	Sat, 31 Jan 2026 02:55:27 +0000 (UTC)
Received: from abb.hmeau.com (abb.hmeau.com [180.181.231.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30B16C56612
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 31 Jan 2026 02:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
 from:content-type:reply-to; bh=PARnfAmO8TS3qYl2afHb4aIaOUKMPPe+CbKLTktcDqM=; 
 b=ssxFzetOSSB93G/sh3CKAllOFkdW+kQt5lLgf812PrjAHbaKyYx/ruV/td2SyK6S3LmVmX76ooq
 YagM7Xw4pe5mg1cSm0tjfR4aBPlL2HJ9776nbzi1Oou3q40WWTkMlFnVMhG2KaKQW4tkKUreXl+E0
 ayt8+bpPWdTMyF2ME/rInx9/EuTRKujxESoL+z0pOzWaaW//7R9ikj3BOljCI9t9NPAE6YNxABc2V
 A+rfC2CMMBgkoO0rcU7k1Ecgg0BI8vvMFOTPtwCS8ghB7+HIakI3H/edxlxuFADYreMlSpJud6nLF
 gv+gse+4s9jNyTtlkhTzbvkjmf3zR37YX6ng==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
 id 1vm18X-003S0A-1M; Sat, 31 Jan 2026 10:55:02 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Sat, 31 Jan 2026 10:55:01 +0800
Date: Sat, 31 Jan 2026 10:55:01 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Message-ID: <aX1vBYvzyxT4zdBK@gondor.apana.org.au>
References: <20260113083130.790316-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260113083130.790316-2-thorsten.blum@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Eric Biggers <ebiggers@google.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-crypto@vger.kernel.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Maxime =?iso-8859-1?Q?M=E9r=E9?= <maxime.mere@foss.st.com>,
 "David S. Miller" <davem@davemloft.net>,
 Colin Ian King <colin.i.king@gmail.com>
Subject: Re: [Linux-stm32] [PATCH] crypto: stm32 - Replace min_t(size_t)
	with just min()
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[herbert@gondor.apana.org.au,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thorsten.blum@linux.dev,m:linux-arm-kernel@lists.infradead.org,m:mcoquelin.stm32@gmail.com,m:ebiggers@google.com,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-crypto@vger.kernel.org,m:sakari.ailus@linux.intel.com,m:maxime.mere@foss.st.com,m:davem@davemloft.net,m:colin.i.king@gmail.com,m:mcoquelinstm32@gmail.com,m:coliniking@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lists.infradead.org,gmail.com,google.com,vger.kernel.org,st-md-mailman.stormreply.com,linux.intel.com,foss.st.com,davemloft.net];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[herbert@gondor.apana.org.au,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[gondor.apana.org.au:-];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gondor.apana.org.au:mid,apana.org.au:url,apana.org.au:email,linux.dev:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: CFC22C065A
X-Rspamd-Action: no action

On Tue, Jan 13, 2026 at 09:31:28AM +0100, Thorsten Blum wrote:
> In most cases, min_t(size_t) and explicit casting are unnecessary
> because the values ->hw_blocksize, ->payload_{in,out}, and ->header_in
> are already of type 'size_t'. Use the simpler min() macro instead.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/crypto/stm32/stm32-cryp.c | 29 ++++++++++++++---------------
>  1 file changed, 14 insertions(+), 15 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
