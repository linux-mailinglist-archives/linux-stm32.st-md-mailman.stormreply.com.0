Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC7E8BEF9B
	for <lists+linux-stm32@lfdr.de>; Wed,  8 May 2024 00:02:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D67A3C5E2D2;
	Tue,  7 May 2024 22:02:58 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37AF1C5E2D1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 May 2024 22:02:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1CB99619A5;
 Tue,  7 May 2024 22:02:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3235C2BBFC;
 Tue,  7 May 2024 22:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715119369;
 bh=ECDBXpA/C+eVvh+6xfhTbhth3yLG8cu9XKxgvKvqxOo=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=gAgk5W1e0tOEO9WlYzPLOCZ+9mCwBDvfyQTxMT4LvrHCji5I0WgltgrclRalG72pj
 WMuOyg0CXOXsp067YM5S7JkutAgSs0kD5O+0zBa6RNx/+/VMwNGExSAJgHSDpM4Gwj
 PHQcfg+MJpIDPACHsBAFqUYI0HGwYAefjvlNLRiMSCkziG7qCo7OPEZFdY4TOGyhAq
 JY9it3DU1wkY2LPQ6lujypdORiS/snyOk7+BvnYuSYbxptlSdUj/JJ6eZ+kgazNaVq
 todH6nHNaskpq3Em4qBytUT3yIm4I6rfL5/ZjY8cnr0N6hZVvtbIrnM9L0oKWsVT50
 dqson14uMhgZg==
Message-ID: <332c845c17e24e2eb660e18680f2626f.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240419152723.570159-3-gabriel.fernandez@foss.st.com>
References: <20240419152723.570159-1-gabriel.fernandez@foss.st.com>
 <20240419152723.570159-3-gabriel.fernandez@foss.st.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 07 May 2024 15:02:47 -0700
User-Agent: alot/0.10
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 2/4] clk: stm32mp2: use of STM32 access
	controller
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

Quoting gabriel.fernandez@foss.st.com (2024-04-19 08:27:21)
> diff --git a/drivers/clk/stm32/clk-stm32mp25.c b/drivers/clk/stm32/clk-stm32mp25.c
> index 210b75b39e50..a37ee9f707e3 100644
> --- a/drivers/clk/stm32/clk-stm32mp25.c
> +++ b/drivers/clk/stm32/clk-stm32mp25.c
> @@ -4,7 +4,9 @@
>   * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
>   */
>  
> +#include <linux/bus/stm32_firewall_device.h>

I don't have this include. I either need a signed tag or this needs to
wait until next merge window.

>  #include <linux/clk-provider.h>
> +#include <linux/of_address.h>

What is this include for?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
