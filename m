Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7C91CA385
	for <lists+linux-stm32@lfdr.de>; Fri,  8 May 2020 08:04:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99336C3FACC;
	Fri,  8 May 2020 06:04:52 +0000 (UTC)
Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4501C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 May 2020 06:04:49 +0000 (UTC)
Received: from gwarestrin.me.apana.org.au ([192.168.0.7]
 helo=gwarestrin.arnor.me.apana.org.au)
 by fornost.hmeau.com with smtp (Exim 4.89 #2 (Debian))
 id 1jWw0z-0004u9-0O; Fri, 08 May 2020 15:57:42 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
 Fri, 08 May 2020 16:04:20 +1000
Date: Fri, 8 May 2020 16:04:20 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Lionel Debieve <lionel.debieve@st.com>
Message-ID: <20200508060420.GA24789@gondor.apana.org.au>
References: <20200427064226.6991-1-lionel.debieve@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200427064226.6991-1-lionel.debieve@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-crypto@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/3] crypto: stm32/hash: Defer probe
	management
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

On Mon, Apr 27, 2020 at 08:42:23AM +0200, Lionel Debieve wrote:
> These patches manage properly the defer probe for STM32 Hash driver.
> It allows the driver to be probed later if clock, reset or dma return
> a defer error.
> It also removes the error print messages in such cases.
> 
> Etienne Carriere (2):
>   crypto: stm32/hash - defer probe for reset controller
>   crypto: stm32/hash - defer probe for dma device
> 
> Lionel Debieve (1):
>   crypto: stm32/hash - don't print error on probe deferral
> 
>  drivers/crypto/stm32/stm32-hash.c | 38 ++++++++++++++++++++++---------
>  1 file changed, 27 insertions(+), 11 deletions(-)

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
