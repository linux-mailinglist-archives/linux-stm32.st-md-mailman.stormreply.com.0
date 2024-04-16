Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F788A6C09
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Apr 2024 15:20:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09415C6B45B;
	Tue, 16 Apr 2024 13:20:58 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72F43C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Apr 2024 13:20:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1F9ABE0003;
 Tue, 16 Apr 2024 13:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1713273656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WCnKnoSsQoEAYv75BNn3l7B7yy2mGKGbl/sOd184mU0=;
 b=jprFcJrVd9rSnrTiyxix2blgTrCU/Qlp+tzngtuXlZLiieDwzkoOldUgEDp5yVLsbulKIZ
 CzSEXc5zzaQHSVsTI5W6AOCIkga+IsG1oFTjYI+JU7a3nor22PG5eIgHIbgpmXTpUzBalM
 mCn64ex2Hn2WUlBRAFWl2qzVao7CKHpEBs+ucgOXjh4GH4LmArUBjbOWczTwHYK7ShMHNl
 KmqTxXL6PM1QSO34cOPfhY+Nfw1c63wJjVcxyoZ6Vh/+Qj5UH4M+GBNyfiDllwmnsAfBBo
 Il45EZNbkMeX3HOTXI5P3oxAe/GyR4f2LJuUEWuXGSighZKeZw4vOiEL7rntOA==
Date: Tue, 16 Apr 2024 15:21:30 +0200 (CEST)
From: Romain Gantois <romain.gantois@bootlin.com>
To: Serge Semin <fancer.lancer@gmail.com>
In-Reply-To: <btgxb3ugs4apjvxj5hmpec3rtoxwdal7ms2z4s7pecdfefphiw@gd7ctqsh7wg2>
Message-ID: <8ffb6634-6d57-8df8-90c3-aecc585395e5@bootlin.com>
References: <20240412180340.7965-1-fancer.lancer@gmail.com>
 <20240412180340.7965-5-fancer.lancer@gmail.com>
 <714199e5-edf2-dcbb-216b-563431d70488@bootlin.com>
 <btgxb3ugs4apjvxj5hmpec3rtoxwdal7ms2z4s7pecdfefphiw@gd7ctqsh7wg2>
MIME-Version: 1.0
X-GND-Sasl: romain.gantois@bootlin.com
Cc: Samuel Holland <samuel@sholland.org>, Yanteng Si <siyanteng@loongson.cn>,
 linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
 Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Chen-Yu Tsai <wens@csie.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-sunxi@lists.linux.dev,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 4/4] net: stmmac: Move MAC caps
 init to phylink MAC caps getter
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

On Tue, 16 Apr 2024, Serge Semin wrote:

> So I don't think that changing it to something different would be a
> good alternative. What could be a better option is to rename the
> stmmac_ops::phylink_get_caps() callback and
> stmmac_mac_phylink_get_caps() macro-function to something like:
> 
> stmmac_ops::link_update_caps()
> stmmac_mac_link_update_caps()
> 
> especially seeing the callback no longer sets the phylink MAC
> capabilities directly. What do you think?

This seems like a good solution to me.

Thanks,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
