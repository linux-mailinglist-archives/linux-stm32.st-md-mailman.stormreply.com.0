Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7509D7AC651
	for <lists+linux-stm32@lfdr.de>; Sun, 24 Sep 2023 04:48:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 128FAC6B44C;
	Sun, 24 Sep 2023 02:48:30 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F7D1C6A5F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 Sep 2023 02:48:28 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id
 5614622812f47-3a9b41ffe12so2930306b6e.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 23 Sep 2023 19:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695523707; x=1696128507;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ZqzUc5Ca0TLk51f9yoIdIBC/lxIeRKZcx3CKiVIdjzQ=;
 b=RQYweZfXjeQL4gextYlkoMtq1MAytPlm+bdbwAk4WgqDz4VHPVYiTIWAZ/iDFz6ry6
 JzTvMwr15WobqyJkzVL+DnnE9BCS54X7rZTYhiJKFL0riSydZGoGqqQsHG+/BSCdmyKz
 dr/P5PS73SafRCeJxgG0+lX+4Fpf0p937Y80UIl2YZ9degHseWm/AUr/Ba2tY1g/0iM2
 PH8e4iSGsKvSOA2OF3tmnDmLAcS4D5i+893Ub/BECVwYrH4lf0BArBhbRsZlCOcIS8fV
 Z6mmm2hT82CT1XJsSeNV+bj4h9QYEjSrr0Tkrlx3bi5xZ9F0MIGS9DtgTaL/+fx5A2Fq
 bQLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695523707; x=1696128507;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZqzUc5Ca0TLk51f9yoIdIBC/lxIeRKZcx3CKiVIdjzQ=;
 b=s0Irrukr3RII4qLqNwOJRxbidwHCkvnxncCYiFQ1I/C11Ugrujn5xe9DpXeIN8Qn5I
 v1U/AbGEetZG4VlUjnb0vrgw7Ou3DdkUhDO5woHWecGPmiKGJ7MScJ+PunmjRs3it9gU
 faYvoKKJZM2d8htH2QRlLSzGBIikQBSpceYRZr/Z5PhGzULvSlpA6W/26l/EwILra74f
 82BnC0bZBlASTsD3W9YfKVu5/OmM4I7LKHJT2JIuOjf2NSMxIAIjz2kNa2+BJdK9ydsk
 IZvVMghaVdn71mRiTcwGXVUmywNnJPKPYbS7pzMuxtmVOThQQCZC179FZiUQhzNUhElc
 Q0cg==
X-Gm-Message-State: AOJu0Yw+O/ISc+DJaRxCcXFqzd8weXVDIrwxDphHnjKC27oKmDU5oO5L
 Jh5ig7CpuJpJzaavD9Z6+No=
X-Google-Smtp-Source: AGHT+IFsJQ1vfOpuk2IaQRPrCUNaPYRrBLQFBvu86Kz8YHQlL7Jz8q3Be91hgZK6q2QTnHVxxVtMXg==
X-Received: by 2002:a05:6808:15a5:b0:3ad:f86a:877b with SMTP id
 t37-20020a05680815a500b003adf86a877bmr5344294oiw.23.1695523707158; 
 Sat, 23 Sep 2023 19:48:27 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:3d36:f550:baf4:ae75])
 by smtp.gmail.com with ESMTPSA id
 h1-20020a170902748100b001bbc8d65de0sm6050106pll.67.2023.09.23.19.48.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Sep 2023 19:48:26 -0700 (PDT)
Date: Sat, 23 Sep 2023 19:48:21 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <ZQ+jddG+UbuSD7pP@google.com>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
Cc: Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Pavel Machek <pavel@ucw.cz>, Guenter Roeck <groeck@chromium.org>,
 Liang He <windhl@126.com>, linux-stm32@st-md-mailman.stormreply.com,
 Daniel Lezcano <daniel.lezcano@linaro.org>, chrome-platform@lists.linux.dev,
 Arnd Bergmann <arnd@arndb.de>, Samuel Holland <samuel@sholland.org>,
 Andrey Moiseev <o2g.org.ru@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Ruan Jinjie <ruanjinjie@huawei.com>, Yangtao Li <frank.li@vivo.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 joewu =?utf-8?B?KOWQs+S7suaMryk=?= <joewu@msi.com>,
 Miloslav Trmac <mitr@volny.cz>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>,
 linux-input@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>,
 linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Rob Herring <robh@kernel.org>, ye xingchen <ye.xingchen@zte.com.cn>,
 Kalle Valo <kvalo@kernel.org>,
 "Steven Rostedt \(Google\)" <rostedt@goodmis.org>,
 Hans de Goede <hdegoede@redhat.com>, Siarhei Volkau <lis8215@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Benson Leung <bleung@chromium.org>, linux-arm-kernel@lists.infradead.org,
 Paolo Abeni <pabeni@redhat.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Chen Jun <chenjun102@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, kernel@pengutronix.de,
 patches@opensource.cirrus.com, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, Bjorn Andersson <andersson@kernel.org>
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

On Wed, Sep 20, 2023 at 02:57:37PM +0200, Uwe Kleine-K=F6nig wrote:
> Hello,
> =

> this series converts all platform drivers below drivers/input to use
> remove_new. The motivation is to get rid of an integer return code
> that is (mostly) ignored by the platform driver core and error prone on
> the driver side.
> =

> See commit 5c5a7680e67b ("platform: Provide a remove callback that
> returns no value") for an extended explanation and the eventual goal.
> =

> There are no interdependencies between the patches. As there are still
> quite a few drivers to convert, I'm happy about every patch that makes
> it in. So even if there is a merge conflict with one patch until you
> apply or a subject prefix is suboptimal, please apply the remainder of
> this series anyhow.

Applied the lot (fixing the i8042-sparcio patch subject), thank you!

-- =

Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
