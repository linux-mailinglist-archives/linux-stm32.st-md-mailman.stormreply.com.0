Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 795A18BAB08
	for <lists+linux-stm32@lfdr.de>; Fri,  3 May 2024 12:52:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20F9DC712A2;
	Fri,  3 May 2024 10:52:34 +0000 (UTC)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D39FFC6C838
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 May 2024 10:52:25 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
 id 1s2qWI-009vRn-2W; Fri, 03 May 2024 18:52:03 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Fri, 03 May 2024 18:52:03 +0800
Date: Fri, 3 May 2024 18:52:03 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Maxime MERE <maxime.mere@foss.st.com>
Message-ID: <ZjTB03ErvDq-lEib@gondor.apana.org.au>
References: <20240423151409.902490-1-maxime.mere@foss.st.com>
 <20240423151409.902490-2-maxime.mere@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240423151409.902490-2-maxime.mere@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/3] crypto: stm32/cryp - use dma when
	possible.
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

On Tue, Apr 23, 2024 at 05:14:07PM +0200, Maxime MERE wrote:
>
> @@ -1239,12 +1758,35 @@ static int stm32_cryp_cipher_one_req(struct crypto_engine *engine, void *areq)
>  	struct stm32_cryp_ctx *ctx = crypto_skcipher_ctx(
>  			crypto_skcipher_reqtfm(req));
>  	struct stm32_cryp *cryp = ctx->cryp;
> +	int ret;
>  
>  	if (!cryp)
>  		return -ENODEV;
>  
> -	return stm32_cryp_prepare_req(req, NULL) ?:
> -	       stm32_cryp_cpu_start(cryp);
> +	ret = stm32_cryp_prepare_req(req, NULL);
> +	if (ret)
> +		return ret;
> +
> +	/* Avoid to use DMA if peripheral 32 bit counter is about to overflow with ctr(aes) */
> +	if (is_aes(cryp) && is_ctr(cryp)) {
> +		u32 iv_overflow[4];
> +
> +		memcpy(iv_overflow, req->iv, sizeof(__be32) * 4);
> +		iv_overflow[3] = 0xffffffff - be32_to_cpu((__be32)iv_overflow[3]);

This triggers a new warning:

../drivers/crypto/stm32/stm32-cryp.c:1775:47: warning: cast to restricted __be32

The logic seems to be broken as the counter counts blocks but you're
testing against bytes (req->src->length)? What's more req->src->length
isn't even the length of the request as it's clamped by req->cryptlen.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
