Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D01950048C
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Apr 2022 05:11:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DBED0C628AB;
	Thu, 14 Apr 2022 03:11:31 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02C5EC6049C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Apr 2022 03:11:30 +0000 (UTC)
X-UUID: 750af9d05ecc4b85b9ebdc41c75ac785-20220414
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:b937fe5a-2ed4-43cb-bd44-5af024acbb39, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:100,FILE:0,RULE:Release_Ham,
 ACTION:release,TS:80
X-CID-INFO: VERSION:1.1.4, REQID:b937fe5a-2ed4-43cb-bd44-5af024acbb39, OB:0,
 LOB:
 0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:100,FILE:0,RULE:Spam_GS981B3D,
 ACTION:quarantine,TS:80
X-CID-META: VersionHash:faefae9, CLOUDID:b1f615a9-d103-4e36-82b9-b0e86991b3df,
 C
 OID:7f4f53e1987f,Recheck:0,SF:13|15|28|16|19|48,TC:nil,Content:0,EDM:-3,Fi
 le:nil,QS:0,BEC:nil
X-UUID: 750af9d05ecc4b85b9ebdc41c75ac785-20220414
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 224678600; Thu, 14 Apr 2022 11:11:22 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 Apr 2022 11:11:21 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 14 Apr 2022 11:11:21 +0800
Message-ID: <69dd1710a7f1c1715e079ece159fc527c7fecb4c.camel@mediatek.com>
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang
 Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Date: Thu, 14 Apr 2022 11:11:21 +0800
In-Reply-To: <20220412103114.19922-3-jason-jh.lin@mediatek.com>
References: <20220412103114.19922-1-jason-jh.lin@mediatek.com>
 <20220412103114.19922-3-jason-jh.lin@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rex-BC
 Chen =?UTF-8?Q?=28=E9=99=B3=E6=9F=8F=E8=BE=B0=29?= <Rex-BC.Chen@mediatek.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "fshao@chromium.org" <fshao@chromium.org>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Singo Chang =?UTF-8?Q?=28=E5=BC=B5=E8=88=88=E5=9C=8B=29?=
 <Singo.Chang@mediatek.com>,
 Roy-CW Yeh =?UTF-8?Q?=28=E8=91=89=E4=B8=AD=E7=91=8B=29?=
 <Roy-CW.Yeh@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Yongqiang Niu =?UTF-8?Q?=28=E7=89=9B=E6=B0=B8=E5=BC=BA=29?=
 <yongqiang.niu@mediatek.com>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>,
 Moudy Ho =?UTF-8?Q?=28=E4=BD=95=E5=AE=97=E5=8E=9F=29?= <Moudy.Ho@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, "hsinyi@chromium.org" <hsinyi@chromium.org>,
 CK Hu =?UTF-8?Q?=28=E8=83=A1=E4=BF=8A=E5=85=89=29?= <ck.hu@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Nancy Lin =?UTF-8?Q?=28=E6=9E=97=E6=AC=A3=E8=9E=A2=29?=
 <Nancy.Lin@mediatek.com>, "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v18 02/10] dt-bindings: arm: mediatek:
 mmsys: add mt8195 SoC binding
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

Hello Rob, Krzysztof,

I found the dt-binding patches in this series never appeared in
devicetree-bindings patchwork and trigger the dt-binding check bot.

Do you know the reason for this?
Could you help me with this and let me know what should I do to solve
this problem?

Thanks.

Regards,
Jason-JH.Lin

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
