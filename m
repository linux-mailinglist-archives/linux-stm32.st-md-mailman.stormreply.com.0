Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF77281C43F
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Dec 2023 05:42:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D41EC6C820;
	Fri, 22 Dec 2023 04:42:08 +0000 (UTC)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2215EC6B477
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Dec 2023 04:42:06 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
 id 1rGXMB-00DhZz-PV; Fri, 22 Dec 2023 12:41:56 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Fri, 22 Dec 2023 12:42:06 +0800
Date: Fri, 22 Dec 2023 12:42:06 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thomas Bourgoin <thomas.bourgoin@foss.st.com>
Message-ID: <ZYUTnm83NdBC0+Rb@gondor.apana.org.au>
References: <20231215111724.864051-1-thomas.bourgoin@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231215111724.864051-1-thomas.bourgoin@foss.st.com>
Cc: Dan Carpenter <error27@gmail.com>, linux-kernel@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 kernel test robot <lkp@intel.com>
Subject: Re: [Linux-stm32] [PATCH] crypto: stm32/crc32 - fix parsing list of
	devices
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

On Fri, Dec 15, 2023 at 12:17:24PM +0100, Thomas Bourgoin wrote:
> smatch warnings:
> drivers/crypto/stm32/stm32-crc32.c:108 stm32_crc_get_next_crc() warn:
> can 'crc' even be NULL?
> 
> Use list_first_entry_or_null instead of list_first_entry to retrieve
> the first device registered.
> The function list_first_entry always return a non NULL pointer even if
> the list is empty. Hence checking if the pointer returned is NULL does
> not tell if the list is empty or not.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/r/202311281111.ou2oUL2i-lkp@intel.com/
> Reported-by: Dan Carpenter <error27@gmail.com>
> Closes: https://lore.kernel.org/r/202311281111.ou2oUL2i-lkp@intel.com/
> Signed-off-by: Thomas Bourgoin <thomas.bourgoin@foss.st.com>
> ---
>  drivers/crypto/stm32/stm32-crc32.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
