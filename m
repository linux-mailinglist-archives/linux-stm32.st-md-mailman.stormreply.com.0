Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2595198C
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Jun 2019 19:29:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E7E1C5CB36
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Jun 2019 17:29:33 +0000 (UTC)
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0FBFDC5CB35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jun 2019 17:29:31 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 5520C15065090;
 Mon, 24 Jun 2019 10:29:28 -0700 (PDT)
Date: Mon, 24 Jun 2019 10:29:27 -0700 (PDT)
Message-Id: <20190624.102927.1268781741493594465.davem@davemloft.net>
To: megous@megous.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <20190620134748.17866-1-megous@megous.com>
References: <20190620134748.17866-1-megous@megous.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Mon, 24 Jun 2019 10:29:29 -0700 (PDT)
Cc: mark.rutland@arm.com, joabreu@synopsys.com, devicetree@vger.kernel.org,
 maxime.ripard@bootlin.com, netdev@vger.kernel.org, wens@csie.org,
 jernej.skrabec@gmail.com, linux-kernel@vger.kernel.org, airlied@linux.ie,
 linux-sunxi@googlegroups.com, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch, peppe.cavallaro@st.com,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v7 0/6] Add support for Orange Pi 3
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

From: megous@megous.com
Date: Thu, 20 Jun 2019 15:47:42 +0200

> From: Ondrej Jirman <megous@megous.com>
> 
> This series implements support for Xunlong Orange Pi 3 board.
> 
> - ethernet support (patches 1-3)
> - HDMI support (patches 4-6)
> 
> For some people, ethernet doesn't work after reboot (but works on cold
> boot), when the stmmac driver is built into the kernel. It works when
> the driver is built as a module. It's either some timing issue, or power
> supply issue or a combination of both. Module build induces a power
> cycling of the phy.
> 
> I encourage people with this issue, to build the driver into the kernel,
> and try to alter the reset timings for the phy in DTS or
> startup-delay-us and report the findings.

This is a mixture of networking and non-networking changes so it really
can't go through my tree.

I wonder how you expect this series to be merged?

Thanks.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
