Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 392C1E032C
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Oct 2019 13:40:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F121C36B0B;
	Tue, 22 Oct 2019 11:40:50 +0000 (UTC)
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20074C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Oct 2019 11:40:49 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id w144so13870769oia.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Oct 2019 04:40:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MTkUrxhJaaygKpYFG6XKyORLB/6UsrnNnAcZ2HEl3vA=;
 b=LNVlnyHIiPKoXcJVgZEpBSMoWCkHsjjrANAN83ohQBYGU9GSkytss+2OV+45hV2il9
 mniPXzst8X99+YEJo4djCBI2fpzpp6XLG5cjrzHoicNwFyxqODqGyqyf6QJ5Y5MjvXDg
 Fh7xgMavVEKnhR80U/tFyhqD4eryFdavU9lE9+JHu7gZjW5JUE3kHmVAhT6Bbp6hPvlZ
 j/E34rxdRc7QEg1sTiN6Up5gKsLyZ+E0bOns3/Bfdf9RyEsJnmw/pAyepewETluiH+E+
 DDA6yNnJJMM5KLCOBSft9/+UzRDWAzRUiqeF+WSLwycnkmrpSP5e0EUK4SjOu0HvEz0B
 IB0A==
X-Gm-Message-State: APjAAAUE2TVGUIHmvd4FgAGYS/UpovzX2ztCB7/WBowRMOILRv521ESC
 ZgEh84h5fNdtsrXj55EJpJ3I2L60Vbf2QrG0xKA=
X-Google-Smtp-Source: APXvYqzhQ8cZ06PtyQQYS8VBvz7ZAfya04dDgTKpedBCyvYLKvYUP4z21wflkhBwZ+Lx/Betkfre5JCQCLddcCfBX8w=
X-Received: by 2002:aca:882:: with SMTP id 124mr2542881oii.54.1571744447771;
 Tue, 22 Oct 2019 04:40:47 -0700 (PDT)
MIME-Version: 1.0
References: <20191021214550.1461-1-robh@kernel.org>
 <20191021214550.1461-5-robh@kernel.org>
 <20191022113001.GG4756@pendragon.ideasonboard.com>
In-Reply-To: <20191022113001.GG4756@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Oct 2019 13:40:36 +0200
Message-ID: <CAMuHMdXCq9urRDCSmLueVpsv9-FxJ6pxQf-9Ua=vT-TrRs++fQ@mail.gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>, CK Hu <ck.hu@mediatek.com>,
 Chen Feng <puck.chen@hisilicon.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, linux-mediatek@lists.infradead.org,
 Vincent Abriou <vincent.abriou@st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Sean Paul <sean@poorly.run>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 Yannick Fertre <yannick.fertre@st.com>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rongrong Zou <zourongrong@gmail.com>,
 Brian Starkey <brian.starkey@arm.com>
Subject: Re: [Linux-stm32] [PATCH 4/6] drm/cma-helper: Support
	DRM_MODE_DUMB_KERNEL_MAP flag
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

Hi Laurent,

On Tue, Oct 22, 2019 at 1:30 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Oct 21, 2019 at 04:45:48PM -0500, Rob Herring wrote:

> > --- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> > +++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> > @@ -419,6 +419,7 @@ int rockchip_gem_dumb_create(struct drm_file *file_priv,
> >        * align to 64 bytes since Mali requires it.
> >        */
> >       args->pitch = ALIGN(min_pitch, 64);
> > +     args->flags = DRM_MODE_DUMB_KERNEL_MAP;
> >       args->size = args->pitch * args->height;
>
> My OCD gets triggered by flags appearing in the middle here while it is
> at the end in other drivers :-)

... while "flags" appears before "pitch" and "size" in the actual struct
definition... Aaarghl ;-)

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
