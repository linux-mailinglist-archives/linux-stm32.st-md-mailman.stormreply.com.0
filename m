Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A56D22AC59C
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Nov 2020 20:57:18 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5FE2EC3FAE3;
	Mon,  9 Nov 2020 19:57:18 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E065C36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Nov 2020 19:57:16 +0000 (UTC)
Received: from kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net
 (c-67-180-217-166.hsd1.ca.comcast.net [67.180.217.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5E9E2206D8;
 Mon,  9 Nov 2020 19:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604951834;
 bh=hqgvKvqsLrWlJnRXYEC8bkCbRe/XLhQPjqC2IZq8Jh0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WRjM9/gTqlHnSklr6hkuYho/PC3pcAdQIdHg0iehe5/SprIyh7ThQeDKTnjOnF5r0
 m3TXyp2ma4vLaERpehnDYDrLk8BfzZaFm1gl4632itLKU9i139xujTwKa0JY9QoZpR
 4YpW+v8NFSNV0iXiXPZKQsdYbw5Y7cs5K0UDa9EA=
Date: Mon, 9 Nov 2020 11:57:13 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Message-ID: <20201109115713.026aeb68@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
In-Reply-To: <20201109160855.24e911b6@xhacker.debian>
References: <20201109160855.24e911b6@xhacker.debian>
MIME-Version: 1.0
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jose Abreu <joabreu@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, "David S.
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: platform: use
 optional clk/reset get APIs
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

On Mon, 9 Nov 2020 16:09:10 +0800 Jisheng Zhang wrote:
> @@ -596,14 +595,10 @@ stmmac_probe_config_dt(struct platform_device *pdev, const char **mac)
>  		dev_dbg(&pdev->dev, "PTP rate %d\n", plat->clk_ptp_rate);
>  	}
>  
> -	plat->stmmac_rst = devm_reset_control_get(&pdev->dev,
> -						  STMMAC_RESOURCE_NAME);
> +	plat->stmmac_rst = devm_reset_control_get_optional(&pdev->dev, STMMAC_RESOURCE_NAME);

This code was wrapped at 80 chars, please keep it wrapped.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
