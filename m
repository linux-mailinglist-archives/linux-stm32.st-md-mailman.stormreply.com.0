Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B9B5BDA28
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Sep 2022 04:33:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F5F0C0D2C0;
	Tue, 20 Sep 2022 02:33:18 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69A34C03FD5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Sep 2022 02:33:16 +0000 (UTC)
X-UUID: f3b6d518f97e4a13a09733edc49a259b-20220920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=t2S3HXzQLfmjdW8BymUDlC5D8EiXYe43lcRmSAgqZFE=; 
 b=pS0GVsS0y0ICPgIcK0uLVFHXY64eh8VvmrXJiU+tCEX56//YEGnq+clhfQgCx07WQ/1NkEWtinThnXtkbG5A1k2MzrMEeOOTle0f+4v5nOPkeV1EzKV7k8SnUCIAWIj/L/VzPj5lejI66ayMdLE16hbAzslQq3j8kPiRhhQCk28=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11, REQID:292d0791-03e7-42f7-b45b-2a16da7e7d47, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:22,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:22
X-CID-INFO: VERSION:1.1.11, REQID:292d0791-03e7-42f7-b45b-2a16da7e7d47, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:22,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:22
X-CID-META: VersionHash:39a5ff1, CLOUDID:fcb8355e-5ed4-4e28-8b00-66ed9f042fbd,
 B
 ulkID:220919161938HV8SMIES,BulkQuantity:416,Recheck:0,SF:28|100|17|19|48|1
 01|823|824,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BE
 C:nil,COL:0
X-UUID: f3b6d518f97e4a13a09733edc49a259b-20220920
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <jianguo.zhang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 526819015; Tue, 20 Sep 2022 10:33:09 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 20 Sep 2022 10:33:08 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 20 Sep 2022 10:33:07 +0800
Message-ID: <20c47bd6742c08912c7b35e75c032c5b853fccde.camel@mediatek.com>
From: Jianguo Zhang <jianguo.zhang@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "David S . Miller"
 <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 20 Sep 2022 10:33:07 +0800
In-Reply-To: <b343e4c7-a247-28b8-3d16-cb7cea7ba36b@linaro.org>
References: <20220919080410.11270-1-jianguo.zhang@mediatek.com>
 <20220919080410.11270-2-jianguo.zhang@mediatek.com>
 <d28ce676-ed6e-98da-9761-ed46f2fa4a95@linaro.org>
 <4c537b63f609ae974dfb468ebc31225d45f785e8.camel@mediatek.com>
 <88412fcc-96be-cd9d-8805-086c7f09c03b@linaro.org>
 <f72e133e9aec70724702054e5f6a8712b649d34f.camel@mediatek.com>
 <b343e4c7-a247-28b8-3d16-cb7cea7ba36b@linaro.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Cc: devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Biao Huang <biao.huang@mediatek.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] stmmac: dwmac-mediatek: add support
	for mt8188
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

Dear Krzysztof,

	Thanks for your comment.

On Mon, 2022-09-19 at 12:06 +0200, Krzysztof Kozlowski wrote:
> On 19/09/2022 11:56, Jianguo Zhang wrote:
> > > No, this does not justify new entry. You need specific
> > > compatible,
> > > but
> > > not new entry.
> > > 
> > > > On the other hand, mt8188 and mt8195 have same ethernet design,
> > > > so
> > > > the
> > > > private data "mt8195_gmac_variant" can be resued to reduce
> > > > redundant
> > > > info in driver.
> > > 
> > > And you do not need new entry in the driver.
> > 
> > Do you mean that I can use "mediatek,mt8195-gmac" as compatible for
> > ethernet in mt8188 DTS file?
> 
> Yes, as a fallback. Example schema describes such case.
> 
OK, we will drop the changes in patch #1 and add MT8188 related info in
binding document in next version patches.
> Best regards,
> Krzysztof
> 
BRS
Jianguo

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
