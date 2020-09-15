Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B59E26B22B
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Sep 2020 00:43:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03030C3FADF;
	Tue, 15 Sep 2020 22:43:09 +0000 (UTC)
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E70FC3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Sep 2020 22:43:06 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id B438D1369E725;
 Tue, 15 Sep 2020 15:26:16 -0700 (PDT)
Date: Tue, 15 Sep 2020 15:43:02 -0700 (PDT)
Message-Id: <20200915.154302.373083705277550666.davem@davemloft.net>
To: vee.khee.wong@intel.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200915012840.31841-1-vee.khee.wong@intel.com>
References: <20200915012840.31841-1-vee.khee.wong@intel.com>
X-Mailer: Mew version 6.8 on Emacs 27.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [2620:137:e000::1:9]);
 Tue, 15 Sep 2020 15:26:17 -0700 (PDT)
Cc: weifeng.voon@intel.com, Joao.Pinto@synopsys.com, arnd@arndb.de,
 netdev@vger.kernel.org, linux@armlinux.org.uk, linux-kernel@vger.kernel.org,
 chen.yong.seow@intel.com, joabreu@synopsys.com,
 sadhishkhanna.vijaya.balan@intel.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, boon.leong.ong@intel.com, peppe.cavallaro@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 0/3] net: stmmac: Add ethtool
 support for get|set channels
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
Date: Tue, 15 Sep 2020 09:28:37 +0800

> This patch set is to add support for user to get or set Tx/Rx channel
> via ethtool. There are two patches that fixes bug introduced on upstream
> in order to have the feature work.
> 
> Tested on Intel Tigerlake Platform.

Series applied, thank you.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
