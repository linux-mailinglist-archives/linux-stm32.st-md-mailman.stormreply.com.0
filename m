Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4A72D5181
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Dec 2020 04:40:46 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 953DBC3FADB;
	Thu, 10 Dec 2020 03:40:46 +0000 (UTC)
Received: from mail.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 764ABC32E90
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Dec 2020 03:40:44 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:477:9e51:a893:b0fe:602a])
 by mail.monkeyblade.net (Postfix) with ESMTPSA id 11FDB4D259C21;
 Wed,  9 Dec 2020 19:40:42 -0800 (PST)
Date: Wed, 09 Dec 2020 19:40:41 -0800 (PST)
Message-Id: <20201209.194041.84161587477984240.davem@davemloft.net>
To: vee.khee.wong@intel.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <20201209224700.30295-1-vee.khee.wong@intel.com>
References: <20201209224700.30295-1-vee.khee.wong@intel.com>
X-Mailer: Mew version 6.8 on Emacs 27.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.2
 (mail.monkeyblade.net [0.0.0.0]); Wed, 09 Dec 2020 19:40:42 -0800 (PST)
Cc: weifeng.voon@intel.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, boon.leong.ong@intel.com, peppe.cavallaro@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 net-next 1/1] net: stmmac: allow stmmac
 to probe for C45 PHY devices
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
Date: Thu, 10 Dec 2020 06:47:00 +0800

> Assign stmmac's mdio_bus probe capabilities to MDIOBUS_C22_C45.
> This extended the probing of C45 PHY devices on the MDIO bus.
> 
> Signed-off-by: Wong Vee Khee <vee.khee.wong@intel.com>
> ---
> v2 changelog:
> - Added conditional check for gmac4.

Applied, thanks.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
