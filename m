Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 874EF2D68A
	for <lists+linux-stm32@lfdr.de>; Wed, 29 May 2019 09:40:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 71D20C35E17
	for <lists+linux-stm32@lfdr.de>; Wed, 29 May 2019 07:40:05 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (dc2-smtprelay2.synopsys.com
 [198.182.61.142])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CB9C9C35E0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 May 2019 07:40:03 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 305D0C263A;
 Wed, 29 May 2019 07:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1559115584; bh=u0bHvq09qbXFfPIAKp6YPrwchkqDTwxdAG0Y1BAOgdk=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=lkJyzDP25Iq5Bo1MkV7iN3kRiuFWrghtGGqU3Xu15XD6DGkmrZI7mPOucZQPcX281
 /3XhmhGqVJEOtctZctfG9bKvjGYFF3JZjyaURA28P+YVo1r5hEcZxhm571aN26dbrd
 qw+1xHh8xk+/Iz64V1t+Iqj+fdW8AWDQq/LMlpn3o6r89wsXuo9eCrZATweQ3EaPEH
 pPKdptPsTFlx/0EnN3fG/Fx9g6hG67rKjHFhuoM7Q7IvrV6VpTRqJidrxwHCvLZalE
 QWryRDqmQIzyaAghUme5LnU+WnwIYs4PyNZzjjHS0CIH7Lnr1C5DoRQ9cTFghvDj+M
 RQLMD2AF8w2DQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 74DCBA0070;
 Wed, 29 May 2019 07:39:52 +0000 (UTC)
Received: from DE02WEHTCA.internal.synopsys.com (10.225.19.92) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 29 May 2019 00:39:51 -0700
Received: from DE02WEMBXB.internal.synopsys.com ([fe80::95ce:118a:8321:a099])
 by DE02WEHTCA.internal.synopsys.com ([::1]) with mapi id
 14.03.0415.000; Wed, 29 May 2019 09:39:49 +0200
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: Biao Huang <biao.huang@mediatek.com>
Thread-Topic: [v4, PATCH] net: stmmac: add support for hash table size
 128/256 in dwmac4
Thread-Index: AQHVFb9bD/NyYV8x/ESH/6Rc+9wGiKaBtu5A
Date: Wed, 29 May 2019 07:39:49 +0000
Message-ID: <78EB27739596EE489E55E81C33FEC33A0B932F51@DE02WEMBXB.internal.synopsys.com>
References: <1559093924-7791-1-git-send-email-biao.huang@mediatek.com>
 <1559093924-7791-2-git-send-email-biao.huang@mediatek.com>
In-Reply-To: <1559093924-7791-2-git-send-email-biao.huang@mediatek.com>
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
Subject: Re: [Linux-stm32] [v4,
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
Date: Wed, May 29, 2019 at 02:38:44

>  	} else if (!netdev_mc_empty(dev)) {
> -		u32 mc_filter[2];
> +		u32 mc_filter[8];
>  		struct netdev_hw_addr *ha;

The reverse christmas tree also applies here.

I also see some coding-style errors, like missing line breaks, etc... 
that checkpatch should complain about.

Also, please run this patch against stmmac selftests and add the output 
to the commit log.

Thanks,
Jose Miguel Abreu
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
