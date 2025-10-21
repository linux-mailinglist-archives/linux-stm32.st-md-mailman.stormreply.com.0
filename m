Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 766E0BF92AD
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Oct 2025 01:02:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2CEE3C57A50;
	Tue, 21 Oct 2025 23:02:26 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0CE07C36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Oct 2025 23:02:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9B5DB43AFD;
 Tue, 21 Oct 2025 23:02:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD849C4CEF1;
 Tue, 21 Oct 2025 23:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761087743;
 bh=jebPbjme7P2kWR8ZBbngJLly0Zj7VzPVjORl20HOTyo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=o+Z/ffp++yk1l4a4ImWFacO3Xbayi82Qa014hran1qQITfIuDpVRQHXPUH//jEK3O
 Sp3sfTP6wr+Aq1Y1W+iTY7TZbNXdQXYG9LoZtDrQ9IR+/y0Il/eHNiT+l9EPyUYdxy
 bTWaa0VSOGq7xbLOXAehLsVxJjpdLj6DF2ea17J0pknwn7+CX0FrpuMcDUgAWRL6th
 2240836ngUv8ifxU/sqBRS23QAaocFlMDL9Hk80q3kleFhRCiz5XQXrXxWO2YPP7mM
 n0v4HGJlMLWsFe+cNsQ8CwNcColVc8bCLgNmjYkH0fYa+V48CZoJUETSScLnKaFwGB
 yC6c2+d6T9+zg==
Date: Tue, 21 Oct 2025 16:02:21 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <20251021160221.4021a302@kernel.org>
In-Reply-To: <911372f3-d941-44a8-bec2-dcc1c14d53dd@bootlin.com>
References: <20251015102725.1297985-1-maxime.chevallier@bootlin.com>
 <20251015102725.1297985-3-maxime.chevallier@bootlin.com>
 <20251017182358.42f76387@kernel.org>
 <d40cbc17-22fa-4829-8eb0-e9fd26fc54b1@bootlin.com>
 <20251020180309.5e283d90@kernel.org>
 <911372f3-d941-44a8-bec2-dcc1c14d53dd@bootlin.com>
MIME-Version: 1.0
Cc: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>,
 linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 2/3] net: stmmac: Allow
 supporting coarse adjustment mode
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

On Tue, 21 Oct 2025 10:02:01 +0200 Maxime Chevallier wrote:
> Let me know if you need more clarifications on this

The explanation was excellent, thank you. I wonder why it's designed
in such an odd way, instead of just having current_time with some
extra/fractional bits not visible in the timestamp. Sigh.

In any case, I don't feel strongly but it definitely seems to me like
the crucial distinction here is not the precision of the timestamp but
whether the user intends to dial the frequency.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
