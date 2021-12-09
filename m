Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F7946E057
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Dec 2021 02:42:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1242C5F1EA;
	Thu,  9 Dec 2021 01:42:19 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8C04C5F1E7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Dec 2021 01:42:16 +0000 (UTC)
X-UUID: b23cf152a0104789ba9f02164db44517-20211209
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=JEt3XG4GHhG9WFakPdTvxOX/lsmWXLVPAlDuPpzKZro=; 
 b=okq6CjmdpC/VGZ97YGqF9AStRZdzKofxz0leGxwBj+1pfGc/1T67zHe00GHDhNwQQ1fcQokayO6cdMUWbENJcebobO/G3KfH3Re9WNtoX46CWCjl62/XUtodVbu8G51MzWSF0iaGYQjDiK/htxnh0ajm55F446joIriJegqgOLk=;
X-UUID: b23cf152a0104789ba9f02164db44517-20211209
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <biao.huang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1554230953; Thu, 09 Dec 2021 09:42:11 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 9 Dec 2021 09:42:10 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 9 Dec 2021 09:42:09 +0800
Message-ID: <5713fa6121effde79c19e0b4475d02389d72d2cc.camel@mediatek.com>
From: Biao Huang <biao.huang@mediatek.com>
To: Jakub Kicinski <kuba@kernel.org>
Date: Thu, 9 Dec 2021 09:42:08 +0800
In-Reply-To: <20211208063820.264df62d@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
References: <20211208054716.603-1-biao.huang@mediatek.com>
 <20211208054716.603-6-biao.huang@mediatek.com>
 <20211208063820.264df62d@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
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
Subject: Re: [Linux-stm32] [PATCH net-next v7 5/6] stmmac: dwmac-mediatek:
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

Dear Jakub,

All these warning lines share a similar semantics:
delay_val |= FIELD_PREP(xxx, !!val);

and, should come from the expansion of FIELD_PREP in
include/linux/bitfiled.h:

  FIELD _PREP --> __BF_FILED_CHECK --> "~((_mask) >> __bf_shf(_mask)) &
(_val) : 0,"

===============================================================
__BF_FILED_CHECK {
...
  BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
                   ~((_mask) >> __bf_shf(_mask)) & (_val) : 0, \
                   _pfx "value too large for the field"); \
...
===============================================================

Should I fix it by converting
  delay_val |= FIELD_PREP(ETH_DLY_TXC_ENABLE, !!mac_delay->tx_delay);
to
  en_val = !!mac_delay->tx_delay;
  delay_val |= FIELD_PREP(ETH_DLY_TXC_ENABLE, !!en_val);

or other suggestions for these warnings?

Thanks~

On Wed, 2021-12-08 at 06:38 -0800, Jakub Kicinski wrote:
> On Wed, 8 Dec 2021 13:47:15 +0800 Biao Huang wrote:
> > Add Ethernet support for MediaTek SoCs from the mt8195 family.
> > 
> > Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> > Acked-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> 
> sparse reports whole bunch of warnings like this:
> 
> drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:213:30: warning:
> dubious: x & !y
> drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:217:30: warning:
> dubious: x & !y
> drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:228:38: warning:
> dubious: x & !y
> drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:232:38: warning:
> dubious: x & !y
> drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:247:46: warning:
> dubious: x & !y
> drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:255:46: warning:
> dubious: x & !y
> drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:273:30: warning:
> dubious: x & !y
> drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:277:30: warning:
> dubious: x & !y
> drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:375:30: warning:
> dubious: x & !y
> drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:379:30: warning:
> dubious: x & !y
> drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:390:43: warning:
> dubious: x & !y
> drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:397:43: warning:
> dubious: x & !y
> drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:415:46: warning:
> dubious: x & !y
> drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:426:46: warning:
> dubious: x & !y
> drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:439:35: warning:
> dubious: x & !y
> drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:443:30: warning:
> dubious: x & !y
> 
> Any idea on where these come from?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
