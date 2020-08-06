Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F36223E3AB
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Aug 2020 23:58:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4183C36B3A;
	Thu,  6 Aug 2020 21:58:08 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24637C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Aug 2020 21:58:07 +0000 (UTC)
Received: from mail-io1-f41.google.com ([209.85.166.41]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MnJUy-1kTCTy20yi-00jK3n for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 06 Aug 2020 23:58:06 +0200
Received: by mail-io1-f41.google.com with SMTP id l17so51202907iok.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 06 Aug 2020 14:58:06 -0700 (PDT)
X-Gm-Message-State: AOAM5300q0aFHN0pmdg5obo5PTHsSLFTii1FzgHaRL8dy89zNLPyDzOE
 YSHrh810lfKe3QVFPXnNsnfVlbTDzxZ8VaU5Zzw=
X-Google-Smtp-Source: ABdhPJxgZbzUezUsGBZmsJqABgfct0c0RuS1c93rT/QNCas4jRck1zkiTI9WMDo0l2MxpsdfxgH1+JL7NncTMPc4G48=
X-Received: by 2002:a37:385:: with SMTP id 127mr10191416qkd.3.1596751084212;
 Thu, 06 Aug 2020 14:58:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200806181932.2253-1-krzk@kernel.org>
In-Reply-To: <20200806181932.2253-1-krzk@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 6 Aug 2020 23:57:48 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2=KXyeb=fZNkHBJ0wUT1fr0TSS5wX=wuXz9y3kSkLQQQ@mail.gmail.com>
Message-ID: <CAK8P3a2=KXyeb=fZNkHBJ0wUT1fr0TSS5wX=wuXz9y3kSkLQQQ@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Provags-ID: V03:K1:YB8iWf9qXVb2q7Tn9A7i/hiQsrB71bU69iORT4ntFqmU4OnTozS
 848LMfnK7bOjALS3WfYvtCYYFI1/QDb1RNWHH0fRebyVFAWMQYP8RT4/8LHFFM2VfSMGDLQ
 P9Vjrt0Ib/vmRM4cA2OLgcu6SY+dwA9UvZEbMgnpxH3eA/P2juDZ3k99FQWSYWjBP8YDVDh
 sZX+SQH3E/ZEauOd/JGfQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:dMHv/5fjCSk=:fZUIUyt66refxaULsvBwJu
 fB5tqW8PRGz7iLmPxl1Pq45P8REW8DGYqLNnsQPUdlw2nR6G2ljYXIZZ65AsWO3J2BxMrQWwi
 x+u9b4m76kbolCMo5HGlvRn4qPdM5JpOJ20FX2EG13s6OtiudfAT131uTu4g/8vBNBZSwwriq
 wfYKEdiOd7O8oWkRrH4TI/y7GGreEBAd4rPsfpUzwwmMO+F/OakLKV19FEWA/j8xOVWSklK0b
 B8y4mo5omqwI/rCZ1n5gP3lKBJEWm4NvPcDTw7F8VgAWse2CH5TxAycCGkLq/zYryqPuLqrZL
 9K6y2sWjG6VGHFZF5sXLScBd0lOJHhjVhnU95OJYhqRcmBmElrn7A3L0gx0rHrEIayFJEogZF
 6td5ZC+lFsdLF+hc46XyJZ339BNtbFh852eGg7s9PEPBycFEw4wGj5XWacvU3nrk3cZSyjrVy
 OywNNbCZhfoDxqGLi2nAJVN0Gye9JQSk0c6Nc2liebdRNd+WGF821yQ893xlyEcMnwpkbSmvg
 H0QTMRKXtQLAC3TlQTJrhx4goXk189LwUXx0Gl1mSCJnXGwWdQP6F9L6q5fTd+nCp9VrjyiDt
 Lz7BSST9fm84nQQfbAVBz50ew1/FqM0jPJj26vrrxQAzlF72aTnGXLlGAyebtZQAk+XCZ9YL9
 d/Z34OcAQLVxzU3aA+PSCoLo/gcNg0yrSyP/aup8vP0hVbgh3i7KUvxQdxddAme+LFNHwzoMQ
 J9OruNblXU1bPho2FjcZ/FY0RLlU527L0CwB+vIqeMd3o43UVe6iv5R2veLhG1YbXTRdN51IF
 22N2m8vTMCFIgFOWnvjx0ZDf5ncOq2aU377lv7guEU4dMdosZUr7P6knqnNivVwCYUXYLNy6p
 rHYt4nlwaYZhl1FjsWUVaeWgTRw28H1s47ECWSCHOe2bqh6cojLgTMPflpDWPfh33QC7ZfdrB
 9BAc5d67478iFft8LMfKfFEBovjUMlHTLF8wxVBHhvIprDTs/z4oE
Cc: Ulf Hansson <ulf.hansson@linaro.org>, USB list <linux-usb@vger.kernel.org>,
 Jiri Slaby <jirislaby@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Tomasz Figa <tomasz.figa@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Russell King <linux@armlinux.org.uk>, linux-spi <linux-spi@vger.kernel.org>,
 Lee Jones <lee.jones@linaro.org>, Andi Shyti <andi@etezian.org>,
 Jason Cooper <jason@lakedaemon.net>,
 "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>, Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Chanwoo Choi <cw00.choi@samsung.com>,
 Kukjin Kim <kgene@kernel.org>, linux-serial@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-mmc <linux-mmc@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Linux PWM List <linux-pwm@vger.kernel.org>, Jean Delvare <jdelvare@suse.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Ben Dooks <ben-linux@fluff.org>, Takashi Iwai <tiwai@suse.com>,
 Thomas Gleixner <tglx@linutronix.de>, Jaroslav Kysela <perex@perex.cz>,
 Simtec Linux Team <linux@simtec.co.uk>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-hwmon@vger.kernel.org,
 Felipe Balbi <balbi@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux PM list <linux-pm@vger.kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Sebastian Reichel <sre@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Sangbeom Kim <sbkim73@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
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

On Thu, Aug 6, 2020 at 8:20 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Hi All,
>
> Shortly
> =======
> This is a continuation of Arnd's work from 2019 [1].  The goal is to
> cleanup, merge and finally make the Samsung S3C24xx and S3C64xx
> architectures multiplatform.  The multiplatform did not happen yet
> here... just cleaning up and merging into one mach-s3c.
>
> I intend to take it through Samsung SoC tree so all Acks are welcomed.
>
> Changes since v1
> ================
> 1. Rebased,
> 2. Addressed comments (including mine),
> 3. Few new patches.
>
> Please see individual changelogs (per patch).
>
> [1] https://patchwork.kernel.org/project/linux-samsung-soc/list/?series=185855&state=*

Thanks a lot for picking up my old branch!

All your additional changes look fine to me, feel free to add

Acked-by: Arnd Bergmann <arnd@arndb.de>

to the patches you added on top my original series.

     Arnd
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
