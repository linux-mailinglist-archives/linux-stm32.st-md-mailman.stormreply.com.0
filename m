Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7859BE174
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Nov 2024 10:00:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80FECC78015;
	Wed,  6 Nov 2024 09:00:15 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42D5BC6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Nov 2024 09:00:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CE518FF813;
 Wed,  6 Nov 2024 09:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1730883607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wggt6wmbTUXS4x4tV46Izk+39B3cnS2JlZr7SjlMcMc=;
 b=NYBVGt3DiBgndrXBPVl9Dcp0UOdXQJi5EvQ7PonofETdX7a6LslGUKmGWg+JmEXFg6J1pD
 FyR/lcVrtOyxtFwamRmxUJPyyXfEYmdmwAfbKnh7KsDC1h0/7yLzOOjj2gpMp95dhRwz/y
 U00g0SRdXOhgEJZq0rGu8T3aXByEJhDW4hW+nXBF++jjIDN1ts8qCm53sryCTfxOQX8Yq2
 dKuII9OUOqM0Vzu43RL7eym79sijjZAbCZPdwdHf4gJ5f/K/SxfiWEdk9cHrJbVbD47voo
 Bwd3eAwpnG8PM+1m1aaL299H0EEnmxVWwlHcJWN8H4iRMAF+3tiDYbYvwJhVow==
Date: Wed, 6 Nov 2024 10:00:04 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <20241106100004.50ff4bb2@fedora.home>
In-Reply-To: <20241105182050.2839f1e7@kernel.org>
References: <20241104170251.2202270-1-maxime.chevallier@bootlin.com>
 <20241105182050.2839f1e7@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: maxime.chevallier@bootlin.com
Cc: linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/9] Support external
	snapshots on dwmac1000
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

On Tue, 5 Nov 2024 18:20:50 -0800
Jakub Kicinski <kuba@kernel.org> wrote:

> On Mon,  4 Nov 2024 18:02:40 +0100 Maxime Chevallier wrote:
> >   net: stmmac: Only update the auto-discovered PTP clock features  
> 
> Minor conflict in the context on this one, please respin.

Sure thing, I'll respin right away.

Thanks,

Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
