Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 056C98B0FD6
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Apr 2024 18:32:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC674C7128C;
	Wed, 24 Apr 2024 16:32:57 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07F59C6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Apr 2024 16:32:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 21B53C000F;
 Wed, 24 Apr 2024 16:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1713976375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nVfX6CunHv0QJSiX7CwyfL7fs8TD4zil05zPYCaSh6k=;
 b=iMVDtccoEjyJoeXjQJLTyW/F8IkBaa/rp9MWSak72TbmK3OD5QfxAjn1in6WE98ZtBUyR5
 3P30Xa4NYEDOJWfQc45QcD3YdXvSv1WDXSusY+dtDC2jdM6pibXjIRocRI5egVRjFP2OOy
 ee13xRwe4nIhFtLSEg+D4hnIG/x9FNg9Y/zCSi8RjeyuNd8Oq5T4u1mYLqcrrN3fg2y5tg
 Mt8UhDahzyzg/3U7hicTJd9RbTxtnMHLCFR+RR6ZXQS+6gwZsApMHLOAIPN2expFnKgqOX
 Zi3tqaEjw8QcWzUf0o8XEAtexPfEvmQSk/JdjNpfLv+x9+AZ58jWDqhqAICBGQ==
Date: Wed, 24 Apr 2024 18:33:30 +0200 (CEST)
From: Romain Gantois <romain.gantois@bootlin.com>
To: Serge Semin <fancer.lancer@gmail.com>
In-Reply-To: <qf637dtkakxbumefbei3qrhbpyxgerjwn72ixp5xh6mc6yjbda@6z6tm6hk7fki>
Message-ID: <27279f1a-e718-a8cf-ecfc-40f45bf6c500@bootlin.com>
References: <20240424-rzn1-gmac1-v4-0-852a5f2ce0c0@bootlin.com>
 <20240424-rzn1-gmac1-v4-2-852a5f2ce0c0@bootlin.com>
 <qf637dtkakxbumefbei3qrhbpyxgerjwn72ixp5xh6mc6yjbda@6z6tm6hk7fki>
MIME-Version: 1.0
X-GND-Sasl: romain.gantois@bootlin.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Eric Dumazet <edumazet@google.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 =?ISO-8859-15?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v4 2/5] net: stmmac: introduce
 pcs_init/pcs_exit stmmac operations
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

Hi Serge,

On Wed, 24 Apr 2024, Serge Semin wrote:

> Once again. There is a ready-to-use stmmac_xpcs_setup() method. Which
> is currently intended for the XPCS setups. Let's collect all the
> PCS-related stuff in a single place there. That will make code cleaner
> and easier to read. This was discussed on v3:
> 
> https://lore.kernel.org/netdev/42chuecdt7dpgm6fcrtt2crifvv5hflmtnmdrw5fvk3r7pwjgu@hlcv56dbeosf/
> 
> You agreed to do that, but just ignored in result. I'll repeat what I
> said in v3:

Yeah sorry I took a quick look at your merged patches and thought that 
stmmac_xpcs_setup() had been repurposed in the meantime, but it seems like I was 
just confused about that.

> It doesn't look as that much hard thing to do, but will cause having a
> better readable code by providing a single coherent function for all
> PCS'es.

Sure, I'll get to it in v5.

Thanks,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
