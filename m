Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 997EAB0A166
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Jul 2025 12:59:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3482AC3F950;
	Fri, 18 Jul 2025 10:59:38 +0000 (UTC)
Received: from abb.hmeau.com (abb.hmeau.com [180.181.231.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82C63C3F94F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Jul 2025 10:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com; 
 s=formenos;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rHrqihAXBWbkD+hNJe9QmyuvcRfGQMrrS8l0OHyFvmc=; b=HEAgY0Rlaa4bpR/jWfqfLLuZn3
 M2+ATfYOBUC9Ml8x5+NSI5LHinIZtAv/YyP3GyUr/pOSmosNGnR1JThvkVtFGQfjiKKLURBEW+JIm
 L0MKAZAtatL8cHfZSG43b+5SniVMEkXM36/5qvmdxvQKi3DtPHb5FzvW7sdITUeHv2qf4xZQ6Qyy/
 70TQrd1VfRUzKR87JxKnzAhJYnp/nW1hqytsA9KTVfp3J2BlNrca/+M0JCDyHpGvaD/JfyizW+Vp8
 qIyf9XJ07SECEpAO+WPd2aO7SnUNFBboMMnAODtKUX2GRwAleVuu7M9CPtBqyibSMeX+E8Sv3v646
 FEmmY7Uw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
 id 1uciYX-007yZy-0x; Fri, 18 Jul 2025 18:59:06 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Fri, 18 Jul 2025 20:59:05 +1000
Date: Fri, 18 Jul 2025 20:59:05 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Message-ID: <aHoo-dQpHxX-Lqbf@gondor.apana.org.au>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
 <20250704075402.3217279-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250704075402.3217279-1-sakari.ailus@linux.intel.com>
Cc: Weili Qian <qianweili@huawei.com>, Eric Biggers <ebiggers@google.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Gilad Ben-Yossef <gilad@benyossef.com>, Zhou Wang <wangzhou1@hisilicon.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
 linux-crypto@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 08/80] crypto: Remove redundant
 pm_runtime_mark_last_busy() calls
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

On Fri, Jul 04, 2025 at 10:54:02AM +0300, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> The cover letter of the set can be found here
> <URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.
> 
> In brief, this patch depends on PM runtime patches adding marking the last
> busy timestamp in autosuspend related functions. The patches are here, on
> rc2:
> 
>         git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
>                 pm-runtime-6.17-rc1
> 
>  drivers/crypto/ccree/cc_pm.c      | 1 -
>  drivers/crypto/hisilicon/qm.c     | 1 -
>  drivers/crypto/omap-aes-gcm.c     | 1 -
>  drivers/crypto/omap-aes.c         | 1 -
>  drivers/crypto/omap-des.c         | 1 -
>  drivers/crypto/omap-sham.c        | 1 -
>  drivers/crypto/stm32/stm32-cryp.c | 1 -
>  drivers/crypto/stm32/stm32-hash.c | 1 -
>  8 files changed, 8 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
