Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A82D96918C1
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Feb 2023 07:54:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48D32C6A5EA;
	Fri, 10 Feb 2023 06:54:48 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 046C4C035BB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Feb 2023 06:54:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5F8AFB82364;
 Fri, 10 Feb 2023 06:54:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E85EFC433EF;
 Fri, 10 Feb 2023 06:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676012085;
 bh=09gUWptY/BbuIMzWbqSjyJe1S02IFSMhcohNYddSSgE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HSjTpTzHZoFbipoV+LpZdBskzS/ag4uT/3oIszVu/2F4J6ovVwdhbhvM7ZWZcNhnf
 71p5YVrmag22+n4US6k+AKoVfrFd6m4VNYkD+/UZEcDlbW/t6ACJCnJgEOUf3V7qiL
 pO4yHMrftBz3KSgbYVmnn+hWKl0L62j73X05vtBsf3v7+6EV1NvXwMPHtHi85Y2jrN
 ru/O3Bf5vplzMRPzY3tz4wtPhm88zw1uAF7cy8eb2gt6R1/fO7Mjt65UpbT2oAzse6
 N+cGe9UED6Nnz89BlkwjfHIpW5oWivWZSNoTYh60vdl2OVleV/wLWkbaGd/umoeUhE
 2Vny6amTJCmSg==
Date: Thu, 9 Feb 2023 22:54:42 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Alain Volmat <avolmat@me.com>
Message-ID: <20230209225442.2b11878e@kernel.org>
In-Reply-To: <20230209091659.1409-8-avolmat@me.com>
References: <20230209091659.1409-1-avolmat@me.com>
 <20230209091659.1409-8-avolmat@me.com>
MIME-Version: 1.0
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Amit Kucheria <amitk@kernel.org>,
 Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
 Jose Abreu <joabreu@synopsys.com>, Zhang Rui <rui.zhang@intel.com>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-pm@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Stephen Boyd <sboyd@kernel.org>, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 07/11] net: ethernet: stmmac: dwmac-sti:
 remove stih415/stih416/stid127
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

On Thu,  9 Feb 2023 10:16:55 +0100 Alain Volmat wrote:
> Remove no more supported platforms (stih415/stih416 and stid127)
> 
> Signed-off-by: Alain Volmat <avolmat@me.com>

No idea who's gonna take these, but FWIW:

Acked-by: Jakub Kicinski <kuba@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
