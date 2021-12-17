Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F06478208
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Dec 2021 02:26:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B9E4C5F1D9;
	Fri, 17 Dec 2021 01:26:16 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD6A4C5EC6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Dec 2021 01:26:14 +0000 (UTC)
X-UUID: 58ee2375bc88455bbc7c539db82efa5e-20211217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=cMKFGO50Nijrd/zf0SyWIymRa4cZ18pTctDEuNU+t50=; 
 b=BQbQE8dhegxrx5xWHmhb4uiWxRp+otcMVObhgnwrTi15c7IaB9LU/SCee18HMcslmoyw79Hj9FiVmW1L4hrnnr599qX4gKjyliKeRWASQOFh7mXfP7GRNKYp7BYyTYoqzCF1zl5j6dnZ+MhpM+U+5XRXAyR7nUQqalJMKjwHCsw=;
X-UUID: 58ee2375bc88455bbc7c539db82efa5e-20211217
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 804381100; Fri, 17 Dec 2021 09:26:07 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 17 Dec 2021 09:26:06 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 17 Dec 2021 09:26:05 +0800
Message-ID: <c231ad91abe639a200b9a18835280c9ca28c771a.camel@mediatek.com>
From: Biao Huang <biao.huang@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Fri, 17 Dec 2021 09:26:07 +0800
In-Reply-To: <Ybti2mNfEVNWQWgM@robh.at.kernel.org>
References: <20211216055328.15953-1-biao.huang@mediatek.com>
 <20211216055328.15953-5-biao.huang@mediatek.com>
 <Ybti2mNfEVNWQWgM@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 dkirjanov@suse.de, Jose Abreu <joabreu@synopsys.com>,
 linux-mediatek@lists.infradead.org, macpaul.lin@mediatek.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH net-next v10 4/6] net: dt-bindings: dwmac:
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
	Thanks for your comments.
On Thu, 2021-12-16 at 10:01 -0600, Rob Herring wrote:
> On Thu, Dec 16, 2021 at 01:53:26PM +0800, Biao Huang wrote:
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
> Reviewed-by: Rob Herring <robh@kernel.org>
I'll add reviewed-by in next send.
Regards!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
