Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A561242672
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Aug 2020 09:57:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C655EC36B26;
	Wed, 12 Aug 2020 07:57:41 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 94A78C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Aug 2020 07:57:39 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 37B28206B5;
 Wed, 12 Aug 2020 07:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597219058;
 bh=GD6v7CB5dursMy1LFpKqdYSAC+0NBpdsVgzB6336OsY=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=gZ5jkX3CKM34ZTH++hII1uQw30e8+MyMAKBf/92qWAPFNOB5EDsGGpwuXXUzUoVYW
 BIntS+buE/cYprrFrlXTkPTipWz6w6D8cuPgvaJsI+4GBwNCLTlbYcOE8cxL8hrqrs
 IhPAVxZVSfXakucpn21EgTtcV7/DYAAjgiQ5+Ui8=
MIME-Version: 1.0
In-Reply-To: <20200804192654.12783-3-krzk@kernel.org>
References: <20200804192654.12783-1-krzk@kernel.org>
 <20200804192654.12783-3-krzk@kernel.org>
From: Stephen Boyd <sboyd@kernel.org>
To: Alexandre Torgue <alexandre.torgue@st.com>, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Guenter Roeck <linux@roeck-us.net>,
 Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Russell King <linux@armlinux.org.uk>, Simtec Linux Team <linux@simtec.co.uk>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-watchdog@vger.kernel.org, patches@opensource.cirrus.com
Date: Wed, 12 Aug 2020 00:57:37 -0700
Message-ID: <159721905719.33733.2654708598275375464@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Cc: Sylwester Nawrocki <snawrocki@kernel.org>, Lihua Yao <ylhuajnu@outlook.com>,
 Cedric Roux <sed@free.fr>, Sergio Prado <sergio.prado@e-labworks.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [Linux-stm32] [PATCH v2 02/13] clk: samsung: s3c24xx: declare
	s3c24xx_common_clk_init() in shared header
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

Quoting Krzysztof Kozlowski (2020-08-04 12:26:43)
> The s3c2410_common_clk_init() and others are defined and used by the
> clk-s3c24xx driver and also used in the mach-s3c24xx machine code.  Move
> the declaration to a header to fix W=1 build warnings:
> 
>     drivers/clk/samsung/clk-s3c2410.c:320:13: warning: no previous prototype for 's3c2410_common_clk_init' [-Wmissing-prototypes]
>       320 | void __init s3c2410_common_clk_init(struct device_node *np, unsigned long xti_f,
>     drivers/clk/samsung/clk-s3c2412.c:205:13: warning: no previous prototype for 's3c2412_common_clk_init' [-Wmissing-prototypes]
>       205 | void __init s3c2412_common_clk_init(struct device_node *np, unsigned long xti_f,
>     drivers/clk/samsung/clk-s3c2443.c:341:13: warning: no previous prototype for 's3c2443_common_clk_init' [-Wmissing-prototypes]
>       341 | void __init s3c2443_common_clk_init(struct device_node *np, unsigned long xti_f,
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
