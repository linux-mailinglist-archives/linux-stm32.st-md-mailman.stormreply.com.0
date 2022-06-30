Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 816CF5612B7
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Jun 2022 08:48:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19F59C04001;
	Thu, 30 Jun 2022 06:48:35 +0000 (UTC)
Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A90AC03FC0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jun 2022 06:48:33 +0000 (UTC)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
 by fornost.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
 id 1o6nyJ-00CwRv-5u; Thu, 30 Jun 2022 16:48:16 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
 Thu, 30 Jun 2022 14:48:15 +0800
Date: Thu, 30 Jun 2022 14:48:15 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Li Qiong <liqiong@nfschina.com>
Message-ID: <Yr1HL5dr/zUyx+5q@gondor.apana.org.au>
References: <20220622020208.25776-1-liqiong@nfschina.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220622020208.25776-1-liqiong@nfschina.com>
Cc: renyu@nfschina.com, yuzhe@nfschina.com, linux-kernel@vger.kernel.org,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 "David S . Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] crypto: stm32 - Handle failure of
	kmalloc_array()
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

On Wed, Jun 22, 2022 at 10:02:08AM +0800, Li Qiong wrote:
> As the possible failure of the kmalloc_array(), therefore it
> should be better to check it and return '-ENOMEM' on error.
> 
> Signed-off-by: Li Qiong <liqiong@nfschina.com>
> ---
>  drivers/crypto/stm32/stm32-hash.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/crypto/stm32/stm32-hash.c b/drivers/crypto/stm32/stm32-hash.c
> index d33006d43f76..fc03e32e364f 100644
> --- a/drivers/crypto/stm32/stm32-hash.c
> +++ b/drivers/crypto/stm32/stm32-hash.c
> @@ -970,6 +970,8 @@ static int stm32_hash_export(struct ahash_request *req, void *out)
>  	rctx->hw_context = kmalloc_array(3 + HASH_CSR_REGISTER_NUMBER,
>  					 sizeof(u32),
>  					 GFP_KERNEL);
> +	if (!rctx->hw_context)
> +		return -ENOMEM;

Actually the problem is bigger than that.  The driver should not be
allocating memory in the export function at all.  This memory will
be leaked as exported requests won't be finalized.

We need to fix this driver to do export properly, or if that's not
possible, we should delete this driver.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
