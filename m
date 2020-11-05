Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F71C2A7AB6
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Nov 2020 10:39:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18261C3FAD4;
	Thu,  5 Nov 2020 09:39:51 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD7D1C36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Nov 2020 09:39:48 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id x12so924755wrm.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Nov 2020 01:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=O1Ptw4Z6fyBehqHYaSzRs4kWOAuaPAg0Ode7nAckbcI=;
 b=lKpQaFbU6i/iQQXHpRtJTGXfYs5EE0e3aodsqlp9QeGZmsffh7RlWk6IgDeVl3o0xu
 pCR6lgT2aiZdhtCXaEuOujnJnud52nziMgKE/ONeqKy0MceI3gfkv1uZ9s99xqbjxUIO
 Vpo4p2Ieo08cBXUL1E7nyc9W3Vw9jo8uYdI0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=O1Ptw4Z6fyBehqHYaSzRs4kWOAuaPAg0Ode7nAckbcI=;
 b=hSpo6VgbI+TnaRBy+Sh2vWTQ5AGz9Q3kxFjLYUtKS12pYt/nvY9ebQR3x6I+gxon8x
 CNRKQx1G84APpyhawzZ9cFKX8ttchSmYsBOINvNgSGTcdLnhhE+KBTxymurXWRGYKW10
 rO/4Fg7wWUy8gC3Rli3IkZMce/9sG+X6U++9kncjHud70Wu1AAAo/Rh91TvAAB5l8Yz+
 j3y6xxxWYDvQ4duZKRDh7gacOAulKOe1a/By9rHaRuchk9FXnGWBXsi9riVzSpmBqHEk
 Sui9HWPsIZ6NR+37pxWAhKHJAkZMI6h/LVfCB1kmO79gimmNrL4e1fRsCiAfCtTHwW3X
 E0Mw==
X-Gm-Message-State: AOAM531JOaVToFW4i0JP+OHGfqvKFGXwktlynLPkntXX7fP9Nlbg9lWP
 WEefaJHLhFkmG9Qmc+xLQLzxhA==
X-Google-Smtp-Source: ABdhPJx0auxQhwpogPi8nd2blZkbW8w0U5S07Gfgt4vJP6rs0bEwZ2m6v9NXVsnccnnz4cQ4Yr52UQ==
X-Received: by 2002:a5d:424e:: with SMTP id s14mr1796145wrr.131.1604569188294; 
 Thu, 05 Nov 2020 01:39:48 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c2sm1720811wmf.47.2020.11.05.01.39.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 01:39:47 -0800 (PST)
Date: Thu, 5 Nov 2020 10:39:45 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Marek Vasut <marex@denx.de>
Message-ID: <20201105093945.GS401619@phenom.ffwll.local>
References: <20201104125200.259639-1-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104125200.259639-1-marex@denx.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Cc: dri-devel@lists.freedesktop.org,
 Yannick =?iso-8859-1?Q?Fertr=E9?= <yannick.fertre@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: Re: [Linux-stm32] [PATCH] drm/stm: Enable RPM during fbdev
	registration
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Wed, Nov 04, 2020 at 01:52:00PM +0100, Marek Vasut wrote:
> Enable runtime PM before registering the fbdev emulation and disable it
> afterward, otherwise register access to the LTDC IP during the fbdev
> emulation registration might hang the system.
> =

> The problem happens because RPM is activated at the end of ltdc_load(),
> but the fbdev emulation registration happens only after that, and ends
> up calling ltdc_crtc_mode_set_nofb(), which checks whether RPM is active
> and only if it is not active, calls pm_runtime_get_sync() to enable the
> clock and so on. If the clock are not enabled, any register access in
> ltdc_crtc_mode_set_nofb() could hang the platform completely.
> =

> This patch makes sure that ltdc_crtc_mode_set_nofb() is called within
> pm_runtime_get_sync(), so with clock enabled.
> =

> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
> Cc: Philippe Cornu <philippe.cornu@st.com>
> Cc: Yannick Fertr=E9 <yannick.fertre@st.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com

This looks like you're papering over a bug in your modeset code. If
userspace later on does a setpar on the fbdev chardev, the exact same
thing could happen. You need to fix your modeset code to avoid this, not
sprinkle temporary rpm_get/put all over some top level entry points,
because you can't even patch those all.
-Daniel


> ---
>  drivers/gpu/drm/stm/drv.c | 2 ++
>  1 file changed, 2 insertions(+)
> =

> diff --git a/drivers/gpu/drm/stm/drv.c b/drivers/gpu/drm/stm/drv.c
> index 411103f013e2..d8921edc83db 100644
> --- a/drivers/gpu/drm/stm/drv.c
> +++ b/drivers/gpu/drm/stm/drv.c
> @@ -197,7 +197,9 @@ static int stm_drm_platform_probe(struct platform_dev=
ice *pdev)
>  	if (ret)
>  		goto err_put;
>  =

> +	pm_runtime_get_sync(ddev->dev);
>  	drm_fbdev_generic_setup(ddev, 16);
> +	pm_runtime_put_sync(ddev->dev);
>  =

>  	return 0;
>  =

> -- =

> 2.28.0
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
