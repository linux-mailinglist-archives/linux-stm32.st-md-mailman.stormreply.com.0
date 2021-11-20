Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8E8457AFA
	for <lists+linux-stm32@lfdr.de>; Sat, 20 Nov 2021 04:58:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62E45C5E2CC
	for <lists+linux-stm32@lfdr.de>; Sat, 20 Nov 2021 03:58:56 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9EDDAC57189
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 20 Nov 2021 03:58:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B95466069B;
 Sat, 20 Nov 2021 03:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637380733;
 bh=mXqChChKsjSCPnEkiDTHU/cG+Or7VNbeDM9auKDL9R8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bk0m+13ZxNA5mwpJx1vevh3NucZD8hzAA8UxE41a69GYzcZxMfmnA86yDSNuvjgeF
 SR1cQANiO5Bt7TPZT13ji+8ykVN48YR0Ml5MqyjSNb3TleCLeYKrhnIIFekjsNrz1G
 +cn/xcOUCVLcM9Unwi+evNHFI/Jj3M3Bi0bB8ydQF0dqabC36kkMSCl4cKPYCHCF2v
 PFO+33eibpW6iY8UhYRtcQ4bTe96Xs4NORTbf3cX1fXGyXLV6lpl2lU6PlOakL/Zwy
 Bgf7N0dIYTGOTCSoditSvdhd9aUQc2uJTY8t3fTZm6rCFnl0qYEt8HopwsypM7sAfq
 pnprrOwaN905Q==
Date: Fri, 19 Nov 2021 19:58:51 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Message-ID: <20211119195851.2181aab3@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20211119230542.3402726-1-vladimir.oltean@nxp.com>
References: <20211119230542.3402726-1-vladimir.oltean@nxp.com>
MIME-Version: 1.0
Cc: Yannick Vignon <yannick.vignon@nxp.com>, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, Kurt Kanzenbach <kurt@linutronix.de>,
 netdev@vger.kernel.org, Xiaoliang Yang <xiaoliang.yang_1@nxp.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Michael Olbrich <m.olbrich@pengutronix.de>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: retain PTP clock time
 during SIOCSHWTSTAMP ioctls
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

On Sat, 20 Nov 2021 01:05:42 +0200 Vladimir Oltean wrote:
> Currently, when user space emits SIOCSHWTSTAMP ioctl calls such as
> enabling/disabling timestamping or changing filter settings, the driver
> reads the current CLOCK_REALTIME value and programming this into the
> NIC's hardware clock. This might be necessary during system
> initialization, but at runtime, when the PTP clock has already been
> synchronized to a grandmaster, a reset of the timestamp settings might
> result in a clock jump. Furthermore, if the clock is also controlled by
> phc2sys in automatic mode (where the UTC offset is queried from ptp4l),
> that UTC-to-TAI offset (currently 37 seconds in 2021) would be
> temporarily reset to 0, and it would take a long time for phc2sys to
> readjust so that CLOCK_REALTIME and the PHC are apart by 37 seconds
> again.
> 
> To address the issue, we introduce a new function called
> stmmac_init_tstamp_counter(), which gets called during ndo_open().
> It contains the code snippet moved from stmmac_hwtstamp_set() that
> manages the time synchronization. Besides, the sub second increment
> configuration is also moved here since the related values are hardware
> dependent and runtime invariant.
> 
> Furthermore, the hardware clock must be kept running even when no time
> stamping mode is selected in order to retain the synchronized time base.
> That way, timestamping can be enabled again at any time only with the
> need to compensate the clock's natural drifting.
> 
> As a side effect, this patch fixes the issue that ptp_clock_info::enable
> can be called before SIOCSHWTSTAMP and the driver (which looks at
> priv->systime_flags) was not prepared to handle that ordering.

Makes build fail:

ERROR: modpost: "stmmac_init_tstamp_counter" [drivers/net/ethernet/stmicro/stmmac/stmmac-platform.ko] undefined!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
