Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D3295FCAE
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Aug 2024 00:22:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 399F6C7801C;
	Mon, 26 Aug 2024 22:22:40 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 153C8C6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Aug 2024 22:22:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 975D0A40FFE;
 Mon, 26 Aug 2024 22:22:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98BDFC4FE9A;
 Mon, 26 Aug 2024 22:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724710549;
 bh=q3Z545Cwl9qk9MzIvKMZNtiuz9zz81MQ4m4M1Lw9iIo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=o80/auCJi8Sgfvg7jUVZhSQD/MidgR2jR43iyA8eZXmMMc0lszYZKttU4XxU82O/k
 GHbW8Pp/ifKNOFIsPn1bG0ez1d6rkaGSKatr/3aC4E5myrmsGzUMH5IIDR/kHwnDyG
 ui1RHw7PkZetL+oiRPnEvHZrFtyOsYfc2iisKtP6K5VP0UX/iewQO458963lbryBpt
 Bih5/+CHj9iyeYiyQak4K/XFKXkq1pat2dWjMgvTz+TKS/ozeHjL2qGCBv0B/iWltl
 uQv1Rtq4b/sV9F8Hs6522FtIybmpjRsKh48BXFEdEQ38c6rc8oGoix/O7IOZxgD/sH
 Pu+4sxbyLThoA==
Date: Mon, 26 Aug 2024 15:15:47 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <20240826151547.1f0e2f29@kernel.org>
In-Reply-To: <20240823072122.2053401-4-frank.li@vivo.com>
References: <20240823072122.2053401-1-frank.li@vivo.com>
 <20240823072122.2053401-4-frank.li@vivo.com>
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
Subject: Re: [Linux-stm32] [net-next v2 3/9] net: ethernet: cortina: Convert
 to devm_clk_get_enabled()
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

On Fri, 23 Aug 2024 01:21:15 -0600 Yangtao Li wrote:
> @@ -2403,6 +2401,7 @@ static int gemini_ethernet_port_probe(struct platform_device *pdev)
>  	struct device *parent;

move the local clock variables here, keep lines longest to shortest

>  	u8 mac[ETH_ALEN];
>  	unsigned int id;
> +	struct clk *pclk;
>  	int irq;
>  	int ret;
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
