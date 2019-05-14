Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DE21C10C
	for <lists+linux-stm32@lfdr.de>; Tue, 14 May 2019 05:39:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07366C35E0B
	for <lists+linux-stm32@lfdr.de>; Tue, 14 May 2019 03:39:06 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DFD95C35E0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 May 2019 03:39:03 +0000 (UTC)
X-UUID: d78f6c5d285847fb879771b0a7456d4a-20190514
X-UUID: d78f6c5d285847fb879771b0a7456d4a-20190514
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1403175480; Tue, 14 May 2019 11:38:53 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Tue, 14 May 2019 11:38:52 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 14 May 2019 11:38:51 +0800
Message-ID: <1557805131.24897.41.camel@mhfsdcap03>
From: biao huang <biao.huang@mediatek.com>
To: Andrew Lunn <andrew@lunn.ch>
Date: Tue, 14 May 2019 11:38:51 +0800
In-Reply-To: <20190514030016.GA19642@lunn.ch>
References: <1557800933-30759-1-git-send-email-biao.huang@mediatek.com>
 <20190514030016.GA19642@lunn.ch>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, yt.shen@mediatek.com,
 Jose Abreu <joabreu@synopsys.com>, linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, jianguo.zhang@mediatek.com,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [Linux-stm32] [v2, PATCH 0/4] fix some bugs in stmmac
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

Hi Andrew,
	Add a Fixes:tag in series v3, please review.

On Tue, 2019-05-14 at 05:00 +0200, Andrew Lunn wrote:
> On Tue, May 14, 2019 at 10:28:49AM +0800, Biao Huang wrote:
> > changes in v2:                                                                  
> >         1. update rx_tail_addr as Jose's comment                                
> >         2. changes clk_csr condition as Alex's proposition                      
> >         3. remove init lines in dwmac-mediatek, get clk_csr from dts instead.   
> 
> Hi Biao
> 
> Since these are fixes, could you provide a Fixes: tag for each one?
> 
> Thanks
> 	Andrew


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
