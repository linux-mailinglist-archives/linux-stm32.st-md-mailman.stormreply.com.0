Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3987D7C834D
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Oct 2023 12:39:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6AB9C6B442;
	Fri, 13 Oct 2023 10:39:35 +0000 (UTC)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2BD48C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Oct 2023 10:39:34 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
 id 1qrFZb-006jgf-92; Fri, 13 Oct 2023 18:39:16 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Fri, 13 Oct 2023 18:39:20 +0800
Date: Fri, 13 Oct 2023 18:39:20 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
Message-ID: <ZSkeWHdOAOfjtpwJ@gondor.apana.org.au>
References: <20231008040140.1647892-1-dimitri.ledkov@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231008040140.1647892-1-dimitri.ledkov@canonical.com>
Cc: linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 linux-crypto@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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

On Sun, Oct 08, 2023 at 05:01:39AM +0100, Dimitri John Ledkov wrote:
> No internal users left and cryptographically insecure. Users should
> upgrade to something else, e.g. sha256 blake3.
> 
> Some drivers have their own full or partial md4 implementation without
> using crypto/md4.
> 
> Userspace code search indicates a few copies of hash_info.h
> https://codesearch.debian.net/search?q=HASH_ALGO_MD4&literal=1 without
> need for MD4.
> 
> Preserve uapi hash algorithm indexes and array length, but rename the
> MD4 enum.
> 
> Signed-off-by: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
> ---
>  crypto/Kconfig                 |   6 -
>  crypto/Makefile                |   1 -
>  crypto/hash_info.c             |   4 +-
>  crypto/md4.c                   | 241 ---------------------------------
>  crypto/tcrypt.c                |  12 --
>  crypto/testmgr.c               |   6 -
>  crypto/testmgr.h               |  42 ------
>  include/uapi/linux/hash_info.h |   2 +-
>  8 files changed, 3 insertions(+), 311 deletions(-)
>  delete mode 100644 crypto/md4.c

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
