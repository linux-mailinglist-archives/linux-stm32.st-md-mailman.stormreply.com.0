Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A35F28F8
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Nov 2019 09:20:28 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D44EEC36B0B;
	Thu,  7 Nov 2019 08:20:27 +0000 (UTC)
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74C40C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Nov 2019 08:20:27 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id v8so1223211ljh.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 Nov 2019 00:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DlF4imC2yuisAQo2SgUCy1P9SylqUN75hyqh76y3GuU=;
 b=aR0m+nKjgA8feFlTBlwL84cE9daL5eeq25n5+TiO9llQb9TsmGAwBzMrydUeOVpqcd
 G/NOnRqUmqV9FDnFABUvFStxGmc4lYiT1CO71XxvWX8QHiG+QuYeULshpCobKFsWAsYm
 tdhQ8t6991g/IUrvBhXPOW8BhPBS86zZJGQOc82tWlYl1GOQvr9MTGWvpPLFiIeR9lEr
 foMt76rS4g+F3J5BvZ1hmIknazOLP6jdC15sbiF4dtMlHzvLlDlwdEVWxYVkVYDLBy/H
 2YD/40djhB6z1791duVFLnjNJBICD/pXuSn9Wyozo1Bsi0Bqg8js/iowtRmXORd7WJzi
 n1iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DlF4imC2yuisAQo2SgUCy1P9SylqUN75hyqh76y3GuU=;
 b=DfSKeFYhJ9H/2wUMJDi0zjA1468VsGVEefQGch4ER5eb7iw9GeU2OEbtZ+YB11zAR3
 jvGFmojlsicEnblek3THzE9Bl5nVqzXT1gq0NskO4F8tzzz31ZrHRthz7HmPFI6LuY0T
 93EehaTsdLI40nRm5gz6aoWCp6ysb33Y9EkBTWDzuunu54cjZfLIZt9wl84vHwO6POwN
 DxsHyNxT0jfFU2nXHLbHJ2IcmSQBfQWQDyCC/V58UMosIAya/aX7RNbXBG1mPjW5Ryxv
 B/sLXqMSG/QWC+bBHZeV9h0HDB1e4eRYRz5jHKZO37oDFDHm4dKQbEW3a+xGdzGsJA29
 EKPQ==
X-Gm-Message-State: APjAAAWzz7oZawvnNW6AiImUUfV+0UYRpyx5YCSSsQT1yiGrfcDShs+w
 fhiYQ7cvPuAMvjfE6jsT+LfJtwAwDEOhSUHf3eyyvg==
X-Google-Smtp-Source: APXvYqxJbhcWq+G1f8Jk5lv3i720/gVAo6L3L+y4Wi2RhTUP1I1SjMgB/XswEKoQSm7d2gl5jZMd4ClfaG2HxTvfJoQ=
X-Received: by 2002:a05:651c:1202:: with SMTP id
 i2mr1417186lja.218.1573114826673; 
 Thu, 07 Nov 2019 00:20:26 -0800 (PST)
MIME-Version: 1.0
References: <cover.1573029228.git.matti.vaittinen@fi.rohmeurope.com>
 <fcd51b067bafa571b3d9879a3afc31e8c764100d.1573029228.git.matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <fcd51b067bafa571b3d9879a3afc31e8c764100d.1573029228.git.matti.vaittinen@fi.rohmeurope.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Nov 2019 09:20:15 +0100
Message-ID: <CACRpkdZm823gEkpw8hYfuLp99ssKtGQMcEcZHC34xd2kQPYH-A@mail.gmail.com>
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 David Daney <david.daney@cavium.com>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Peter Tyser <ptyser@xes-inc.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>, Marek Behun <marek.behun@nic.cz>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Bamvor Jian Zhang <bamv2005@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 linux-pwm@vger.kernel.org, Grygorii Strashko <grygorii.strashko@ti.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 Matti Vaittinen <mazziesaccount@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, linux-tegra@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Scott Branden <sbranden@broadcom.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Andrew Jeffery <andrew@aj.id.au>, "Enrico Weigelt,
 metux IT consult" <info@metux.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Thorsten Scherer <t.scherer@eckelmann.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, patches@opensource.cirrus.com,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 1/2] gpio: Add definition for GPIO
	direction
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

On Wed, Nov 6, 2019 at 9:51 AM Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> wrote:

> At least for me it is difficult to remember the meaning of GPIO
> direction values. Define GPIO_LINE_DIRECTION_IN and
> GPIO_LINE_DIRECTION_OUT so that occasional GPIO contributors would
> not need to always check the meaning of hard coded values 1 and 0.
>
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

Patch applied.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
