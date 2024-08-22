Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEAC95B459
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Aug 2024 13:56:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ABF83C6DD9D;
	Thu, 22 Aug 2024 11:56:33 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33E2FC6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Aug 2024 11:56:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 42C44240009;
 Thu, 22 Aug 2024 11:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1724327786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/gOwxgtxFAxYkk7+l7KBiOk6VqViegG+X4kGMpiBsEo=;
 b=Gkf/OszTAyzJ4UL7JWAhorzjFpHa9YZk/knbSvzZMWiYR/gsX3vGUS0W/UcuXE88EWTD/q
 N5vdK2U48d1gIQpUChHYHilR7KkVvjUDeDSWRBXrZTSY/WMBLeyjD7chhw5p9bVQqard0L
 qvN9lT1lp+lZAP1zFfkjeU64eV4z3BRSfJqc9IIGIDTq+TbefvY10+K3tNeLuPOL8wZKIz
 tDxM359xOKHifHiW+6fbC21dGftgAdV4hTriKsWgNs6dcrWVbiC13Rp4Qhq2vrE8lUbs2q
 Fjb9IeoGAUNpkmP+8eEzrjhX2Nx5ssjhQHcpQ4/vz5+GzMv2ZhjIrHEX+K8sKg==
Date: Thu, 22 Aug 2024 13:56:24 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <20240822135624.4ca9a98d@fedora-3.home>
In-Reply-To: <20240822084733.1599295-3-frank.li@vivo.com>
References: <20240822084733.1599295-1-frank.li@vivo.com>
 <20240822084733.1599295-3-frank.li@vivo.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: maxime.chevallier@bootlin.com
Cc: andrew@lunn.ch, marcin.s.wojtas@gmail.com, kees@kernel.org,
 linus.walleij@linaro.org, edumazet@google.com,
 linux-stm32@st-md-mailman.stormreply.com, f.fainelli@gmail.com,
 linux@armlinux.org.uk, hkallweit1@gmail.com, joabreu@synopsys.com,
 u.kleine-koenig@pengutronix.de, jacob.e.keller@intel.com, kuba@kernel.org,
 pabeni@redhat.com, clement.leger@bootlin.com, mcoquelin.stm32@gmail.com,
 ulli.kroll@googlemail.com, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, horms@kernel.org, justinstitt@google.com,
 olteanv@gmail.com, davem@davemloft.net, shannon.nelson@amd.com
Subject: Re: [Linux-stm32] [net-next 2/9] net: stmmac: platform: Convert to
 devm_clk_get_enabled() and devm_clk_get_optional_enabled()
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

Hi,

On Thu, 22 Aug 2024 02:47:26 -0600
Yangtao Li <frank.li@vivo.com> wrote:

> Use devm_clk_get_enabled() and devm_clk_get_optional_enabled()
> to simplify code.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Thanks,

Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
