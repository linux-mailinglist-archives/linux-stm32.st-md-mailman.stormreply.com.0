Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C22DE94
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Apr 2019 11:01:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CEE6DC35E03
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Apr 2019 09:01:05 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (dc2-smtprelay2.synopsys.com
 [198.182.61.142])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F0D9C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Apr 2019 09:01:03 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8D1C3C00B0;
 Mon, 29 Apr 2019 09:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1556528460; bh=f+Cu/athXgOTZCGbWOkD1x70otBzc7nrCuSU1nPo2XY=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=ETWv8pqP/VDfCRlvwlPl6QM4T+AXFjYWarpa2e2JcO6fVTn9lVI2T2l/L5OM7f11p
 ha7P7e4QLjFqxjLUUSqvXbTeqXMc7M5jpW+91mVRhZgjvK74P4F0gOFai2p6XWYkzA
 CW1JwjzrltvOXd5mlhRvKxbtciEqkBClo4TNeDYirq/qPzFVQ4OhZzXo9FvBOWBSbw
 xZYMVLPuo0csKLsibII5U7qCLZEis4K4E1gWyb3cElcsReR7FQoCMOY0bFekXLK2sa
 ESuTklDQp3FrxSv9LLeZFAoY1y6rOaEQ5n+SDhe9DP1lNvHU/GgvZ2VbKFY7hCzJQd
 6832nLyvCB99Q==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id D0F87A0066;
 Mon, 29 Apr 2019 09:00:55 +0000 (UTC)
Received: from DE02WEHTCA.internal.synopsys.com (10.225.19.92) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 29 Apr 2019 02:00:55 -0700
Received: from DE02WEMBXB.internal.synopsys.com ([fe80::95ce:118a:8321:a099])
 by DE02WEHTCA.internal.synopsys.com ([::1]) with mapi id
 14.03.0415.000; Mon, 29 Apr 2019 11:00:53 +0200
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: Biao Huang <biao.huang@mediatek.com>, "davem@davemloft.net"
 <davem@davemloft.net>
Thread-Topic: [PATCH 1/2] net-next: stmmac: add support for hash table size
 128/256 in dwmac4
Thread-Index: AQHU/lXC7igBXFx5K0O3QkQ2RyP1CKZS1qXA
Date: Mon, 29 Apr 2019 09:00:53 +0000
Message-ID: <78EB27739596EE489E55E81C33FEC33A0B46DE20@DE02WEMBXB.internal.synopsys.com>
References: <1556519724-1576-1-git-send-email-biao.huang@mediatek.com>
 <1556519724-1576-2-git-send-email-biao.huang@mediatek.com>
In-Reply-To: <1556519724-1576-2-git-send-email-biao.huang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.107.19.176]
MIME-Version: 1.0
Cc: "jianguo.zhang@mediatek.com" <jianguo.zhang@mediatek.com>,
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
Subject: Re: [Linux-stm32] [PATCH 1/2] net-next: stmmac: add support for
 hash table size 128/256 in dwmac4
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
Date: Mon, Apr 29, 2019 at 07:35:23

> +#define GMAC_HASH_TAB(x)		(0x10 + x * 4)

You need to guard x here with parenthesis.

>  	void __iomem *ioaddr = (void __iomem *)dev->base_addr;
> -	unsigned int value = 0;
> +	unsigned int value;
> +	int i;
> +	int numhashregs = (hw->multicast_filter_bins >> 5);
> +	int mcbitslog2 = hw->mcast_bits_log2;

Reverse Christmas tree order here please.

Thanks,
Jose Miguel Abreu
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
