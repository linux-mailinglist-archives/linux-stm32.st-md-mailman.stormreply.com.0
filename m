Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3366ECFCA33
	for <lists+linux-stm32@lfdr.de>; Wed, 07 Jan 2026 09:39:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4F25C8F281;
	Wed,  7 Jan 2026 08:39:02 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4C908C8F27A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jan 2026 08:39:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 8A4A4C1EC95;
 Wed,  7 Jan 2026 08:38:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 912BD606F8;
 Wed,  7 Jan 2026 08:39:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id ED8FA103C86DC; Wed,  7 Jan 2026 09:38:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1767775140; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=QYeONbMPZsohq9VBaUL+fOZtixRXDsqHxHYEMCv0KqU=;
 b=U7RPDc9lUGFV9EfgCe5xJCH8kkFydm4o1dDmMUTz43CE7s8pO7CHQE+V7r767Zl7uFlXz+
 KXD2ZNLnCwFvJmzT+jW2MwHFSRJtrahjDtN0lA95Sg+NTbL4HlEkF9dtRm2Im0Z+a8WhbA
 zbmaJygHIMjwWrCxES+2G8gNwDKprMMZ00mzfrSBryxc8kb3VVEGPUDg1qwvgNnTL+lBAy
 Jp0t7HHqP4LLtUGFYpA2RghAhSw8u4uYUXwBTGRZavw8ejwRI0MUTWu8pCsiwossi5ppUf
 HEXW8J5vZhaTsExGvaoCuqppPPP+j7vqFa7nb2bAACYM9WwBTge5SFh6Lx6wPQ==
Message-ID: <e439e649-ca9a-4245-80bf-9f1749c5af3e@bootlin.com>
Date: Wed, 7 Jan 2026 09:38:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <aV1w9yxPwL990yZJ@shell.armlinux.org.uk>
 <E1vdDi5-00000002E1P-24pm@rmk-PC.armlinux.org.uk>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <E1vdDi5-00000002E1P-24pm@rmk-PC.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 2/9] net: stmmac: dwmac4: fix RX
 FIFO fill statistics
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



On 06/01/2026 21:31, Russell King (Oracle) wrote:
> In dwmac4_debug(), the wrong shift is used with the RXFSTS mask:
> 
>  #define MTL_DEBUG_RXFSTS_MASK          GENMASK(5, 4)
>  #define MTL_DEBUG_RXFSTS_SHIFT         4
>  #define MTL_DEBUG_RRCSTS_SHIFT         1
> 
>                        u32 rxfsts = (value & MTL_DEBUG_RXFSTS_MASK)
>                                     >> MTL_DEBUG_RRCSTS_SHIFT;
> 
> where rxfsts is tested against small integers 1 .. 3. This results in
> the tests always failing, causing the "mtl_rx_fifo__fill_level_empty"
> statistic counter to always be incremented no matter what the fill
> level actually is.
> 
> Fix this by using FIELD_GET() and remove the unnecessary
> MTL_DEBUG_RXFSTS_SHIFT definition as FIELD_GET() will shift according
> to the least siginificant set bit in the supplied field mask.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
