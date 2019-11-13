Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EC8FAD22
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Nov 2019 10:40:34 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE8DBC36B0B;
	Wed, 13 Nov 2019 09:40:33 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 559D6C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Nov 2019 09:40:30 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id g3so1752966ljl.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Nov 2019 01:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OrN8x9LyxKD7Xl1d/h9oz7KZmMmc0A5znbrf73E9+bA=;
 b=a676ZUZ7j8Q/YVK0Bi4A2cENhUW9DTDHjr8EReuSTbfFGUvF8kqNCs8Bo51EzHCTfr
 +kz0MvywQjdwCzed5RVZ/ltsXL1ng8RXtD1/6GPl8H7lg6uitxQgbRh7337hfbTPpxi7
 c0MPzJXnqSmZh5BK1mNl7g00o+3ot7uwReiUDx8mf+Xz1Qmy/8XCuM5WWG4bdkpxJ5O9
 LYO93Tg8FD4Z9PTaV5yL+ij91p4VjwPnYIyaurBh2OCqLjLQFUa58DJr7ylP/keLOwt9
 NA1P+BqzIB/OLwx5vA0TxDOn2k4Vuj1byrU1h72J11w+AOeOqJ3Z0rsAXcI5encccpgy
 Splg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OrN8x9LyxKD7Xl1d/h9oz7KZmMmc0A5znbrf73E9+bA=;
 b=D880NfejSJ1XqYWL/9XXcMxjsyQG79S1dCw7/EnQ+YOBX7jI/3s9fx3CHa0dexqL5A
 maNzX/mTxKdbmypkXNC0fv7e7F+efehJy8oGkSlqXhgnDKSnulShpd1IkOS9ZAWYOm7z
 Nh71hDM3keOT8mS6EzIR02hb/B8YerRQp5l8DSo+R01lgSmS2qzr5L/r7BbU+vLQDqVE
 y3j4Yo+9piJvZtBkp2Q5mxjrF3Zhr6pvFAHZ10E0dZ+TBkSLIjH56wtkV+6DFG5EXfnC
 fLMokjMsL+qEsziC+8IG2u6WYr7UrSxBs++I9Mj/QJ9UY4bFvHqzECS8orpJLx0TjV7i
 ppsQ==
X-Gm-Message-State: APjAAAVPPxFCelM2zMEU41GHPvmpnaZAHxcXq77k49x3ovqH1ZpoDOUO
 U5vj/6qNWU50EH8KMuCZ9B93e9SXANcdpnbyLqmZMA==
X-Google-Smtp-Source: APXvYqyOFp98GI7jY2XSDtkSfkrTqobC6IABhD/Iv9amdhinzj3w5mpyUY8ScymlvcvvrEEwwPsb6sgbGb33/qncEqU=
X-Received: by 2002:a2e:5c46:: with SMTP id q67mr1815120ljb.42.1573638029531; 
 Wed, 13 Nov 2019 01:40:29 -0800 (PST)
MIME-Version: 1.0
References: <20191112141819.GA22076@localhost.localdomain>
 <201911131438.KT6pnFZ7%lkp@intel.com>
 <ac16492e11899ef4ec981f7f2e84714c7d61d2a7.camel@fi.rohmeurope.com>
In-Reply-To: <ac16492e11899ef4ec981f7f2e84714c7d61d2a7.camel@fi.rohmeurope.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 13 Nov 2019 10:40:17 +0100
Message-ID: <CACRpkdYAmye8wT39fqy=LN+6pXDvrcQ0SyDTCvG7aSgea3Uumw@mail.gmail.com>
To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc: "andrew@lunn.ch" <andrew@lunn.ch>,
 "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "heiko@sntech.de" <heiko@sntech.de>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "paul@crapouillou.net" <paul@crapouillou.net>,
 "eric@anholt.net" <eric@anholt.net>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "jason@lakedaemon.net" <jason@lakedaemon.net>,
 "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "lkp@intel.com" <lkp@intel.com>,
 "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
 "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "wens@csie.org" <wens@csie.org>, "agross@kernel.org" <agross@kernel.org>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>,
 "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
 "rjui@broadcom.com" <rjui@broadcom.com>,
 "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-rpi-kernel@lists.infradead.org" <linux-rpi-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
 "sbranden@broadcom.com" <sbranden@broadcom.com>,
 "sean.wang@kernel.org" <sean.wang@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "wahrenst@gmx.net" <wahrenst@gmx.net>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "linux-oxnas@groups.io" <linux-oxnas@groups.io>
Subject: Re: [Linux-stm32] [PATCH 2/2] pinctrl: Use new GPIO_LINE_DIRECTION
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

On Wed, Nov 13, 2019 at 7:52 AM Vaittinen, Matti
<Matti.Vaittinen@fi.rohmeurope.com> wrote:
> On Wed, 2019-11-13 at 14:30 +0800, kbuild test robot wrote:
> > Hi Matti,
> >
> > Thank you for the patch! Perhaps something to improve:
> >
> > [auto build test WARNING on 70d97e099bb426ecb3ad4bf31e88dbf2ef4b2e4c]
> >
>
> >    480        static int wmt_gpio_get_direction(struct gpio_chip
> > *chip, unsigned offset)
> >    481        {
> >    482                struct wmt_pinctrl_data *data =
> > gpiochip_get_data(chip);
> >    483                u32 bank = WMT_BANK_FROM_PIN(offset);
> >    484                u32 bit = WMT_BIT_FROM_PIN(offset);
> >    485                u32 reg_dir = data->banks[bank].reg_dir;
> >    486                u32 val;
> >    487
> >    488                val = readl_relaxed(data->base + reg_dir);
> >    489                if (val & BIT(bit))
> >  > 490                        GPIO_LINE_DIRECTION_OUT;
>
> Right. Return is missing. I think I already fixed this - I guess I sent
> wrong version... Sorry guys. I'll do v3 with only this return added -
> and I'll send it to limited amount of recipients as I think most of you
> guys may not be interested. Probably to Linus W, Geert and GPIO list
> only. Let me know if you want to see the v3 (or other subsequent
> patches)

I think I already merged it, just send a new patch on top fixing the
problem.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
