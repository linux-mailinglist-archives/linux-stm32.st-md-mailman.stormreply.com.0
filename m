Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0673446AFEA
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Dec 2021 02:39:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2FD9C5F1E5;
	Tue,  7 Dec 2021 01:39:07 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EDEE5C597BA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Dec 2021 01:39:05 +0000 (UTC)
X-UUID: bcadf9cb14034271b35f83d2687bc5fd-20211207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=5TqzGfDJSklDX44XMBIA/ykNHsD+dGmD9/tWrIY+fjY=; 
 b=PNQuW8hwaV3CPXj/ZdP36tj6CV04V+lESRQjva8hsXj07O3nP25vanoZB/Dv7tkgNVbQKRiGXreNt1IkAEpWBLk9OB6L0Mw1kAFLb1eFvsrVogq7UcVh4AqUF0mXuJ/xM12lS40OOFQdOfW/QNLzFmaqr9oDv7LvznA5wxy+j/8=;
X-UUID: bcadf9cb14034271b35f83d2687bc5fd-20211207
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <biao.huang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1146748263; Tue, 07 Dec 2021 09:39:00 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 7 Dec 2021 09:38:59 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 7 Dec 2021 09:38:58 +0800
Message-ID: <d807b5784357ca7656b496b275ef87bf0e4b8100.camel@mediatek.com>
From: Biao Huang <biao.huang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Rob Herring
 <robh+dt@kernel.org>
Date: Tue, 7 Dec 2021 09:38:58 +0800
In-Reply-To: <0efc7cfd-f048-3c69-0ef3-5904c245f914@collabora.com>
References: <20211203063418.14892-1-biao.huang@mediatek.com>
 <20211203063418.14892-6-biao.huang@mediatek.com>
 <0efc7cfd-f048-3c69-0ef3-5904c245f914@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 netdev@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-kernel@vger.kernel.org, dkirjanov@suse.de,
 Jose Abreu <joabreu@synopsys.com>, linux-mediatek@lists.infradead.org,
 macpaul.lin@mediatek.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 5/7] net-next: stmmac: dwmac-mediatek:
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

Dear Angelo,
	Thanks for your comments~
On Mon, 2021-12-06 at 16:22 +0100, AngeloGioacchino Del Regno wrote:
> Il 03/12/21 07:34, Biao Huang ha scritto:
> > Add Ethernet support for MediaTek SoCs from the mt8195 family.
> > 
> > Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> 
> Acked-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
I'll add it in next send.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
