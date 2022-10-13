Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD515FD1BB
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Oct 2022 02:45:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DFECAC640F2;
	Thu, 13 Oct 2022 00:45:12 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8085C03FD5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Oct 2022 00:45:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A039D616DC;
 Thu, 13 Oct 2022 00:45:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 217F6C43470;
 Thu, 13 Oct 2022 00:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665621908;
 bh=BY6NSNTsGspisONHzJBR5FbCDR3j3NmpXA4EUtKNq7k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=h39oegE9/yYg4mdGObUEHdbBB1VHfmT4ffOkxp0632dgmwqJ6djgYrneUd2A3PXGz
 26g2y6oXX14aMeuxRKHQ8e4CMl25pwTPXxw5NDPzcSUKgFqxtclUjhH7mLuLGnQNzx
 6HujuDZYXjMKZ/MPfCjW3jowQmo48A6shj66kg0UTCIcKnCc22L9DxNVhHp6pbDCev
 tlhB+KHLLzQe8ldacaT0cqYzx9rx1vzrBfPJ0SoU7v8Uh4CULMYfNwHe7xtZhV0Pbv
 xNeAvgJvmaelU9ZT4hqsqIqloJ/zJ8WhoMKrqwEhwHNt5yZ7OkyZpsnvCz38w/6tC6
 KOnqddIhMD15A==
Date: Wed, 12 Oct 2022 17:45:07 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Message-ID: <20221012174507.1938d533@kernel.org>
In-Reply-To: <20221010204827.153296-3-shenwei.wang@nxp.com>
References: <20221010204827.153296-1-shenwei.wang@nxp.com>
 <20221010204827.153296-3-shenwei.wang@nxp.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, imx@lists.linux.dev, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v4 2/2] net: stmmac: Enable mac_managed_pm
 phylink config
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

On Mon, 10 Oct 2022 15:48:27 -0500 Shenwei Wang wrote:
> Enable the mac_managed_pm configuration in the phylink_config
> structure to avoid the kernel warning during system resume.
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>

Could you add a Fixes tag pointing to where the warning first appeared?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
