Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EA8B0A16D
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Jul 2025 12:59:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45EE7C3F950;
	Fri, 18 Jul 2025 10:59:58 +0000 (UTC)
Received: from abb.hmeau.com (abb.hmeau.com [180.181.231.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7AA1DC3F94F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Jul 2025 10:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com; 
 s=formenos;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZAzXiiY/YIuQ/9uY0l8462fgPlzoh4f7KxWN0ebvqKE=; b=gl6/Zd5HCQjexfoJQ5QZ7wWbAN
 hbTSGnGqU1GFUKmrbFD5jj5vmYPGtEhp2sd/JvCtZM6Ey182276LgB1rE6/Y4aUV+YP9bKd8D1GaR
 zFO93R0YQ/tC9nTkcRMnuZTdZ9Df6EvDXbhwS0lu+KiAp/tqI1sLtvSsK9OUIfEHv9h1Zgc9fUTSy
 FhsdvvJ9w0SYBxvit/U5QBdoDkz+FyLZGvo+Wpy+Ut0aSr8T8A7G2SLLgJJQxnRDa/M20K8u0rMGO
 zTuIwFdckQDDn1z7Fu0M5YEidFHCWP3HUT1OuutOK5JjiGBlgmO95iGw2o9kaSi+0Jbt6qJZK+hZB
 84nBPNsA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
 id 1uciYM-007yZr-27; Fri, 18 Jul 2025 18:58:56 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Fri, 18 Jul 2025 20:58:55 +1000
Date: Fri, 18 Jul 2025 20:58:55 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Message-ID: <aHoo71TbepQD2Nsd@gondor.apana.org.au>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
 <20250704075359.3217036-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250704075359.3217036-1-sakari.ailus@linux.intel.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Olivia Mackall <olivia@selenic.com>, linux-stm32@st-md-mailman.stormreply.com,
 Heiko Stuebner <heiko@sntech.de>, Marek Vasut <marex@denx.de>,
 Benjamin Fair <benjaminfair@google.com>, linux-rockchip@lists.infradead.org,
 openbmc@lists.ozlabs.org, Daniel Golle <daniel@makrotopia.org>,
 Nancy Yuen <yuenn@google.com>, Hadar Gat <hadar.gat@arm.com>,
 Sean Wang <sean.wang@mediatek.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-mediatek@lists.infradead.org,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [Linux-stm32] [PATCH 05/80] hwrng: Remove redundant
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

On Fri, Jul 04, 2025 at 10:53:59AM +0300, Sakari Ailus wrote:
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
>  drivers/char/hw_random/atmel-rng.c     | 1 -
>  drivers/char/hw_random/cctrng.c        | 1 -
>  drivers/char/hw_random/mtk-rng.c       | 1 -
>  drivers/char/hw_random/npcm-rng.c      | 1 -
>  drivers/char/hw_random/omap3-rom-rng.c | 1 -
>  drivers/char/hw_random/rockchip-rng.c  | 3 ---
>  drivers/char/hw_random/stm32-rng.c     | 1 -
>  7 files changed, 9 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
