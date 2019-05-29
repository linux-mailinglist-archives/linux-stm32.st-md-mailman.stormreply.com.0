Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4942DACD
	for <lists+linux-stm32@lfdr.de>; Wed, 29 May 2019 12:31:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99BCDC35E0A
	for <lists+linux-stm32@lfdr.de>; Wed, 29 May 2019 10:31:01 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [198.182.47.102])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7C02BC35E09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 May 2019 10:30:59 +0000 (UTC)
Received: from mailhost.synopsys.com (dc2-mailhost2.synopsys.com
 [10.12.135.162])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id ABC78C0B59;
 Wed, 29 May 2019 10:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1559125866; bh=L/zcOt3uTfx3QhugJlownAMFQSm3dP+6sx2sVmiAnyQ=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=OfcezbJfSbiSnMClNxogVHod+fr2745De2QQ7yOrncJNWbJ4Kr7y50mxqm6okcCs/
 Si0HOCdbJBNGEzsuQUYrUt4C9vmhQ9K7tdaf1g3GBjpoJ2F/i0IXtouSu0mokP22ry
 sB0FBWiv6mm25LRF6Toev9LeuvfoW1/Kj/SJyUYQ0YUCNVha/M7+cK0FsXJjDrJ5gV
 ArF+B4G5fLTtD6CsqGcK4Z3lDZlw/8YGGL5IS4oKxnM8/xqW+v2AkcA34F2gWMJ45b
 4BeKIsRZdmUNzlOCTqRAHcoWQ6SOgtOJaNEhU3/EAmBdm+eBbWLySxOkGrXS2nozbR
 kpofpnVlRFBSQ==
Received: from US01WXQAHTC1.internal.synopsys.com
 (us01wxqahtc1.internal.synopsys.com [10.12.238.230])
 (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 55124A00A3;
 Wed, 29 May 2019 10:30:49 +0000 (UTC)
Received: from DE02WEHTCA.internal.synopsys.com (10.225.19.92) by
 US01WXQAHTC1.internal.synopsys.com (10.12.238.230) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 29 May 2019 03:30:49 -0700
Received: from DE02WEMBXB.internal.synopsys.com ([fe80::95ce:118a:8321:a099])
 by DE02WEHTCA.internal.synopsys.com ([::1]) with mapi id
 14.03.0415.000; Wed, 29 May 2019 12:30:47 +0200
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: Biao Huang <biao.huang@mediatek.com>
Thread-Topic: [v5, PATCH] net: stmmac: add support for hash table size
 128/256 in dwmac4
Thread-Index: AQHVFgFMgnlWoV6tbES+hcM7ZfkqbqaB5uaw
Date: Wed, 29 May 2019 10:30:46 +0000
Message-ID: <78EB27739596EE489E55E81C33FEC33A0B9334CE@DE02WEMBXB.internal.synopsys.com>
References: <1559122268-22545-1-git-send-email-biao.huang@mediatek.com>
 <1559122268-22545-2-git-send-email-biao.huang@mediatek.com>
In-Reply-To: <1559122268-22545-2-git-send-email-biao.huang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.107.19.176]
MIME-Version: 1.0
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

From: Biao Huang <biao.huang@mediatek.com>
Date: Wed, May 29, 2019 at 10:31:08

> 1. get hash table size in hw feature reigster, and add support
> for taller hash table(128/256) in dwmac4.
> 2. only clear GMAC_PACKET_FILTER bits used in this function,
> to avoid side effect to functions of other bits.
> 
> stmmac selftests output log:
> 	ethtool -t eth0
> 	The test result is FAIL
> 	The test extra info:
> 	 1. MAC Loopback                 0
> 	 2. PHY Loopback                 -95
> 	 3. MMC Counters                 0
> 	 4. EEE                          -95
> 	 5. Hash Filter MC               0
> 	 6. Perfect Filter UC            0
> 	 7. MC Filter                    0
> 	 8. UC Filter                    0
> 	 9. Flow Control                 1

Thanks for testing, this patch looks good to me.

Do you want to check why Flow Control selftest is failing ?


Thanks,
Jose Miguel Abreu
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
