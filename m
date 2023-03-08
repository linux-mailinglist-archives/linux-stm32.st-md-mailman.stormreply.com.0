Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AA56AFD97
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Mar 2023 04:46:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 94F32C69053;
	Wed,  8 Mar 2023 03:46:33 +0000 (UTC)
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net
 (167-179-156-38.a7b39c.syd.nbn.aussiebb.net [167.179.156.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E915C65E60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Mar 2023 03:46:31 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
 id 1pZkkk-001YTl-Tm; Wed, 08 Mar 2023 11:46:11 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Wed, 08 Mar 2023 11:46:10 +0800
Date: Wed, 8 Mar 2023 11:46:10 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: lionel.debieve@foss.st.com
Message-ID: <ZAgFAtrp3ptq9Ym7@gondor.apana.org.au>
References: <Y/3FYZJeLE7DVPBf@gondor.apana.org.au>
 <Y/3IA4OjmUmjMgh1@gondor.apana.org.au>
 <Y/3N6zFOZeehJQ/p@gondor.apana.org.au>
 <CACRpkdZ3rCsOWqooNkPL6m7vZ2Z2Frh2sdxruKhrS0t3QHcSKw@mail.gmail.com>
 <Y/6sCC2nH0FcD6kJ@gondor.apana.org.au>
 <CACRpkdYN-SDfxXKLt3HWGVkWb3V1rABwvWuytwDrzfTqm81fNA@mail.gmail.com>
 <ZAA8doNUjYmTRScB@gondor.apana.org.au>
 <ZAMQjOdi8GfqDUQI@gondor.apana.org.au>
 <ZAVu/XHbL9IR5D3h@gondor.apana.org.au>
 <009901d950fc$7e0f68a0$7a2e39e0$@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <009901d950fc$7e0f68a0$7a2e39e0$@foss.st.com>
Cc: 'Linus Walleij' <linus.walleij@linaro.org>, 'Li kunyu' <kunyu@nfschina.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-crypto@vger.kernel.org, mcoquelin.stm32@gmail.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [v6 PATCH 0/7] crypto: stm32 - Save and restore
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

On Tue, Mar 07, 2023 at 02:55:29PM +0100, lionel.debieve@foss.st.com wrote:
>
> The issue about the context management relies on a question I've get time to
> ask you. There is no internal test purpose (using test manager) that really
> show the need of a hash update that needs to be "self-content". We've seen

Indeed this functionality is sorely missed.  It shouldn't be hard
to implement, because simply hashing two different requests
interleaved with each other should show the problem:

init(A) => update(A) => init(B) => update(B) => final(A) => final(B)

> the issue using openssl use cases that is not using import/export.
> I'm wondering to understand the real need of import/export in the framework
> if the request must be safe itself?

The hash state is normally stored in the request context.  The
import/export functions let you save a copy of the state for
subsequent processing.  The request could then be freed after
the export and re-allocated prior to import, or in other contexts
the request could be reused for a completely different hash in
the time being (init/update/final).

> >From hardware point of view, it is a penalty to wait for completion to save
> the context after each request. I understand the need of multiple hash
> request in // but I was wondering that it can be managed by the
> import/export, but it seems I was wrong. The penalty of the context saving
> will impact all hash requests where, in a runtime context is probably not
> the most important use case.

Oh of course we try to avoid unnecessary savings/restoring as much
as we can.  That's why we encourage users to use finup/digest as
much as possible, in which case there may be be no need to save and
restore at all.

However, if the user has to do a partial update through the update
function, then we have to save the state.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
