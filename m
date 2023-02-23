Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6356A02A0
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Feb 2023 07:00:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F241C6A5F8;
	Thu, 23 Feb 2023 06:00:54 +0000 (UTC)
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net
 (167-179-156-38.a7b39c.syd.nbn.aussiebb.net [167.179.156.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 94467C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Feb 2023 06:00:52 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
 id 1pV4el-00EjAW-4v; Thu, 23 Feb 2023 14:00:40 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Thu, 23 Feb 2023 14:00:39 +0800
Date: Thu, 23 Feb 2023 14:00:39 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Li kunyu <kunyu@nfschina.com>, Linus Walleij <linus.walleij@linaro.org>
Message-ID: <Y/cBB+q0Ono9j2Jy@gondor.apana.org.au>
References: <20230224215019.3687-1-kunyu@nfschina.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230224215019.3687-1-kunyu@nfschina.com>
Cc: linux-kernel@vger.kernel.org, davem@davemloft.net,
 linux-crypto@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] stm32: stm32-hash: Add kmalloc_array
	allocation check
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

On Sat, Feb 25, 2023 at 05:50:19AM +0800, Li kunyu wrote:
> If rctx->hw_context allocation of the context pointer failed. Returning
> -ENOMEM and assigning NULL to the out pointer should improve the
> robustness of the function.
> 
> Signed-off-by: Li kunyu <kunyu@nfschina.com>
> ---
>  drivers/crypto/stm32/stm32-hash.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/crypto/stm32/stm32-hash.c b/drivers/crypto/stm32/stm32-hash.c
> index d33006d43f76..18e79f62be96 100644
> --- a/drivers/crypto/stm32/stm32-hash.c
> +++ b/drivers/crypto/stm32/stm32-hash.c
> @@ -970,6 +970,10 @@ static int stm32_hash_export(struct ahash_request *req, void *out)
>  	rctx->hw_context = kmalloc_array(3 + HASH_CSR_REGISTER_NUMBER,
>  					 sizeof(u32),
>  					 GFP_KERNEL);
> +	if (rctx->hw_context == NULL) {
> +		out = NULL;
> +		return -ENOMEM;
> +	}
>  
>  	preg = rctx->hw_context;

Shouldn't we free the hw_context at the end of the function?

Why does it even need to be stored in rctx in the first place?

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
