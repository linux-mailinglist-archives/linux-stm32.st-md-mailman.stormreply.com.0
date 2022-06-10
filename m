Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D86545BE3
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jun 2022 07:52:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C6C8C5EC76;
	Fri, 10 Jun 2022 05:52:41 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4AD31C5E2CC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jun 2022 05:52:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 03BD761D99;
 Fri, 10 Jun 2022 05:52:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A97ABC3411B;
 Fri, 10 Jun 2022 05:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654840357;
 bh=9zkxBIOVn1jqpEIn3oRNOtYHxAz8CrVcwvYLEOX+hUQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Hdh7bWVg2Kn+IOmG8VDaHsYzXzO5C8DP99mi7sI/gyXTsydvAp7Rp1ScECqRxQFMR
 3jv4cwtrL13VLFj8F9i4WpZCMcqsE4jC/1lIMMQAi1Mm4ewszyg/CflVwHsmX99B/W
 2NxwXQruv3/CCnZYo2LoujCOhCGHUJ3P15x74TlXbn4VfbarmvG6ShTWuG8EXBGjUA
 egeV837WAYF588soBoZtSrFrJj5y6xlQe/AYip5rTPmqHITwGB4E3PLhDJAjRiNU8J
 VctdO0qOhBgUJ0ZaXiFeSTBuBu4We+xzTSPr0HlTk/lWs5wgcdeO6T8z5H8L07edNo
 KRFFZPln4bsvg==
Date: Thu, 9 Jun 2022 22:52:35 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Ong Boon Leong <boon.leong.ong@intel.com>
Message-ID: <20220609225235.4904ea56@kernel.org>
In-Reply-To: <20220610033610.114084-1-boon.leong.ong@intel.com>
References: <20220610033610.114084-1-boon.leong.ong@intel.com>
MIME-Version: 1.0
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, Emilio Riva <emilio.riva@ericsson.com>,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Vivien Didelot <vivien.didelot@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v3 0/7] pcs-xpcs,
 stmmac: add 1000BASE-X AN for network switch
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

On Fri, 10 Jun 2022 11:36:03 +0800 Ong Boon Leong wrote:
> Thanks Russell King [1] and Andrew Lunn [2] for v1 review and suggestion.
> Since then, I have worked on refactoring the implementation as follow:
> 
> My apology in sending v2 patch series that miss 1/7 patch, please ignore.

Please wait 24h before posting v3, as is documented to be our process:

https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html#i-have-received-review-feedback-when-should-i-post-a-revised-version-of-the-patches

In the meantime try to build each patch with W=1 C=1 flags set and fix
the build errors and warnings you're introducing. 

Thanks!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
