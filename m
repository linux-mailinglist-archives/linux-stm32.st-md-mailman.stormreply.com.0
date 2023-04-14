Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5183A6E1B64
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Apr 2023 07:00:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD2F2C69066;
	Fri, 14 Apr 2023 05:00:51 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 57857C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Apr 2023 05:00:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 195FE6437C;
 Fri, 14 Apr 2023 05:00:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2B95C433D2;
 Fri, 14 Apr 2023 05:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681448448;
 bh=CXO10PjY2/zG6b2bRTZgyHaMtJBiQFKnOvBLnoXwp3E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OtxFy53iprI5S3FaCLu1j1YLT0nHaMG8mq5nDd6a6av6Sq5yXeJBsgN9vYA7zZuaS
 yz6zr5CmXoNY59Km5LDmkHHECjVlUacCK6Dgj3qa6JRFVdxfxE5VxO2wXTa2DeNlH7
 Kwwb9OQbNnLbyZCZWmLKQWtxGT9dpnk7C6zJRIFDvNPjsz1jLBj8bnOSyU2oHprzWj
 eCNTwFxRbqkUoT+zuIiCKFvBwbeOXI5p8cmM5ZR5jMD3rzKM7FCcw36Em1r2/uGoMX
 gGkEpypLzQaO0I4uAcgiNtuT7dqAKj1TxFOoJSMH6TZvIqwpXqTIm3a/vXCe3sUH5X
 ANM9oT9ucXZQA==
Date: Thu, 13 Apr 2023 22:00:46 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Yan Wang <rk.code@outlook.com>
Message-ID: <20230413220046.267fdc31@kernel.org>
In-Reply-To: <KL1PR01MB544872920F00149E3BDDC7ECE6999@KL1PR01MB5448.apcprd01.prod.exchangelabs.com>
References: <KL1PR01MB544872920F00149E3BDDC7ECE6999@KL1PR01MB5448.apcprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Cc: open list <linux-kernel@vger.kernel.org>,
 "open list:STMMAC ETHERNET DRIVER" <netdev@vger.kernel.org>,
 "moderated list:ARM/STM32
 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>, edumazet@google.com,
 Jose Abreu <joabreu@synopsys.com>, mcoquelin.stm32@gmail.com,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, pabeni@redhat.com,
 davem@davemloft.net, "moderated
 list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net-next v3] net: stmmac:fix system hang
 when setting up tag_8021q VLAN for DSA ports
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

On Fri, 14 Apr 2023 11:07:10 +0800 Yan Wang wrote:
> The system hang because of dsa_tag_8021q_port_setup()->
> 				stmmac_vlan_rx_add_vid().
> 
> I found in stmmac_drv_probe() that cailing pm_runtime_put()
> disabled the clock.
> 
> First, when the kernel is compiled with CONFIG_PM=y,The stmmac's
> resume/suspend is active.
> 
> Secondly,stmmac as DSA master,the dsa_tag_8021q_port_setup() function
> will callback stmmac_vlan_rx_add_vid when DSA dirver starts. However,
> The system is hanged for the stmmac_vlan_rx_add_vid() accesses its
> registers after stmmac's clock is closed.
> 
> I would suggest adding the pm_runtime_resume_and_get() to the
> stmmac_vlan_rx_add_vid().This guarantees that resuming clock output
> while in use.
> 
> Fixes: b3dcb3127786 ("net: stmmac: correct clocks enabled in stmmac_vlan_rx_kill_vid()")
> Signed-off-by: Yan Wang <rk.code@outlook.com>

Happy to see you managed to work around the email server problems!

Please make sure to read this doc before posting the next version:
https://www.kernel.org/doc/html/next/process/maintainer-netdev.html
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
