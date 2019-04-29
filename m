Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB51E5F9
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Apr 2019 17:19:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47278C35E03
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Apr 2019 15:19:38 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (dc8-smtprelay2.synopsys.com
 [198.182.47.102])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C57B9C36B3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Apr 2019 15:19:36 +0000 (UTC)
Received: from mailhost.synopsys.com (dc8-mailhost1.synopsys.com
 [10.13.135.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B1458C0081;
 Mon, 29 Apr 2019 15:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1556551176; bh=6ca6mfO960XBEcOh39ZiDJip0nWB/IKPMIyykJ70WEY=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=ej/ASn9kUF6DpwOz0Kaanp+8KeLtu2R8lijifgir3NVbN079ob8qsK6blxowQ7DM1
 jlTL16Trt+O2a0j9p1gAPt0/UPGwh6ysnVdhDsXVzjJ/2MDXQvuX5eO3bB85vuEpAR
 pQZfpuNveagwTo277SN+Db2E/OBh2g8kpo6N4jZLGWB9VABNt6LMTU++awUyEcrDlY
 w+mD1mrVhSOCKCv/q0xclu+HdiQGokZrQw8jEs4cQuBnDpAXzKB8kSHITx2s1tTpp7
 fXqICT3VEPMb101AeXIQo6OmPO9tCvPC1c7IYG8JEQF1KsaYaZ+oS58ETuUpUsAnpy
 sZmMoA24vKGpQ==
Received: from US01WXQAHTC1.internal.synopsys.com
 (us01wxqahtc1.internal.synopsys.com [10.12.238.230])
 (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 7CED8A006A;
 Mon, 29 Apr 2019 15:19:29 +0000 (UTC)
Received: from DE02WEHTCA.internal.synopsys.com (10.225.19.92) by
 US01WXQAHTC1.internal.synopsys.com (10.12.238.230) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 29 Apr 2019 08:19:28 -0700
Received: from DE02WEMBXB.internal.synopsys.com ([fe80::95ce:118a:8321:a099])
 by DE02WEHTCA.internal.synopsys.com ([::1]) with mapi id
 14.03.0415.000; Mon, 29 Apr 2019 17:19:17 +0200
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: "Ong, Boon Leong" <boon.leong.ong@intel.com>, Biao Huang
 <biao.huang@mediatek.com>, "davem@davemloft.net" <davem@davemloft.net>,
 Andrew Lunn <andrew@lunn.ch>
Thread-Topic: [PATCH 2/2] net-next: stmmac: add mdio clause 45 access from
 mac device for dwmac4
Thread-Index: AQHU/lXExFDw5bAlc0G9MPOfQZ0kMKZTHp8AgAAh5QA=
Date: Mon, 29 Apr 2019 15:19:16 +0000
Message-ID: <78EB27739596EE489E55E81C33FEC33A0B46E5B4@DE02WEMBXB.internal.synopsys.com>
References: <1556519724-1576-1-git-send-email-biao.huang@mediatek.com>
 <1556519724-1576-3-git-send-email-biao.huang@mediatek.com>
 <AF233D1473C1364ABD51D28909A1B1B75C0C27ED@pgsmsx114.gar.corp.intel.com>
In-Reply-To: <AF233D1473C1364ABD51D28909A1B1B75C0C27ED@pgsmsx114.gar.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.107.19.176]
MIME-Version: 1.0
Cc: "Kweh, Hock Leong" <hock.leong.kweh@intel.com>,
 "jianguo.zhang@mediatek.com" <jianguo.zhang@mediatek.com>, "Voon,
 Weifeng" <weifeng.voon@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "yt.shen@mediatek.com" <yt.shen@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
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

From: Ong, Boon Leong <boon.leong.ong@intel.com>
Date: Mon, Apr 29, 2019 at 16:15:42

> What is the preference of the driver maintainer here?  

Your implementation doesn't need the mdelay() so I think we should follow 
your way once you also address the review comments from Andrew and me.

Maybe you can coordinate with Biao and submit a C45 implementation that 
can be tested by both ?

Thanks,
Jose Miguel Abreu
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
