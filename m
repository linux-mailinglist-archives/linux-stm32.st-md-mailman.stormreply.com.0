Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F785E6AD
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jul 2019 16:29:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36DA9CA7057
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jul 2019 14:29:34 +0000 (UTC)
Received: from deadmen.hmeau.com (helcar.hmeau.com [216.24.177.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7611CA7055
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jul 2019 14:29:31 +0000 (UTC)
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
 by deadmen.hmeau.com with esmtps (Exim 4.89 #2 (Debian))
 id 1higGD-0000jF-Ee; Wed, 03 Jul 2019 22:29:25 +0800
Received: from herbert by gondobar with local (Exim 4.89)
 (envelope-from <herbert@gondor.apana.org.au>)
 id 1higGC-0000Xk-BF; Wed, 03 Jul 2019 22:29:24 +0800
Date: Wed, 3 Jul 2019 22:29:24 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Lionel Debieve <lionel.debieve@st.com>
Message-ID: <20190703142924.i6y44cqspgklb7ek@gondor.apana.org.au>
References: <20190628112641.9269-1-lionel.debieve@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190628112641.9269-1-lionel.debieve@st.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: linux-kernel@vger.kernel.org, Fabien Dessenne <fabien.dessenne@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/1] crypto: stm32/crc32 - rename driver
	file
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

On Fri, Jun 28, 2019 at 01:26:41PM +0200, Lionel Debieve wrote:
> Use the same naming convention for all stm32 crypto
> drivers.
> 
> Signed-off-by: Lionel Debieve <lionel.debieve@st.com>
> ---
>  drivers/crypto/stm32/Makefile                         | 2 +-
>  drivers/crypto/stm32/{stm32_crc32.c => stm32-crc32.c} | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename drivers/crypto/stm32/{stm32_crc32.c => stm32-crc32.c} (100%)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
