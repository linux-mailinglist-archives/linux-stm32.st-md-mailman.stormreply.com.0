Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB93ED3AA3A
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Jan 2026 14:23:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2DFCC36B3C;
	Mon, 19 Jan 2026 13:23:28 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88EFAC36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jan 2026 13:23:27 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 046A4C214CA;
 Mon, 19 Jan 2026 13:23:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0CEAD60731;
 Mon, 19 Jan 2026 13:23:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8E70110B6AFE5; Mon, 19 Jan 2026 14:23:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1768829005; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=KxedpuQaJ1XVwtqrotV402P4SEf92fFjf3lBHShSz7o=;
 b=ESSnzD+eNodO3pGQ2VSksmhDzLtD7Haf02tWs6UM3s/aJs+45FX3aI+D3WUocDRTjKq7Md
 8QGsn5A52b5/RW7IDBhL914t4h1n2Z/srz32S8oyBhriGrlU+VjUZSirqC0AJmnvg92bRl
 BzuT/6IaT9Hz2v9w4Sen77kLVMmJnVn+scvXb/5Hum5EiJCM8o07ElwOV8p2eGGfIpi0+9
 +lbbbKgtI4C53cf/Irpq2USu1GgbzJPfcqrvdKgsX+w7uNE5nPEoJMKC06UcyQNhELg26X
 XeqYLxf8d1c8+pvLsbp6FFEorRAqk8M1gd4aocJcRV7DCpLu53w+fHmBpJ+Fxg==
Message-ID: <2c5a7b0c-b58f-4b6a-9669-fde434f995e6@bootlin.com>
Date: Mon, 19 Jan 2026 14:23:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <aW4kakF3Ly7VaxN6@shell.armlinux.org.uk>
 <E1vhoSm-00000005H2F-1mve@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vhoSm-00000005H2F-1mve@rmk-PC.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-phy@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 11/14] net: stmmac: add struct
	stmmac_pcs_info
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



On 19/01/2026 13:34, Russell King (Oracle) wrote:
> We need to describe one more register (offset and field bitmask) to
> the PCS code. Move the existing PCS offset and interrupt enable bits
> to a new struct and pass that in to stmmac_integrated_pcs_init().
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
