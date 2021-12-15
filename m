Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A90447565B
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Dec 2021 11:28:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B03D9C5EC6C;
	Wed, 15 Dec 2021 10:28:49 +0000 (UTC)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
 [209.85.222.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C3DDC5E2C5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Dec 2021 10:28:48 +0000 (UTC)
Received: by mail-ua1-f47.google.com with SMTP id p2so40031964uad.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Dec 2021 02:28:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6KatagByVh+i+7U2cQTugmti3xcd82C2QfCSX1Fy8Jo=;
 b=iiRBrtTg5I9twZ8AYQBp7ofu7xaztPr7TPjCwI7XQDVY5LDwOfHd62xM4f2unrjWFg
 JLLp8+n0VL5bOwGkYZX0HgceCdSUeDf5PCRLkSD7N+nx3+UmbeHBW7fCc9kxqA5REBwU
 10jJiA8c6CMIhdv6Sztfy5aB1VrUFYFQbwtEcyEirSk7bYORFNJLJZS9WfinS7eCGjwz
 lnP9W2pL7BQgshmijgpL0CpXN90WPGX7rvluT9v6/AJ7+umkukymP4gK2abSX7bS8ISU
 TjtYRhpjAhXyExps6G80HdSMWHszLZSzJvSN+dwolNcr8JdIQyKpx3NvVsfJJ+tXMb+a
 yjyQ==
X-Gm-Message-State: AOAM533sHU9G5Hgiv8Y5nFMYAeNlbBHViHGVQO/K8RbwdomODCgId9IH
 VqM9eL0C1rPOvae1ed53/rEr/0aGL6gWPw==
X-Google-Smtp-Source: ABdhPJwhG5rQafu64bKGjklVb5ySYx3icDiGHXAr7FUsF28ZjR4WTLA8emMeIABOZSNhK4hvRJtmAQ==
X-Received: by 2002:ab0:3ca0:: with SMTP id a32mr9364700uax.63.1639564126990; 
 Wed, 15 Dec 2021 02:28:46 -0800 (PST)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com.
 [209.85.221.182])
 by smtp.gmail.com with ESMTPSA id i7sm328969vkh.24.2021.12.15.02.28.45
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 02:28:46 -0800 (PST)
Received: by mail-vk1-f182.google.com with SMTP id m19so14292766vko.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Dec 2021 02:28:45 -0800 (PST)
X-Received: by 2002:a05:6122:920:: with SMTP id
 j32mr2889520vka.20.1639564125403; 
 Wed, 15 Dec 2021 02:28:45 -0800 (PST)
MIME-Version: 1.0
References: <20211213163929.7509-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20211213163929.7509-1-andriy.shevchenko@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Dec 2021 11:28:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW_CKcXwOSUAbCreHVM62E35yjiCfpXC_wM0zK-V43CnA@mail.gmail.com>
Message-ID: <CAMuHMdW_CKcXwOSUAbCreHVM62E35yjiCfpXC_wM0zK-V43CnA@mail.gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Herve Codina <herve.codina@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Viresh Kumar <vireshk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Douglas Anderson <dianders@chromium.org>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Florian Fainelli <f.fainelli@gmail.com>, arm-soc <soc@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Andy Gross <agross@kernel.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Baruch Siach <baruch@tkos.co.il>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Sam Shih <sam.shih@mediatek.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-actions@lists.infradead.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 linux-mediatek@lists.infradead.org,
 Radim Pavlik <radim.pavlik@tbs-biometrics.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Support Opensource <support.opensource@diasemi.com>,
 Scott Branden <sbranden@broadcom.com>, - <patches@opensource.cirrus.com>,
 Sean Wang <sean.wang@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ray Jui <rjui@broadcom.com>, Colin Foster <colin.foster@in-advantage.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-oxnas@groups.io,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v1 1/2] pinctrl: Get rid of duplicate
 of_node assignment in the drivers
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

On Mon, Dec 13, 2021 at 5:40 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> GPIO library does copy the of_node from the parent device of
> the GPIO chip, there is no need to repeat this in the individual
> drivers. Remove these assignment all at once.
>
> For the details one may look into the of_gpio_dev_init() implementation.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

>  drivers/pinctrl/renesas/pinctrl-rza2.c     | 1 -

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
