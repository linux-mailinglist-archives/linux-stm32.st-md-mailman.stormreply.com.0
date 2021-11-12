Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D00D44E028
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Nov 2021 03:11:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE7F1C5EC72;
	Fri, 12 Nov 2021 02:11:57 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9F9CC5EC70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Nov 2021 02:11:56 +0000 (UTC)
X-UUID: 21e06842463d43bc821990a8da6df3f8-20211112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ufO+ZBf8QD7tWoExaa5T5GTQHOADopwfBVamDw5rnT8=; 
 b=WGNR5C6X6mNe9hpA9vwRUcTU0RpZ+MmlZaY7jez4e3CnJzapr5V2kQlzKqbAQQu+rUFQeu3QuTgN1Hp3VFE/gvn3ZDWUSeTGURKnQJ3Z/LO5fo3t1EkV66nFGaNjz5G2QanusQTSifCyApWAqNlOPOtzRpdaUJygJaIEco4qF3Y=;
X-UUID: 21e06842463d43bc821990a8da6df3f8-20211112
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <biao.huang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1869951413; Fri, 12 Nov 2021 10:11:52 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 12 Nov 2021 10:11:51 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 12 Nov 2021 10:11:50 +0800
Message-ID: <5500319817253c3f0c01064c363089d6b0c95d48.camel@mediatek.com>
From: Biao Huang <biao.huang@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Fri, 12 Nov 2021 10:11:50 +0800
In-Reply-To: <1636642646.918741.3774088.nullmailer@robh.at.kernel.org>
References: <20211111071214.21027-1-biao.huang@mediatek.com>
 <20211111071214.21027-5-biao.huang@mediatek.com>
 <1636642646.918741.3774088.nullmailer@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 davem@davemloft.net, Jose Abreu <joabreu@synopsys.com>,
 linux-mediatek@lists.infradead.org, macpaul.lin@mediatek.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
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

Dear Rob,
	Thanks for your comments~

On Thu, 2021-11-11 at 08:57 -0600, Rob Herring wrote:
> On Thu, 11 Nov 2021 15:12:13 +0800, Biao Huang wrote:
> > Convert mediatek-dwmac to DT schema, and delete old mediatek-
> > dwmac.txt.
> > 
> > Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> > ---
> >  .../bindings/net/mediatek-dwmac.txt           |  91 --------
> >  .../bindings/net/mediatek-dwmac.yaml          | 211
> > ++++++++++++++++++
> >  2 files changed, 211 insertions(+), 91 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/net/mediatek-
> > dwmac.txt
> >  create mode 100644 Documentation/devicetree/bindings/net/mediatek-
> > dwmac.yaml
> > 
> 
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
> 
> Note that it is not yet a requirement to have 0 warnings for
> dtbs_check.
> This will change in the future.
> 
> Full log is available here: 
> https://patchwork.ozlabs.org/patch/1553803
> 
> 
> ethernet@1101c000: clock-names: ['axi', 'apb', 'mac_main', 'ptp_ref']
> is too short
> 	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml
> 
> ethernet@1101c000: clocks: [[27, 34], [27, 37], [6, 154], [6, 155]]
> is too short
> 	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml
> 
> ethernet@1101c000: compatible: ['mediatek,mt2712-gmac'] does not
> contain items matching the given schema
> 	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml
> 
> ethernet@1101c000: compatible: 'oneOf' conditional failed, one must
> be fixed:
> 	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml
> 
Yes, I should add a dts related patch to fix this issue in next send.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
