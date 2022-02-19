Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D884BC55A
	for <lists+linux-stm32@lfdr.de>; Sat, 19 Feb 2022 05:33:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6CC4C60474;
	Sat, 19 Feb 2022 04:33:33 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E90E2C23E53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 19 Feb 2022 04:33:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 329B9B81EF8;
 Sat, 19 Feb 2022 04:33:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 548C4C340EC;
 Sat, 19 Feb 2022 04:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645245209;
 bh=Rs4cMPN9TM4IX/vQWrInXDPL6gf4BDqIhlJMXPdzig4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tnRqV7FW16sCEwlmc039O5/sVLO6OtKxIdSxWPMTw9C1VWTL6uZw+6/6rf8C3Rr+R
 Kdi6t/WHyF0xICWUasHPw+4wn1PhMz0c3HRijAgWVN9Zusq3OfRqmMufrw10Bfi7pQ
 AwtM9aeciKHbL7Xn3q3raVYV24cdJwbcG033m23dXuVuo6Ggp4YBZQL8mtY5ZcYYaG
 w+2LzSl5KFbB6CO42N2TtWP+aDVB3QGerlA50BiqyHUzyXrnOXYnpub6CZYYoeAqiM
 hqt2LNCWhTBTDLVPs61sQ8JmSgbTDf4YVImbv8qtqo3k02kmmO97sZHcwXP3snNfdx
 g5Um/TFMgvZRg==
Date: Fri, 18 Feb 2022 20:33:28 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Message-ID: <20220218203328.20318a68@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20220218104504.62sfwbc4yoaceqdw@pengutronix.de>
References: <20220217145527.2696444-1-vincent.whitchurch@axis.com>
 <20220217203604.39e318d0@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <20220218104504.62sfwbc4yoaceqdw@pengutronix.de>
MIME-Version: 1.0
Cc: Srinivas Kandagatla <srinivas.kandagatla@st.com>, netdev@vger.kernel.org,
 Vincent Whitchurch <vincent.whitchurch@axis.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 kernel@axis.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Lars Persson <larper@axis.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Enable NAPI before
	interrupts go live
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

On Fri, 18 Feb 2022 11:45:04 +0100 Marc Kleine-Budde wrote:
> >  - request irq
> >  - mask irq  
> 
> I think you can merge these, to avoid a race condition, see:
> 
> | cbe16f35bee6 genirq: Add IRQF_NO_AUTOEN for request_irq/nmi()

GTK, finally someone implemented it! :)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
