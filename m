Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E6C47120A
	for <lists+linux-stm32@lfdr.de>; Sat, 11 Dec 2021 06:56:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CDB3FC5F1EB;
	Sat, 11 Dec 2021 05:56:06 +0000 (UTC)
Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95F82C5F1E0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Dec 2021 05:56:04 +0000 (UTC)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
 by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
 id 1mvvMH-0004yB-FI; Sat, 11 Dec 2021 16:55:46 +1100
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
 Sat, 11 Dec 2021 16:55:45 +1100
Date: Sat, 11 Dec 2021 16:55:45 +1100
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Nicolas Toromanoff <nicolas.toromanoff@foss.st.com>
Message-ID: <20211211055545.GB6841@gondor.apana.org.au>
References: <20211130075501.21958-1-nicolas.toromanoff@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211130075501.21958-1-nicolas.toromanoff@foss.st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Marek Vasut <marex@denx.de>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "David S . Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 0/9] STM32 CRYP driver: many fixes
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

On Tue, Nov 30, 2021 at 08:54:52AM +0100, Nicolas Toromanoff wrote:
> Hello,
> 
> This set of patches update the STM32 CRYP driver.
> 
> First two update about EPROBE_DEFER management.
> Then many fixes to success the cryptomanager EXTRA_TESTS.
> And finally we reorder the initialization to set the key as last step.
> 
> This patch series applies to cryptodev/master.
> 
> v1 -> v2 :
>   - use crypto_inc() in "crypto: stm32/cryp - fix CTR counter carry".
>   - more explicit commit description.
>   - with CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=y all tests pass, at boot
>     if built into kernel, at insmod if in module. (as v1)
> 
> v2->v3:
>   - fix smatch warning (that was a bug) in "crypto: stm32/cryp - fix bugs
>     and crash in tests" add missing parenthesis in mask/shift operation in
>     stm32_cryp_write_ccm_first_header(), was only visible in case of aad
>     buffer bigger than 65280 bytes.
>   - add a new commit to fix lrw chaining mode
> 
> v3->v4
>   - Fix sparse warning
>   - Rebase on cryptodev-2.6/master
>   - rework 0004-patch: with v1 correction, the xts extra tests using
>     stm32-cryp were still broken.
> 
> Etienne Carriere (2):
>   crypto: stm32/cryp - defer probe for reset controller
>   crypto: stm32/cryp - don't print error on probe deferral
> 
> Nicolas Toromanoff (7):
>   crypto: stm32/cryp - fix CTR counter carry
>   crypto: stm32/cryp - fix xts and race condition in crypto_engine
>     requests
>   crypto: stm32/cryp - check early input data
>   crypto: stm32/cryp - fix double pm exit
>   crypto: stm32/cryp - fix lrw chaining mode
>   crypto: stm32/cryp - fix bugs and crash in tests
>   crypto: stm32/cryp - reorder hw initialization
> 
>  drivers/crypto/stm32/stm32-cryp.c | 987 ++++++++++++------------------
>  1 file changed, 404 insertions(+), 583 deletions(-)
> 
> 
> base-commit: 330507fbc9d8c3bc4525ea2ae9c3774738bc0c80
> -- 
> 2.17.1

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
