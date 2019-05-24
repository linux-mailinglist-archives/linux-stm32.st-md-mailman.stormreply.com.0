Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0972948E
	for <lists+linux-stm32@lfdr.de>; Fri, 24 May 2019 11:24:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D0B7C055FE
	for <lists+linux-stm32@lfdr.de>; Fri, 24 May 2019 09:24:40 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (dc2-smtprelay2.synopsys.com
 [198.182.61.142])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 244EDC055FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 May 2019 09:24:38 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 667C4C0137;
 Fri, 24 May 2019 09:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1558689862; bh=AVU6oZcHCROGnmkLrcWIelylachVoYTTTsYDpq5qRGE=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=D6N1xI62ExfnhyeopDP2KepGh9+jcTsoEdBgNxKAB8EyL2fnL9XREOHFmEEC3hEsi
 +sV5eTIn2eDF0X+zGLIclMhVbRmsCn1mnXSf8b6YXmO+JCj257l1HAgFEsprkN4IBi
 vaW9W8eRRXX+nnYrR92XoZ1bY6GQaFnMeybI/KjollFkG5VPauhnhwClD/xulaMaUJ
 mW55DXwY3yipCq7jOQRVF9ySTeXKTPNqceFkFoWHyrAVq6/Kky44Bhc3rbPQ5X0znp
 yZC8zLePl0nck3VrGBfDDtBFePDEP5Xy2yj/Mg+RJWCkK2qYWId9+WkoKX1J3JhSKy
 mKwbWs8/Mpt7g==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 5716EA0070;
 Fri, 24 May 2019 09:24:34 +0000 (UTC)
Received: from DE02WEHTCB.internal.synopsys.com (10.225.19.94) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 24 May 2019 02:24:33 -0700
Received: from DE02WEMBXB.internal.synopsys.com ([fe80::95ce:118a:8321:a099])
 by DE02WEHTCB.internal.synopsys.com ([::1]) with mapi id
 14.03.0415.000; Fri, 24 May 2019 11:24:31 +0200
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: biao huang <biao.huang@mediatek.com>, Jose Abreu <Jose.Abreu@synopsys.com>
Thread-Topic: [v2, PATCH] net: stmmac: add support for hash table size
 128/256 in dwmac4
Thread-Index: AQHVCgFP5uFdcKuEVU64Pxj/Ha7yEaZ5v7KAgABABhD//+D6AIAAL/0w
Date: Fri, 24 May 2019 09:24:31 +0000
Message-ID: <78EB27739596EE489E55E81C33FEC33A0B92D26F@DE02WEMBXB.internal.synopsys.com>
References: <1557802843-31718-1-git-send-email-biao.huang@mediatek.com>
 <1557802843-31718-2-git-send-email-biao.huang@mediatek.com>
 <1558679617.24897.43.camel@mhfsdcap03>
 <78EB27739596EE489E55E81C33FEC33A0B92CDA0@DE02WEMBXB.internal.synopsys.com>
 <1558686704.24897.45.camel@mhfsdcap03>
In-Reply-To: <1558686704.24897.45.camel@mhfsdcap03>
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
Date: Fri, May 24, 2019 at 09:31:44

> On Fri, 2019-05-24 at 08:24 +0000, Jose Abreu wrote:
> > From: biao huang <biao.huang@mediatek.com>
> > Date: Fri, May 24, 2019 at 07:33:37
> > 
> > > any comments about this patch?
> > 
> > Can you please test your series on top of this one [1] and let me know 
> > the output of :
> > # ethtool -t eth0
> "ethtol -T eth0"? This patch only affect hash table filter, seems no
> relation to timestamp.
> > 
> > Just to make sure that this patch does not introduce any regressions. The 
> > remaining ones of the series look fine by me!
> > 
> > [1] 
> which one? Did I miss anything here?

Sorry, my mail client tried to wrap the long link and ended up in a 
loooong email.

[1] https://patchwork.ozlabs.org/project/netdev/list/?series=109699

Thanks,
Jose Miguel Abreu
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
