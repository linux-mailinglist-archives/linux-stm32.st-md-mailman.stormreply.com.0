Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E99B2EA49
	for <lists+linux-stm32@lfdr.de>; Thu, 30 May 2019 03:39:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B451BC36B3F
	for <lists+linux-stm32@lfdr.de>; Thu, 30 May 2019 01:39:20 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00486C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 May 2019 01:39:18 +0000 (UTC)
X-UUID: eb0d16995d464ece951d8d337d91a496-20190530
X-UUID: eb0d16995d464ece951d8d337d91a496-20190530
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1220763986; Thu, 30 May 2019 09:39:13 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Thu, 30 May 2019 09:39:11 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 30 May 2019 09:39:10 +0800
Message-ID: <1559180349.24897.72.camel@mhfsdcap03>
From: biao huang <biao.huang@mediatek.com>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Date: Thu, 30 May 2019 09:39:09 +0800
In-Reply-To: <78EB27739596EE489E55E81C33FEC33A0B9334CE@DE02WEMBXB.internal.synopsys.com>
References: <1559122268-22545-1-git-send-email-biao.huang@mediatek.com>
 <1559122268-22545-2-git-send-email-biao.huang@mediatek.com>
 <78EB27739596EE489E55E81C33FEC33A0B9334CE@DE02WEMBXB.internal.synopsys.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
Cc: "andrew@lunn.ch" <andrew@lunn.ch>,
 "jianguo.zhang@mediatek.com" <jianguo.zhang@mediatek.com>,
 "boon.leong.ong@intel.com" <boon.leong.ong@intel.com>,
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
Subject: Re: [Linux-stm32] [v5,
 PATCH] net: stmmac: add support for hash table size 128/256 in
 dwmac4
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

Hi Jose,
	Flow control is disabled in v5 commit.

	I tried "insmod stmmac flow_ctrl=1", and the output log shows self test
pass:
	ethtool -t eth0                                    
	The test result is PASS
 	The test extra info:
 	 1. MAC Loopback                 0
 	 2. PHY Loopback                 -95
 	 3. MMC Counters                 0
 	 4. EEE                          -95
 	 5. Hash Filter MC               0
 	 6. Perfect Filter UC            0
 	 7. MC Filter                    0
 	 8. UC Filter                    0
	 9. Flow Control                 0

	Is v5 OK? Should I resend a v6?

On Wed, 2019-05-29 at 10:30 +0000, Jose Abreu wrote:
> From: Biao Huang <biao.huang@mediatek.com>
> Date: Wed, May 29, 2019 at 10:31:08
> 
> > 1. get hash table size in hw feature reigster, and add support
> > for taller hash table(128/256) in dwmac4.
> > 2. only clear GMAC_PACKET_FILTER bits used in this function,
> > to avoid side effect to functions of other bits.
> > 
> > stmmac selftests output log:
> > 	ethtool -t eth0
> > 	The test result is FAIL
> > 	The test extra info:
> > 	 1. MAC Loopback                 0
> > 	 2. PHY Loopback                 -95
> > 	 3. MMC Counters                 0
> > 	 4. EEE                          -95
> > 	 5. Hash Filter MC               0
> > 	 6. Perfect Filter UC            0
> > 	 7. MC Filter                    0
> > 	 8. UC Filter                    0
> > 	 9. Flow Control                 1
> 
> Thanks for testing, this patch looks good to me.
> 
> Do you want to check why Flow Control selftest is failing ?
> 
> 
> Thanks,
> Jose Miguel Abreu

Thanks,
Biao


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
