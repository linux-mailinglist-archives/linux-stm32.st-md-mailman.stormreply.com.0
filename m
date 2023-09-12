Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D074279D416
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Sep 2023 16:52:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8935EC6B46F;
	Tue, 12 Sep 2023 14:52:41 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5BEF9C6B461
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Sep 2023 14:52:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id D0AFACE1934;
 Tue, 12 Sep 2023 14:52:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93AF7C433CD;
 Tue, 12 Sep 2023 14:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694530356;
 bh=Ayl+OQo2GhxKzgk/+pTD2IDT8nzvjC7bYrHEQNjKOhs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tbX5NZaZDg4omgGReZeg3XcT52zv8O95SQf5BlDQ6yAxYUCyCznrpQ8kEgx+Mh4dZ
 4VyxXJD9UCo5/BbZfC1mfbdxdeuq+sCGl6v+7r9c/6+2eOKpnpxsRwHtwwzhQLPTeH
 7pQhxIN1IJJ9IRyS4FzWQfCOlMswRunfMQ1jdJNVofX+gnjHeQm0lZXYGS+tvetqNB
 OHXficeHt+wN9/CKI/UP1ZtH7DFPH4/VCOlndcwvJx4p5vQK7ieaJ/h+EmY/HqTFHj
 /Q//KGi+Zh1WtjpbAncBMicQTuYW4Js/UXPTx1844+Yu96/qBFQV+PwctmZwFdaTHt
 5vh4QNf4rjf9A==
Date: Tue, 12 Sep 2023 16:52:27 +0200
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20230912145227.GE401982@kernel.org>
References: <ZP8yEFWn0Ml3ALWq@shell.armlinux.org.uk>
 <E1qfiqd-007TPL-7K@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1qfiqd-007TPL-7K@rmk-PC.armlinux.org.uk>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, Jose Abreu <joabreu@synopsys.com>,
 Samin Guo <samin.guo@starfivetech.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Alexei Starovoitov <ast@kernel.org>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, bpf@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next 1/6] net: stmmac: add platform
	library
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

On Mon, Sep 11, 2023 at 04:29:11PM +0100, Russell King (Oracle) wrote:
> Add a platform library of helper functions for common traits in the
> platform drivers. Currently, this is setting the tx clock.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Hi Russell,

some minor issues raised by checkpatch follow.

> ---
>  drivers/net/ethernet/stmicro/stmmac/Makefile  |  2 +-
>  .../ethernet/stmicro/stmmac/stmmac_plat_lib.c | 29 +++++++++++++++++++
>  .../ethernet/stmicro/stmmac/stmmac_plat_lib.h |  8 +++++
>  3 files changed, 38 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_plat_lib.c
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_plat_lib.h
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
> index 5b57aee19267..ba2cbfa0c9d1 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
> +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
> @@ -6,7 +6,7 @@ stmmac-objs:= stmmac_main.o stmmac_ethtool.o stmmac_mdio.o ring_mode.o	\
>  	      mmc_core.o stmmac_hwtstamp.o stmmac_ptp.o dwmac4_descs.o	\
>  	      dwmac4_dma.o dwmac4_lib.o dwmac4_core.o dwmac5.o hwif.o \
>  	      stmmac_tc.o dwxgmac2_core.o dwxgmac2_dma.o dwxgmac2_descs.o \
> -	      stmmac_xdp.o \
> +	      stmmac_xdp.o stmmac_plat_lib.o \
>  	      $(stmmac-y)
>  
>  stmmac-$(CONFIG_STMMAC_SELFTESTS) += stmmac_selftests.o
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_plat_lib.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_plat_lib.c
> new file mode 100644
> index 000000000000..abb9f512bb0e
> --- /dev/null
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_plat_lib.c
> @@ -0,0 +1,29 @@

Is an SPDX identifier appropriate here?

> +#include <linux/stmmac.h>
> +#include <linux/clk.h>
> +
> +#include "stmmac_plat_lib.h"
> +
> +int dwmac_set_tx_clk_gmii(struct clk *tx_clk, int speed)
> +{
> +	unsigned long rate;
> +
> +	switch (speed) {
> +	case SPEED_1000:
> +		rate = 125000000;
> +		break;
> +
> +	case SPEED_100:
> +		rate = 25000000;
> +		break;
> +
> +	case SPEED_10:
> +		rate = 2500000;
> +		break;
> +
> +	default:
> +		return -ENOTSUPP;

Checkpatch seems to think that EOPNOTSUPP would be more appropriate
as "ENOTSUPP is not a SUSV4 error code".

> +	}
> +
> +	return clk_set_rate(tx_clk, rate);
> +}
> +EXPORT_SYMBOL_GPL(dwmac_set_tx_clk_gmii);

...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
