Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 896D383D1FE
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Jan 2024 02:22:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1AAACC6B444;
	Fri, 26 Jan 2024 01:22:58 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CDDD5C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jan 2024 01:22:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7CFFC622C5;
 Fri, 26 Jan 2024 01:22:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3997C433C7;
 Fri, 26 Jan 2024 01:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706232175;
 bh=Hk9/gpwL/FH2xmnit/2UJvfVqasuwOB//G3xIDeSRXY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QbX2GfKhc5hZC6h46CHXmhCNSbMB8gJ/J4nLe6qNyA1qja9Bx/1+7GMkkTu7Vrkqo
 2B1vx1tOGSpm3V8/KYFG+mBy621FwOkM5v5A6zENUMsqvkzEJLgMfZ/HNq664U8tkP
 Nr4prtIK2SqWcBWyaxLsUhZlvjwcVKkki/Q4vBkuCUsOgMMy4HqX5xPpxEECJly+aA
 D3N2ZmkRivt4zCmOGAHEVuKM27BJGqiVonKPbSuqcpcf3eztESC17H/FzAlpdGT4wL
 8qEN1M9Os2zV8uf7+5rAddkolgppNsYnFmpbp2TJIesGiMlXOl4MCg/9td0zCyC+UL
 ZL8+JdfmnpD4g==
Date: Thu, 25 Jan 2024 17:22:53 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Esben Haabendal <esben@geanix.com>
Message-ID: <20240125172253.3fe50cfc@kernel.org>
In-Reply-To: <5606bb5f0b7566a20bb136b268dae89d22a48898.1706184304.git.esben@geanix.com>
References: <cover.1706184304.git.esben@geanix.com>
 <5606bb5f0b7566a20bb136b268dae89d22a48898.1706184304.git.esben@geanix.com>
MIME-Version: 1.0
Cc: Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, netdev@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/2] net: stmmac: dwmac-imx: set TSO/TBS
 TX queues default settings
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

On Thu, 25 Jan 2024 13:34:34 +0100 Esben Haabendal wrote:
> +        for (int i = 0; i < plat_dat->tx_queues_to_use; i++) {
> +                /* Default TX Q0 to use TSO and rest TXQ for TBS */
> +                if (i > 0)
> +                        plat_dat->tx_queues_cfg[i].tbs_en = 1;
> +        }

checkpatch points out this code is indented with spaces.
Please use tabs.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
