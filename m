Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBEC4E5C6F
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Mar 2022 01:52:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E1E1C60469;
	Thu, 24 Mar 2022 00:52:18 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F4FDC5F1EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Mar 2022 00:52:16 +0000 (UTC)
X-UUID: 9be1904981d042b891cc123de4c0a5b3-20220324
X-UUID: 9be1904981d042b891cc123de4c0a5b3-20220324
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <biao.huang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1488320240; Thu, 24 Mar 2022 08:52:10 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 24 Mar 2022 08:52:09 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 24 Mar 2022 08:52:08 +0800
Message-ID: <6a2f52d2a173a9127ea517c81c3c1c5fe7b2b009.camel@mediatek.com>
From: Biao Huang <biao.huang@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>
Date: Thu, 24 Mar 2022 08:52:08 +0800
In-Reply-To: <CAL_Jsq+6XKvS5RcE6j9vRd3JL-Wbi-O6BrcoGQ5xV0Q2ZG8EMw@mail.gmail.com>
References: <20220314075713.29140-1-biao.huang@mediatek.com>
 <20220314075713.29140-6-biao.huang@mediatek.com>
 <CAL_Jsq+6XKvS5RcE6j9vRd3JL-Wbi-O6BrcoGQ5xV0Q2ZG8EMw@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Cc: devicetree@vger.kernel.org, srv_heupstream <srv_heupstream@mediatek.com>,
 netdev <netdev@vger.kernel.org>, "moderated list:ARM/STM32
 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dkirjanov@suse.de, Jose Abreu <joabreu@synopsys.com>,
 "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
 Macpaul Lin <macpaul.lin@mediatek.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 David Miller <davem@davemloft.net>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [Linux-stm32] [PATCH net-next v13 5/7] net: dt-bindings: dwmac:
 Convert mediatek-dwmac to DT schema
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

Dear Rob,

	Sorry for the failings.

	"snps,txpbl"/"snps,rxpbl" are limited to enum [2,4,8] in
snps,dwmac.yaml, but the hardware allows 1,2,4,8,16 or 32 according to
datasheet.

	I'll submit another patch to modify enum in snps,dwmac.yaml.

Regards!
Biao

On Wed, 2022-03-23 at 09:00 -0500, Rob Herring wrote:
> On Mon, Mar 14, 2022 at 2:57 AM Biao Huang <biao.huang@mediatek.com>
> wrote:
> > 
> > Convert mediatek-dwmac to DT schema, and delete old mediatek-
> > dwmac.txt.
> > And there are some changes in .yaml than .txt, others almost keep
> > the same:
> >   1. compatible "const: snps,dwmac-4.20".
> >   2. delete "snps,reset-active-low;" in example, since driver
> > remove this
> >      property long ago.
> >   3. add "snps,reset-delay-us = <0 10000 10000>" in example.
> >   4. the example is for rgmii interface, keep related properties
> > only.
> > 
> > Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../bindings/net/mediatek-dwmac.txt           |  91 ----------
> >  .../bindings/net/mediatek-dwmac.yaml          | 155
> > ++++++++++++++++++
> >  2 files changed, 155 insertions(+), 91 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/net/mediatek-
> > dwmac.txt
> >  create mode 100644 Documentation/devicetree/bindings/net/mediatek-
> > dwmac.yaml
> 
> Now failing in linux-next:
> 
> /builds/robherring/linux-
> dt/Documentation/devicetree/bindings/net/mediatek-dwmac.example.dtb:
> ethernet@1101c000: snps,txpbl:0:0: 1 is not one of [2, 4, 8]
>  From schema: /builds/robherring/linux-
> dt/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> /builds/robherring/linux-
> dt/Documentation/devicetree/bindings/net/mediatek-dwmac.example.dtb:
> ethernet@1101c000: snps,rxpbl:0:0: 1 is not one of [2, 4, 8]
>  From schema: /builds/robherring/linux-
> dt/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> 
> 
> Rob

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
