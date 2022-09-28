Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5420E5ED665
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Sep 2022 09:40:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 012CFC63328;
	Wed, 28 Sep 2022 07:40:14 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 632D3C63326
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Sep 2022 07:40:12 +0000 (UTC)
X-UUID: eefd5cc0ca874c7787e6b04e87e2627d-20220928
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=twBFZvQndTAJep03Qp9HrLxape++Wqs0xYwSivoNI3Q=; 
 b=DIwcsLObG97GUH7hrj9xrg44qEOueuXU1Die6rl0wEQcHA5K+5lj/K5jty7CeCc0Ue/mgOV1fjJeahmCYWBOzEP5rp3UMNzmhRqXy+Pyap0u1ZTFfeTHGEolhKugoedDC5T9YYRklKkhVNor23vVGeOGeTPNzp3srtQIs+jy0u0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11, REQID:e802330c-8d41-4808-be8b-4d6b26b37f10, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:39a5ff1, CLOUDID:42bd4907-1cee-4c38-b21b-a45f9682fdc0,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: eefd5cc0ca874c7787e6b04e87e2627d-20220928
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <jianguo.zhang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2003581825; Wed, 28 Sep 2022 15:40:02 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 28 Sep 2022 15:40:01 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 28 Sep 2022 15:40:00 +0800
Message-ID: <7c46b223e4ba5d1ceb587facf7dd060e6cab9f17.camel@mediatek.com>
From: Jianguo Zhang <jianguo.zhang@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, "David S . Miller"
 <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>
Date: Wed, 28 Sep 2022 15:40:00 +0800
In-Reply-To: <ff577b86-44c8-3146-3388-78021bb7edb4@linaro.org>
References: <20220923052828.16581-1-jianguo.zhang@mediatek.com>
 <20220923052828.16581-5-jianguo.zhang@mediatek.com>
 <e0fa3ddf-575d-9e25-73d8-e0858782b73f@collabora.com>
 <ac24dc0f-0038-5068-3ce6-bbace55c7027@linaro.org>
 <4f205f0d-420d-8f51-ad26-0c2475c0decd@linaro.org>
 <80c59c9462955037981a1eab6409ba69fc9b7c34.camel@mediatek.com>
 <888703a8-a8e5-e691-7a53-294f88ad7a4e@collabora.com>
 <ff577b86-44c8-3146-3388-78021bb7edb4@linaro.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Cc: devicetree@vger.kernel.org, Biao Huang <biao.huang@mediatek.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 4/4] net: stmmac: Update the name of
 property 'clk_csr'
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

On Wed, 2022-09-28 at 09:17 +0200, Krzysztof Kozlowski wrote:
> On 27/09/2022 12:44, AngeloGioacchino Del Regno wrote:
> 
> > > > OTOH, as Angelo pointed out, handling old and new properties is
> > > > quite
> > > > easy to achieve, so... :)
> > > > 
> > > 
> > > So, the conclusion is as following:
> > > 
> > > 1. add new property 'snps,clk-csr' and document it in binding
> > > file.
> > > 2. parse new property 'snps,clk-csr' firstly, if failed, fall
> > > back to
> > > old property 'clk_csr' in driver.
> > > 
> > > Is my understanding correct?
> > 
> > Yes, please.
> > 
> > I think that bindings should also get a 'clk_csr' with deprecated:
> > true,
> > but that's Krzysztof's call.
> 
> The property was never documented, so I think we can skip it as
> deprecated.
> 
We will send next version patches according to the conclusion.
> Best regards,
> Krzysztof
> 
BRS
Jianguo

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
