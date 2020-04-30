Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BE71C06FB
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Apr 2020 21:51:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F23CBC36B0E;
	Thu, 30 Apr 2020 19:51:50 +0000 (UTC)
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C763AC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Apr 2020 19:51:49 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 440621289FD3C;
 Thu, 30 Apr 2020 12:51:47 -0700 (PDT)
Date: Thu, 30 Apr 2020 12:51:46 -0700 (PDT)
Message-Id: <20200430.125146.1288195412515001021.davem@davemloft.net>
To: andriy.shevchenko@linux.intel.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200430150254.34565-1-andriy.shevchenko@linux.intel.com>
References: <20200430150254.34565-1-andriy.shevchenko@linux.intel.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Thu, 30 Apr 2020 12:51:47 -0700 (PDT)
Cc: peppe.cavallaro@st.com, netdev@vger.kernel.org, joabreu@synopsys.com,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v3 0/7] stmmac: intel: Fixes and cleanups
 after dwmac-intel split
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
Date: Thu, 30 Apr 2020 18:02:47 +0300

> Seems the split of dwmac-intel didn't go well and on top of that new
> functionality in the driver has not been properly tested.
> 
> Patch 1 fixes a nasty kernel crash due to missed error handling.
> Patches 2 and 3 fix the incorrect split (clock and PCI bar handling).
> 
> Patch 4 converts driver to use new PCI IRQ allocation API.
> 
> The rest is a set of clean ups that may have been done in the initial
> submission.
> 
> Series has been tested on couple of Elkhart Lake platforms with different
> behaviour of ethernet hardware.
> 
> Changelog v3:
> - added the cover letter (David)
> - appended separate fix as a first patch
> - marked patches 2 and 3 with Fixes tag

Series applied, thank you.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
