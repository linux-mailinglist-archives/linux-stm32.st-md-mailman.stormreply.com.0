Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0BA1C0CF9
	for <lists+linux-stm32@lfdr.de>; Fri,  1 May 2020 06:00:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CBDF1C36B0F;
	Fri,  1 May 2020 04:00:43 +0000 (UTC)
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8564FC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 May 2020 04:00:41 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 09781127806CC;
 Thu, 30 Apr 2020 21:00:38 -0700 (PDT)
Date: Thu, 30 Apr 2020 21:00:37 -0700 (PDT)
Message-Id: <20200430.210037.2294375960459896634.davem@davemloft.net>
To: andriy.shevchenko@linux.intel.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200429150932.17927-1-andriy.shevchenko@linux.intel.com>
References: <20200429150932.17927-1-andriy.shevchenko@linux.intel.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Thu, 30 Apr 2020 21:00:38 -0700 (PDT)
Cc: weifeng.voon@intel.com, netdev@vger.kernel.org, joabreu@synopsys.com,
 boon.leong.ong@intel.com, peppe.cavallaro@st.com,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v1] stmmac: intel: Fix kernel crash due to
 wrong error path
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

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Wed, 29 Apr 2020 18:09:32 +0300

> Unfortunately sometimes ->probe() may fail. The commit b9663b7ca6ff
> ("net: stmmac: Enable SERDES power up/down sequence")
> messed up with error handling and thus:
> 
> [   12.811311] ------------[ cut here ]------------
> [   12.811993] kernel BUG at net/core/dev.c:9937!
> 
> Fix this by properly crafted error path.
> 
> Fixes: b9663b7ca6ff ("net: stmmac: Enable SERDES power up/down sequence")
> Cc: Voon Weifeng <weifeng.voon@intel.com>
> Cc: Ong Boon Leong <boon.leong.ong@intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
