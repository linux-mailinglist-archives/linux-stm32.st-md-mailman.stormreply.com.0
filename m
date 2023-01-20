Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 36236675240
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Jan 2023 11:21:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8472C6904C;
	Fri, 20 Jan 2023 10:21:49 +0000 (UTC)
Received: from formenos.hmeau.com (helcar.hmeau.com [216.24.177.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DB79CC6410A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Jan 2023 10:21:47 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
 id 1pIoWd-002BGR-8C; Fri, 20 Jan 2023 18:21:36 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Fri, 20 Jan 2023 18:21:35 +0800
Date: Fri, 20 Jan 2023 18:21:35 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Linus Walleij <linus.walleij@linaro.org>
Message-ID: <Y8prL1fzhdf1jEyT@gondor.apana.org.au>
References: <20221227-ux500-stm32-hash-v2-0-bc443bc44ca4@linaro.org>
 <20221227-ux500-stm32-hash-v2-5-bc443bc44ca4@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221227-ux500-stm32-hash-v2-5-bc443bc44ca4@linaro.org>
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh+dt@kernel.org>, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 5/6] crypto: stm32/hash: Support Ux500
	hash
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

On Tue, Jan 10, 2023 at 08:19:16PM +0100, Linus Walleij wrote:
>  
> +static void stm32_hash_emptymsg_fallback(struct ahash_request *req)
> +{
> +	struct crypto_ahash *ahash = crypto_ahash_reqtfm(req);
> +	struct stm32_hash_ctx *ctx = crypto_ahash_ctx(ahash);
> +	struct stm32_hash_request_ctx *rctx = ahash_request_ctx(req);
> +	struct stm32_hash_dev *hdev = rctx->hdev;
> +	struct crypto_shash *xtfm;
> +	struct shash_desc *sdesc;
> +	size_t len;
> +	int ret;
> +
> +	dev_dbg(hdev->dev, "use fallback message size 0 key size %d\n",
> +		ctx->keylen);
> +	xtfm = crypto_alloc_shash(crypto_ahash_alg_name(ahash),
> +				  0, CRYPTO_ALG_NEED_FALLBACK);
> +	if (IS_ERR(xtfm)) {
> +		dev_err(hdev->dev, "failed to allocate synchronous fallback\n");
> +		return;
> +	}
> +
> +	len = sizeof(*sdesc) + crypto_shash_descsize(xtfm);
> +	sdesc = kmalloc(len, GFP_KERNEL);
> +	if (!sdesc)
> +		goto err_hashkey_sdesc;
> +	sdesc->tfm = xtfm;
> +
> +	if (ctx->keylen) {
> +		ret = crypto_shash_setkey(xtfm, ctx->key, ctx->keylen);
> +		if (ret) {
> +			dev_err(hdev->dev, "failed to set key ret=%d\n", ret);
> +			goto err_hashkey;
> +		}
> +	}
> +
> +	ret = crypto_shash_init(sdesc);
> +	if (ret) {
> +		dev_err(hdev->dev, "shash init error ret=%d\n", ret);
> +		goto err_hashkey;
> +	}
> +
> +	ret = crypto_shash_finup(sdesc, NULL, 0, rctx->digest);
> +	if (ret)
> +		dev_err(hdev->dev, "shash finup error\n");
> +err_hashkey:
> +	kfree(sdesc);
> +err_hashkey_sdesc:
> +	crypto_free_shash(xtfm);
> +}

Calling crypto_alloc_shash is not allowed in this context.  For
example, we might have been called down from the block layer due to
swapping.  Even if you intermediate this with kernel threads, it
still doesn't change the nature of the dead-lock.

So if you need a fallback for zero-length messages, just allocate
it unconditionally in the init_tfm function.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
