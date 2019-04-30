Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0422FF256
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Apr 2019 10:58:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F27D0C35E03
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Apr 2019 08:58:49 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95251C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Apr 2019 08:58:48 +0000 (UTC)
X-UUID: 5a55ebb6ad7941189c0f2739cd5def45-20190430
X-UUID: 5a55ebb6ad7941189c0f2739cd5def45-20190430
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 64381693; Tue, 30 Apr 2019 16:58:45 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Tue, 30 Apr 2019 16:58:44 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 30 Apr 2019 16:58:43 +0800
Message-ID: <1556614723.24897.33.camel@mhfsdcap03>
From: biao huang <biao.huang@mediatek.com>
To: "Ong, Boon Leong" <boon.leong.ong@intel.com>
Date: Tue, 30 Apr 2019 16:58:43 +0800
In-Reply-To: <AF233D1473C1364ABD51D28909A1B1B75C0C2849@pgsmsx114.gar.corp.intel.com>
References: <1556519724-1576-1-git-send-email-biao.huang@mediatek.com>
 <1556519724-1576-3-git-send-email-biao.huang@mediatek.com>
 <AF233D1473C1364ABD51D28909A1B1B75C0C27ED@pgsmsx114.gar.corp.intel.com>
 <78EB27739596EE489E55E81C33FEC33A0B46E5B4@DE02WEMBXB.internal.synopsys.com>
 <AF233D1473C1364ABD51D28909A1B1B75C0C2849@pgsmsx114.gar.corp.intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 "jianguo.zhang@mediatek.com" <jianguo.zhang@mediatek.com>, "Voon,
 Weifeng" <weifeng.voon@intel.com>, "Kweh,
 Hock Leong" <hock.leong.kweh@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "yt.shen@mediatek.com" <yt.shen@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 2/2] net-next: stmmac: add mdio clause 45
 access from mac device for dwmac4
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

On Mon, 2019-04-29 at 15:23 +0000, Ong, Boon Leong wrote:
> >> What is the preference of the driver maintainer here?
> >
> >Your implementation doesn't need the mdelay() so I think we should follow
> >your way once you also address the review comments from Andrew and me.
> >
> >Maybe you can coordinate with Biao and submit a C45 implementation that
> >can be tested by both ?
> 
> Ok. We will address the review comments for that patch-series and resend the
> v3 patch-series soonest and for Biao to test. 
>  
I'll test it when your patch is ready. Please cc me, thanks.
> Thanks


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
