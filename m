Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF15692516
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Feb 2023 19:13:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2580CC6A5EB;
	Fri, 10 Feb 2023 18:13:26 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12D94C6A5E9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Feb 2023 18:13:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A0E1461E52;
 Fri, 10 Feb 2023 18:13:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90E21C433EF;
 Fri, 10 Feb 2023 18:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676052803;
 bh=6FLDH++aUj095WH9otN0bkobiJlSDQziX4LlJjA4wS4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OBeovfgBitTlBAxZHZpmc5RTctjYTaEPJRtQRt9AvYMQm79B2inSL2GCVqGCNRThH
 uv6ZV5NIrYKBg1+2+8prF8TmMOpdfezRGuXAkz8fEki6YKNfYEgQsrVy4DcI/tlxqp
 BjPhcwp6vQgLawKj8Ly+E/Ov7p2zGAok4V94flhRydi9R2Egj6Sf6g/jAVQJW0ZVo5
 cJoC2H2enzXbF7VRM7BZfUXTIjCQRtMOzFdO1qG+m5YKLLg6dWRjl1YKw05SSM+Ew4
 JgenQnvyNc+qu3vklc1eq/zqASHpAUXRSN8u5zXM1BZ+wZosIxSXf1FRTcsMOiXuz9
 xuTk5ILD8DMEg==
Date: Fri, 10 Feb 2023 10:13:20 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Alain Volmat <avolmat@me.com>
Message-ID: <20230210101320.331c1d95@kernel.org>
In-Reply-To: <Y+YKeVoq91/mtlo2@imac101>
References: <20230209091659.1409-1-avolmat@me.com>
 <20230210090420.GB175687@linaro.org> <Y+YKeVoq91/mtlo2@imac101>
MIME-Version: 1.0
Cc: linux-doc@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Amit Kucheria <amitk@kernel.org>, Eric Dumazet <edumazet@google.com>,
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
 linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 00/11] ARM: removal of STiH415/STiH416
	remainings bits
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

On Fri, 10 Feb 2023 10:12:25 +0100 Alain Volmat wrote:
> Having seen situations like that for some other series I was guessing
> that each maintainer would apply the relevant patches on his side.
> Those two platforms being no more used, there is no specific patch
> ordering to keep.
> 
> I've actually been wondering at the beginning how should I post those
> patches.  If another way is preferrable I can post again differently
> if that helps.

You'd have most luck getting the changes accepted for 6.3 if you split
this up and resend to individual maintainers.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
