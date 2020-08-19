Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD7324A5CF
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Aug 2020 20:18:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 94822C3FAD8;
	Wed, 19 Aug 2020 18:18:33 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4705EC3FAD3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Aug 2020 18:18:32 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id t10so27421340ejs.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Aug 2020 11:18:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wnUg3p/rkzEg7r5c/DTFnIBFdODWMiQLm/bvg10pJj4=;
 b=L2ZhZ6lSIU7SYwvnTlGsfXpzdwCn1dg/fKivW8o4x/upf0kE/egWhLFW9xW4ld+wc3
 jlVkRL632M4Fpd2+B3EJLa1c9W3y81wPWKQb/hKsB9rPWSaBErUjPEXIDvPrSfbb68CU
 XaVCbI7hXnzEKiKTF1X+3NNUP2WDyDtWXzxKD8nXzTaw+6gRkWz2reAMvyF1FhI0vim8
 xlG8ZMkyblSF7RzGd46Z4T/POvm4QHTtcw2+qEyqJkO+F8R2oYk/Mq9GCGHVmvECJ+k+
 3h/BuSLmeEB/Xp/ab4JMdKZFntL1w+rPieiMdnUFI6kPSflCGb+jaGDN/cY1jv5WTazn
 ou1Q==
X-Gm-Message-State: AOAM533xHwRpl2sB3mgsr+dh3lR91FnNAoCd88yV6e24QVFNLBbs2gmO
 wChouIOD7wAauZQsnn0XlHI=
X-Google-Smtp-Source: ABdhPJwhe7v/Ue1xFghexM9wTspolT/ZMLwUsVvmESFPXE05UaS1MOTnbDUeHiPOeM2GGznnOamAJg==
X-Received: by 2002:a17:906:2717:: with SMTP id
 z23mr5615021ejc.19.1597861111871; 
 Wed, 19 Aug 2020 11:18:31 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
 by smtp.googlemail.com with ESMTPSA id x10sm17923412eds.21.2020.08.19.11.18.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 19 Aug 2020 11:18:31 -0700 (PDT)
Date: Wed, 19 Aug 2020 20:18:28 +0200
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
Message-ID: <20200819181828.GC21298@kozik-lap>
References: <20200804192654.12783-1-krzk@kernel.org>
 <20200804192654.12783-9-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200804192654.12783-9-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Sylwester Nawrocki <snawrocki@kernel.org>, Cedric Roux <sed@free.fr>,
 stable@vger.kernel.org, Lihua Yao <ylhuajnu@outlook.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [Linux-stm32] [PATCH v2 08/13] ARM: s3c24xx: fix missing system
	reset
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

On Tue, Aug 04, 2020 at 09:26:49PM +0200, Krzysztof Kozlowski wrote:
> Commit f6361c6b3880 ("ARM: S3C24XX: remove separate restart code")
> removed usage of the watchdog reset platform code in favor of the
> Samsung SoC watchdog driver.  However the latter was not selected thus
> S3C24xx platforms lost reset abilities.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: f6361c6b3880 ("ARM: S3C24XX: remove separate restart code")
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm/Kconfig | 2 ++

Applied.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
