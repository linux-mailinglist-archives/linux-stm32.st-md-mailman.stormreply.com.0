Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E877BE1D9A
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Oct 2025 09:04:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE19EC57194;
	Thu, 16 Oct 2025 07:04:03 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D255FC57192
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Oct 2025 07:04:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 691421A140D;
 Thu, 16 Oct 2025 07:04:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3C1636062C;
 Thu, 16 Oct 2025 07:04:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C887D102F229A; 
 Thu, 16 Oct 2025 09:03:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1760598241; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=EgwW0ArP1Xeb+OuDBxc0n1MTgi0tuz5Lo5UBvgrMi2Y=;
 b=Wx1st7lIJl/IIfm3alE87+k9DoScC+ITTNsxAUKKuQEgaGTYImMhig9VUTBDPghOMKpvYe
 r14AH2/hwAYAfIgT6y7u39Tnb2KBoCiRcVeoJz2o8eodfpoaFh+z0OstVwi9/2u9I0hY8j
 YBHsgvoZSFWSm8tFkwhM0vSTeD5PV/wbJDAxm6ocwFxtaindVc/+uAhoWgPERk2GtQB6SZ
 a46/SApA0VKOKY5zzA+a3Gnn/dYeYnbqzLm+55v1jX44GjCSy+oKD9E2IBx6PcMLPcFFqX
 9MGSXk6vmZpLpng9AmEtzsaqShRsJmQnEuS2DycgI9moygjf6RCYVHlCjo/xjQ==
Message-ID: <d47e6753-ed00-4380-b11a-75088e885a48@bootlin.com>
Date: Thu, 16 Oct 2025 09:03:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <aO_HIwT_YvxkDS8D@shell.armlinux.org.uk>
 <E1v945J-0000000AmeJ-1GOb@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1v945J-0000000AmeJ-1GOb@rmk-PC.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/5] net: stmmac: dwc-qos-eth:
 move MDIO bus locking into stmmac_mdio
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

> Rather than dwc-qos-eth manipulating the MDIO bus lock directly, add
> helpers to the stmmac MDIO layer and use them in dwc-qos-eth. This
> improves my commit 87f43e6f06a2 ("net: stmmac: dwc-qos: calibrate tegra
> with mdio bus idle").
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
