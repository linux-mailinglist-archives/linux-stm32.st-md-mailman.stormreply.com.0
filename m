Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEaMEnOWhmlWPAQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 07 Feb 2026 02:33:39 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBD7104861
	for <lists+linux-stm32@lfdr.de>; Sat, 07 Feb 2026 02:33:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7F60C87EDD;
	Sat,  7 Feb 2026 01:33:37 +0000 (UTC)
Received: from abb.hmeau.com (abb.hmeau.com [180.181.231.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CEFB6C290A0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Feb 2026 01:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
 from:content-type:reply-to; bh=ZP0q/N4Mv9/YFhWpAEXqYZ/5tMDPuAMQxDVCxLLtahA=; 
 b=p7lxJoZ8nABuzGCYhDzD+n1dsvvbK1j2iCbx0SqWB2b0vbHpJSXopIgM1OGu0oCjJ3d8vTykhIp
 ecg1yN6ilbWsjkmaTkn9TuW51rR3R4inFr0kMp6c9kR9LWFW6TZyx7Qf3vxSYkLAmlF5t54BPo6Gc
 BG4g9Qyk2bSiGK72c5TbHfljUbOswSrYdyXCX6ZG5sjtjfd41AycIi/KY/nAcfPtYmZmGez3/dKHA
 oYsNQ8B6vc5BFkt0mpTjjNPkJ9pMFC8re5A/WVw2aP/abhy08iOQbDyCro3kjvT6np4GIYWY8VhRL
 P//eABMNc1MQv+ElULnIYCkvxGlAc1HJI/xQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
 id 1voXCF-005AtF-2W; Sat, 07 Feb 2026 09:33:16 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Sat, 07 Feb 2026 09:33:15 +0800
Date: Sat, 7 Feb 2026 09:33:15 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Message-ID: <aYaWWy2KSYz787a-@gondor.apana.org.au>
References: <20260201112834.3378-1-olek2@wp.pl>
 <aYXKFtmVJCCZpUVw@gondor.apana.org.au>
 <3622af67-b083-488a-998a-29b8657be73a@wp.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3622af67-b083-488a-998a-29b8657be73a@wp.pl>
Cc: linux-kernel@vger.kernel.org, davem@davemloft.net,
 linux-crypto@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] crypto: testmgr - Add test vectors for
 authenc(hmac(md5), cbc(des3_ede))
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Server: lfdr
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
	NEURAL_HAM(-0.00)[-0.917];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,gondor.apana.org.au:mid]
X-Rspamd-Queue-Id: 3CBD7104861
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 08:40:18PM +0100, Aleksander Jan Bajkowski wrote:
>
> While resolving the conflict, the entry was added in the wrong place. As a
> result, the test manager complains about sorting:
> [=A0 =A0 0.050891] testmgr: alg_test_descs entries in wrong order:
> 'authenc(hmac(md5),ecb(cipher_null))' before
> 'authenc(hmac(md5),cbc(des3_ede))'

Thanks for the heads up.  I've just pushed out a fix, can you
please double-check?

Cheers,
-- =

Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
