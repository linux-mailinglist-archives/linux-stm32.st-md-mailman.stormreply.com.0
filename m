Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D93AA23ECBD
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Aug 2020 13:44:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 902E4C36B3A;
	Fri,  7 Aug 2020 11:44:17 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F33F2C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Aug 2020 11:44:16 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id r4so1383339wrx.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 07 Aug 2020 04:44:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=N8musXdCYjKNkXhIeUBafzXyS9da0FtZxFcd8OoiZgU=;
 b=OlxqHdsw08lyXh089aff9Oa0C+KWNVkl4ztkgy40zgm5USxKETnysXGS1K2V+gDC4V
 4EdnyfGmJwlJYOElsko7x9dFWjLhP/RiHRcByhieFbWOsiKsLHZYmIIRXC3LOxR82U/9
 GCfBtwxL0G/w9rbpNCTT3WLEnCJ+QHz1mB7naC50/jA/8MVeK/K21f/yPQ9r+hed6TK2
 EJSuRChrsMqqv3UzevD4yhGqUbr9Pd3lc34OLUgMEgPE08L1Rz+lDf5Hk2O1P+wX+0vQ
 Uy30Q1aFosYXY6oNrDJlX1GLmzY7rNA8XM8JukHmYjMYYr3vpGDEAs6rY6MnOeA7L6r+
 licA==
X-Gm-Message-State: AOAM532M+21MxG3+tZyFmyITBEeupPRU6EVjZDkQbKlgqNU1K9GfqXdc
 DR9Awvsc8/XLseqYGapUsTE=
X-Google-Smtp-Source: ABdhPJxvn7J2DKLgtpo4L81vi7ot+MvhlFdzMe5TulnmTigW2FE/oEUvy/2eSWYpCzwErtyG5KFlaQ==
X-Received: by 2002:a05:6000:11c1:: with SMTP id
 i1mr12351441wrx.277.1596800656407; 
 Fri, 07 Aug 2020 04:44:16 -0700 (PDT)
Received: from pi3 ([194.230.155.117])
 by smtp.googlemail.com with ESMTPSA id i66sm10625022wma.35.2020.08.07.04.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Aug 2020 04:44:15 -0700 (PDT)
Date: Fri, 7 Aug 2020 13:44:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mark Brown <broonie@kernel.org>
Message-ID: <20200807114411.GA9589@pi3>
References: <20200806181932.2253-1-krzk@kernel.org>
 <20200807113330.GC5435@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200807113330.GC5435@sirena.org.uk>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-usb@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, dri-devel@lists.freedesktop.org,
 Liam Girdwood <lgirdwood@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Russell King <linux@armlinux.org.uk>, linux-spi@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, Andi Shyti <andi@etezian.org>,
 Jason Cooper <jason@lakedaemon.net>, linux-samsung-soc@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-fbdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Chanwoo Choi <cw00.choi@samsung.com>,
 Kukjin Kim <kgene@kernel.org>, linux-serial@vger.kernel.org,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-mmc@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 linux-pwm@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 alsa-devel@alsa-project.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-input@vger.kernel.org, linux-clk@vger.kernel.org,
 Ben Dooks <ben-linux@fluff.org>, Takashi Iwai <tiwai@suse.com>,
 Thomas Gleixner <tglx@linutronix.de>, Jaroslav Kysela <perex@perex.cz>,
 Simtec Linux Team <linux@simtec.co.uk>, linux-arm-kernel@lists.infradead.org,
 linux-hwmon@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Sebastian Reichel <sre@kernel.org>,
 linux-kernel@vger.kernel.org, Sangbeom Kim <sbkim73@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, patches@opensource.cirrus.com
Subject: Re: [Linux-stm32] [PATCH v2 00/41] spi / fbdev / cpufreq / usb /
 mmc / hwmon / ARM: Prepare for multiplatform S3C
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

On Fri, Aug 07, 2020 at 12:33:30PM +0100, Mark Brown wrote:
> On Thu, Aug 06, 2020 at 08:19:32PM +0200, Krzysztof Kozlowski wrote:
> 
> > I intend to take it through Samsung SoC tree so all Acks are welcomed.
> 
> Any issue with me applying the ASoC bits and sending you a branch?  This
> seems like it might run into some of the subsystem wide cleanups we've
> got going on.

Five ASoC patches:
 - ARM: s3c24xx: move iis pinctrl config into boards
 - ASoC: samsung: s3c2412-i2s: avoid hardcoded S3C2410_PA_IIS
 - ASoC: samsung: rx1950: turn into platform driver
 - ASoC: samsung: neo1973: turn into platform driver
 - ASoC: samsung: h1940: turn into platform driver
apply cleanly on current next so I guess they could go through your tree
without problems.  Providing me a branch would be great in such case, so
please go ahead.

Thanks!

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
