Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D7E44D736
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Nov 2021 14:28:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD427C5EC73;
	Thu, 11 Nov 2021 13:28:46 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69B2EC5660B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Nov 2021 13:28:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 557401F45C17
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1636637325; bh=hKlJPVIsd3zl1fRS+HP0UR+QSYciJS0/XcKJEC6ReGU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=bt6bqF1fNP4inuT+/4OcgZZjROtLEbuwpi5Sb473NqCNEZ7q9PJoNl7vjPkEORvdZ
 pA6vwT0iSzB6cR+3DdoqueSaB4OOLHZW9cy3P/JT2azA1Ukcnp37fst7pVCL+OLDbe
 EY3XvRh7PywUblMcQ4V78VsFsqQsfBOGyibzME5KshpNZVHmQ3AsiDPHz9B1M9HEPf
 w/8nzQtjaOMBJC7o8yqgqoXnL4K3aDau+ZAvdyIMMfO1LZqE2JYqXZbLOBJZGYJwQl
 SUOlAem03Zfb2jQMZKyUliqnRRdwFAYpvOCHBLEx9WYeIael5rYClvZk1PEr6SFxUZ
 n5EX+fwU1LfhA==
To: Biao Huang <biao.huang@mediatek.com>, davem@davemloft.net,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>
References: <20211111071214.21027-1-biao.huang@mediatek.com>
 <20211111071214.21027-3-biao.huang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <71620d46-c9d5-07cc-befd-da838f0dcd1f@collabora.com>
Date: Thu, 11 Nov 2021 14:28:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211111071214.21027-3-biao.huang@mediatek.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 netdev@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-kernel@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>,
 linux-mediatek@lists.infradead.org, macpaul.lin@mediatek.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/5] net: stmmac: dwmac-mediatek: Reuse
 more common features
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Il 11/11/21 08:12, Biao Huang ha scritto:
> This patch makes dwmac-mediatek reuse more features
> supported by stmmac_platform.c.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>   .../ethernet/stmicro/stmmac/dwmac-mediatek.c  | 32 +++++++++----------
>   1 file changed, 15 insertions(+), 17 deletions(-)
> 

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
