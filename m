Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7179E7D07E4
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Oct 2023 07:54:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1CCB1C6907A;
	Fri, 20 Oct 2023 05:54:46 +0000 (UTC)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D2F0C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Oct 2023 05:54:44 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
 id 1qtiSm-0097bb-Am; Fri, 20 Oct 2023 13:54:25 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Fri, 20 Oct 2023 13:54:29 +0800
Date: Fri, 20 Oct 2023 13:54:29 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
Message-ID: <ZTIWFcFgpOsaE05N@gondor.apana.org.au>
References: <20231010212240.61637-1-dimitri.ledkov@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231010212240.61637-1-dimitri.ledkov@canonical.com>
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 David Howells <dhowells@redhat.com>, Luis Chamberlain <mcgrof@kernel.org>,
 keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-modules@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] crypto: pkcs7: remove sha1 support
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

On Tue, Oct 10, 2023 at 10:22:38PM +0100, Dimitri John Ledkov wrote:
> Removes support for sha1 signed kernel modules, importing sha1 signed
> x.509 certificates.
> 
> rsa-pkcs1pad keeps sha1 padding support, which seems to be used by
> virtio driver.
> 
> sha1 remains available as there are many drivers and subsystems using
> it. Note only hmac(sha1) with secret keys remains cryptographically
> secure.
> 
> In the kernel there are filesystems, IMA, tpm/pcr that appear to be
> using sha1. Maybe they can all start to be slowly upgraded to
> something else i.e. blake3, ParallelHash, SHAKE256 as needed.
> 
> Signed-off-by: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
> ---
>  crypto/asymmetric_keys/mscode_parser.c    |  3 -
>  crypto/asymmetric_keys/pkcs7_parser.c     |  4 --
>  crypto/asymmetric_keys/public_key.c       |  3 +-
>  crypto/asymmetric_keys/signature.c        |  2 +-
>  crypto/asymmetric_keys/x509_cert_parser.c |  8 ---
>  crypto/testmgr.h                          | 80 -----------------------
>  include/linux/oid_registry.h              |  4 --
>  kernel/module/Kconfig                     |  5 --
>  8 files changed, 2 insertions(+), 107 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
