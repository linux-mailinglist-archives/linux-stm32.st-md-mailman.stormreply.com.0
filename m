Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 227A77C92B2
	for <lists+linux-stm32@lfdr.de>; Sat, 14 Oct 2023 06:07:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1496C6B442;
	Sat, 14 Oct 2023 04:07:09 +0000 (UTC)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 430D4C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Oct 2023 04:07:08 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
 id 1qrVvK-0070KV-3B; Sat, 14 Oct 2023 12:06:47 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Sat, 14 Oct 2023 12:06:50 +0800
Date: Sat, 14 Oct 2023 12:06:50 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Denis Kenzior <denkenz@gmail.com>
Message-ID: <ZSoT2loMni1PWqiq@gondor.apana.org.au>
References: <20231008040140.1647892-1-dimitri.ledkov@canonical.com>
 <ZSkeWHdOAOfjtpwJ@gondor.apana.org.au>
 <2e52c8b4-e70a-453f-853a-1962c8167dfa@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2e52c8b4-e70a-453f-853a-1962c8167dfa@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Marcel Holtmann <marcel@holtmann.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Dimitri John Ledkov <dimitri.ledkov@canonical.com>,
 James Prestwood <prestwoj@gmail.com>
Subject: Re: [Linux-stm32] [PATCH] crypto: remove md4 driver
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

On Fri, Oct 13, 2023 at 09:37:52AM -0500, Denis Kenzior wrote:
>
> Does this patch break userspace?
> 
> Here's a thread regarding MD4 the last time its removal was attempted:
> https://lore.kernel.org/linux-crypto/20210818144617.110061-1-ardb@kernel.org/
> 
> Please note that iwd does use MD4 hashes here:
> https://git.kernel.org/pub/scm/libs/ell/ell.git/tree/ell/checksum.c#n63
> 
> https://git.kernel.org/pub/scm/network/wireless/iwd.git/tree/src/eap-mschapv2.c#n165

I've backed this out for now.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
