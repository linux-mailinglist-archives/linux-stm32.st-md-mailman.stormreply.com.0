Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFBF89E7D6
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Apr 2024 03:34:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0EA7BC6C841;
	Wed, 10 Apr 2024 01:34:11 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 542C1CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Apr 2024 01:34:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BF44761A85;
 Wed, 10 Apr 2024 01:34:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03DCFC433F1;
 Wed, 10 Apr 2024 01:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712712847;
 bh=DqEyzDB6gA9tY2cLBHY0HaJ2TcbP4Rj1/3pQs/AVjDY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cGaVed5+yN7xmkmbHJVfElRpnFUDSFbABfqVWya2USmjMjKEmBJh5A+s0Sm5J5PVE
 7uuAeJ6v9qqvRo5Ac43XM2HQqpk7FaeJFsC3W4scazZHmI2OEfZBWeNoem+I5nWSNF
 9Pobqaw9ShSFnL2Bb7GbaXUjvJ9xbqJtjlls3NdHfj0PaqmoYu9ovNHemu8W4q8ICw
 zKymKoS8f5WjJphpOZFTZmqDgugBL9r4ggGRd17rn787M6se9cNEd3PW/NBzksRI5p
 IOWp3Sh3SvTViEXjsqiKPFiKe9XJBvC7CPm1anTc7uiC9Xva5F/ZPkT4wW+DSQuUiT
 k853Gh/qEOTAA==
Date: Tue, 9 Apr 2024 18:34:04 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Romain Gantois <romain.gantois@bootlin.com>
Message-ID: <20240409183404.7d3eb04f@kernel.org>
In-Reply-To: <20240409-rzn1-gmac1-v2-3-79ca45f2fc79@bootlin.com>
References: <20240409-rzn1-gmac1-v2-0-79ca45f2fc79@bootlin.com>
 <20240409-rzn1-gmac1-v2-3-79ca45f2fc79@bootlin.com>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Eric Dumazet <edumazet@google.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Jose Abreu <joabreu@synopsys.com>, Paolo Abeni <pabeni@redhat.com>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v2 3/5] net: stmmac:
 dwmac-socfpga: use pcs_init/pcs_exit
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

On Tue, 09 Apr 2024 11:21:46 +0200 Romain Gantois wrote:
> +	struct regmap_config pcs_regmap_cfg = {
> +		.reg_bits = 16,
> +		.val_bits = 16,
> +		.reg_shift = regmap_upshift(1),

This appears to displease the compiler:

drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c:389:16: error: call to undeclared function 'regmap_upshift'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  389 |                 .reg_shift = regmap_upshift(1),
      |                              ^
-- 
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
