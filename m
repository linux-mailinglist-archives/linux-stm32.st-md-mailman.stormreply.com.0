Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4138A265C
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Apr 2024 08:21:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70874C6DD66;
	Fri, 12 Apr 2024 06:21:49 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82D2EC69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Apr 2024 06:21:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9FD77CE3187;
 Fri, 12 Apr 2024 06:21:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7044C2BBFC;
 Fri, 12 Apr 2024 06:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712902905;
 bh=3HkpJojy/K1PBxL+4mbZbpwq+U3GGqzPtMY8c/dVemc=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=t2oH6sEoxUvKpABTuzdEvcxBIg+pIRL+XCecL1b+p6Y2BkQb2XQTp3KVqf/NHZU+5
 ssV4p1dEpC0JU0+Y1goSDJXUfFjupXzk2w9GbCDgha0iUNp0MMji0G8yrIc/jkHVoN
 UHL8q9trcQwm175POiBhTFLYOXTZqnC9HdjqMpBKL62teCJY8qOq3kt6DRJXlr2zTI
 qAdhVY63NG2FYFYaxCFseLdAmKB+yAHjcXMfMl10wez9egmnFpEVPzwIGER2eEr7Db
 gofbTjSQAmu1CUMPQBS7Cw1o5sxRBhplUqUqL0/RNZtFBvewmJK2D5JnWIrDgsuBQh
 PIrGtV9wk1chg==
Message-ID: <c6db329bdd8f760878cbbc84d099a4e5.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240411092453.243633-2-gabriel.fernandez@foss.st.com>
References: <20240411092453.243633-1-gabriel.fernandez@foss.st.com>
 <20240411092453.243633-2-gabriel.fernandez@foss.st.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>
Date: Thu, 11 Apr 2024 23:21:43 -0700
User-Agent: alot/0.10
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v11 1/4] clk: stm32mp13: use platform
	device APIs
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

Quoting gabriel.fernandez@foss.st.com (2024-04-11 02:24:50)
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> 
> Convert devm_platform_ioremap_resource() and remove unnecessary
> dependency check with SCMI clock driver.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---

Applied to clk-next
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
