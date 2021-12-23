Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1261647E68C
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Dec 2021 17:57:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6D5CC5F1F7;
	Thu, 23 Dec 2021 16:57:13 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9FD0CC5F1F4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Dec 2021 16:57:12 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id o30so1555932wms.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Dec 2021 08:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=x19kNH14ExPsQ28C6SlBYVGa8akiQhXJZ1zBC3AV6iQ=;
 b=M227YuJRwIPX/CPb7Lg+WOaaHsKzAMYXB/Da0yMQGvxGa0saRVV+di4RqWZbiRK50Q
 trtNNAA5U+lBSeLSDkBTYNHzvTkoRut7yqBa7TwaK2JiNuabxmv5BOwtUV4KRi5pR2ah
 +So40Cr4Iob4Tt6iSivBaTYonKePYDmJoO96G2315qHEemCOzvUnpTMv67mZ828dG624
 KlLSAQZAPCK0t6oW5/w0P/ratE8Q/gOGGcfxxVQgmWw9mxWxwPnvkTDBy6VlAIJ/qwC5
 FqwkC9EauN7+/9F2aBN7XWx0UBUkBy4Fy8msCrRtBKZG4HbI823JZ/pJxnGPdlZrGi+r
 XB+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=x19kNH14ExPsQ28C6SlBYVGa8akiQhXJZ1zBC3AV6iQ=;
 b=4PczDp+SAJklY+qwEDn6vwj3B27FSKC5O/FtVH/yz3tuKWTI/NBzyWkQb2sA3s5AJJ
 t7DAMbZFsItEuXKSRlGTrPh8z+n7XIb1YeOUu3/Fq16NxeoRe0Si9dtsPozSydHGItD6
 75XOqStv7E7CqxpknChdTw/ByJXDXuaYcKcSDArWPfNbRUfb57yskg0FEHHbp6jJ939Q
 EDB/ddCg8XgYiImgUcNcBZUy5lfJL/jdevDy9hXsp3gjhaTE9RCaWsqRRV8UGp2erW3e
 14m7hIs0MlImiZoFQD3SsUajjZ/EZxqZva3MeMyuMtAeIQsQ7WK+JkRs0r8sKCdUQiqB
 iwqQ==
X-Gm-Message-State: AOAM533cjBiufv37B8QdzBBZ9eBc8tryK2zNMp+z7/3l8CaxEptCBKRa
 O+OOs1bhhen/tb01O+E+EyE=
X-Google-Smtp-Source: ABdhPJx0hYSOm4vDZR/gdV0QEOZLF2E0+HdDedp9MlR3fSt42MKgNwt3bY/4NeUgqZTjBr+NJEe+5g==
X-Received: by 2002:a1c:1d0d:: with SMTP id d13mr2448580wmd.78.1640278632133; 
 Thu, 23 Dec 2021 08:57:12 -0800 (PST)
Received: from elementary ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id u23sm4893233wmc.7.2021.12.23.08.57.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 08:57:11 -0800 (PST)
Date: Thu, 23 Dec 2021 17:57:06 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20211223165706.GA11019@elementary>
References: <20211222090552.25972-1-jose.exposito89@gmail.com>
 <20211222090552.25972-2-jose.exposito89@gmail.com>
 <YcRkB7uWyt4EbcZm@intel.com>
 <PIq2EEI7giz2rOuv2cfySbdxwht8AaCye140X5C7NejjXT6kD67E3E28uvg4Ebhob12EJUBtAxGPFNOgZwSWLYEfMtdhRNt3mR8bBGBJmU4=@emersion.fr>
 <YcSPt+81fuzteeCu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YcSPt+81fuzteeCu@intel.com>
Cc: marex@denx.de, mcoquelin.stm32@gmail.com, s.hauer@pengutronix.de,
 tzimmermann@suse.de, kernel@pengutronix.de, airlied@linux.ie,
 Simon Ser <contact@emersion.fr>, intel-gfx@lists.freedesktop.org,
 alexandre.torgue@foss.st.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, yannick.fertre@foss.st.com, linux-imx@nxp.com,
 benjamin.gaignard@linaro.org, rodrigo.vivi@intel.com,
 dmitry.baryshkov@linaro.org, shawnguo@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32]
 =?iso-8859-1?q?=5BPATCH_v2_1/6=5D_drm/plane=3A_Make?=
 =?iso-8859-1?q?_format=5Fmod=5Fsupported_truly=A0optional?=
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

Thanks for your reviews :) I'll wait a couple of days to see
if somebody else wants to comment and I'll send v3 adding the
reviewed by tags and fixing the compiler warning.

On Thu, Dec 23, 2021 at 05:03:19PM +0200, Ville Syrj=E4l=E4 wrote:
> Another related thing that might be worth checking is whether
> drivers generally do anything to validate the modifiers in
> the addfb2 ioctl. Looks like i915 and amdgpu are the only ones
> to use drm_any_plane_has_format() for that, so all the other
> drivers must either be checking it manually (or they're just
> potentially broken when handed unexpected modifiers by evil
> userspace).

I'm pretty new to this subsystem, so please correct me if I'm =

wrong, but after looking into a couple of drivers I think you
are right, this check is missing in some drivers.

This possible bug reminds me of this ToDo task [1]:

> Many drivers wrap drm_gem_fb_create() only to check for valid formats. For
> atomic drivers we could check for valid formats by calling
> drm_plane_check_pixel_format() against all planes, and pass if any plane
> supports the format. For non-atomic that's not possible since like the fo=
rmat
> list for the primary plane is fake and we'd therefor reject valid formats.

I had a look to the Raspberry Pi driver (mainly because I'm trying
to understand it) and it looks like the check is missing. Other
drivers, for example Mali, are checking the format modifier manually.

I'll try to do some actual testing during Christmas and see
how it goes.

Jos=E9 Exp=F3sito

[1] https://www.kernel.org/doc/html/latest/gpu/todo.html#drm-framebuffer-fu=
ncs-and-drm-mode-config-funcs-fb-create-cleanup
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
