Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8D049C236
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jan 2022 04:40:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B782DC5F1D5;
	Wed, 26 Jan 2022 03:40:43 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A623AC5EC76
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jan 2022 03:40:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 00670B81074;
 Wed, 26 Jan 2022 03:40:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68B31C340E3;
 Wed, 26 Jan 2022 03:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643168439;
 bh=YILwlodCyd4mdH5DL4bOcMKvZ745VRwUzzjYehTweJ0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=b2ywctUMiZxNPwLdRX94rGjTss4FNogBgcpctz7UZGex59ZECtuAheH6P3tkitkC+
 6EsGv2IsdX4ns8jcim7ao56cBbOF+ffvhEqLFg9uDuAXIZ2I8ViWdNENAKk2ikeDMP
 xbmwiYST2aqX06zI9rUx6c4Oj0+NzT+zGJT9OIoRH+SsuBrX3T19kOfzmK3A1+e/fI
 rFsJAt+/JuTTv4AzPhvC72v9uqgtJrnpeEuHMLuNG05Pbm+HauhS8XZFCytzC6EZCn
 Lwm4TIc9/SolMY5aGrqfhnCXqB8iKqijr+EqEcJ+RGxPumv+ucypOBHaIWP4dlh6aT
 BEZo20uNoHpcg==
Date: Tue, 25 Jan 2022 19:40:38 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Message-ID: <20220125194038.4bfa2007@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
In-Reply-To: <20220123141245.1060-1-jszhang@kernel.org>
References: <20220123141245.1060-1-jszhang@kernel.org>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, "David S
 . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: don't stop RXC during LPI
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

On Sun, 23 Jan 2022 22:12:45 +0800 Jisheng Zhang wrote:
> I met can't receive rx pkt issue with below steps:
> 0.plug in ethernet cable then boot normal and get ip from dhcp server
> 1.quickly hotplug out then hotplug in the ethernet cable
> 2.trigger the dhcp client to renew lease
> 
> tcpdump shows that the request tx pkt is sent out successfully,
> but the mac can't receive the rx pkt.
> 
> The issue can easily be reproduced on platforms with PHY_POLL external
> phy. If we don't allow the phy to stop the RXC during LPI, the issue
> is gone. I think it's unsafe to stop the RXC during LPI because the mac
> needs RXC clock to support RX logic.
> 
> And the 2nd param clk_stop_enable of phy_init_eee() is a bool, so use
> false instead of 0.

FWIW this is marked Changes Requested in pw, TBH I'm not sure what 
the conclusion is but if the patch is good please try to fold the
information requested in the discussion into the commit msg and repost.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
