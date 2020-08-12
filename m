Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6070242FED
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Aug 2020 22:13:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67592C36B26;
	Wed, 12 Aug 2020 20:13:52 +0000 (UTC)
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E487DC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Aug 2020 20:13:49 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 51A4012905D74;
 Wed, 12 Aug 2020 12:57:01 -0700 (PDT)
Date: Wed, 12 Aug 2020 13:13:46 -0700 (PDT)
Message-Id: <20200812.131346.1049273548567735486.davem@davemloft.net>
To: noodles@earth.li
From: David Miller <davem@davemloft.net>
In-Reply-To: <cover.1597260787.git.noodles@earth.li>
References: <cover.1597260787.git.noodles@earth.li>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Wed, 12 Aug 2020 12:57:01 -0700 (PDT)
Cc: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, peppe.cavallaro@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 0/2] net: stmmac: Fix multicast filter
	on IPQ806x
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

From: Jonathan McDowell <noodles@earth.li>
Date: Wed, 12 Aug 2020 20:36:54 +0100

> This pair of patches are the result of discovering a failure to
> correctly receive IPv6 multicast packets on such a device (in particular
> DHCPv6 requests and RA solicitations). Putting the device into
> promiscuous mode, or allmulti, both resulted in such packets correctly
> being received. Examination of the vendor driver (nss-gmac from the
> qsdk) shows that it does not enable the multicast filter and instead
> falls back to allmulti.
> 
> Extend the base dwmac1000 driver to fall back when there's no suitable
> hardware filter, and update the ipq806x platform to request this.

Series applied, thank you.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
