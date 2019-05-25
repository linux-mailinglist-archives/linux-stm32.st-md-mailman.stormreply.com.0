Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F4E2A5F3
	for <lists+linux-stm32@lfdr.de>; Sat, 25 May 2019 20:02:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9E7CC2907D
	for <lists+linux-stm32@lfdr.de>; Sat, 25 May 2019 18:02:56 +0000 (UTC)
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA6A4C32EAB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 May 2019 18:02:55 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::3d8])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 282C814FC9282;
 Sat, 25 May 2019 11:02:53 -0700 (PDT)
Date: Sat, 25 May 2019 11:02:52 -0700 (PDT)
Message-Id: <20190525.110252.292904127953775877.davem@davemloft.net>
To: biao.huang@mediatek.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <1558679169-26752-1-git-send-email-biao.huang@mediatek.com>
References: <1558679169-26752-1-git-send-email-biao.huang@mediatek.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Sat, 25 May 2019 11:02:53 -0700 (PDT)
Cc: jianguo.zhang@mediatek.comi, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, boon.leong.ong@intel.com, yt.shen@mediatek.com,
 joabreu@synopsys.com, linux-mediatek@lists.infradead.org,
 mcoquelin.stm32@gmail.com, matthias.bgg@gmail.com, peppe.cavallaro@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [v4, PATCH 0/3] fix some bugs in stmmac
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
Date: Fri, 24 May 2019 14:26:06 +0800

> changes in v4:                                                                  
>         since MTL_OPERATION_MODE write back issue has be fixed in the latest driver,
> remove original patch#3                                                         
>                                                                                 
> changes in v3:                                                                  
>         add a Fixes:tag for each patch                                          
>                                                                                 
> changes in v2:                                                                  
>         1. update rx_tail_addr as Jose's comment                                
>         2. changes clk_csr condition as Alex's proposition                      
>         3. remove init lines in dwmac-mediatek, get clk_csr from dts instead.   
>                                                                                 
> v1:                                                                             
> This series fix some bugs in stmmac driver                                      
> 3 patches are for common stmmac or dwmac4:                                      
>         1. update rx tail pointer to fix rx dma hang issue.                     
>         2. change condition for mdc clock to fix csr_clk can't be zero issue.   
>         3. write the modified value back to MTL_OPERATION_MODE.                 
> 1 patch is for dwmac-mediatek:                                                  
>         modify csr_clk value to fix mdio read/write fail issue for dwmac-mediatek

Series applied, thanks.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
