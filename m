Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F4182B0E3
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jan 2024 15:45:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 976FDC6DD74;
	Thu, 11 Jan 2024 14:45:39 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2F47C6DD73
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jan 2024 14:45:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1C7ACFF802;
 Thu, 11 Jan 2024 14:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1704984337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vkrVHLxEwhTSNjxCZbhrusosakXdhKYEMgVhXIlbl0c=;
 b=RbrjROd/PFakx6mn3Jxbv84GBMC2jbmUIGPxirbv7E30zRpTYwhAHH9J5yozCBRRHmlES7
 jtC1yLPThNPoRo1FNdvLSZqHn6Pt2hyRdA3DQUp4eKUNdIJmPaCoLKZG2npkH6t1W55Edt
 kv3T8S57sKg8xC7Gons4wrPZtb3R0xCPs9us32C1vBDyQLGTEuq/Z0SzdkNgYPwEBil9qo
 5i9yecZ9rCWHY/3o3hwnkhAYkFGczdNkINhy3uK7inerwtjzQIqh5iQpIznTreYvjEb6mz
 4FCpkKwt7hEfzA5vuKzFf2QZ/9n7LJUX1PWWaU6tc00vvHR0iEQkiEhkaRIiZQ==
Date: Thu, 11 Jan 2024 15:45:58 +0100 (CET)
From: Romain Gantois <romain.gantois@bootlin.com>
To: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <99289be4aa940932acbf728ba6a926c67eb5484a.camel@redhat.com>
Message-ID: <5dff8608-f1b2-1edb-00a5-9b0d56afd7f8@bootlin.com>
References: <20240109-prevent_dsa_tags-v4-1-f888771fa2f6@bootlin.com>
 <99289be4aa940932acbf728ba6a926c67eb5484a.camel@redhat.com>
MIME-Version: 1.0
X-GND-Sasl: romain.gantois@bootlin.com
Cc: Andrew Lunn <andrew@lunn.ch>,
 Richard Tresidder <rtresidd@electromag.com.au>,
 Pascal EBERHARD <pascal.eberhard@se.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Sylvain Girard <sylvain.girard@se.com>,
 linux-stm32@st-md-mailman.stormreply.com, stable@vger.kernel.org,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4] net: stmmac: Prevent DSA tags from
	breaking COE
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

Hi Paolo,

On Thu, 11 Jan 2024, Paolo Abeni wrote:
> 
> Unfortunately, you dropped the target tree tag ('net') from the
> subject, and did not allow our CI to trigger properly.
> 
> Since we can't merge this patch ATM ('net' is currently frozen since we
> merge back the net-next PR), I think it's better if you resubmit with a
> proper tag. You can retain all Vladimir Rb tag.

Alright I'll do that right away, sorry for the hassle.

Best Regards,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
