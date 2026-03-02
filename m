Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCv9Bp4gpmlQKwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 03 Mar 2026 00:43:26 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A957D1E6C34
	for <lists+linux-stm32@lfdr.de>; Tue, 03 Mar 2026 00:43:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F17B1C35E3C;
	Mon,  2 Mar 2026 23:43:24 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 346E9C35E2B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Mar 2026 23:43:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 133E5600AE;
 Mon,  2 Mar 2026 23:43:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33EE6C19423;
 Mon,  2 Mar 2026 23:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772495002;
 bh=frEcAm5Sb1Cb7UDQJ6+oJvgem0+Bj3jNre9w1kRD5bU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZfF9RoqNtXK3zaSK0l/MgBBePdW41R0Gle86cjvmzgNhTjC1IHXCP+S5Zpl5Le1Or
 CEosyRxgDnvdYPp4qRa3ywnxuehbw0G9dgZ6DZ6S7pHk7s/Ia2DSCroth055V9R4kV
 a6XfrWTwYq01vB7ic9HNPvdDbqWQajs1WY2+SxnGfVS6OveSzDnEG5+4ZsH7jMAx2E
 pV57efldAweLJHnekmOnODknbfHlxnmZ7+21S7WzfUQ2HgDBaQmcGgpIKztJQTwUNy
 /F94rQu9QMf/4PZ9B0QpNlvkMYPW40yrS6IOQfKjVDd9/V379ag7FsKnaA97q9fsoR
 +I54U/iix+BTg==
Date: Mon, 2 Mar 2026 15:43:19 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Aleksander Jan Bajkowski <aleksaander@onet.pl>
Message-ID: <20260302234319.GC20209@quark>
References: <20260301155351.5840-1-aleksaander@onet.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260301155351.5840-1-aleksaander@onet.pl>
Cc: herbert@gondor.apana.org.au, linux-kernel@vger.kernel.org,
 davem@davemloft.net, linux-crypto@vger.kernel.org, mcoquelin.stm32@gmail.com,
 Aleksander Jan Bajkowski <olek2@wp.pl>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/5] crypto: testmgr - Add test vectors
 for authenc(hmac(sha1), rfc3686(ctr(aes)))
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
X-Rspamd-Queue-Id: A957D1E6C34
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:aleksaander@onet.pl,m:herbert@gondor.apana.org.au,m:linux-kernel@vger.kernel.org,m:davem@davemloft.net,m:linux-crypto@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:olek2@wp.pl,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[onet.pl];
	FORGED_SENDER(0.00)[ebiggers@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	NEURAL_HAM(-0.00)[-0.363];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[ebiggers@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[gondor.apana.org.au,vger.kernel.org,davemloft.net,gmail.com,wp.pl,st-md-mailman.stormreply.com,lists.infradead.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email]
X-Rspamd-Action: no action

On Sun, Mar 01, 2026 at 04:53:38PM +0100, Aleksander Jan Bajkowski wrote:
> diff --git a/crypto/testmgr.c b/crypto/testmgr.c
> index c4770b87551d..91831b548062 100644
> --- a/crypto/testmgr.c
> +++ b/crypto/testmgr.c
> @@ -4136,8 +4136,12 @@ static const struct alg_test_desc alg_test_descs[] = {
>  		}
>  	}, {
>  		.alg = "authenc(hmac(sha1),rfc3686(ctr(aes)))",
> -		.test = alg_test_null,
> +		.generic_driver = "authenc(hmac-sha1-lib,rfc3686(ctr(aes-generic)))",

aes-generic was replaced with aes-lib in v7.0-rc1.

- Eric
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
