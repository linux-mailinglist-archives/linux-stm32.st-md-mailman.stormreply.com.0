Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9827597DD0
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Aug 2019 16:59:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF499C35E01;
	Wed, 21 Aug 2019 14:59:15 +0000 (UTC)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6832DC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Aug 2019 14:59:14 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id w11so995289plp.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Aug 2019 07:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=MGu3Yx6P1oW2dkVZJ8rQOp/8pAXcm/B2IMgoDlOEKl4=;
 b=WLYmJXxArkZ+xpZrPWfZ85MRzNzUcKTIsk882+RxQxxR3Az/71RvVWigMyyc3o9qDg
 mtvIRNq6XqeN1cOcZdrxEKMDHffD2FSe6/WbeP3fCJsQQUwFHkNqyr1s3s/9l6wOl4hi
 i61XL/Ai4/XENarTcYSqmmmeNxx7hyK+c8wCDaxPxncIttf7Mf8ZvxfKx2BB2nHOHoC4
 c0aMh+x4BaABVYpPLLtW5xg8u7M3ZX6mQoBFs4WrPYllZko4hPmPVVPlY8U86SnB4jfI
 OfGoENjS2m5V/qu3I2HjQjjnojwvAqezsZODeJIns7mWjTQGdm1PNzNZCvBa11J0X1NP
 9Ryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=MGu3Yx6P1oW2dkVZJ8rQOp/8pAXcm/B2IMgoDlOEKl4=;
 b=TlXSf0fcxsqJg8XpjhfYQGHWQ2abNscYfaTOOCPBvbiHKy6K86nn4PV01CWNgPAVs7
 i1wnOopFo+8yvozRP/GO6ldQWR5eD6rTjg/0jsgJQ8W5wCwuUoGM/f6CS1tudJXxi2/Z
 rJl5wwF3q65fXYducSdq/c4WqIBY9NbZ8WATDNn1Sg3X5l2T+/tEwo/+lZCoN9udfSnk
 XgIH+aYPbaZqbYv6YzykjYDnJ7+RVG7nuRRp0ZxLcVfZg+gZEB8qREfK1gXAFVFSsCuT
 PlDxQKoQjO+W+BJ5zil2aNgQu9cUfO7nPq2V9EPXGRVzluDH6nQduASL55o7Gm+UERNi
 t7/g==
X-Gm-Message-State: APjAAAWDVJ50Eiyikkfa4+8BEsVAzQH1r0TcVKxQBAr0UOTT6oUyXSDL
 0So6yDPxfjsUaK0SY+Crc2o=
X-Google-Smtp-Source: APXvYqxUP8xkNyQZWYrRIamXP/wMkzF1WMKVh7TUKjSQXGKEymiVCjMrEbQg8CoUx7Bzq7phU6wEqA==
X-Received: by 2002:a17:902:44f:: with SMTP id
 73mr34838894ple.192.1566399552898; 
 Wed, 21 Aug 2019 07:59:12 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id m145sm27713891pfd.68.2019.08.21.07.59.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 21 Aug 2019 07:59:12 -0700 (PDT)
Date: Wed, 21 Aug 2019 07:59:11 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Matthias Maennich <maennich@google.com>
Message-ID: <20190821145911.GA6521@roeck-us.net>
References: <20190813121733.52480-1-maennich@google.com>
 <20190821114955.12788-1-maennich@google.com>
 <20190821114955.12788-12-maennich@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190821114955.12788-12-maennich@google.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Tomer Maimon <tmaimon77@gmail.com>, lucas.de.marchi@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arch@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>, mingo@redhat.com,
 geert@linux-m68k.org, NXP Linux Team <linux-imx@nxp.com>,
 Tomas Winkler <tomas.winkler@intel.com>, Jean Delvare <jdelvare@suse.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, tglx@linutronix.de,
 michal.lkml@markovi.net, Scott Branden <sbranden@broadcom.com>,
 Andrew Jeffery <andrew@aj.id.au>, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org, yamada.masahiro@socionext.com,
 Thierry Reding <thierry.reding@gmail.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Kukjin Kim <kgene@kernel.org>, kernel-team@android.com, sspatil@google.com,
 linux-watchdog@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, pombredanne@nexb.com,
 linux-m68k@lists.linux-m68k.org, linux-rpi-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, maco@android.com,
 linux-arm-kernel@lists.infradead.org, Barry Song <baohua@kernel.org>,
 Johannes Thumshirn <morbidrsa@gmail.com>, oneukum@suse.com,
 Stefan Wahren <wahrenst@gmx.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 kstewart@linuxfoundation.org, usb-storage@lists.one-eyed-alien.net,
 linux-tegra@vger.kernel.org, patches@opensource.cirrus.com,
 joel@joelfernandes.org, sam@ravnborg.org, linux-rtc@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>,
 Benjamin Fair <benjaminfair@google.com>, Eric Anholt <eric@anholt.net>,
 Krzysztof Kozlowski <krzk@kernel.org>, Nancy Yuen <yuenn@google.com>,
 Chen-Yu Tsai <wens@csie.org>, bcm-kernel-feedback-list@broadcom.com,
 Joel Stanley <joel@jms.id.au>, stern@rowland.harvard.edu, arnd@arndb.de,
 Ray Jui <rjui@broadcom.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Orson Zhai <orsonzhai@gmail.com>, linux-hwmon@vger.kernel.org,
 Support Opensource <support.opensource@diasemi.com>,
 Andreas Werner <andreas.werner@men.de>, Avi Fishman <avifishman70@gmail.com>,
 maco@google.com, jeyu@kernel.org, Shawn Guo <shawnguo@kernel.org>,
 Baruch Siach <baruch@tkos.co.il>, Mans Rullgard <mans@mansr.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Jerry Hoemann <jerry.hoemann@hpe.com>, Tali Perry <tali.perry1@gmail.com>,
 hpa@zytor.com, linux-scsi@vger.kernel.org, openbmc@lists.ozlabs.org,
 x86@kernel.org, Andy Gross <agross@kernel.org>,
 Marc Gonzalez <marc.w.gonzalez@free.fr>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 linux-mediatek@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Alessandro Zummo <a.zummo@towertech.it>, Baolin Wang <baolin.wang@linaro.org>,
 Patrick Venture <venture@google.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-modules@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 11/11] RFC: watchdog: export core
 symbols in WATCHDOG_CORE namespace
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

On Wed, Aug 21, 2019 at 12:49:26PM +0100, Matthias Maennich wrote:
> Modules using these symbols are required to explicitly import the
> namespace. This patch was generated with the following steps and serves
> as a reference to use the symbol namespace feature:
> 
>  1) Use EXPORT_SYMBOL_NS* macros instead of EXPORT_SYMBOL* for symbols
>     in watchdog_core.c
>  2) make  (see warnings during modpost about missing imports)
>  3) make nsdeps
> 
> I used 'allmodconfig' for the above steps to ensure all occurrences are
> patched.
> 
> Defining DEFAULT_SYMBOL_NAMESPACE in the Makefile is not trivial in this
> case as not only watchdog_core is defined in drivers/watchdog/Makefile.
> Hence this patch uses the variant of using the EXPORT_SYMBOL_NS* macros
> to export into a different namespace.
> 
I don't have the context, and thus I am missing the point of this patch
set. Whatever it is supposed to accomplish, it seems extreme to me
to require extra code in each driver for it.

Anyway, WATCHDOG_CORE would be the default namespace (if it is what
I think it is) for watchdog drivers, even though not all watchdog drivers
use it. As such, I am missing an explanation why defining it in Makefile
is not trivial. "... as not only watchdog_core is defined in
drivers/watchdog/Makefile" does not mean anything to me and is not a real
explanation. Also, it is not immediately obvious to me why "select
WATCHDOG_CORE" in Kconfig would not automatically imply that WATCHDOG_CORE
is used by a given driver, and why it is impossible to use that
information to avoid the per-driver changes.

I am also missing an explanation why WATCHDOG_CORE is going to be a
separate namespace to start with. Maybe that discussion has happened,
but I don't recall being advised or asked or told about it. Are we also
going to have a new HWMON_CORE namespace ? And the same for each other
subsystem in the kernel ?

Since this is being added to the watchdog API, it will have to be
documented accordingly. Watchdog driver writers, both inside and outside
the watchdog subsystem, will need to know that they now have to add an
additional boilerplate declaration into their drivers.

Last but not least, combining patches affecting multiple subsystems in a
single patch will make it difficult to apply and will likely result in
conflicts. Personally I would prefer a split into one patch per affected
subsystem. Also, please keep in mind that new pending watchdog drivers
won't have the new boilerplate.

Thanks,
Guenter
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
