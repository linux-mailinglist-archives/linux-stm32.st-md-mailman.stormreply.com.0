Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B81D25088
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jan 2026 15:48:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 179B1C8F28A;
	Thu, 15 Jan 2026 14:48:11 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A52F8C8F285
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jan 2026 14:48:09 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 9E9FA4E420F6;
 Thu, 15 Jan 2026 14:48:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6D548606B6;
 Thu, 15 Jan 2026 14:48:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9C2FD10B6863F; Thu, 15 Jan 2026 15:47:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1768488487; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=Tnh3H0qYNwGp6qVVwkc9HsChCokbifV7Nfx7Yhfo5TQ=;
 b=Np8K8KxeLsilDkOmYJmbd3SN54jVQF9kNgt6Bk96yKC4Gf1NvNy5w/X6XQMGeck9u1WnvU
 W2suCBiU3uiLMeTbsC3XAtdTCDLx+jGMMsSWjunuD2aWwuBY7HYdDRPmUfNqAnge+wZ0Zh
 SD5z1V0je8wYUujIqZKId3/WgJOGsC1ABAOOBlAWJnhl5FpsdpAtH4cgnHDXbFH8Z3UtzV
 DSkjgu6cpQfnIYsB5W/sNv5Ya50EM/01uR6YuxtV1YtU3KtowjOZRZe/xSy8eJWFfRdk1v
 SlfT+FoYuDRD9+S4A6CwaKc6fO7GvRqFtjCa8FMHrKpexYCw9KB4//5MolcYvQ==
Message-ID: <6a4dd81e-fe37-4e41-82af-18a9ac812137@bootlin.com>
Date: Thu, 15 Jan 2026 15:47:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <aWfWDsCoBc3YRKKo@shell.armlinux.org.uk>
 <E1vg4vx-00000003SFz-1ldy@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vg4vx-00000003SFz-1ldy@rmk-PC.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-phy@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 04/14] net: stmmac: wrap
 phylink's rx_clk_stop functions
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

Hi Russell,

On 14/01/2026 18:45, Russell King (Oracle) wrote:
> With generic SerDes support, stmmac will need to do more work to ensure
> that clk_rx_i is running in all configurations. Rather than turn each
> site that calls phylink_rx_clk_stop_xxx() into a list of functions,
> move these to their own pair of functions so that they can be
> augmented at a single location.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
