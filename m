Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 617E66CB53E
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Mar 2023 05:59:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11063C6A5F2;
	Tue, 28 Mar 2023 03:59:03 +0000 (UTC)
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net
 (167-179-156-38.a7b39c.syd.nbn.aussiebb.net [167.179.156.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16E2CC01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Mar 2023 03:59:01 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
 id 1ph0Tf-009Oce-Ss; Tue, 28 Mar 2023 11:58:32 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Tue, 28 Mar 2023 11:58:31 +0800
Date: Tue, 28 Mar 2023 11:58:31 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thomas BOURGOIN <thomas.bourgoin@foss.st.com>
Message-ID: <ZCJl55aGJO8CFO0j@gondor.apana.org.au>
References: <ZAxFBR3TdA7jUAgJ@gondor.apana.org.au>
 <E1pavED-002xbf-LL@formenos.hmeau.com>
 <e7cd1e8b-9ebc-ff6d-a8c4-1ccd11df6de1@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e7cd1e8b-9ebc-ff6d-a8c4-1ccd11df6de1@foss.st.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Li kunyu <kunyu@nfschina.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-crypto@vger.kernel.org, mcoquelin.stm32@gmail.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [v7 PATCH 8/8] crypto: stm32 - Save and restore
 between each request
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

On Mon, Mar 27, 2023 at 10:33:10AM +0200, Thomas BOURGOIN wrote:
> 
> I'm working on the patch for STM32MP13.

...
 
> The version of HASH implemented in the STM32MP13 provides new algorithms (SHA512, SHA3, ...).
> Because of that, the constant HASH_CSR_REGISTER_NUMBER increases (from 54 to 103).
> Hence, the size of stm32_hash_state is equal to 688 which is bigger than HASH_MAX_STATESIZE(=512)
> and the driver fails to register the algorithms.
> 
> Is there any reasons why HASH_MAX_STATESIZE is set to 512 ?
> I only see it used to define static arrays, so maybe it could be set to 1024.

Thanks for reaching out.  Please fix your emails so that they
are plain-text only, otherwise you won't be able to send any
patches to the list.

I have just sent out two patches to remove this limit.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
