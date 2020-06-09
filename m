Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBC51F4118
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jun 2020 18:39:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9EF1FC36B23;
	Tue,  9 Jun 2020 16:39:21 +0000 (UTC)
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9FECAC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jun 2020 16:39:20 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id b18so17132067oti.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Jun 2020 09:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v7mrV9A8x5gROdoWHb4mBMuLQK66GuFHbbDU9aAaIY4=;
 b=UxlslCOp5lHCML8zHfSxii0/aaaTdlNzCPYYCv2xzb4wWEZtWsF+k5/n8Osgdx0hJy
 BfJRocyU0Eo8PTSI7zAl6DbWAZBVkW4kXvOXpX/QENIqRqsf2TPNP9lYxPtdLLVWVtAE
 ZrBxyXn9wMMr4aKFJuJRt1jw1DUCO9QEpG8AY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v7mrV9A8x5gROdoWHb4mBMuLQK66GuFHbbDU9aAaIY4=;
 b=BzF2VGIyDFxCKtNTAvABcGnjCcC8krI6mc1apkGIkt0Fnl2XCfulBQ6WjoEZUdaZhn
 5Ey/SIoPf2Kby2TXjUifMZreQR9H2AkC8iz8wVULrFqFs+e14G1Qiz+JN6IYAyqJYHQi
 wV9pXe6Bo/PRV7yNRcmg+4LzGwHvkE0juBJz4tJYG2RY3aHCshtyf/JFHfxsdMKQOV07
 v9LYP9ECYBYCungxIzno31vultsJP60AhF7LM7NnBLKOwB28iDbp490dv3nkcXCJX1gI
 UB1CmbE3T6PweeQGQFOZHSJEMpU1aaCu6WqCngayZywzDyJgbGH4BgzndolTJPG7Ntrg
 D7tw==
X-Gm-Message-State: AOAM532tOJ3YG/SytRy9k+R+CZAR8jn9zyd/tAP9ZBKnor8F6J9wHhgq
 4MrZXHTV9yHYymSycNIgnOB7hG4qhpQ6jFuMDI/gRw==
X-Google-Smtp-Source: ABdhPJyzEiiGK0RgxvAB9nvhNz9jMbudR88GwxzWaWaK//yF7MA0SnaEkI/Owvhift8/7RXSbhpKtNM5VXKxf/ldzwA=
X-Received: by 2002:a9d:768a:: with SMTP id j10mr23941760otl.188.1591720759321; 
 Tue, 09 Jun 2020 09:39:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200609162700.953260-1-adrian.ratiu@collabora.com>
 <20200609162700.953260-12-adrian.ratiu@collabora.com>
In-Reply-To: <20200609162700.953260-12-adrian.ratiu@collabora.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 9 Jun 2020 18:39:08 +0200
Message-ID: <CAKMK7uGLQCj_oJcbXynt_1bmwBQy6ncUgc49DPejyfCtb68e_g@mail.gmail.com>
To: Adrian Ratiu <adrian.ratiu@collabora.com>
Cc: devicetree <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Heiko Stuebner <heiko@sntech.de>,
 Andrzej Hajda <a.hajda@samsung.com>, Jonas Karlman <jonas@kwiboo.se>,
 Yannick FERTRE <yannick.fertre@st.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>, linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [Linux-stm32] [PATCH v9 11/11] Documentation: gpu: todo: Add
 dw-mipi-dsi consolidation plan
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

On Tue, Jun 9, 2020 at 6:25 PM Adrian Ratiu <adrian.ratiu@collabora.com> wrote:
>
> This documents the longer-term plan to cleanup the dw-mipi-dsi bridge
> based drivers after the regmap refactor and i.MX6 driver have landed.
>
> The goal is to get the entire bridge logic in one place and continue
> the refactorings under the drm/bridge tree.
>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>

This cc's the world, but not dri-devel. Can you pls resubmit with that added?

Thanks, Daniel

> ---
>  Documentation/gpu/todo.rst | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 658b52f7ffc6c..2b142980a4b16 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -548,6 +548,31 @@ See drivers/gpu/drm/amd/display/TODO for tasks.
>
>  Contact: Harry Wentland, Alex Deucher
>
> +Reorganize dw-mipi-dsi bridge-based host-controller drivers
> +-----------------------------------------------------------
> +
> +The Synopsys DW MIPI DSI bridge is used by a number of SoC platform drivers
> +(STM, Rockchip, i.MX) which don't cleanly encapsulate their bridge logic which
> +gets split between the Synopsys bridge (drm/bridge/synopsys/dw-mipi-dsi.c) and
> +platform drivers like drm/imx/dw_mipi_dsi-imx6.c by passing around the bridge
> +configuration regmap, creating new bridges / daisy chaining in platform drivers,
> +duplicating encoder creation, having too much encoder logic instead of using the
> +simple encoder interface and so on.
> +
> +The goal of this rework is to make the dw-mipi-dsi driver a better encapsulated
> +bridge by moving all bridge-related logic under drm/bridge, including the SoC
> +bindings which chain to the core Synopsys code under drm/bridge/dw-mipi-dsi/
> +from which they can be further consolidated and cleaned up.
> +
> +If this goal proves to be impossible then drm_bridge might not be the correct
> +abstraction for these host controllers and unifying their logic into a helper
> +library encapsulating a drm_encoder might be more desirable, in other words to
> +move away from drm_bridge entirely.
> +
> +Contact: Adrian Ratiu, Daniel Vetter, Laurent Pinchart
> +
> +Level: Intermediate
> +
>  Bootsplash
>  ==========
>
> --
> 2.27.0
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
