Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 772A095FCAD
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Aug 2024 00:22:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E4F4C7801A;
	Mon, 26 Aug 2024 22:22:40 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16E02C7801A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Aug 2024 22:22:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 92F13A40DDF;
 Mon, 26 Aug 2024 22:22:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FE93C4FE00;
 Mon, 26 Aug 2024 22:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724710521;
 bh=n8gcZiAC0tOhqnbHGpl+P3dIj4Y7x2ew9/hSqEmdqYE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=f+rDslGmjbisVo9bTthG3D9FKhutZ8wRqbAo44ZxhIDHlbkIRfiNO+bHLyS8a2Jyx
 x96RnINdxQbltUMQdqBcJ8p1uXXRJpU9z9ONfCM8ELuiipd+Lnt5etFKM60/YJ1vcU
 ZxkRTzQ8PL6OgNlLYd5NY9Jgwf+jtzNGuw+5aUV22ULI/mQcwXnhjJrfj3LZPoJjCp
 Z44pZanGSjnzwNZ4yh5579PzsS0qw5SI9ETAR7lB4FxwT9rxunRB0vOlvU7gdsBugr
 QRTZZhpgw63eqigMMBJEulSLYVJ0l1Pzc8EeMpyB1wg5uYB3y6AmVrsDfCKmSKQ5Aq
 RS3fw3ejwkuJg==
Date: Mon, 26 Aug 2024 15:15:18 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <20240826151518.6ccaec1f@kernel.org>
In-Reply-To: <20240823072122.2053401-7-frank.li@vivo.com>
References: <20240823072122.2053401-1-frank.li@vivo.com>
 <20240823072122.2053401-7-frank.li@vivo.com>
MIME-Version: 1.0
Cc: andrew@lunn.ch, marcin.s.wojtas@gmail.com, kees@kernel.org,
 linus.walleij@linaro.org, edumazet@google.com,
 linux-stm32@st-md-mailman.stormreply.com, f.fainelli@gmail.com,
 sd@queasysnail.net, linux@armlinux.org.uk, joabreu@synopsys.com,
 u.kleine-koenig@pengutronix.de, pabeni@redhat.com, clement.leger@bootlin.com,
 mcoquelin.stm32@gmail.com, ulli.kroll@googlemail.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 horms@kernel.org, justinstitt@google.com, olteanv@gmail.com,
 davem@davemloft.net, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [net-next v2 6/9] net: ethernet: broadcom:
 bcm63xx_enet: Convert to devm_clk_get_enabled()
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

On Fri, 23 Aug 2024 01:21:18 -0600 Yangtao Li wrote:
> diff --git a/drivers/net/ethernet/broadcom/bcm63xx_enet.c b/drivers/net/ethernet/broadcom/bcm63xx_enet.c
> index 3c0e3b9828be..6e288cee2c35 100644
> --- a/drivers/net/ethernet/broadcom/bcm63xx_enet.c
> +++ b/drivers/net/ethernet/broadcom/bcm63xx_enet.c
> @@ -1718,6 +1718,7 @@ static int bcm_enet_probe(struct platform_device *pdev)
>  	struct bcm63xx_enet_platform_data *pd;

move the local clock variables here, keep lines longest to shortest

>  	int irq, irq_rx, irq_tx;
>  	struct mii_bus *bus;
> +	struct clk *phy_clk, *mac_clk;
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
