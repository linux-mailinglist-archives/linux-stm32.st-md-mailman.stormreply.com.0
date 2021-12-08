Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA94A46CBE1
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Dec 2021 05:04:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 806A8C5F1E8;
	Wed,  8 Dec 2021 04:04:55 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B46CC5F1D8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Dec 2021 04:04:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DD631B81F61;
 Wed,  8 Dec 2021 04:04:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF090C00446;
 Wed,  8 Dec 2021 04:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638936292;
 bh=1r558GTEUAd1QgB8UN7qYm8RGcn1C0as6rGvCpBhBdg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=c01kKm4/EQD7+IVBOaAq4j4UcZQ8YLSq5USj5LOyOi9aX3+mCathluYcIjJ6SABi9
 g6J0suXdmg7hRkpTD9nD0lhFCoZ9yuz+Zha87gSo0B81XoZ5LO2IcTmUehjajCNvuc
 gWt2m4OLGEn4G+74hnr4wyEQsmZFGPgbqs+BzyXw+cYqOnnDz2TV5GBHl/eUIEKH0w
 ZnrENM1w3kmAGUmCml5MsV3rywh3o9w0nWgWiDRJzkVXkx4/Cj2N/skV24SooOyIGW
 vkgg4brNMcg56vFmOwqGqJSy8a5uKsKViW1Bz5YusbPYnG2t6+OaJWJFmi9JoUMoEz
 F8gDOIWeoA5Xw==
Date: Tue, 7 Dec 2021 20:04:50 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Biao Huang <biao.huang@mediatek.com>
Message-ID: <20211207200450.093f94a8@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20211208030354.31877-6-biao.huang@mediatek.com>
References: <20211208030354.31877-1-biao.huang@mediatek.com>
 <20211208030354.31877-6-biao.huang@mediatek.com>
MIME-Version: 1.0
Cc: Jose Abreu <joabreu@synopsys.com>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 dkirjanov@suse.de, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, macpaul.lin@mediatek.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH net-next v6 5/6] stmmac: dwmac-mediatek:
 add support for mt8195
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

On Wed, 8 Dec 2021 11:03:53 +0800 Biao Huang wrote:
> Add Ethernet support for MediaTek SoCs from the mt8195 family.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:439:3: warning: variable 'gtxc_delay_val' is uninitialized when used here [-Wuninitialized]
                gtxc_delay_val |= FIELD_PREP(MT8195_DLY_GTXC_ENABLE, !!mac_delay->tx_delay);
                ^~~~~~~~~~~~~~
drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:369:20: note: initialize the variable 'gtxc_delay_val' to silence this warning
        u32 gtxc_delay_val, delay_val = 0, rmii_delay_val = 0;
                          ^
                           = 0
1 warning generated.
drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:439:3: warning: variable 'gtxc_delay_val' is uninitialized when used here [-Wuninitialized]
                gtxc_delay_val |= FIELD_PREP(MT8195_DLY_GTXC_ENABLE, !!mac_delay->tx_delay);
                ^~~~~~~~~~~~~~
drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:369:20: note: initialize the variable 'gtxc_delay_val' to silence this warning
        u32 gtxc_delay_val, delay_val = 0, rmii_delay_val = 0;
                          ^
                           = 0
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
