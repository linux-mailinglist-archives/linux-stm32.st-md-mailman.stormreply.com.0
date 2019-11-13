Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC18EFB633
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Nov 2019 18:18:26 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86615C36B0B;
	Wed, 13 Nov 2019 17:18:26 +0000 (UTC)
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0DEAC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Nov 2019 17:18:24 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id v8so3462777ljh.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Nov 2019 09:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WgpjeDP92LtqHtJXxSWI//ZDvUBHvFnRmWqhhvkv3sU=;
 b=KvuV0fh/hJQyvRYAMyLtyX7TtdrS4cRfCetdL0REIkE+MZASromLfykUpUl271O+CX
 vFdpD6FCntAze0eiaLeCGewSPBYzWcMyf8dAip0r8ZYXAdwDlGykLbTwiivROOyI2jcu
 UqZ9m0g904KiBxG4PAMdp1dQu69o/iLfXSGCuUSWnkAM1RZk4SKm02qXOtPg478nMo1w
 2u+noeVIBVZdLdjiJORmfrpGe4D8XpbYfR67n+nowmC4HyebMgPh4pG3a2eeWqFYwJwr
 JuqVAGOMP2v4G0vVkcsS9JARWxnX0VZhRa5GgVLcIqhEySXkSYAdEzE9f/BdNMWNDQFQ
 6eXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WgpjeDP92LtqHtJXxSWI//ZDvUBHvFnRmWqhhvkv3sU=;
 b=ui37HZQqJ7moVYKpcuOykKZ2xpSFORHrsdjPQYfYR27RpAsk/lrbmn7DUbwYjzhCQj
 pTZkCTwuhFz4QIJKIEPmr1ijsmxYDKhejbI6aRjKeryIGWgxFwPs3a5PpFrUKaAfRXlL
 lVAPuTHHgZ988rBuztYCrmssD/8ULT0jpJZlHUglNu7Wjix05H1fT1Saoij2hl71rIFh
 ayV5+vw2w0Gs3s8CUEWD+sCOhcYOWhREVr0oXz+cVDjBzXJ7x+2rBkGReFhBRUfBeJj7
 P3i82wD9ITWUpb3rEljHV3Ovqdkxm8Y1IW5ujdSnrrfR9V45jeKW+VBKWyOa7ec21mgW
 03hw==
X-Gm-Message-State: APjAAAWOBOf28pSW/0RJPUlRXNv8l81ia/OAR3Xvm/Kz4YGDJCB3U+ie
 7PvXOf8BtX9NDStjaydE3ESyqyB6cDENxEGWHGdFzQ==
X-Google-Smtp-Source: APXvYqzb9LSbjvyTYyJro6roGfmfcXuB5wD3OhRztdb8g4aem5VqSxWcjf73KgosmX+l6Ndl56jWPa35+BrI2knRZzU=
X-Received: by 2002:a2e:5c46:: with SMTP id q67mr3315497ljb.42.1573665504123; 
 Wed, 13 Nov 2019 09:18:24 -0800 (PST)
MIME-Version: 1.0
References: <20191112141819.GA22076@localhost.localdomain>
 <201911131438.KT6pnFZ7%lkp@intel.com>
 <ac16492e11899ef4ec981f7f2e84714c7d61d2a7.camel@fi.rohmeurope.com>
 <CACRpkdYAmye8wT39fqy=LN+6pXDvrcQ0SyDTCvG7aSgea3Uumw@mail.gmail.com>
 <b67faf875fd0060ad36db04b29c109f01e58ab1a.camel@fi.rohmeurope.com>
In-Reply-To: <b67faf875fd0060ad36db04b29c109f01e58ab1a.camel@fi.rohmeurope.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 13 Nov 2019 18:18:11 +0100
Message-ID: <CACRpkdZy73oFmHcjGuxCCYD0kxWuAi4xp9s+fHVLcGXwPzc5TQ@mail.gmail.com>
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
 "rjui@broadcom.com" <rjui@broadcom.com>,
 "sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>,
 "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
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

On Wed, Nov 13, 2019 at 11:06 AM Vaittinen, Matti
<Matti.Vaittinen@fi.rohmeurope.com> wrote:
> On Wed, 2019-11-13 at 10:40 +0100, Linus Walleij wrote:

> > I think I already merged it, just send a new patch on top fixing the
> > problem.
>
> Hmm. Are you sure you did merge the pincontrol part already?

No I confused it for the GPIO part. Sorry!

Please keep iterarating this patch.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
