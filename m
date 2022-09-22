Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 735B95E5C88
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Sep 2022 09:37:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E9B0C04003;
	Thu, 22 Sep 2022 07:37:08 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8663C03FCD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Sep 2022 07:37:05 +0000 (UTC)
X-UUID: 76aa0398248148a1934e81a715d2cef8-20220922
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=/6bsX4RBcjvTUrrlX0LGHcO1IxWp0f22mVXpMN7I5ks=; 
 b=ar6zWAYYBLJkZehh1Rk+l9JxNQIrLSyVL2GQNAbvS3Wk2n3eoU8VOOMLDhy95+P8CTZs8U+SX9xX2t7GqghmgsdwQqE+GWxqjGzCoMQrym2Ni6jhgvVhluDc3sFgJBo5mrDrnKDxI4Xa2h6ilprOxwznIxr3rjJGyXMNvEkp4nA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11, REQID:81abf139-2e85-4b13-8fe3-165e62a61f9f, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:45
X-CID-INFO: VERSION:1.1.11, REQID:81abf139-2e85-4b13-8fe3-165e62a61f9f, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:45
X-CID-META: VersionHash:39a5ff1, CLOUDID:a244dce3-87f9-4bb0-97b6-34957dc0fbbe,
 B
 ulkID:220921162412WQNVHANJ,BulkQuantity:205,Recheck:0,SF:28|17|19|48|823|8
 24,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,CO
 L:0
X-UUID: 76aa0398248148a1934e81a715d2cef8-20220922
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <jianguo.zhang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 175818648; Thu, 22 Sep 2022 15:36:59 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 22 Sep 2022 15:36:57 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 22 Sep 2022 15:36:56 +0800
Message-ID: <9c28de4cef86d706baf92813f5d32cfd1630852e.camel@mediatek.com>
From: Jianguo Zhang <jianguo.zhang@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "David S . Miller"
 <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Date: Thu, 22 Sep 2022 15:36:56 +0800
In-Reply-To: <821b3c30-6f1f-17c1-061c-8d3b3add0238@linaro.org>
References: <20220921070721.19516-1-jianguo.zhang@mediatek.com>
 <20220921070721.19516-3-jianguo.zhang@mediatek.com>
 <bd460cfd-7114-b200-ab99-16fa3e2cff50@linaro.org>
 <d231f64e494f4badf8bbe23130b25594376c9882.camel@mediatek.com>
 <821b3c30-6f1f-17c1-061c-8d3b3add0238@linaro.org>
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
Subject: Re: [Linux-stm32] [PATCH v3 2/2] dt-bindings: net: snps,
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

On Thu, 2022-09-22 at 08:38 +0200, Krzysztof Kozlowski wrote:
> On 22/09/2022 04:15, Jianguo Zhang wrote:
> > Dear Krzysztof,
> > 
> > 	Thanks for your comment.
> > 
> > On Wed, 2022-09-21 at 10:24 +0200, Krzysztof Kozlowski wrote:
> > > On 21/09/2022 09:07, Jianguo Zhang wrote:
> > > > Add clk_csr property for snps,dwmac
> > > > 
> > > > Signed-off-by: Jianguo Zhang <jianguo.zhang@mediatek.com>
> > > > ---
> > > >  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 5
> > > > +++++
> > > >  1 file changed, 5 insertions(+)
> > > > 
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > > > b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > > > index 491597c02edf..8cff30a8125d 100644
> > > > --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > > > +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > > > @@ -288,6 +288,11 @@ properties:
> > > >        is supported. For example, this is used in case of SGMII
> > > > and
> > > >        MAC2MAC connection.
> > > >  
> > > > +  clk_csr:
> > > 
> > > No underscores in node names. Missing vendor prefix.
> > > 
> > 
> > We will remane the property name 'clk_csr' as 'snps,clk-csr' and
> > another driver patch is needed to align the name used in driver
> > with
> > the new name. 
> 
> You did not say anything that you document existing property. Commit
> msg
> *must* explain why you are doing stuff in commit body.
> 
> We should not be asking for this and for reason of clk_csr.

We will explain the background that why we document 'clk_csr' property
in binding file in commit message in next version patches.
> 
> Best regards,
> Krzysztof
> 
BRS
Jianguo

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
