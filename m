Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 20ADBC172C2
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Oct 2025 23:19:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C55B2C62D22;
	Tue, 28 Oct 2025 22:19:29 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2812C62D21
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Oct 2025 22:19:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C2FAC6026D;
 Tue, 28 Oct 2025 22:19:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C785C4CEE7;
 Tue, 28 Oct 2025 22:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761689967;
 bh=yzrt0FYCMLcKcOf8fkJpIi0sW/mpdZ4QYj6NRuWqX6Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ETgH2vqRVFELtRx6mfXR2jj78Pj7OJ1UhP25bGPbjy2Z3qr2B3AWDbQb6Ee91di0G
 0EiK455ipRcrCx/Eum8WD9d85EQ388CwVjcM3c6v2RglaQasBguyLUSeFKC4sqyJHl
 dlMoHSz+6nskNWpFaPgK6O36SLGauKkvnuPk2Lvfi4n/ybY+k2tZS7XQ92I9hqBa80
 fjeYtAQUUV7WqOjnMoUPlUFIyssJiJ+6JoXbUinYWIQOz7fN5g0/RSSPTi3H9cky4u
 SdKAgRuxqEQSO681n+jsQIgC6QjY/QAbb8GVUaCxobtFeFivoryWYLc3Hzp4WX+MYZ
 la612AfZ5BfZQ==
Date: Tue, 28 Oct 2025 15:19:25 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <20251028151925.12784dca@kernel.org>
In-Reply-To: <20251024070720.71174-3-maxime.chevallier@bootlin.com>
References: <20251024070720.71174-1-maxime.chevallier@bootlin.com>
 <20251024070720.71174-3-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Cc: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 2/2] net: stmmac: Add a
 devlink attribute to control timestamping mode
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

Sorry didn't get to review this in time.

On Fri, 24 Oct 2025 09:07:18 +0200 Maxime Chevallier wrote:
> +   * - ``ts_coarse``

This is not a great name IMHO. Is "coarse" from the PRM?
It's the increment that's coarse, right? Not the timestamp
This naming confuses me greatly.

> +     - Boolean
> +     - runtime
> +     - Enable the Coarse timestamping mode. In Coarse mode, the ptp clock is
> +       expected to be updated through an external PPS input, but the subsecond

I guess the definition of "PPS input" got diluted but technically it
means Pulse Per Second, right? Here IIUC we need an actual 50MHz clock
fed in?

> +       increment used for timestamping is set to 1/ptp_clock_rate. In Fine mode
> +       (i.e. Coarse mode == false), the ptp clock frequency is adjusted more
> +       frequently, but the subsecond increment is set to 2/ptp_clock_rate.
> +       Coarse mode is suitable for PTP Grand Master operation. If unsure, leave
> +       the parameter to False.

My understanding based on your previous explanation is that basically
in one of the modes the frequency cannot be adjusted. It's only usable
if a very stable reference clock is fed into the device (or otherwise
we "trust" the clock that's fed in). So that's why Grand Master.

In the other mode we can tweak the frequency more accurately.
But it comes at a cost of the HW time incrementing 2x larger step.

If that's the case I think we should update the documentation and
rename the knob to indicate that it's the frequency adjustment that's
coarse.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
