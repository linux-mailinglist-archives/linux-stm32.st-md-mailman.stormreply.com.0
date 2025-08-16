Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C0317B28C61
	for <lists+linux-stm32@lfdr.de>; Sat, 16 Aug 2025 11:30:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2CAF2C35E3C;
	Sat, 16 Aug 2025 09:30:44 +0000 (UTC)
Received: from abb.hmeau.com (abb.hmeau.com [180.181.231.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B1B3C36B10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Aug 2025 09:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com; 
 s=formenos;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4WiZ9ddpNrGSgA17pjQ7Do4+YzZaiUY0Hg+kDmv11gc=; b=Yvy91sGjFKWDa4QDCuhWNnVenx
 rtefdrPoiAQWGr9MeAIc7RK82rncwbCMaZ9LzIPmlJbq0H0Jv6sGSoa2PCNlAYwvUMQX3Mrxj50Of
 PSrKQn8GzeSayzurAzGZDOCITckNcrDPTkyAK2q3E81XLOs1G3Oq0O+Zh9AoSE1Nf27060FF1Yt0u
 pzAGcFMJv7aS+01yltWJrJa08mkLyTKdUw6JZdeZSu5i4X8s+qAeD3SEVQe3EpBuLGHCowc1AoBvq
 QgGn0AKP5mnr+zP08R+EtL8ctwoOiaEMaaheo2xpLeNv1mY/J7ux6RIEtVXq65vVTRnH72REkGMJy
 0avR0ryQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
 id 1unCzl-00EmJl-2C; Sat, 16 Aug 2025 17:30:35 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Sat, 16 Aug 2025 17:30:34 +0800
Date: Sat, 16 Aug 2025 17:30:34 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Colin Ian King <colin.i.king@gmail.com>
Message-ID: <aKBPutUbmQCp28YX@gondor.apana.org.au>
References: <20250724105754.140400-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250724105754.140400-1-colin.i.king@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH][next] crypto: stm32: Fix spelling mistake
 "STMicrolectronics" -> "STMicroelectronics"
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

On Thu, Jul 24, 2025 at 11:57:54AM +0100, Colin Ian King wrote:
> There is a spelling mistake in the module description text. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/crypto/stm32/stm32-cryp.c | 2 +-
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
