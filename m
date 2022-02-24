Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B634C280A
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Feb 2022 10:27:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9466DC5F1D7;
	Thu, 24 Feb 2022 09:27:34 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19E40C23E53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Feb 2022 09:27:33 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id a23so3007917eju.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Feb 2022 01:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5+kUny2RZ0RuNdhH0rcF0HLlqfcfBOEW7obgNCv8j1s=;
 b=mYHsOBAn5oGqkqGiL0olxjHcyHEPj4RpaseQt4OcNS3I5AbhfqU+nrzOwrN05KlqTv
 nQySHUxq+GSoZYjKaPyVm5JTQP+GAMcYbc5xj1jSk5O4mrwqgKUUZbFvzcLnm9sl/AsL
 rF3NYgIHCPwiRf0+i7kaMYWpFKnhUkMIdOuds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5+kUny2RZ0RuNdhH0rcF0HLlqfcfBOEW7obgNCv8j1s=;
 b=dTj7Hmufy2AkrpWqnSeQUtzI3MK4+y06wk7cYSWkQGte/ZcGEOjtLdIFgkQONXKyFR
 U7fU5d3iOsR38YPFmfabCIC2s06zVnkZOghu+/uwkfJ09bJhHob3eKZRBTfmSdNRsviI
 v4UcY3ZhEZIE/w+ZUXgc+vOzmO1rQdLZw6o9gjHz1nkMppSlh+YmGZX6XUQpCHortqYY
 n7nbkHgZ40SAEyoUjN7pWkDpEGgvUj/usOyKyO4U5OhkFY8kAHwp1xQtbTFthVvrOsld
 FNK0EAdv42AKuzh0FGwGxtWo5pvG3CCAt8MsDVhdeDYRg+sGhYiyN6m255iQvyHyqH3j
 3iSA==
X-Gm-Message-State: AOAM530g3TdzX9Lhweqh8figjtZpWwynKW7LsrpdqfmLiMut8+A2QQum
 13j35jWzqwBRa1sKbDfw4AkVICzzC4d9vkyJfIebCg==
X-Google-Smtp-Source: ABdhPJy7NWl6V7uQam8s7xz0z+Q+MYOsJR+U5qx3JJg14ZPkRQFjj+oSeW7E1FTEJBiFECOjP0PDKrc2HCoOW/rfY68=
X-Received: by 2002:a17:906:4ccd:b0:6b7:75ca:3eac with SMTP id
 q13-20020a1709064ccd00b006b775ca3eacmr1498686ejt.167.1645694852581; Thu, 24
 Feb 2022 01:27:32 -0800 (PST)
MIME-Version: 1.0
References: <20211210174819.2250178-1-jagan@amarulasolutions.com>
 <20211210174819.2250178-3-jagan@amarulasolutions.com>
 <CACRpkdb4JGCNyjncqgh8=3wWi4BRCqGNuLyTBRzLiVLK38UzqA@mail.gmail.com>
 <CAMty3ZDDdxkTiC2GByuiVW9obXW_jdBFK+R2-BAh0k_uB=GApQ@mail.gmail.com>
In-Reply-To: <CAMty3ZDDdxkTiC2GByuiVW9obXW_jdBFK+R2-BAh0k_uB=GApQ@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 24 Feb 2022 14:57:10 +0530
Message-ID: <CAMty3ZC4FP31zAU5CE88iG3JtXYaKo6b43bKjWuLiorHsrYBgQ@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
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

Hi Linus,

On Sat, Dec 11, 2021 at 11:59 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> Hi Linus,
>
> On Sat, Dec 11, 2021 at 5:37 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > On Fri, Dec 10, 2021 at 6:49 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> > >
> > > devm_drm_of_get_bridge is capable of looking up the downstream
> > > bridge and panel and trying to add a panel bridge if the panel
> > > is found.
> > >
> > > Replace explicit finding calls with devm_drm_of_get_bridge.
> > >
> > > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > > Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > > Cc: Linus Walleij <linus.walleij@linaro.org>
> > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> >
> > Nice overall!
> >
> > > -       /* Look for a panel as a child to this node */
> > > -       for_each_available_child_of_node(dev->of_node, child) {
> > > -               panel = of_drm_find_panel(child);
> > > -               if (IS_ERR(panel)) {
> > > -                       dev_err(dev, "failed to find panel try bridge (%ld)\n",
> > > -                               PTR_ERR(panel));
> > > -                       panel = NULL;
> > > -
> > > -                       bridge = of_drm_find_bridge(child);
> > > -                       if (!bridge) {
> > > -                               dev_err(dev, "failed to find bridge\n");
> > > -                               return -EINVAL;
> > > -                       }
> > > -               }
> > > -       }
> > > -       if (panel) {
> > > -               bridge = drm_panel_bridge_add_typed(panel,
> > > -                                                   DRM_MODE_CONNECTOR_DSI);
> >
> > And we are guaranteed that the right type of connector will be
> > used here? (Just checking.)
>
> Yes. Each panel driver initialised the connector_type via
> drm_panel_init and it will check during devm_drm_of_get_bridge.
>
> >
> > > -               if (IS_ERR(bridge)) {
> > > -                       dev_err(dev, "error adding panel bridge\n");
> > > -                       return PTR_ERR(bridge);
> > > -               }
> > > -               dev_info(dev, "connected to panel\n");
> > > -               d->panel = panel;
> >
> > How does this assignment happen after your patch?
> > I'm using that...
> >
> > devm_drm_of_get_bridge() needs some more argument right?
>
> Yes, but I think we don't need to preserve the panel here. Yes I
> didn't add that change, will take care in v2.
>
> >
> > > -       } else if (bridge) {
> > > -               /* TODO: AV8100 HDMI encoder goes here for example */
> > > -               dev_info(dev, "connected to non-panel bridge (unsupported)\n");
> > > -               return -ENODEV;
> > > -       } else {
> > > -               dev_err(dev, "no panel or bridge\n");
> > > -               return -ENODEV;
> > > +       bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
> > > +       if (IS_ERR(bridge)) {
> > > +               dev_err(dev, "error to get bridge\n");
> > > +               return PTR_ERR(bridge);
> >
> > I'm gonna want to test this somehow on the hardware. But the TODO comment
> > there wasn't supposed to be deleted if I will still need to take some special
> > action whether this is a panel bridge or some other bridge.
>
> Agreed. Even I do like to add this prints, since
> devm_drm_of_get_bridge is not able to return differentiated bridge so
> it it not possible now. May be we can discuss this point.

Any comments on this? I will try to send the next version based on it.

Thanks,
Jagan.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
