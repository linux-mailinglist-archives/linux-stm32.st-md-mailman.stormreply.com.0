Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDB676FD75
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Aug 2023 11:36:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97B10C6B459;
	Fri,  4 Aug 2023 09:36:43 +0000 (UTC)
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net
 (167-179-156-38.a7b39c.syd.nbn.aussiebb.net [167.179.156.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50324C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Aug 2023 09:36:41 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
 id 1qRrDk-003baN-9J; Fri, 04 Aug 2023 17:35:45 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Fri, 04 Aug 2023 17:35:44 +0800
Date: Fri, 4 Aug 2023 17:35:44 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Rob Herring <robh@kernel.org>
Message-ID: <ZMzGcMJh6TA+V+p5@gondor.apana.org.au>
References: <20230728134828.3224218-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230728134828.3224218-1-robh@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Benjamin Fair <benjaminfair@google.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Michael Ellerman <mpe@ellerman.id.au>, openbmc@lists.ozlabs.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Nancy Yuen <yuenn@google.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 devicetree@vger.kernel.org, Deepak Saxena <dsaxena@plexity.net>,
 Ray Jui <rjui@broadcom.com>, Nicholas Piggin <npiggin@gmail.com>,
 linux-rpi-kernel@lists.infradead.org, Olivia Mackall <olivia@selenic.com>,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH v3] hwrng: Explicitly include correct DT
	includes
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

On Fri, Jul 28, 2023 at 07:48:27AM -0600, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it was merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> v3:
>  - Split out hw_random, ipmi and tpm
> v2:
>  - Fix build for pic32-rng.c dropping of_match_ptr()
> ---
>  drivers/char/hw_random/atmel-rng.c     | 2 +-
>  drivers/char/hw_random/bcm2835-rng.c   | 3 +--
>  drivers/char/hw_random/ingenic-trng.c  | 2 +-
>  drivers/char/hw_random/iproc-rng200.c  | 3 +--
>  drivers/char/hw_random/npcm-rng.c      | 3 +--
>  drivers/char/hw_random/omap-rng.c      | 2 --
>  drivers/char/hw_random/omap3-rom-rng.c | 1 -
>  drivers/char/hw_random/pasemi-rng.c    | 3 +--
>  drivers/char/hw_random/pic32-rng.c     | 5 ++---
>  drivers/char/hw_random/stm32-rng.c     | 3 ++-
>  drivers/char/hw_random/xgene-rng.c     | 5 ++---
>  drivers/char/hw_random/xiphera-trng.c  | 1 -
>  12 files changed, 12 insertions(+), 21 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
