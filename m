Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1ED45E72D
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Nov 2021 06:24:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D5DAC5A4D4;
	Fri, 26 Nov 2021 05:24:32 +0000 (UTC)
Received: from deadmen.hmeau.com (helcar.hmeau.com [216.24.177.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45789C597BB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Nov 2021 05:24:31 +0000 (UTC)
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
 by deadmen.hmeau.com with esmtp (Exim 4.92 #5 (Debian))
 id 1mqTid-0008O2-VT; Fri, 26 Nov 2021 13:24:20 +0800
Received: from herbert by gondobar with local (Exim 4.92)
 (envelope-from <herbert@gondor.apana.org.au>)
 id 1mqTiL-0004XE-DX; Fri, 26 Nov 2021 13:24:01 +0800
Date: Fri, 26 Nov 2021 13:24:01 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Nicolas Toromanoff <nicolas.toromanoff@foss.st.com>
Message-ID: <20211126052401.GA17410@gondor.apana.org.au>
References: <20211118150756.6593-1-nicolas.toromanoff@foss.st.com>
 <20211118150756.6593-4-nicolas.toromanoff@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211118150756.6593-4-nicolas.toromanoff@foss.st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Marek Vasut <marex@denx.de>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "David S . Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 3/9] crypto: stm32/cryp - fix CTR
	counter carry
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

On Thu, Nov 18, 2021 at 04:07:50PM +0100, Nicolas Toromanoff wrote:
> STM32 CRYP hardware doesn't manage CTR counter bigger than max U32, as
> a workaround, at each block the current IV is saved, if the saved IV
> lower u32 is 0xFFFFFFFF, the full IV is manually incremented, and set
> in hardware.
> Fixes: bbb2832620ac ("crypto: stm32 - Fix sparse warnings")
> 
> Signed-off-by: Nicolas Toromanoff <nicolas.toromanoff@foss.st.com>
> ---
>  drivers/crypto/stm32/stm32-cryp.c | 25 ++++++++++++-------------
>  1 file changed, 12 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/crypto/stm32/stm32-cryp.c b/drivers/crypto/stm32/stm32-cryp.c
> index 7b55ad6d2f1a..9d6ccf1eb4ce 100644
> --- a/drivers/crypto/stm32/stm32-cryp.c
> +++ b/drivers/crypto/stm32/stm32-cryp.c
> @@ -163,7 +163,7 @@ struct stm32_cryp {
>  	struct scatter_walk     in_walk;
>  	struct scatter_walk     out_walk;
>  
> -	u32                     last_ctr[4];
> +	__be32                  last_ctr[4];

This introduces a sparse warning, please fix and resubmit.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
