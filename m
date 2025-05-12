Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 85444AB3EDD
	for <lists+linux-stm32@lfdr.de>; Mon, 12 May 2025 19:22:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2FFA0C7A82D;
	Mon, 12 May 2025 17:22:05 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E3C2C7A82A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 May 2025 17:22:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 93110445CC;
 Mon, 12 May 2025 17:22:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01D2DC4CEE7;
 Mon, 12 May 2025 17:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747070522;
 bh=soJO4A4AjQPFXEEm8Vly+9M2b9nOAfW43rupkSUMSm8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=H800bMg9hqnv8v4VunViEWyxpF50Txz38vqJV4wqjgqkT2GMc+bvhjjfbDC3MQy6m
 Km+rrH7e3IAP1TXIkFgg2lhUj8Km6xdpcPjsJJpr8Tb8LQ6RGLKXThqMgr5KG5gBRH
 nJNNeqd3U9ltFLsSyXfiTUt3vQPR6oDCiVpCORJog11+UHcE8hLnl9UFGvGwkhDSRq
 F+4HQfrDryePQ7z4LGqJejC5OPcKaJNLayof8ygKBMpPIeOotQt04MepQQRGJVtcsj
 QoI8bVW24RVdRcmz4R9eCXWwMPffw6ZnG9mxSHshIZBfwVkMNg4jBnBudov/2XHGku
 a1oJc3O8R/vnw==
Date: Mon, 12 May 2025 10:22:01 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Message-ID: <20250512102201.01a695c4@kernel.org>
In-Reply-To: <20250512143607.595490-1-vladimir.oltean@nxp.com>
References: <20250512143607.595490-1-vladimir.oltean@nxp.com>
MIME-Version: 1.0
Cc: Furong Xu <0x1207@gmail.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Simon Horman <horms@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: convert to
 ndo_hwtstamp_get() and ndo_hwtstamp_set()
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

On Mon, 12 May 2025 17:36:07 +0300 Vladimir Oltean wrote:
> -		netdev_alert(priv->dev, "No support for HW time stamping\n");
> +		NL_SET_ERR_MSG_MOD(extack, "No support for HW time stamping\n");

coccinelle says:

drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:594:29-64: WARNING avoid newline at end of message in NL_SET_ERR_MSG_MOD

Feel free to repost without the 24h wait.
-- 
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
