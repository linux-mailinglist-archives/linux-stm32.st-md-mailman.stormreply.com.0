Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BE724C2B0
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Aug 2020 17:59:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 407B0C32E8F;
	Thu, 20 Aug 2020 15:59:21 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51F63C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Aug 2020 15:59:19 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id a14so2531327wra.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Aug 2020 08:59:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=AICl07wj2rdeLbaUuIr48jZgNAhD7HLePnLKN8bK9F8=;
 b=AshXK2tvtzasxe0m0etf2xhkOBARHZbdnJDN7ZFXAW7xzDIvtrMAgzcTJpdCszKc2q
 Z6+CITw5WmyamkcRKvg5mPH4wd2pXVkdnyVYmty0r51yaQZIhfdn5+FEqD11LFSKXmSO
 VV47Q2IEpv03Lckr9H2RN7wglqxWzhuNgn+/6rHcqlB8QclxqkmS7lcARQi42p6P/t4K
 CpQUZt43bAWnAHpVNgIkiIv2r2Ybuakyibp1r6VxmeCe/gCJ0Fj+lz1AtsjJkCNXgyOm
 gnfcKaDzm/pFJsBADahIreOCFuzNKfucMeFFj1XKFCXUkMnsJZ8kZLa4uHC5D4ELNhA+
 fIwA==
X-Gm-Message-State: AOAM532bO5oOt8UwgqM12Msx4gOL3SOdHzovGLwa/zJHevT6uhOos34F
 ncm5PLXukzTGxOMKBB0rVF4=
X-Google-Smtp-Source: ABdhPJywyymogpnt/oOUmaLTWNdzju8F9YvcCdpX66tCuBP6i1vn7QobEV9VEvGit4tTroGXYziTeA==
X-Received: by 2002:adf:b353:: with SMTP id k19mr3772990wrd.159.1597939158768; 
 Thu, 20 Aug 2020 08:59:18 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
 by smtp.googlemail.com with ESMTPSA id l11sm4693828wme.11.2020.08.20.08.59.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 20 Aug 2020 08:59:18 -0700 (PDT)
Date: Thu, 20 Aug 2020 17:59:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kukjin Kim <kgene@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Simtec Linux Team <linux@simtec.co.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Viresh Kumar <viresh.kumar@linaro.org>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Ben Dooks <ben-linux@fluff.org>, Sebastian Reichel <sre@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@kernel.org>,
 Andi Shyti <andi@etezian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Felipe Balbi <balbi@kernel.org>,
 Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 patches@opensource.cirrus.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-clk@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, alsa-devel@alsa-project.org
Message-ID: <20200820155913.GA21395@kozik-lap>
References: <20200806181932.2253-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200806181932.2253-1-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>
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

On Thu, Aug 06, 2020 at 08:19:32PM +0200, Krzysztof Kozlowski wrote:
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
>

Hi All,

I applied second part of the set which finishes this step of S3C
cleanup. Thanks to Arnd for the work!

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
