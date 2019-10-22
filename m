Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E468E0CCF
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Oct 2019 21:52:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22002C36B0B;
	Tue, 22 Oct 2019 19:52:45 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B63AFC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Oct 2019 19:52:43 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EBFBA222D1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Oct 2019 19:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571773962;
 bh=lVep/kGw+Qm/9BH6yFF5Ta8I/nos5oV6cOnqMoFM8O4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=SbSsk/ekDVLBB454r0f1fvmvvTfmN03c5NGb9PdZ9IvpRX8d1DtgQ08Z0bcIFwtzs
 VJWkSkAkUUYtQwyf9KuPhqlpVOF4v4w2h5TXmW4XmSDy7Bzdam3XJW9stl7dqdpFvB
 VeMeIZqvsNaRGBObR2DhS1fZ9eyDJP3dVFLqhiSw=
Received: by mail-qt1-f169.google.com with SMTP id e14so8889108qto.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Oct 2019 12:52:41 -0700 (PDT)
X-Gm-Message-State: APjAAAWMpokS4oTnvg7xXkPzFeAkH0yVomRo5zy0w8YBym4d7NBP9zhg
 WELBFEHQ7+vkGexdxKg5i8KAUEk89dn59gPSQg==
X-Google-Smtp-Source: APXvYqwfTFQvEWZsi+fmlXq4bJ/93h8u27YyErOcN6+jtvSG/aNt4UCbC5GoUws1bleVICB9W55vYXnUR58eU0hZLWI=
X-Received: by 2002:ac8:741a:: with SMTP id p26mr5266590qtq.143.1571773960946; 
 Tue, 22 Oct 2019 12:52:40 -0700 (PDT)
MIME-Version: 1.0
References: <20191021214550.1461-1-robh@kernel.org>
 <20191021214550.1461-5-robh@kernel.org>
 <20191022113001.GG4756@pendragon.ideasonboard.com>
 <CAMuHMdXCq9urRDCSmLueVpsv9-FxJ6pxQf-9Ua=vT-TrRs++fQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXCq9urRDCSmLueVpsv9-FxJ6pxQf-9Ua=vT-TrRs++fQ@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 22 Oct 2019 14:52:29 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJwJgNHy4wr0as0n-R3ist_yKp3ytyBw4bPXjtSOSMOXQ@mail.gmail.com>
Message-ID: <CAL_JsqJwJgNHy4wr0as0n-R3ist_yKp3ytyBw4bPXjtSOSMOXQ@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>, CK Hu <ck.hu@mediatek.com>,
 Chen Feng <puck.chen@hisilicon.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
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

On Tue, Oct 22, 2019 at 6:40 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Laurent,
>
> On Tue, Oct 22, 2019 at 1:30 PM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > On Mon, Oct 21, 2019 at 04:45:48PM -0500, Rob Herring wrote:
>
> > > --- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> > > +++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> > > @@ -419,6 +419,7 @@ int rockchip_gem_dumb_create(struct drm_file *file_priv,
> > >        * align to 64 bytes since Mali requires it.
> > >        */
> > >       args->pitch = ALIGN(min_pitch, 64);
> > > +     args->flags = DRM_MODE_DUMB_KERNEL_MAP;
> > >       args->size = args->pitch * args->height;
> >
> > My OCD gets triggered by flags appearing in the middle here while it is
> > at the end in other drivers :-)
>
> ... while "flags" appears before "pitch" and "size" in the actual struct
> definition... Aaarghl ;-)

There was some reasoning here as my CMA helper conversion patch is
going to insert code between flags and size.

But to keep everyone's OCD in check, I can set flags first.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
