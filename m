Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 34714902F04
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jun 2024 05:17:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA92EC6C838;
	Tue, 11 Jun 2024 03:17:54 +0000 (UTC)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80EBECFAC7F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jun 2024 03:17:47 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
 id 1sGs0f-007rxS-11; Tue, 11 Jun 2024 11:17:22 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Tue, 11 Jun 2024 11:17:24 +0800
Date: Tue, 11 Jun 2024 11:17:24 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <ZmfBxLB8RC_KNUlx@gondor.apana.org.au>
References: <20240524-mcrc64-upstream-v3-0-24b94d8e8578@ti.com>
 <87tti098af.fsf@kamlesh.i-did-not-set--mail-host-address--so-tickle-me>
 <Zme3EcW4Uz8kTbTt@gondor.apana.org.au>
 <20240611031314.GA2557@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240611031314.GA2557@sol.localdomain>
Cc: robh@kernel.org, conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 kristo@kernel.org, devicetree@vger.kernel.org,
 Kamlesh Gurudasani <kamlesh@ti.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 mcoquelin.stm32@gmail.com, catalin.marinas@arm.com, akpm@linux-foundation.org,
 will@kernel.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 vigneshr@ti.com
Subject: Re: [Linux-stm32] [PATCH v3 0/6] Add support for MCRC64 engine to
 calculate 64-bit CRC in Full-CPU mode
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

On Mon, Jun 10, 2024 at 08:13:14PM -0700, Eric Biggers wrote:
>
> I thought the rule is that there needs to be an in-kernel user to add algorithms
> to the crypto API?  Is there any precedent for adding new algorithms purely so
> that accelerators that implement them can be accessed from userspace via AF_ALG?

I agree.  Perhaps this driver could instead be added as a simple
char device that is then used directly by the intended user without
going through the Crypto API at all.

That would make it a lot simpler.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
