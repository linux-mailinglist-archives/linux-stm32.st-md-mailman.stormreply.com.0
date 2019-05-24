Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C215029301
	for <lists+linux-stm32@lfdr.de>; Fri, 24 May 2019 10:24:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C085C5776F
	for <lists+linux-stm32@lfdr.de>; Fri, 24 May 2019 08:24:35 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [198.182.61.142])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BAB2EC57762
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 May 2019 08:24:33 +0000 (UTC)
Received: from mailhost.synopsys.com (dc8-mailhost1.synopsys.com
 [10.13.135.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id F36FDC0131;
 Fri, 24 May 2019 08:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1558686257; bh=2d5krVqE1IwKQPL77HYD2SfvzObastRzptHMse61g4U=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=lm577U5VAIjKEPVxfUSdVuAFH8prU8fFxXAtoQ2E1Dm3/AiVFlXQRUH++PL5Wf5jI
 N+bfLEcAmg/hzWqPJPryP/GnshlqN2IwgjLkxc54Yt3ylZtEcTu7X7wG0/PeXR4JFT
 1D1tT50hBt3R9DOYf8KOWV6BaoNnCI2XW8K3xqApYXCC9YANRo0TziDXH2S7l3S6pw
 9ZWgtNbnGFc0U7TzGLW4BvXjgrWrxs3LWfHIT6rtWeh+WtZ8C2au7VDrYa/9DMbmlu
 4nbFdDy1P/ks4ttRJLy0NRTPIN/0v8F5wTEhbIuH3HRu0wcA/iJ467t/UHMnLVuLv2
 trTS1G2URXoSg==
Received: from US01WEHTC2.internal.synopsys.com
 (us01wehtc2.internal.synopsys.com [10.12.239.237])
 (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 508BFA005D;
 Fri, 24 May 2019 08:24:29 +0000 (UTC)
Received: from DE02WEHTCB.internal.synopsys.com (10.225.19.94) by
 US01WEHTC2.internal.synopsys.com (10.12.239.237) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 24 May 2019 01:24:29 -0700
Received: from DE02WEMBXB.internal.synopsys.com ([fe80::95ce:118a:8321:a099])
 by DE02WEHTCB.internal.synopsys.com ([::1]) with mapi id
 14.03.0415.000; Fri, 24 May 2019 10:24:27 +0200
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: biao huang <biao.huang@mediatek.com>
Thread-Topic: [v2, PATCH] net: stmmac: add support for hash table size
 128/256 in dwmac4
Thread-Index: AQHVCgFP5uFdcKuEVU64Pxj/Ha7yEaZ5v7KAgABABhA=
Date: Fri, 24 May 2019 08:24:26 +0000
Message-ID: <78EB27739596EE489E55E81C33FEC33A0B92CDA0@DE02WEMBXB.internal.synopsys.com>
References: <1557802843-31718-1-git-send-email-biao.huang@mediatek.com>
 <1557802843-31718-2-git-send-email-biao.huang@mediatek.com>
 <1558679617.24897.43.camel@mhfsdcap03>
In-Reply-To: <1558679617.24897.43.camel@mhfsdcap03>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.107.19.176]
MIME-Version: 1.0
Cc: "jianguo.zhang@mediatek.comi" <jianguo.zhang@mediatek.comi>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "yt.shen@mediatek.com" <yt.shen@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "boon.leong.ong@intel.com" <boon.leong.ong@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [v2,
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

From: biao huang <biao.huang@mediatek.com>
Date: Fri, May 24, 2019 at 07:33:37

> any comments about this patch?

Can you please test your series on top of this one [1] and let me know 
the output of :
# ethtool -t eth0

Just to make sure that this patch does not introduce any regressions. The 
remaining ones of the series look fine by me!

[1] 







































































































































































https://patchwork.ozlabs.org/project/netdev/list/?series=109699

Thanks,
Jose Miguel Abreu
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
