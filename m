Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C85C4105446
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Nov 2019 15:21:31 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 818A1C36B0B;
	Thu, 21 Nov 2019 14:21:31 +0000 (UTC)
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3FC8C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Nov 2019 14:21:29 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id cq11so1539579pjb.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Nov 2019 06:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=advO9e9Vq8oX5pUg5eqAZ8hMHDIBv+K1uEoGcfdp6Pg=;
 b=Q/BiBo5hxPoRt7be6VMJbLczAnhSIy2lPWLssuK4UBRdiypufvszol2d35aiqoLm5B
 SnKaYGix1iSdFR4Z0iQBRcoWRRlWgS/LX1T6OfxQc3J0zhILkVpifvNiTb+y+rfbDm0w
 ftICNsoRSXB+p/53aKCBsZkAQSeFLuZGwKG7uzTDMnpCiIguML0XbtgPDbEfn2KTgui9
 mJJTt8oyI2BtuJmRycEYuvd+Hz+5Dxb4VKgYRsIZip1h8tBA1E3la98IQ4r4pfkT961c
 kPFz98ibRpZdmkkrQD717+Xw7H+1b3wOmfc3GyB3eIe907cuW8Umfblwh4MtaukzCmZe
 r4dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=advO9e9Vq8oX5pUg5eqAZ8hMHDIBv+K1uEoGcfdp6Pg=;
 b=iVGtIXBtiAIL3JOvRv6ZSIoiTHTCkf5vZFyu93P8nx2msC2hDXo/o+jXVyCuI52V0L
 d7j/y3a8o8oKVnqVqqXgQq+QG3D6Sk/kC69vSHj+HstD+Zs6bhX4lNvNa47XUEx78Np2
 QWG/3NldkaHqFKHum97XMfOKRepWI+9MKgHRkcsys8ywUhVxmByuGvJEzOGpx5f9JFEl
 8IZ0ybWwhcTji9FXqrI2e1P6NY0edpe+c82HbjFjIPMBlhqapJdePAJc57W7wWO5Z1Tn
 Z023VSWuPRMV4PE4J420BKT08VyErScyIAbXJnn0KOTuqpyFFoL8QoqL5X9ZvMrIMlA1
 ct8Q==
X-Gm-Message-State: APjAAAVq7+famL9ADjIbizkv5TdxvHQmADrLLuEiSseB4Ma7LKTWKVsZ
 8Qf1tuz+yaHfr1MnEqs5x38=
X-Google-Smtp-Source: APXvYqxJTWh2kG8FI80v+Upz1ZQtluio58NfbwFL3EB19Ri9bUOi5lj878945BYaiTM4NAZUFidO8g==
X-Received: by 2002:a17:902:9043:: with SMTP id
 w3mr9308463plz.30.1574346088100; 
 Thu, 21 Nov 2019 06:21:28 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id m34sm3321136pgb.26.2019.11.21.06.21.26
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 21 Nov 2019 06:21:27 -0800 (PST)
Date: Thu, 21 Nov 2019 06:21:26 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Christophe ROULLIER <christophe.roullier@st.com>
Message-ID: <20191121142126.GB13249@roeck-us.net>
References: <20191121082813.29267-1-christophe.roullier@st.com>
 <20191121082813.29267-2-christophe.roullier@st.com>
 <ce10681c-8fa3-0fa6-3509-376a2f37aec9@roeck-us.net>
 <550566ff-31bd-1f40-63d1-67b013f8be75@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <550566ff-31bd-1f40-63d1-67b013f8be75@st.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH 1/1] drivers: watchdog: stm32_iwdg: set
 WDOG_HW_RUNNING at probe
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Thu, Nov 21, 2019 at 01:45:21PM +0000, Christophe ROULLIER wrote:
> Hi Guenter,
> =

> On 11/21/19 10:53 AM, Guenter Roeck wrote:
> > On 11/21/19 12:28 AM, Christophe Roullier wrote:
> >> If the watchdog hardware is already enabled during the boot process,
> >> when the Linux watchdog driver loads, it should reset the watchdog and
> >> tell the watchdog framework. As a result, ping can be generated from
> >> the watchdog framework (if CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is set),
> >> until the userspace watchdog daemon takes over control
> >>
> >
> > This is not what the code is doing. It sets the WDOG_HW_RUNNING flag
> > unconditionally, no matter if the watchdog is already running or not.
> > It also changes the semantic of the rest of the code, as well as
> > functionality. The code in start_timeout no longer waits, and the ping
> > code explicitly (re-)enables the watchdog.
> >
> > If you want an option to start the watchdog at probe time =

> > unconditionally,
> > please add a module parameter to do it. Otherwise you'll need to check =
if
> > it is indeed enabled before setting WDOG_HW_RUNNING, and in that case it
> > should not be necessary to re-enable it. It should also not be necessary
> > to split the start function.
> =

> With our IWDG IP, there is no way to read values from hardware (if it is =

> running or not)
> =

> We are in same case of intel-mid_wdt.c driver, we have Uboot which can
> =

> leaves the watchdog running. So we need to force the kicking of our =

> watchdog.
> =


"can" or "leaves" ? =


Anyway, if that is the case, please follow the guidance from intel-mid_wdt.=
c,
and explain it accordingly. Alternatively, please explain why something like

	ret =3D wdt_start(wdt_dev);
        if (ret)
                return ret;

	/* Make sure the watchdog is serviced */
        set_bit(WDOG_HW_RUNNING, &wdt_dev->status);

would not work in your case, and why all that added complexity
is needed.

Thanks,
Guenter

> Thanks
> =

> Christophe
> =

> >
> > Thanks,
> > Guenter
> >
> >> Fixes:4332d113c66a ("watchdog: Add STM32 IWDG driver")
> >> Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
> >> ---
> >> =A0 drivers/watchdog/stm32_iwdg.c | 57 ++++++++++++++++++++++++-------=
----
> >> =A0 1 file changed, 40 insertions(+), 17 deletions(-)
> >>
> >> diff --git a/drivers/watchdog/stm32_iwdg.c =

> >> b/drivers/watchdog/stm32_iwdg.c
> >> index a3a329011a06..2b3be3b1c15b 100644
> >> --- a/drivers/watchdog/stm32_iwdg.c
> >> +++ b/drivers/watchdog/stm32_iwdg.c
> >> @@ -87,8 +87,23 @@ static inline void reg_write(void __iomem *base, =

> >> u32 reg, u32 val)
> >> =A0 static int stm32_iwdg_start(struct watchdog_device *wdd)
> >> =A0 {
> >> =A0=A0=A0=A0=A0 struct stm32_iwdg *wdt =3D watchdog_get_drvdata(wdd);
> >> -=A0=A0=A0 u32 tout, presc, iwdg_rlr, iwdg_pr, iwdg_sr;
> >> -=A0=A0=A0 int ret;
> >> +
> >> +=A0=A0=A0 dev_dbg(wdd->parent, "%s\n", __func__);
> >> +
> >> +=A0=A0=A0 /*=A0 Start the watchdog */
> >> +=A0=A0=A0 reg_write(wdt->regs, IWDG_KR, KR_KEY_ENABLE);
> >> +
> >> +=A0=A0=A0 /* reload watchdog */
> >> +=A0=A0=A0 reg_write(wdt->regs, IWDG_KR, KR_KEY_RELOAD);
> >> +
> >> +=A0=A0=A0 set_bit(WDOG_HW_RUNNING, &wdd->status);
> >> +=A0=A0=A0 return 0;
> >> +}
> >> +
> >> +static int stm32_iwdg_setprescaler(struct watchdog_device *wdd)
> >> +{
> >> +=A0=A0=A0 struct stm32_iwdg *wdt =3D watchdog_get_drvdata(wdd);
> >> +=A0=A0=A0 u32 tout, presc, iwdg_rlr, iwdg_pr;
> >> =A0 =A0=A0=A0=A0=A0 dev_dbg(wdd->parent, "%s\n", __func__);
> >> =A0 @@ -108,19 +123,6 @@ static int stm32_iwdg_start(struct =

> >> watchdog_device *wdd)
> >> =A0=A0=A0=A0=A0 /* set prescaler & reload registers */
> >> =A0=A0=A0=A0=A0 reg_write(wdt->regs, IWDG_PR, iwdg_pr);
> >> =A0=A0=A0=A0=A0 reg_write(wdt->regs, IWDG_RLR, iwdg_rlr);
> >> -=A0=A0=A0 reg_write(wdt->regs, IWDG_KR, KR_KEY_ENABLE);
> >> -
> >> -=A0=A0=A0 /* wait for the registers to be updated (max 100ms) */
> >> -=A0=A0=A0 ret =3D readl_relaxed_poll_timeout(wdt->regs + IWDG_SR, iwd=
g_sr,
> >> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 !(iwdg_s=
r & (SR_PVU | SR_RVU)),
> >> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 SLEEP_US=
, TIMEOUT_US);
> >> -=A0=A0=A0 if (ret) {
> >> -=A0=A0=A0=A0=A0=A0=A0 dev_err(wdd->parent, "Fail to set prescaler, re=
load regs\n");
> >> -=A0=A0=A0=A0=A0=A0=A0 return ret;
> >> -=A0=A0=A0 }
> >> -
> >> -=A0=A0=A0 /* reload watchdog */
> >> -=A0=A0=A0 reg_write(wdt->regs, IWDG_KR, KR_KEY_RELOAD);
> >> =A0 =A0=A0=A0=A0=A0 return 0;
> >> =A0 }
> >> @@ -131,6 +133,9 @@ static int stm32_iwdg_ping(struct watchdog_device =

> >> *wdd)
> >> =A0 =A0=A0=A0=A0=A0 dev_dbg(wdd->parent, "%s\n", __func__);
> >> =A0 +=A0=A0=A0 /*=A0 Start the watchdog */
> >> +=A0=A0=A0 reg_write(wdt->regs, IWDG_KR, KR_KEY_ENABLE);
> >> +
> >> =A0=A0=A0=A0=A0 /* reload watchdog */
> >> =A0=A0=A0=A0=A0 reg_write(wdt->regs, IWDG_KR, KR_KEY_RELOAD);
> >> =A0 @@ -140,12 +145,21 @@ static int stm32_iwdg_ping(struct =

> >> watchdog_device *wdd)
> >> =A0 static int stm32_iwdg_set_timeout(struct watchdog_device *wdd,
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 unsigned int=
 timeout)
> >> =A0 {
> >> +=A0=A0=A0 int ret;
> >> +
> >> =A0=A0=A0=A0=A0 dev_dbg(wdd->parent, "%s timeout: %d sec\n", __func__,=
 timeout);
> >> =A0 =A0=A0=A0=A0=A0 wdd->timeout =3D timeout;
> >> =A0 -=A0=A0=A0 if (watchdog_active(wdd))
> >> -=A0=A0=A0=A0=A0=A0=A0 return stm32_iwdg_start(wdd);
> >> +=A0=A0=A0 if (watchdog_active(wdd)) {
> >> +=A0=A0=A0=A0=A0=A0=A0 ret =3D stm32_iwdg_setprescaler(wdd);
> >> +=A0=A0=A0=A0=A0=A0=A0 if (ret) {
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(wdd->parent, "failed to set=
 prescaler\n");
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;
> >> +=A0=A0=A0=A0=A0=A0=A0 } else {
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return stm32_iwdg_start(wdd);
> >> +=A0=A0=A0=A0=A0=A0=A0 }
> >> +=A0=A0=A0 }
> >> =A0 =A0=A0=A0=A0=A0 return 0;
> >> =A0 }
> >> @@ -262,12 +276,21 @@ static int stm32_iwdg_probe(struct =

> >> platform_device *pdev)
> >> =A0=A0=A0=A0=A0 watchdog_set_nowayout(wdd, WATCHDOG_NOWAYOUT);
> >> =A0=A0=A0=A0=A0 watchdog_init_timeout(wdd, 0, dev);
> >> =A0 +=A0=A0=A0 /* Make sure the watchdog is serviced */
> >> +=A0=A0=A0 set_bit(WDOG_HW_RUNNING, &wdd->status);
> >> +
> >> =A0=A0=A0=A0=A0 ret =3D devm_watchdog_register_device(dev, wdd);
> >> =A0=A0=A0=A0=A0 if (ret)
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;
> >> =A0 =A0=A0=A0=A0=A0 platform_set_drvdata(pdev, wdt);
> >> =A0 +=A0=A0=A0 ret =3D stm32_iwdg_setprescaler(wdd);
> >> +=A0=A0=A0 if (ret) {
> >> +=A0=A0=A0=A0=A0=A0=A0 dev_err(dev, "failed to set prescaler\n");
> >> +=A0=A0=A0=A0=A0=A0=A0 return ret;
> >> +=A0=A0=A0 }
> >> +
> >> =A0=A0=A0=A0=A0 return 0;
> >> =A0 }
> >>
> >
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
