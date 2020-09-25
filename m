Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6481727951A
	for <lists+linux-stm32@lfdr.de>; Sat, 26 Sep 2020 01:49:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C9A7C3FAFF;
	Fri, 25 Sep 2020 23:49:37 +0000 (UTC)
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60F49C3FADF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Sep 2020 23:49:35 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 2168213BA091A;
 Fri, 25 Sep 2020 16:32:46 -0700 (PDT)
Date: Fri, 25 Sep 2020 16:49:32 -0700 (PDT)
Message-Id: <20200925.164932.397279241814019073.davem@davemloft.net>
To: vee.khee.wong@intel.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200925095406.27834-1-vee.khee.wong@intel.com>
References: <20200925095406.27834-1-vee.khee.wong@intel.com>
X-Mailer: Mew version 6.8 on Emacs 27.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [2620:137:e000::1:9]);
 Fri, 25 Sep 2020 16:32:46 -0700 (PDT)
Cc: mgross@linux.intel.com, weifeng.voon@intel.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, chen.yong.seow@intel.com, joabreu@synopsys.com,
 sadhishkhanna.vijaya.balan@intel.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, boon.leong.ong@intel.com, peppe.cavallaro@st.com,
 andriy.shevchenko@linux.intel.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: Fix clock handling
	on remove path
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

From: Wong Vee Khee <vee.khee.wong@intel.com>
Date: Fri, 25 Sep 2020 17:54:06 +0800

> While unloading the dwmac-intel driver, clk_disable_unprepare() is
> being called twice in stmmac_dvr_remove() and
> intel_eth_pci_remove(). This causes kernel panic on the second call.
> 
> Removing the second call of clk_disable_unprepare() in
> intel_eth_pci_remove().
> 
> Fixes: 09f012e64e4b ("stmmac: intel: Fix clock handling on error and remove paths")
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Voon Weifeng <weifeng.voon@intel.com>
> Signed-off-by: Wong Vee Khee <vee.khee.wong@intel.com>

Applied, thanks.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
