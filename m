Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A55DD902E61
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jun 2024 04:32:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36ADFC6C838;
	Tue, 11 Jun 2024 02:32:23 +0000 (UTC)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D666CFAC7F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jun 2024 02:32:15 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
 id 1sGrIV-007rLt-0K; Tue, 11 Jun 2024 10:31:44 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Tue, 11 Jun 2024 10:31:45 +0800
Date: Tue, 11 Jun 2024 10:31:45 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Kamlesh Gurudasani <kamlesh@ti.com>, Eric Biggers <ebiggers@kernel.org>
Message-ID: <Zme3EcW4Uz8kTbTt@gondor.apana.org.au>
References: <20240524-mcrc64-upstream-v3-0-24b94d8e8578@ti.com>
 <87tti098af.fsf@kamlesh.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87tti098af.fsf@kamlesh.i-did-not-set--mail-host-address--so-tickle-me>
Cc: robh@kernel.org, conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 kristo@kernel.org, devicetree@vger.kernel.org, catalin.marinas@arm.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, mcoquelin.stm32@gmail.com,
 akpm@linux-foundation.org, will@kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, vigneshr@ti.com
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

On Mon, Jun 10, 2024 at 08:03:44PM +0530, Kamlesh Gurudasani wrote:
> <kamlesh@ti.com> writes:
> 
> > From: Kamlesh Gurudasani <kamlesh@ti.com>
> >
> > MCRC64 engine calculates 64-bit cyclic redundancy checks (CRC)
> > according to the ISO 3309 standard.
> 
> Could you please review this and let me know if any changes are needed
> to get it merged.

Eric Biggers had concerns about adding this to the kernel.  I'd
like know if he's OK with this or not.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
