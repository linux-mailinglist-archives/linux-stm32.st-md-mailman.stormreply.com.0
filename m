Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C59715E718B
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Sep 2022 03:48:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C664C04003;
	Fri, 23 Sep 2022 01:48:37 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E88FC01E99
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Sep 2022 01:48:35 +0000 (UTC)
X-UUID: 7639ba8871e34b4ba20f8ed1059ca1ea-20220923
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=1k5TOoyEcepapXTo6DfuMdGwBHBkldYi/XOn9F6EwJA=; 
 b=cJ+ZvhgPTPLkgEOCChkcJUHphHkjgYfz96qfeW7o/jPDakKFTB4u+XkKL7Ki+WC+OsuSY9WZUdSuVsoAspOsCCebkCS6gcXce88rNvRGNfkmKmk9uKtVpLmK5m1xjA/Z6RdrMIPI86VQszdEMMH6EuJ8FRCMeUus1lU+lDrAprA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11, REQID:6f70596c-f29d-47e5-ac1e-feb7cbb33b87, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:39a5ff1, CLOUDID:f8d4f0e3-87f9-4bb0-97b6-34957dc0fbbe,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 7639ba8871e34b4ba20f8ed1059ca1ea-20220923
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <jianguo.zhang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1205604914; Fri, 23 Sep 2022 09:48:30 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Fri, 23 Sep 2022 09:48:29 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 23 Sep 2022 09:48:28 +0800
Message-ID: <8007b455dd18837c06ab099a6009505e7dddc124.camel@mediatek.com>
From: Jianguo Zhang <jianguo.zhang@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "David S . Miller"
 <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Date: Fri, 23 Sep 2022 09:48:28 +0800
In-Reply-To: <04b9e5ef-f3c7-3400-f9df-2f585a084c5d@linaro.org>
References: <20220922092743.22824-1-jianguo.zhang@mediatek.com>
 <20220922092743.22824-3-jianguo.zhang@mediatek.com>
 <04b9e5ef-f3c7-3400-f9df-2f585a084c5d@linaro.org>
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
Subject: Re: [Linux-stm32] [resend PATCH v4 2/2] dt-bindings: net: snps,
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

On Thu, 2022-09-22 at 17:07 +0200, Krzysztof Kozlowski wrote:
> On 22/09/2022 11:27, Jianguo Zhang wrote:
> > The clk_csr property is parsed in driver for generating MDC clock
> > with correct frequency. A warning('clk_csr' was unexpeted) is
> > reported
> > when runing 'make_dtbs_check' because the clk_csr property
> > has been not documented in the binding file.
> > 
> 
> You did not describe the case, but apparently this came with
> 81311c03ab4d ("net: ethernet: stmmac: add management of clk_csr
> property") which never brought the bindings change.
> 
> Therefore the property was never part of bindings documentation and
> bringing them via driver is not the correct process. It bypasses the
> review and such bypass cannot be an argument to bring the property to
> bindings. It's not how new properties can be added.
> 
> Therefore I don't agree. Please make it a property matching bindings,
> so
> vendor prefix, no underscores in node names.
> 
> Driver and DTS need updates.
> 
We will rename the property 'clk_csr' as 'snps,clk-csr' and update DTS
& driver to align with the new name in next versions patches.
> Best regards,
> Krzysztof
> 
BRS
Jianguo

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
