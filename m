Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3347724A5BF
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Aug 2020 20:16:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3830C3FAD8;
	Wed, 19 Aug 2020 18:16:33 +0000 (UTC)
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74423C3FAD3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Aug 2020 18:16:27 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id g19so27383086ejc.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Aug 2020 11:16:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=t3qsgE3nJwNaWUKRuhBUBlsZ1BJmez2mj7vmp2zbCgY=;
 b=i1T3b6R7twZaGudK4km0lrIq6F7vrxp9KQAEopZs+46ASSWWsRqBpzz+6gQzZAhB4i
 touQu3TnsYtt5OF2iNd2c0an4A+QZPJvXmdiopaqS5sLu7thQ8FkJg0u0idtIgQcV5Ln
 4YmYZDWjV03PJhkC50I0XJJVQmIt8z1hl2pAMTFQMAAZvOUAvh1x/ngoB/heF5bd4emq
 qGGrCLYvCdbPL1iaCJVVE3yyEiMYTdCM4Gw1ANU1g7iXh5tywg0LmnqgxTQStDNcFm0d
 KLJk9BTLJJM+e7DlMmF5Qbe5ppl5AFk2jq9UIl+csDXzPhLu0nHnQv4Xig4DtXOT3k+v
 A3eg==
X-Gm-Message-State: AOAM532ujh5OrT2ON05pQSDq6DwVvpi4XauI+cSULsXv0LSSy/j4cE8u
 Db5Cj2AFjm5zqnKmMR6gpWQ=
X-Google-Smtp-Source: ABdhPJzOcN1GZKTtRnWkWtwfjQiD9o87+S+tpPQkggCUttDLUkxuxmb4YmLExAOC3PinRJdWfsIbkw==
X-Received: by 2002:a17:906:e17:: with SMTP id
 l23mr25676842eji.13.1597860987481; 
 Wed, 19 Aug 2020 11:16:27 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
 by smtp.googlemail.com with ESMTPSA id
 gh25sm18892391ejb.109.2020.08.19.11.16.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 19 Aug 2020 11:16:26 -0700 (PDT)
Date: Wed, 19 Aug 2020 20:16:23 +0200
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
Message-ID: <20200819181623.GA21298@kozik-lap>
References: <20200804192654.12783-1-krzk@kernel.org>
 <20200804192654.12783-7-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200804192654.12783-7-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Sylwester Nawrocki <snawrocki@kernel.org>, Lihua Yao <ylhuajnu@outlook.com>,
 Cedric Roux <sed@free.fr>, Sergio Prado <sergio.prado@e-labworks.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [Linux-stm32] [PATCH v2 06/13] ARM: samsung: remove
 HAVE_S3C2410_WATCHDOG and use direct dependencies
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

On Tue, Aug 04, 2020 at 09:26:47PM +0200, Krzysztof Kozlowski wrote:
> A separate Kconfig option HAVE_S3C2410_WATCHDOG for Samsung SoCs is not
> really needed and the s3c24xx watchdog driver can depend on Samsung ARM
> architectures instead.
> 
> The "HAVE_xxx_WATCHDOG" pattern of dependency is not popular and Samsung
> platforms are here exceptions.  All others just depend on
> CONFIG_ARCH_xxx.
> 
> This makes the code slightly smaller without any change in
> functionality.
> 

Applied.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
