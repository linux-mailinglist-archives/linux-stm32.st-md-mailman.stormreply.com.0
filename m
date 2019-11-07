Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC69F2900
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Nov 2019 09:22:49 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6580BC36B0B;
	Thu,  7 Nov 2019 08:22:49 +0000 (UTC)
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 92D7EC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Nov 2019 08:22:47 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id j5so874205lfh.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 Nov 2019 00:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W1kMVjXy8TfTB/av4qsnw1G4ZHclSRdrlLtTCyTAB3g=;
 b=aihVYo6vGJcSeMzZA2gHQagzuZuVYL80Tl8HsV3o3LI/DBg/S5MVPTitfm7pDFAG6E
 KU7Z1uXIrrxA5+r3lGKAenb9vmOH8pAHta+z2HuVGSB9kZOdz5AgkNdvAbRde2xOvpoT
 UzS8yGbMFd4DKYtsb3RNUpUElWYw56B6yCUzHCngiVaTKGxNs8EmIs8SqB757Vwf7VCX
 fwVEWkW6ZJ96L32Zj0dhvc0ujr2loUfyfL3PJK2DRlar2WzaN4hH3/gqSQ4Ye2vE2W10
 yDUxaSTMoU4hyrN/yWNS9R4ldaKnokRAtrRVSfZzc1jrl3LQMW5QsT76aHAI4spwff8o
 FNFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W1kMVjXy8TfTB/av4qsnw1G4ZHclSRdrlLtTCyTAB3g=;
 b=d6qCrn3a5wRvNUZRTIBdUPsD4qjvMPEtT5Yas6V08PO8/sSnLk9JWvx05Sfx7lBFmM
 j6hqxvnKsqlL+SOpEZ5Bj4BblSa/O3qKc0DBHixPrr4gqQrYbvynXdrLJNnnoSzZcR33
 +2XIJhizb7jHv7dFq+zEzyyPJr+dr69XB/nPYmrA9s9xsidVaEBBvfp52wHut1mDB46v
 fTKqmOZJ8f0JiztOvVsFrMdM6WLV7iu4FFloM3NnqRuB9CAuq4304Xh0pu4/Tj/hm6DM
 1pIOMmNeY39fB8/Z6BtNy34oQN7+8qXnqEX33FTbFxcKNuSg5nwFHyMP7Klwt1SlKM8w
 qj2A==
X-Gm-Message-State: APjAAAWFqT8CwI++3YTXcylhJMAJV5XVR2oBWmCfvjJqmfHRSwNstoX/
 O9kjgUjJAWLbSaIMVoSM2sad6MwHbiMoXFWKUuoS/A==
X-Google-Smtp-Source: APXvYqy/AiAWlfAU/KnMLcnvlDO6zbO8H2HQsF3Z0XznPUZPaxE+dGbrTI9u/vdRHxraIochQ2FKHYEfNic+fopaYJs=
X-Received: by 2002:a19:ca13:: with SMTP id a19mr1415050lfg.133.1573114966856; 
 Thu, 07 Nov 2019 00:22:46 -0800 (PST)
MIME-Version: 1.0
References: <cover.1573029228.git.matti.vaittinen@fi.rohmeurope.com>
 <20191106120846.5bunrqj3uz4khih5@earth.universe>
 <ddcd02cc6c709837a28cae2cbfa672c506927659.camel@fi.rohmeurope.com>
In-Reply-To: <ddcd02cc6c709837a28cae2cbfa672c506927659.camel@fi.rohmeurope.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Nov 2019 09:22:35 +0100
Message-ID: <CACRpkdbaRsv+cKz7yxKxvs+99GRK50-d_kpKcdVn3NVV9Qr6Ng@mail.gmail.com>
To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "david.daney@cavium.com" <david.daney@cavium.com>,
 "sathyanarayanan.kuppuswamy@linux.intel.com"
 <sathyanarayanan.kuppuswamy@linux.intel.com>,
 "sre@kernel.org" <sre@kernel.org>, "ptyser@xes-inc.com" <ptyser@xes-inc.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "marek.behun@nic.cz" <marek.behun@nic.cz>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
 "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
 "khilman@kernel.org" <khilman@kernel.org>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "bamv2005@gmail.com" <bamv2005@gmail.com>, "joel@jms.id.au" <joel@jms.id.au>,
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 "grygorii.strashko@ti.com" <grygorii.strashko@ti.com>,
 "ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
 "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
 "rjui@broadcom.com" <rjui@broadcom.com>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "vilhelm.gray@gmail.com" <vilhelm.gray@gmail.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>,
 "ssantosh@kernel.org" <ssantosh@kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "sbranden@broadcom.com" <sbranden@broadcom.com>,
 "yamada.masahiro@socionext.com" <yamada.masahiro@socionext.com>,
 "andrew@aj.id.au" <andrew@aj.id.au>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "t.scherer@eckelmann.de" <t.scherer@eckelmann.de>,
 "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "info@metux.net" <info@metux.net>
Subject: Re: [Linux-stm32] [PATCH v2 0/2] Add definition for GPIO direction
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

On Wed, Nov 6, 2019 at 1:25 PM Vaittinen, Matti
<Matti.Vaittinen@fi.rohmeurope.com> wrote:
> On Wed, 2019-11-06 at 13:08 +0100, Sebastian Reichel wrote:
> > On Wed, Nov 06, 2019 at 10:51:06AM +0200, Matti Vaittinen wrote:
> > > The patch series adds definitions for GPIO line directions.
> > >
> > > For occasional GPIO contributor like me it is always a pain to
> > > remember
> > > whether 1 or 0 was used for GPIO direction INPUT/OUTPUT.
> >
> > Maybe also update the GPIO drivers in pinctrl?
(...)
> Ouch. I didn't check from pinctrl but I see those should be converted
> as well. I'm a bit short on time right now so if anyone else is
> interested I won't mind :)
>
> Luckily the value for IN and OUT is not changed - only the defines were
> added - so all of the drivers do not need to be done at once. If no one
> else will take the pinctrl part then I can probably do pinctrl patches
> for v5.6 cycle.

No hurry with that. This is a good start, we don't have to fix
the whole world at once.

Let's look at this for v5.6.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
