Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF4C5EBDBE
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Sep 2022 10:49:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B3FCC63326;
	Tue, 27 Sep 2022 08:49:37 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27AC4C5F1D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Sep 2022 08:49:35 +0000 (UTC)
X-UUID: 54547f90f4c24f05a9716be71998a468-20220927
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=PWBKd6s+alHmuqMW7zBzYd2csWJfir6MkKHpoQDs4cg=; 
 b=Ry/6IipgkSU2hqtXGAVjuy+5b5xKfu8wglUEzfr25o/dRZNXDRdrpfArD37Q0c7f24lLrXcY8AdAyJF7tvOW6Gkp1z5HrlGZD8Y7nk99nIf+dxBrOBkWeJ5dOmohV/tOzja0ZcyL9//6S7HvkQQNNFwyRI7EzHI+Bd4AowS9IHk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11, REQID:6147a00e-7c2d-4823-ad3d-bed593ddf9b0, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:45
X-CID-INFO: VERSION:1.1.11, REQID:6147a00e-7c2d-4823-ad3d-bed593ddf9b0, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:45
X-CID-META: VersionHash:39a5ff1, CLOUDID:1eb737a3-dc04-435c-b19b-71e131a5fc35,
 B
 ulkID:220927164931O60JSLKQ,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48,TC:n
 il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 54547f90f4c24f05a9716be71998a468-20220927
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw01.mediatek.com (envelope-from <jianguo.zhang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1987659540; Tue, 27 Sep 2022 16:49:30 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Tue, 27 Sep 2022 16:49:29 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 27 Sep 2022 16:49:27 +0800
Message-ID: <eb6a70844b067f76e8405b937de9408045d569a0.camel@mediatek.com>
From: Jianguo Zhang <jianguo.zhang@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "David S . Miller"
 <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Date: Tue, 27 Sep 2022 16:49:27 +0800
In-Reply-To: <a215ae81-10de-7880-1a15-b7b08d0d80d7@linaro.org>
References: <20220923052828.16581-1-jianguo.zhang@mediatek.com>
 <20220923052828.16581-3-jianguo.zhang@mediatek.com>
 <a215ae81-10de-7880-1a15-b7b08d0d80d7@linaro.org>
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
Subject: Re: [Linux-stm32] [PATCH v5 2/4] dt-bindings: net: snps,
 dwmac: add clk_csr property
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

On Fri, 2022-09-23 at 20:11 +0200, Krzysztof Kozlowski wrote:
> On 23/09/2022 07:28, Jianguo Zhang wrote:
> > The clk_csr property is parsed in driver for generating MDC clock
> > with correct frequency. A warning('clk_csr' was unexpeted) is
> > reported
> > when runing 'make_dtbs_check' because the clk_csr property
> > has been not documented in the binding file.
> 
> Your subject is not accurate anymore. Maybe mention that instead of
> existing clk_csr, you add a different property.
> 
> With commit msg fixes:
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
We will fix commit message in next version patches.

> Best regards,
> Krzysztof
> 
BRS
Jianguo

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
