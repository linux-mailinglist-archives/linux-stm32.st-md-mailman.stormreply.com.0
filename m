Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0137B41C2
	for <lists+linux-stm32@lfdr.de>; Sat, 30 Sep 2023 17:37:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3AE3C6B47A;
	Sat, 30 Sep 2023 15:37:51 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 09CCCC6B477
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 30 Sep 2023 15:37:49 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-69335ddbe16so4525064b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 30 Sep 2023 08:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696088268; x=1696693068;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=SFxpcz2a7H2ZjgJ8ssrmjpRaSpMI8na0366gdvXOP5U=;
 b=ExAzO1TSQ4JCvY4WK3iNRTlKuPAvPL1SiiNOnkd9nUBRI8VtGcDLDAj6wPMPVf4ozz
 TMfnymsaCdn8/ptSxT+L0/CRwyRrT221C6hslnDeHchtTRFPJyxE+PR4jTyvuQVVMhDt
 IuJel/fB4qeyvVmU0A+e1UVIC3EpBPBQJ8TZkCPYCCMYPZ7I7W0JPQW1okT1r/GEj7q/
 58st+CH140TNR/akAPKHeUIRXaHR4yQNgdu3cHoOEAvAs6utJw8rAY5tM6OLp2jzJdtj
 jdamYnrAYKWLEIGlU84emuOi+Rm0ho0FbSr4uW2RSxb3ILkFSaV/uZ2yNjyE78kMgOhB
 ZOIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696088268; x=1696693068;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SFxpcz2a7H2ZjgJ8ssrmjpRaSpMI8na0366gdvXOP5U=;
 b=vMpOX7gjpsKIv7npamYrQ6H7lTDvekKwKo5pHQpalHyzQcKFQy9OrGvEEMTVmYmP9i
 RGoqC7hFC+VcnY9amCINGE9ecHot8OykvipU6C69lJeyR/Sds8brYDnczY6DAm7VqymF
 l0+mOylKC9OPxCffwWsaZY7cjQju5bac3edoJLGsc3bj4CIHQOKhfWdqsixSvNP63Q6x
 pos03LyENIIPBCukF9aRxZBT4eAtxwLtpJyVup9kkx/xBA+CEVhY7NyefyuHdYMju+xn
 Cpyl34/8ln0UDXRV0ygGMJEbb4BiB+X0jh6KNHSf38VrphDGU6IFSfYEDSv/sgmwsYM3
 cpBQ==
X-Gm-Message-State: AOJu0Yyw1Hwsh5MVNsVlzV4NvP298k8Q3Fewr5lgV6uR/hZ3emuxB8c2
 sTd5Ouwrlgny3uptbs2BS5M=
X-Google-Smtp-Source: AGHT+IEMqhKSToJyXm3yTD7cSFnLWSycVL5nK0X/hEUjcO1rvPkbJ0hf7ZvRqV9SvIbBhj0xSyFIPg==
X-Received: by 2002:a05:6a00:16c7:b0:68f:ecb9:5fde with SMTP id
 l7-20020a056a0016c700b0068fecb95fdemr7078816pfc.34.1696088268304; 
 Sat, 30 Sep 2023 08:37:48 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:a90f:2dad:30c1:d923])
 by smtp.gmail.com with ESMTPSA id
 a10-20020a62d40a000000b006926506de1csm17137176pfh.28.2023.09.30.08.37.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Sep 2023 08:37:47 -0700 (PDT)
Date: Sat, 30 Sep 2023 08:37:43 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <ZRhAx5oDFxJJkUIz@google.com>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
 <ZQ+jddG+UbuSD7pP@google.com>
 <20230924155057.e4k4ruv5iggbt6q6@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230924155057.e4k4ruv5iggbt6q6@pengutronix.de>
Cc: Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Pavel Machek <pavel@ucw.cz>, Guenter Roeck <groeck@chromium.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 chrome-platform@lists.linux.dev,
 Michael Hennerich <michael.hennerich@analog.com>,
 Samuel Holland <samuel@sholland.org>, Andrey Moiseev <o2g.org.ru@gmail.com>,
 Liang He <windhl@126.com>, Ruan Jinjie <ruanjinjie@huawei.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 joewu =?utf-8?B?KOWQs+S7suaMryk=?= <joewu@msi.com>,
 Miloslav Trmac <mitr@volny.cz>, Chen-Yu Tsai <wens@csie.org>,
 Andy Gross <agross@kernel.org>, Benson Leung <bleung@chromium.org>,
 linux-input@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>,
 linux-sunxi@lists.linux.dev, ye xingchen <ye.xingchen@zte.com.cn>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Yangtao Li <frank.li@vivo.com>,
 linux-arm-msm@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
 "Steven Rostedt \(Google\)" <rostedt@goodmis.org>,
 Hans de Goede <hdegoede@redhat.com>, Siarhei Volkau <lis8215@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michal Simek <michal.simek@amd.com>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, Paolo Abeni <pabeni@redhat.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Chen Jun <chenjun102@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Jonathan Corbet <corbet@lwn.net>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, patches@opensource.cirrus.com,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 00/52] input: Convert to platform remove
 callback returning void
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

Hi Uwe,

Sorry for the spotty responses.

On Sun, Sep 24, 2023 at 05:50:57PM +0200, Uwe Kleine-K=F6nig wrote:
> Hello Dmitry,
> =

> On Sat, Sep 23, 2023 at 07:48:21PM -0700, Dmitry Torokhov wrote:
> > On Wed, Sep 20, 2023 at 02:57:37PM +0200, Uwe Kleine-K=F6nig wrote:
> > > Hello,
> > > =

> > > this series converts all platform drivers below drivers/input to use
> > > remove_new. The motivation is to get rid of an integer return code
> > > that is (mostly) ignored by the platform driver core and error prone =
on
> > > the driver side.
> > > =

> > > See commit 5c5a7680e67b ("platform: Provide a remove callback that
> > > returns no value") for an extended explanation and the eventual goal.
> > > =

> > > There are no interdependencies between the patches. As there are still
> > > quite a few drivers to convert, I'm happy about every patch that makes
> > > it in. So even if there is a merge conflict with one patch until you
> > > apply or a subject prefix is suboptimal, please apply the remainder of
> > > this series anyhow.
> > =

> > Applied the lot (fixing the i8042-sparcio patch subject), thank you!
> =

> Thanks. In the meantime I found out why my process failed here: I only
> fixed *.c, but this driver struct is defined in a header file
> i8042-sparcio.h.
> =

> This file is only included by drivers/input/serio/i8042.h which in turn
> is only included by drivers/input/serio/i8042.c. So there is only one
> instance created, but I'd call that unusual anyhow.

Right, i8042 is essentially a singleton, and what you see here is an
attempt to bolt OF onto a legacy driver that is largely predates the
current driver model. I wanted to clean it up, but it is still widely
used and I am hesitant to disturb it too much.

Thanks.

-- =

Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
