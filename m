Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27293470F32
	for <lists+linux-stm32@lfdr.de>; Sat, 11 Dec 2021 01:07:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CBFC4C5F1EB;
	Sat, 11 Dec 2021 00:07:27 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4CB97C5F1E0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Dec 2021 00:07:26 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id bk14so15429397oib.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Dec 2021 16:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qig9qwOGoBvnHg7tX1jnWpBgUUxlTEaBoNWwy9fRxAA=;
 b=LYKvaouQK49EpVPst3Wl1jp9uanlO8+/fsf3o8zvyUAD/TWtG7bSAnYGfveQgsi+l/
 pOULHbtJZkHDhj1P02cSLpjfe6NEgoe3OAdNNcnBOiuPOPRdeZnpi8Y3Fff5aby81YQs
 fPhpADdzgSMu37lIhibBpY9OzkPocIVBDZs0IDTmESOd7sqUhWdUsIwT4MaPiGkGzN9O
 DaE8Ps69zfMEhxBnqYEXiPM/uWWeLnq69F7+JEBaAG6jO6dIP2g1bYOOwB1YhlxNC0tC
 mzf/RG8CYNTlgX1j753NKNt5UlAox5RHR7S5ZiwMmcwBL2qVHz0DRZAnnKmhNp145y2B
 +J4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qig9qwOGoBvnHg7tX1jnWpBgUUxlTEaBoNWwy9fRxAA=;
 b=FdSWNc8INvFQzKpLjMLiWm+CEBFdPJYmxkTtDDpIsc6rXJkny9ZaiBdrMP/SgeczDd
 LJQsWG8zBi+FeW6ynfU+rOqq4yOxQZ9x+qVOftuectlBCFAB2elHRfK7owXKrr7J/KY4
 M/YJmyjZ9zYu18E1FZUqdBhvop0oVcSUZZTDU0x5Zb7ksEs4NV8hmag+qX0iFhdqEO4T
 +K9HL+epFjbcinB2fPFPQ3zaJJAz1WmjR2foe2+ZyDCuAHFm5O3ns/uOjnpCAv2NBBW+
 LW68bjy/XgH2DdUjl1pLQfIZ0tMeiyxeqQt+aeNCmgJKushdRt5QE37nCrNRB2NmY6F/
 119g==
X-Gm-Message-State: AOAM5309CYvGykrAkSYRKeD93wfZV3BxmdP8ww1EIIOO+Hc8jq07PAoy
 gM6sjmC/99SBca0ALxxIlm4z/X7ky4uLrg2vE0jBdA==
X-Google-Smtp-Source: ABdhPJzXH8G3CxM8f1dVbL2fs9y2zVr5fX8welXMizONG6Brv5hnOIdYNhyIV1TO6rIbKlx9NQGdXT1Zm6G0UGYTiTs=
X-Received: by 2002:a54:4791:: with SMTP id o17mr15621211oic.114.1639181245034; 
 Fri, 10 Dec 2021 16:07:25 -0800 (PST)
MIME-Version: 1.0
References: <20211210174819.2250178-1-jagan@amarulasolutions.com>
 <20211210174819.2250178-3-jagan@amarulasolutions.com>
In-Reply-To: <20211210174819.2250178-3-jagan@amarulasolutions.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 11 Dec 2021 01:07:13 +0100
Message-ID: <CACRpkdb4JGCNyjncqgh8=3wWi4BRCqGNuLyTBRzLiVLK38UzqA@mail.gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Maxime Ripard <mripard@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-amarula@amarulasolutions.com
Subject: Re: [Linux-stm32] [PATCH 3/3] drm: bridge: Switch to
	devm_drm_of_get_bridge
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

On Fri, Dec 10, 2021 at 6:49 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> devm_drm_of_get_bridge is capable of looking up the downstream
> bridge and panel and trying to add a panel bridge if the panel
> is found.
>
> Replace explicit finding calls with devm_drm_of_get_bridge.
>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Nice overall!

> -       /* Look for a panel as a child to this node */
> -       for_each_available_child_of_node(dev->of_node, child) {
> -               panel = of_drm_find_panel(child);
> -               if (IS_ERR(panel)) {
> -                       dev_err(dev, "failed to find panel try bridge (%ld)\n",
> -                               PTR_ERR(panel));
> -                       panel = NULL;
> -
> -                       bridge = of_drm_find_bridge(child);
> -                       if (!bridge) {
> -                               dev_err(dev, "failed to find bridge\n");
> -                               return -EINVAL;
> -                       }
> -               }
> -       }
> -       if (panel) {
> -               bridge = drm_panel_bridge_add_typed(panel,
> -                                                   DRM_MODE_CONNECTOR_DSI);

And we are guaranteed that the right type of connector will be
used here? (Just checking.)

> -               if (IS_ERR(bridge)) {
> -                       dev_err(dev, "error adding panel bridge\n");
> -                       return PTR_ERR(bridge);
> -               }
> -               dev_info(dev, "connected to panel\n");
> -               d->panel = panel;

How does this assignment happen after your patch?
I'm using that...

devm_drm_of_get_bridge() needs some more argument right?

> -       } else if (bridge) {
> -               /* TODO: AV8100 HDMI encoder goes here for example */
> -               dev_info(dev, "connected to non-panel bridge (unsupported)\n");
> -               return -ENODEV;
> -       } else {
> -               dev_err(dev, "no panel or bridge\n");
> -               return -ENODEV;
> +       bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
> +       if (IS_ERR(bridge)) {
> +               dev_err(dev, "error to get bridge\n");
> +               return PTR_ERR(bridge);

I'm gonna want to test this somehow on the hardware. But the TODO comment
there wasn't supposed to be deleted if I will still need to take some special
action whether this is a panel bridge or some other bridge.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
