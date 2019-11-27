Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB58010AEBF
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Nov 2019 12:33:41 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB0FBC36B0B;
	Wed, 27 Nov 2019 11:33:41 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67230C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Nov 2019 11:33:39 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id y5so7044721wmi.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Nov 2019 03:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=b/oO5LgHIVezHDa0lWHiVZRMYVl3WjVpcB8Rma2bE0Q=;
 b=DSeeNl4igiUFnQKTSKwXvgHohVfm3OC/tKrYXjjxIPHl/mKpkRiGsJPZvB0LRQMR9/
 snerCB4pXivXSs9anz2HALpOv2YGaoW118K6PyfcfnYTaemYeB591cJoLMnYhBRclEY6
 EP2UpXz33jTdNZJF/IeZy2+EPIyJ2ogsioj3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=b/oO5LgHIVezHDa0lWHiVZRMYVl3WjVpcB8Rma2bE0Q=;
 b=mEibYPKBwfmEZOA8iQf+FW5DzbOyn7x1yAaxuFFno5wViVA2EQbxtrLaMOvH+afApq
 v9OH41ICq3xs4GcxfJchR7rEdSEUBiyW2iFc+g2/nKl2bQBBVbzdjJxlucHq4iOtTcem
 PxlPU40b6Lto2s6QtcZH0Ipi3mMLsx+2/YLWvXKjvGVVuYPd7e9JgMY1J6n7TgVQivLD
 KED/Vd4d4Ak1BJlAgPaAArQ9o0DGcpxtkeX+Nrz3C0Qb46/0F6DogNeSiqDtdOKyzIMd
 9TInbx5/PZYvhHbb0N5aOpr+poqWolDPlefFHbqveRT8qK8IymPVOgtU4jNHJyy1ewrp
 dW+A==
X-Gm-Message-State: APjAAAXQ5LcjraIu0NbB0xEtiogUb7OukNBCJDfYDJk53QDQKM+8UB6e
 BYXs3gHtETjr+uQXogqRZJTm/g==
X-Google-Smtp-Source: APXvYqxdj4Cb0sM2R96ZUr1ajQFtYGm88VO/1g5Vy4S4C3IPuqYDDBKqaecA00hOMA81KjJPgvGlUg==
X-Received: by 2002:a1c:3d8a:: with SMTP id k132mr3750438wma.144.1574854418904; 
 Wed, 27 Nov 2019 03:33:38 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id m15sm18702608wrq.97.2019.11.27.03.33.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2019 03:33:38 -0800 (PST)
Date: Wed, 27 Nov 2019 12:33:36 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Yannick Fertre <yannick.fertre@st.com>
Message-ID: <20191127113336.GB406127@phenom.ffwll.local>
Mail-Followup-To: Yannick Fertre <yannick.fertre@st.com>,
 Philippe Cornu <philippe.cornu@st.com>,
 Benjamin Gaignard <benjamin.gaignard@st.com>,
 David Airlie <airlied@linux.ie>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1574850165-13135-1-git-send-email-yannick.fertre@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1574850165-13135-1-git-send-email-yannick.fertre@st.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] drm/bridge/synopsys: dsi: check post
	disable
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

On Wed, Nov 27, 2019 at 11:22:45AM +0100, Yannick Fertre wrote:
> From: Yannick Fertr=E9 <yannick.fertre@st.com>
> =

> Some bridges did not registered the post_disable function.
> To avoid a crash, check it before calling.
> =

> Signed-off-by: Yannick Fertre <yannick.fertre@st.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/=
drm/bridge/synopsys/dw-mipi-dsi.c
> index cc806ba..1e37233 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> @@ -886,7 +886,8 @@ static void dw_mipi_dsi_bridge_post_disable(struct dr=
m_bridge *bridge)
>  	 * This needs to be fixed in the drm_bridge framework and the API
>  	 * needs to be updated to manage our own call chains...
>  	 */
> -	dsi->panel_bridge->funcs->post_disable(dsi->panel_bridge);
> +	if (dsi->panel_bridge->funcs->post_disable)
> +		dsi->panel_bridge->funcs->post_disable(dsi->panel_bridge);
>  =

>  	if (dsi->slave) {
>  		dw_mipi_dsi_disable(dsi->slave);
> -- =

> 2.7.4
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
