Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F86746CD33
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Dec 2021 06:34:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55C61C5F1E8;
	Wed,  8 Dec 2021 05:34:38 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 471CCC5F1D8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Dec 2021 05:34:35 +0000 (UTC)
X-UUID: cf248f2ca8064c1ebb4fe1e09bec9971-20211208
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=cREHopv2I0vmXpVmvz4oR9TOg4BtDWc6c9ra60cPwdA=; 
 b=on6EpM+AbDWjXT9jBYfizWJCj0ANlmQ2lRClcyvzjau6jLEswATkMDxC2n+Jf7eH/Hn8wFNaxc50vr5dX8Lrf297nDFRa3C5Qd1a9FV3ISNodXlBbTdJ8gy8GPRzWkCG4DBeeTDDIroPg6tDvqyLOBm6Ak72pvuDJdQXpcMjwKM=;
X-UUID: cf248f2ca8064c1ebb4fe1e09bec9971-20211208
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <biao.huang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 736930027; Wed, 08 Dec 2021 13:34:29 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 8 Dec 2021 13:34:28 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 8 Dec 2021 13:34:27 +0800
Message-ID: <9d559afc6ae7c5f85bff222aa0c326f3f3e46fcf.camel@mediatek.com>
From: Biao Huang <biao.huang@mediatek.com>
To: Jakub Kicinski <kuba@kernel.org>
Date: Wed, 8 Dec 2021 13:34:23 +0800
In-Reply-To: <20211207200450.093f94a8@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
References: <20211208030354.31877-1-biao.huang@mediatek.com>
 <20211208030354.31877-6-biao.huang@mediatek.com>
 <20211207200450.093f94a8@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
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

Dear Jakub,
	Thanks for your comments.
On Tue, 2021-12-07 at 20:04 -0800, Jakub Kicinski wrote:
> On Wed, 8 Dec 2021 11:03:53 +0800 Biao Huang wrote:
> > Add Ethernet support for MediaTek SoCs from the mt8195 family.
> > 
> > Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> > Acked-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> 
> drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:439:3: warning:
> variable 'gtxc_delay_val' is uninitialized when used here [-
> Wuninitialized]
>                 gtxc_delay_val |= FIELD_PREP(MT8195_DLY_GTXC_ENABLE,
> !!mac_delay->tx_delay);
>                 ^~~~~~~~~~~~~~
> drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:369:20: note:
> initialize the variable 'gtxc_delay_val' to silence this warning
>         u32 gtxc_delay_val, delay_val = 0, rmii_delay_val = 0;
>                           ^
>                            = 0
> 1 warning generated.
> drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:439:3: warning:
> variable 'gtxc_delay_val' is uninitialized when used here [-
> Wuninitialized]
>                 gtxc_delay_val |= FIELD_PREP(MT8195_DLY_GTXC_ENABLE,
> !!mac_delay->tx_delay);
>                 ^~~~~~~~~~~~~~
> drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:369:20: note:
> initialize the variable 'gtxc_delay_val' to silence this warning
>         u32 gtxc_delay_val, delay_val = 0, rmii_delay_val = 0;
>                           ^
>                            = 0
I'll fix the uninitialized warning in next send.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
