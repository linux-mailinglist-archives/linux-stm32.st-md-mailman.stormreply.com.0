Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F02D3AEA6
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Jan 2026 16:15:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9D30C36B3C;
	Mon, 19 Jan 2026 15:15:30 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 29A5FC36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jan 2026 15:15:29 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 7AC61C214C1;
 Mon, 19 Jan 2026 15:15:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7ACB760731;
 Mon, 19 Jan 2026 15:15:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 89BF110B6B111; Mon, 19 Jan 2026 16:15:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1768835727; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=EF+qQZyPT/qsuzg53k1VSKJV+VsSYDYEvH4LG0YqI48=;
 b=F7y+vxrZtCX69fbEjwMcHPuD0RLxU6ivMa1qTosvLSpgg9mwFqhZgm9WHwXgjLVku1yHUX
 DYFzW2p2jUZWa3ISEVED51wynIRvI6sWLl5QmCT+RA1iJ3bUF4DcsTUlvmv8ASP9iYCDEn
 tXkAwfnbZKWQ/2R29T3nKnbh3Lpl4BToUzWWpcHs99vqT7Dnf3Mh5nkdziZe7aXEku/B87
 QiJMf0zc0yA2+tobwRQOELPlavSoiTTPMusy6qqbnFTzDq5ctis1vh3+H8jDvEywrNfHhg
 oyqI52a0kn2wXpExfC9q8czWQvXrYXcud/SXOFdjyXXmvr6IZFXkEXfwUWVrFA==
Message-ID: <821723dc-387c-4d57-aa73-1e5556fed0bc@bootlin.com>
Date: Mon, 19 Jan 2026 16:15:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <E1vgtBc-00000005D6v-040n@rmk-PC.armlinux.org.uk>
 <33b06fd6-3eb3-4eb7-8091-7ebe8a8373ba@bootlin.com>
Content-Language: en-US
In-Reply-To: <33b06fd6-3eb3-4eb7-8091-7ebe8a8373ba@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC net-next] net: stmmac: enable RPS and
	RBU interrupts
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


>> I'm not sure why we publish these statistic counters if we don't
>> enable the interrupts to allow them to ever be non-zero.

 [...]

> I personnaly find the stat useful,

Just to elaborate a bit more, I'd say I find it even harmful to have the
stat stay stuck at 0, which would be misleading when debugging while
relying on these counter values, especially if other stmmac flavours
make proper use of it.

Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
