Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A7A8FA399
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Jun 2024 23:46:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35DABC6B460;
	Mon,  3 Jun 2024 21:36:55 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5CB1EC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Jun 2024 21:36:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6FD1DCE0F76;
 Mon,  3 Jun 2024 21:36:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92E41C2BD10;
 Mon,  3 Jun 2024 21:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717450603;
 bh=1GajkzrxJWwIATnMlSQb8T/W4Z6Ei4LUQqaYzeUpUoE=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=U00QJour8XN4wwOSFH/cVWjQ0sCcztZR3LUU8kRQD2tKWhpj+ZIWnXfVShtbYerag
 XxPA9TeSz6VDHuWdNaLlRgh6ZQUOR5kisfJwtsgXxymhyQIN+FbuOXQb1d8dF5wf1g
 qgGPxZUD6JN8eurPq9Ffz+x6D8VLVWBnfWy/SBMoAJsGutlOP2Z89ttvM93fgM8nnK
 Sbs+8EDy2VitP04DtcbOArSzcRkd7XmsE0Tn1jQi2kNhll3j516YkT8Xd3UcfyCySs
 GY1SZg41dIopeQ++WWQDDGim29SZcfKC1Wj0Vps5qswKxO2tCmJCbbPmkknrDnS43M
 ZyY+xAZO97Zfw==
Message-ID: <c776960ca7b285626366dd7ecba04018.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240529131310.260954-2-gabriel.fernandez@foss.st.com>
References: <20240529131310.260954-1-gabriel.fernandez@foss.st.com>
 <20240529131310.260954-2-gabriel.fernandez@foss.st.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>, Dan Carpenter <dan.carpenter@linaro.or6g>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>
Date: Mon, 03 Jun 2024 14:36:41 -0700
User-Agent: alot/0.10
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [RESEND PATCH v2 1/3] clk: stm32mp2: use of STM32
	access controller
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

Quoting gabriel.fernandez@foss.st.com (2024-05-29 06:13:08)
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> 
> Use an STM32 access controller to filter the registration of clocks.
> If a clock is used by the security world, then it must not registered.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---

Applied to clk-next
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
