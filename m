Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E147460C6C
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Nov 2021 02:46:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E1B6DC57B6F;
	Mon, 29 Nov 2021 01:46:38 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B8BFC56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Nov 2021 01:46:37 +0000 (UTC)
X-UUID: 7504e7f034de4da189b34954e687bfe6-20211129
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=UuTnIeAjwYA5dUirlDhuBq9UUSsnxYbAfHAqvOTbTpA=; 
 b=I2oQAZ1pNpftqI/YHBXqWOkrXkxevQHfZJhpddfyAdJblNPZeDpdpNMlPRCty2Emh0cDDmUqF1ssdkMyFsIq+COoV6+1ozT4bHPW4WIsdvsI8mZZzm/tr9JcCGYzgzyTmSslAs2c9BpR1oSYrUix9hJbJwNlyq76A3tClloL6bE=;
X-UUID: 7504e7f034de4da189b34954e687bfe6-20211129
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 78232290; Mon, 29 Nov 2021 09:46:32 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 29 Nov 2021 09:46:31 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 29 Nov 2021 09:46:30 +0800
Message-ID: <833463899b37856804b45521adf1b335368f8286.camel@mediatek.com>
From: Biao Huang <biao.huang@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Mon, 29 Nov 2021 09:46:30 +0800
In-Reply-To: <YaQXdaXzJ3LD7ab2@robh.at.kernel.org>
References: <20211112093918.11061-1-biao.huang@mediatek.com>
 <20211112093918.11061-5-biao.huang@mediatek.com>
 <04051f18-a955-9397-d94e-0c61fc8f595b@gmail.com>
 <5f6fec21ef9f2bca6007283b37e35301cfe745ed.camel@mediatek.com>
 <YaQXdaXzJ3LD7ab2@robh.at.kernel.org>
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
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub
 Kicinski <kuba@kernel.org>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH v3 4/7] net-next: dt-bindings: dwmac:
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
	Thanks for your comments~

On Sun, 2021-11-28 at 17:57 -0600, Rob Herring wrote:
> On Thu, Nov 18, 2021 at 11:09:55AM +0800, Biao Huang wrote:
> > Dear Matthias,
> > 	Agree, converting and changes should be seperated.
> > 
> > 	There are some changes in the driver, but mediatek-dwmac.txt
> > 	
> > is not updated for a long time, and is not accurate enough.
> > 
> > 	So this patch is more like a new yaml replace the old txt,
> > 	than a word-to-word converting.
> > 
> > 	
> > Anyway, only 3 little changes compare to old mediate-dwmac.txt, 	
> > others
> > almost keep the same:
> > 	1. compatible " const: snps,dwmac-4.20"
> > 	2. delete "snps,reset-active-low;" in example, since driver
> > remove this property long ago.
> > 	3. add "snps,reset-delays-us = <0 10000 10000>;" in example, 
> > 
> > 	Should I split this patch? 
> > 	If yes, I'll split in next send.
> > 	Thanks.
> 
> It's fine with one patch, but describe the changes in the commit msg.
> 
> Rob
> 
OK, I'll add the changes in the commit message in next send.
Thanks~
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
