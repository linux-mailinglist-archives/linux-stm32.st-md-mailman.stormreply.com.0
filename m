Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B4B370374
	for <lists+linux-stm32@lfdr.de>; Sat,  1 May 2021 00:28:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88988C58D7A;
	Fri, 30 Apr 2021 22:28:05 +0000 (UTC)
Received: from mail.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A798CFAC5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Apr 2021 22:28:04 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 by mail.monkeyblade.net (Postfix) with ESMTPSA id 7EF194F7E7593;
 Fri, 30 Apr 2021 15:28:01 -0700 (PDT)
Date: Fri, 30 Apr 2021 15:28:01 -0700 (PDT)
Message-Id: <20210430.152801.713225083548143754.davem@davemloft.net>
To: michael.wei.hong.sit@intel.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <20210429084636.24752-1-michael.wei.hong.sit@intel.com>
References: <20210429084636.24752-1-michael.wei.hong.sit@intel.com>
X-Mailer: Mew version 6.8 on Emacs 27.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.2
 (mail.monkeyblade.net [0.0.0.0]); Fri, 30 Apr 2021 15:28:02 -0700 (PDT)
Cc: Jose.Abreu@synopsys.com, andrew@lunn.ch, vee.khee.wong@linux.intel.com,
 linux-kernel@vger.kernel.org, weifeng.voon@intel.com, vee.khee.wong@intel.com,
 netdev@vger.kernel.org, tee.min.tan@intel.com, linux@armlinux.org.uk,
 alexandre.torgue@foss.st.com, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, boon.leong.ong@intel.com, kuba@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 0/2] Introducing support for DWC
 xpcs Energy Efficient Ethernet
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

From: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
Date: Thu, 29 Apr 2021 16:46:34 +0800

> The goal of this patch set is to enable EEE in the xpcs so that when
> EEE is enabled, the MAC-->xpcs-->PHY have all the EEE related
> configurations enabled.
> 
> Patch 1 adds the functions to enable EEE in the xpcs and sets it to
> transparent mode.
> Patch 2 adds the callbacks to configure the xpcs EEE mode.

net-next is closed, please resubit this when it opensd back up.

Thank you.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
