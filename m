Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AFA44DFF2
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Nov 2021 02:47:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C6A6C5EC72;
	Fri, 12 Nov 2021 01:47:46 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9369FC5EC70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Nov 2021 01:47:44 +0000 (UTC)
X-UUID: 90d1e70834bd4ed7bbc780b50d3b8901-20211112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=FsPSBY4kE9j2LqywphopQINupDGKsKOuuiiMQfxWJjs=; 
 b=rTtWc29ZVadOEIJKiHfF8btthiJhwuWbag7WgmNWt8BvdCAwGu9fXE/2XW4PgLGG4MJ+pOFrrRrA1G5eK/O6Z9xow8ESXlodDltTfSLUp2+KA1p9kQpVaqYz/tcQNKKHY2OFBZ/RVxU2syqa3xh1x6cNor/T4IMuzhreZY/C6mw=;
X-UUID: 90d1e70834bd4ed7bbc780b50d3b8901-20211112
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <biao.huang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1034506641; Fri, 12 Nov 2021 09:47:37 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 12 Nov 2021 09:47:37 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 12 Nov 2021 09:47:36 +0800
Message-ID: <9df428e1f09fd25573eac78646d74699bd2c5712.camel@mediatek.com>
From: Biao Huang <biao.huang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Rob Herring
 <robh+dt@kernel.org>
Date: Fri, 12 Nov 2021 09:47:36 +0800
In-Reply-To: <4214b222-6c43-3132-bcfe-07c43d29f5f9@collabora.com>
References: <20211111071214.21027-1-biao.huang@mediatek.com>
 <20211111071214.21027-5-biao.huang@mediatek.com>
 <4214b222-6c43-3132-bcfe-07c43d29f5f9@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 netdev@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-kernel@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>,
 linux-mediatek@lists.infradead.org, macpaul.lin@mediatek.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 4/5] dt-bindings: net: dwmac: Convert
 mediatek-dwmac to DT schema
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

Dear AngeloGioacchino,
	Thanks for your comments~

On Thu, 2021-11-11 at 14:30 +0100, AngeloGioacchino Del Regno wrote:
> Il 11/11/21 08:12, Biao Huang ha scritto:
> > Convert mediatek-dwmac to DT schema, and delete old mediatek-
> > dwmac.txt.
> > 
> > Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> > ---
> >   .../bindings/net/mediatek-dwmac.txt           |  91 --------
> >   .../bindings/net/mediatek-dwmac.yaml          | 211
> > ++++++++++++++++++
> >   2 files changed, 211 insertions(+), 91 deletions(-)
> >   delete mode 100644
> > Documentation/devicetree/bindings/net/mediatek-dwmac.txt
> >   create mode 100644
> > Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> > 
> 
> Thanks for the DT schema conversion!
> 
> Anyway, you should split this in two commits: in the first one, you
> convert the
> txt documentation to schema, as it is... and in the second one, you
> add mt8195
> bindings.
OK, I'll split it in next send.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
