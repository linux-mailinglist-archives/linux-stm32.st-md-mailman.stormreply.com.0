Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D28F88C7F40
	for <lists+linux-stm32@lfdr.de>; Fri, 17 May 2024 02:34:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 83704C6DD66;
	Fri, 17 May 2024 00:34:54 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DEF3DC69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 May 2024 00:34:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id AB389CE0AC2;
 Fri, 17 May 2024 00:34:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C89E0C113CC;
 Fri, 17 May 2024 00:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715906083;
 bh=NxT1fDiRetTAEkEf4wcSp/6bnfFWtJKyN4JFKJ+uVsQ=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=cMYTELw96iYyprniezpbpuN/KS2c5FO38U+zmTtHpgblOFoyCiNRNBcSOhGhjUQFS
 ctNi73VzlE0everJqBnmEk3TEmCu6VYJ9t8SN2FHznE2EiukRoJ5DMfIr0BfoGXJUd
 q5e4CUJPLKDi8Q7saQp8twXSOdXNeBqS0VKgcZFo4x0S29QWycUy2OGmKrAYQ4JSLU
 XADHeLPKRN+NCqZ3238XYjbI8PKK4Soj/CyzCQKOzF7r06OooC83rKsYl4JWc4Ramz
 xkr5wtXVBiAH1BmybG5YhxdH3WEyMDKodfSPMtiHe7NtoYc4DsK+ZlxkZZeEbw52mF
 f0D55NzEVZacw==
Message-ID: <5cceccdba7297d84e948a85f533f3189.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <73a9d56c-9e8d-4859-b3a2-dba1531b57e5@foss.st.com>
References: <20240419152723.570159-1-gabriel.fernandez@foss.st.com>
 <20240419152723.570159-3-gabriel.fernandez@foss.st.com>
 <332c845c17e24e2eb660e18680f2626f.sboyd@kernel.org>
 <73a9d56c-9e8d-4859-b3a2-dba1531b57e5@foss.st.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>
Date: Thu, 16 May 2024 17:34:41 -0700
User-Agent: alot/0.10
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 2/4] clk: stm32mp2: use of STM32 access
	controller
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

Quoting Gabriel FERNANDEZ (2024-05-14 23:41:17)
> 
> On 5/8/24 00:02, Stephen Boyd wrote:
> > Quoting gabriel.fernandez@foss.st.com (2024-04-19 08:27:21)
> >> diff --git a/drivers/clk/stm32/clk-stm32mp25.c b/drivers/clk/stm32/clk-stm32mp25.c
> >> index 210b75b39e50..a37ee9f707e3 100644
> >> --- a/drivers/clk/stm32/clk-stm32mp25.c
> >> +++ b/drivers/clk/stm32/clk-stm32mp25.c
> >> @@ -4,7 +4,9 @@
> >>    * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
> >>    */
> >>   
> >> +#include <linux/bus/stm32_firewall_device.h>
> > I don't have this include. I either need a signed tag or this needs to
> > wait until next merge window.
> 
> Sorry for the delay, i was off.
> 
> I was based on tag next-20240419
> 
> >>   #include <linux/clk-provider.h>
> >> +#include <linux/of_address.h>
> > What is this include for?
> 
> yes #include <linux/io.h> is more appropriate.
> 

Ok. Please resend after the merge window.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
