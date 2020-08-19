Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D22024A5CB
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Aug 2020 20:17:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50839C3FAD8;
	Wed, 19 Aug 2020 18:17:45 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77918C3FAD3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Aug 2020 18:17:41 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id p24so27385901ejf.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Aug 2020 11:17:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Yl0aiKpy9oU+yX24bKO0Wi0FwOjbsT5HEwJCqJSSr0E=;
 b=E6WXCjXy1LhNWNgweEBwMJhMLoCtT9F9+A2Xmk/fXPZEDuJXHrdc8HEg2bPmEcMmU7
 3qssV6oocV1/THmf3IBQxok7S44x1UOp+229gcrBRcgpVx+3TLWJ/X7HX0ipz+BUJDFo
 24mpPojoEitCnWYZKEV+GD902lwHWKzyCUPhDFHLMeLhtU+jLS7727iBivnRLqM8CKJS
 fIAxgQafUNvM8hFTpzOS+JFp1Z0ubAozUhIhHKVA34RK5JafbB28SNCJoZVZPEX2RjKJ
 HaCMS2SjkQF8l8Jc0vxr7SKNxCEJ/OQo3Vx1iNlE65pX1uo+R4lW5CMhElSEzj/kMgUl
 VYZw==
X-Gm-Message-State: AOAM531r7Hr1E8ua5hWhsrx75JOWXmO4zr65zBeX6umTHfYKR3Cp0wvo
 vWCH97WNxggTpT5L9lIFZEg=
X-Google-Smtp-Source: ABdhPJwPrp0tgwpB1iLAmKOegFv4OOS/OWlgOOvq+s6N718YJm5HdBzWfJk3O7jPqez5lMwHUAJGLw==
X-Received: by 2002:a17:907:20f5:: with SMTP id
 rh21mr26001104ejb.194.1597861061058; 
 Wed, 19 Aug 2020 11:17:41 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
 by smtp.googlemail.com with ESMTPSA id b20sm18281130eds.7.2020.08.19.11.17.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 19 Aug 2020 11:17:40 -0700 (PDT)
Date: Wed, 19 Aug 2020 20:17:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Russell King <linux@armlinux.org.uk>, Kukjin Kim <kgene@kernel.org>,
 Simtec Linux Team <linux@simtec.co.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 patches@opensource.cirrus.com, linux-clk@vger.kernel.org,
 linux-watchdog@vger.kernel.org
Message-ID: <20200819181736.GB21298@kozik-lap>
References: <20200804192654.12783-1-krzk@kernel.org>
 <20200804192654.12783-8-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200804192654.12783-8-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Sylwester Nawrocki <snawrocki@kernel.org>, Lihua Yao <ylhuajnu@outlook.com>,
 Cedric Roux <sed@free.fr>, Sergio Prado <sergio.prado@e-labworks.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [Linux-stm32] [PATCH v2 07/13] ARM: s3c64xx: switch to generic
 watchdog driver reset
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

On Tue, Aug 04, 2020 at 09:26:48PM +0200, Krzysztof Kozlowski wrote:
> Similarly to commit f6361c6b3880 ("ARM: S3C24XX: remove separate restart
> code"), the platform watchdog reset code can be removed in favor of
> a generic watchdog driver which already handles reset.
> 
> This allows removal of a bunch of machine code and fixes also W=1
> compile warnings:
> 
>     arch/arm/plat-samsung/watchdog-reset.c:29:6: warning: no previous prototype for 'samsung_wdt_reset' [-Wmissing-prototypes]
>        29 | void samsung_wdt_reset(void)
>     arch/arm/plat-samsung/watchdog-reset.c:69:13: warning: no previous prototype for 'samsung_wdt_reset_of_init' [-Wmissing-prototypes]
>        69 | void __init samsung_wdt_reset_of_init(void)
>     arch/arm/plat-samsung/watchdog-reset.c:89:13: warning: no previous prototype for 'samsung_wdt_reset_init' [-Wmissing-prototypes]
>        89 | void __init samsung_wdt_reset_init(void __iomem *base)
> 
> The generic watchdog-based system reset is not exactly the same as
> before.  The previous method had a fallback to soft_restart() which now
> is gone.
> 
> The commit also removes a FIXME note about calling s3c64xx_clk_init()
> inside s3c64xx_init_irq().  No one fixed this since long time and the
> note is not meaningful anymore because watchdog part is removed.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Tomasz Figa <tomasz.figa@gmail.com>

Applied.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
