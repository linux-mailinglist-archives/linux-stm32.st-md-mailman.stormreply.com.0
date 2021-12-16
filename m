Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD73476899
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Dec 2021 04:19:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93B8CC5E2C5;
	Thu, 16 Dec 2021 03:19:22 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 838E4C0614D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Dec 2021 03:19:21 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id bf8so34564394oib.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Dec 2021 19:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RWM/2Tdo+A39zviPt3A6JldRYsbUDOs2gZmt1TWRfEU=;
 b=zRWPUcug9JLw4lLpjR5FRm7N3TahpWbYFQnGkQdY0nnpN0NcMRzW1rPNPX2iUOk+fz
 wqb2Z9a1/S63sZxUor6sGazjkdHQXZfktqexaXyD3BN2xxB3TLdiriHQSLyOSe0gdWtn
 IP+TVnZklGicQ0oM1CwDLRlXFz5vx0Qw+MJ72Ye/aRXa2mhUUMemZO6K/Bk+sFO9qcGe
 TOwf8L9Izfo45NtjGjU+076dqTi7ndUdP3E9jIOqVUAkMS6nRj9BnMFTny39NDTvu0Xm
 yvkv1F4ZMghOB5QWYM0X7vwbuQT6eofb57B8D4yRhQJl+4SFgLfOS6uC/bAaI4RaNfNd
 L5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RWM/2Tdo+A39zviPt3A6JldRYsbUDOs2gZmt1TWRfEU=;
 b=hWJVlf1slbHr8jI0noN35CxRrifXWieZZBPfyD7xdEiS9u/SZ/0zhLumZXAmOqNX4i
 RRD23zr92OleSaFDnr0qNtQaqnnoMIucZX69IaxuQowOvfqh5cuKX01NkY/0Ye0jKHxq
 iqbPcInxIDOwKaEKOrGqvybu97sUa1oDsUmg+K6h+A+c4ZJrTZUhElM0DIr9UfCLsb3r
 isfzsexXEq8wTznoVpnXXdSIeBzsrDMHcKagkCaKVkYrefHoBg6I5rHROmDQDghNgRr9
 mWKmR1BXMqluReCkmN7E1ls2FlC3LNFYcouZctcAu/j7PVx2Qnsz/8M4DVMB9x59UWST
 86IA==
X-Gm-Message-State: AOAM532MRexpODRxugC6rxq4NwmaiWRhCevCeaq04XYPJFWS0WlSPcOa
 jIjgiyhmm65aRmVIxBOFOHBqAL1zB8UFogCeQCkvgA==
X-Google-Smtp-Source: ABdhPJxMt8LsH5solEGiTCgX6vrLS/Lejlh/uyv5vtoK/cjjDQdtu3LiiiFa8vkEePPWEVkSf5rT4Xe4hzEx6EQxyiM=
X-Received: by 2002:a54:4791:: with SMTP id o17mr2719065oic.114.1639624760385; 
 Wed, 15 Dec 2021 19:19:20 -0800 (PST)
MIME-Version: 1.0
References: <20211214125855.33207-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20211214125855.33207-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 16 Dec 2021 04:19:08 +0100
Message-ID: <CACRpkdZxfOZtibKgywx_XL_ayp5NEQiCK-NRrEtbvCUGYSojVg@mail.gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: alsa-devel@alsa-project.org, Herve Codina <herve.codina@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Viresh Kumar <vireshk@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Douglas Anderson <dianders@chromium.org>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Florian Fainelli <f.fainelli@gmail.com>, soc@kernel.org,
 Marc Zyngier <maz@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Andy Gross <agross@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-arm-msm@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Sam Shih <sam.shih@mediatek.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-actions@lists.infradead.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-gpio@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 linux-mediatek@lists.infradead.org,
 Radim Pavlik <radim.pavlik@tbs-biometrics.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org,
 Support Opensource <support.opensource@diasemi.com>,
 Scott Branden <sbranden@broadcom.com>, patches@opensource.cirrus.com,
 Sean Wang <sean.wang@kernel.org>, linux-kernel@vger.kernel.org,
 Ray Jui <rjui@broadcom.com>, Colin Foster <colin.foster@in-advantage.com>,
 linux-renesas-soc@vger.kernel.org,
 Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-oxnas@groups.io,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 Claudiu Beznea <Claudiu.Beznea@microchip.com>,
 linux-rpi-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/2] pinctrl: Get rid of duplicate
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

On Tue, Dec 14, 2021 at 1:59 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> GPIO library does copy the of_node from the parent device of
> the GPIO chip, there is no need to repeat this in the individual
> drivers. Remove these assignment all at once.
>
> For the details one may look into the of_gpio_dev_init() implementation.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: no changes

Applied this patch 1/2 of the v2 patch set!

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
