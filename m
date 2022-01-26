Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5956F49CA4B
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jan 2022 14:03:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 094E7C5F1EC;
	Wed, 26 Jan 2022 13:03:11 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9C22C5718D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jan 2022 13:03:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ACCB061A3F;
 Wed, 26 Jan 2022 13:03:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E8E8C340E3;
 Wed, 26 Jan 2022 13:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643202188;
 bh=I/sYGDx/XyXGayEEK+UDUv1Ro8EyPNYU+/FL/SgC0Sg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g6G36H1ZimcP9WAjchnqyB2PyL54aAfm39ckwcon06tV5/ptTzm/2apZmy/O6RjNf
 TFEUhRiJwoRCpD4Z+lJo5MrDdRbAk7rfrCPrA/BjsxASCDl/GvY31eU9XTdj9bFwbQ
 9XYHDFnyEOlJjgFFsf8fLqIPEluFCORQGtZthfBx1CfdeeoaPu+11NH8FctU0bcHdy
 C2inkqMMlPQLRzyuX63QBHaZAmKKr0nacprXc9NiQApbL/OGlennI0xjUhQue2PWa9
 Z/rgytKkbx7fDkTRiVB7vw+oIK7MkczCy2N4LuxIBB1xqbNuwm1TNuBBTdM7DvLN7b
 F3JRQOB1zwVdg==
Date: Wed, 26 Jan 2022 20:55:22 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <YfFEulZJKzuRQfeG@xhacker>
References: <20220123141245.1060-1-jszhang@kernel.org>
 <Ye15va7tFWMgKPEE@lunn.ch> <Ye19bHxcQ5Plx0v9@xhacker>
 <Ye2SznI2rNKAUDIq@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Ye2SznI2rNKAUDIq@lunn.ch>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
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

On Sun, Jan 23, 2022 at 06:39:26PM +0100, Andrew Lunn wrote:
> > I think this is a common issue because the MAC needs phy's RXC for RX
> > logic. But it's better to let other stmmac users verify. The issue
> > can easily be reproduced on platforms with PHY_POLL external phy.
> 
> What is the relevance of PHY polling here? Are you saying if the PHY
> is using interrupts you do not see this issue?

I tried these two days, if the PHY is using interrupts, I can't
reproduce the issue. It looks a bit more complex. Any suggestions?

Thanks in advance
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
