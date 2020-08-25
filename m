Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 663B7250DC4
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Aug 2020 02:43:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C9F8C32EA7;
	Tue, 25 Aug 2020 00:43:52 +0000 (UTC)
Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C942AC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Aug 2020 00:43:49 +0000 (UTC)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
 by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
 id 1kAN3o-0004XJ-Ti; Tue, 25 Aug 2020 10:43:38 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
 Tue, 25 Aug 2020 10:43:36 +1000
Date: Tue, 25 Aug 2020 10:43:36 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Fabio Estevam <festevam@gmail.com>
Message-ID: <20200825004336.GA7849@gondor.apana.org.au>
References: <20200824135840.3716-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200824135840.3716-1-festevam@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-crypto@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 1/2] crypto: stm32/crc32 - include
	<linux/io.h>
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

On Mon, Aug 24, 2020 at 10:58:39AM -0300, Fabio Estevam wrote:
> Building ARM allmodconfig leads to the following warnings:
> 
> drivers/crypto/stm32/stm32-crc32.c:128:2: error: implicit declaration of function 'writel_relaxed' [-Werror=implicit-function-declaration]
> drivers/crypto/stm32/stm32-crc32.c:134:17: error: implicit declaration of function 'readl_relaxed' [-Werror=implicit-function-declaration]
> drivers/crypto/stm32/stm32-crc32.c:176:4: error: implicit declaration of function 'writeb_relaxed' [-Werror=implicit-function-declaration]
> 
> Include <linux/io.h> to fix such warnings.
> 
> Reported-by: Olof's autobuilder <build@lixom.net>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  drivers/crypto/stm32/stm32-crc32.c | 1 +
>  1 file changed, 1 insertion(+)

Thank you.  But this is already in the queue:

https://patchwork.kernel.org/patch/11729369/
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
