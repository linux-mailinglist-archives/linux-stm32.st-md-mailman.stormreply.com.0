Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEAA470F7F
	for <lists+linux-stm32@lfdr.de>; Sat, 11 Dec 2021 01:35:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 658D7C5F1EB;
	Sat, 11 Dec 2021 00:35:47 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 59282C57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Dec 2021 00:35:45 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 x43-20020a056830246b00b00570d09d34ebso11342298otr.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Dec 2021 16:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e5x1ZjLFt2D7tDxJkUBVGLXNcKm1tzU4wK9evqtEkww=;
 b=O7hwBTF5k+CrSbVIJz7E/Ja3jnkWRmNNlGupROLqkAREKGvQ7klIt163ni1FQLHeIy
 lqXa+Q079+k8F8KqDCPqC2c0wLokSb7E39OH17K3im5utFF9U5L6MDLtFc4Ci4d6qeA5
 HAH2qe5ECgoRCiFKH3z0nW5vBh/UaDGurQ7R3U8/HaBRvMjxm+TK/o1ICV9J03f9/yxU
 FprbGD+dqdt1muP1VFGPUJKlCJZJQtBZtH1wXKKNO3U92hiExCF/1LgCkChHZm58/skJ
 c39v2CAVrlbZ5NH4ksghAc9FDOosX56s8hhX3DUCR3AZ9445uzQXOeoj9k4XVBRbYSNv
 +VaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e5x1ZjLFt2D7tDxJkUBVGLXNcKm1tzU4wK9evqtEkww=;
 b=Q3MLkNyzj0Y0oREcigDZNGvp5o5IGF/YFeSjvSy2Jvv6Eyum/mtQR7AggTIPX7rIR/
 eLOBOFW6DnJfOPFEZ/XH+VDf18nvDdsUb9iv71X26Z+H/a4vXKNflL8W1grqbJh3a1gW
 VfeT/OjcXIRouelpSizl2kQihAr1jEYyNwkSTAXZM+WrjDltRoC5NWxbFYJfCTjA8B81
 dupI6HsEyUXXvWSrqFcTN0IBmYJroy9oUhkFlYmJkrIXyeQWttxtFmkGs47i4hAbNp2g
 k5yQLanqTFBeHHViRkHiEWmWBUz3knoDeoAylN/Snj2tEGZngu5ydGoymLn3yhUbeRGW
 o5Ig==
X-Gm-Message-State: AOAM532h/2qCLRhLN4/MAgtV+MpJeVDjp7+s1ClQpC31s2PtDcpMFyYA
 R1jQQ/2yl2mGd1zrZE55n05dSQHgQOzhAkfYbuGpvw==
X-Google-Smtp-Source: ABdhPJzikiVI8vcao0kj+q441azYFjZ6pqZrjkhHa3ehGwijjFUBuob39jPpZnmU8LWbI38sHbTYQoddgoE2n4/7fKo=
X-Received: by 2002:a9d:a42:: with SMTP id 60mr13978796otg.179.1639182944229; 
 Fri, 10 Dec 2021 16:35:44 -0800 (PST)
MIME-Version: 1.0
References: <20211210174819.2250178-1-jagan@amarulasolutions.com>
 <20211210174819.2250178-3-jagan@amarulasolutions.com>
 <CACRpkdb4JGCNyjncqgh8=3wWi4BRCqGNuLyTBRzLiVLK38UzqA@mail.gmail.com>
In-Reply-To: <CACRpkdb4JGCNyjncqgh8=3wWi4BRCqGNuLyTBRzLiVLK38UzqA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 11 Dec 2021 01:35:32 +0100
Message-ID: <CACRpkda=yAk9kQ20ey+am7xjuVDvgDcup6B5vxb3WeuzMiy+kQ@mail.gmail.com>
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

On Sat, Dec 11, 2021 at 1:07 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Fri, Dec 10, 2021 at 6:49 PM Jagan Teki <jagan@amarulasolutions.com> wrote:

> > -               dev_info(dev, "connected to panel\n");
> > -               d->panel = panel;
>
> How does this assignment happen after your patch?
> I'm using that...
>
> devm_drm_of_get_bridge() needs some more argument right?

Actually it is only used in unbind right below:

       if (d->panel)
                drm_panel_bridge_remove(d->bridge_out);

If it is not needed at all after your patch (because devm removes
the bridge) then also delete this code, and delete the
struct drm_panel *panel from struct mcde_dsi at the top
and possibly also drop the header #include <drm/drm_panel.h>
entirely.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
