Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D96095B52B3
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Sep 2022 04:52:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7968FC03FC8;
	Mon, 12 Sep 2022 02:52:50 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00440C035A5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Sep 2022 02:52:47 +0000 (UTC)
X-UUID: c5330deb367146d3bf4327e8d57c20ab-20220912
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=9iQvNSCdIGu6UTVgz7Ig2p0RKCQGqQ3bI7wc8ozG05w=; 
 b=eS14lgERbfazx0EJ/IX03eKDpG/nbcEiqebhl6SJ0nXpVeVk0wUjynSkBEPT30UyRpMh7PPAvPGn3L7Vb+Z5XTI3kFVCfaEFUgETW8QOu93VC9H5aT4ZWR5qW4zg7zVgEcGhevqbG6ttaTTXtkGuLvmscO/ix2FW1eoGvShTwRM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:42fd265f-293b-4e61-9a9e-641637606e13, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:51,FILE:0,BULK:0,RULE:Release
 _Ham,ACTION:release,TS:51
X-CID-INFO: VERSION:1.1.10, REQID:42fd265f-293b-4e61-9a9e-641637606e13, OB:0,
 LOB
 :0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:51,FILE:0,BULK:0,RULE:Release_H
 am,ACTION:release,TS:51
X-CID-META: VersionHash:84eae18, CLOUDID:672309f6-6e85-48d9-afd8-0504bbfe04cb,
 C
 OID:affc5e72d426,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: c5330deb367146d3bf4327e8d57c20ab-20220912
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <nathan.lu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 791623106; Mon, 12 Sep 2022 10:52:39 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Mon, 12 Sep 2022 10:52:38 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 12 Sep 2022 10:52:38 +0800
Message-ID: <3b0dd4bf01400641a6b622f2c5344c9ded8b5995.camel@mediatek.com>
From: Nathan Lu <nathan.lu@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
Date: Mon, 12 Sep 2022 10:52:37 +0800
In-Reply-To: <cd896ff3-47b7-43eb-c821-8c5fb53c6ae6@linaro.org>
References: <20220906084449.20124-1-nathan.lu@mediatek.com>
 <cd896ff3-47b7-43eb-c821-8c5fb53c6ae6@linaro.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Cc: devicetree@vger.kernel.org, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, Rex-BC
 Chen <rex-bc.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 linux-mediatek@lists.infradead.org, CK Hu <ck.hu@mediatek.com>,
 lancelot.wu@mediatek.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [Linux-stm32] [PATCH v2 0/6] Add first version mt8188 vdosys0
	driver
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

Hi Krzysztof,

Apologize for the incovenience.
I will remove it.

Best regards,

On Thu, 2022-09-08 at 15:14 +0200, Krzysztof Kozlowski wrote:
> On 06/09/2022 10:44, nathan.lu wrote:
> > From: Nathan Lu <nathan.lu@mediatek.com>
> > 
> > This path is based on [1] and [2]
> > [1] Add MediaTek SoC(vdosys1) support for mt8195
> >     - 
> > https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/list/?series=658416__;!!CTRNKA9wMg0ARbw!zuOwDY1dopRZLeZe36Ate1lspoWzDaM06Gj2x8zf9OprwhIMON5dJOlixUGivOIU$
> >  
> > [2] Add MediaTek SoC DRM (vdosys1) support for mt8195
> >     - 
> > https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/list/?series=665269__;!!CTRNKA9wMg0ARbw!zuOwDY1dopRZLeZe36Ate1lspoWzDaM06Gj2x8zf9OprwhIMON5dJOlixX9HBrk2$
> >  
> > 
> 
> Can you stop ccing internal/fake/non-existing email addresses?
> 
> Your message couldn't be delivered to wsd_upstream@mediatek.com
> because
> the remote server is misconfigured. See the technical details below
> for
> more information.
> 
> 
> Best regards,
> Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
