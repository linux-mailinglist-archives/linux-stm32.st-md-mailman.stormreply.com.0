Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A12B94BFC65
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Feb 2022 16:23:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6982DC60463;
	Tue, 22 Feb 2022 15:23:35 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76D08C60461
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Feb 2022 15:23:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5B895615AF;
 Tue, 22 Feb 2022 15:23:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00490C340E8;
 Tue, 22 Feb 2022 15:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645543411;
 bh=36C5XSTwUOyfNvIcqQ9TuoXhkklJD5exPe/8nUTTeMo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=urLBibFGvdPJvEFgJ9BsfC5Bsg1TMwd4yAIQItElZeHpfxbBUwiq+uVBZ6rCsy5nZ
 DxRN/Jf4b9JFwNA19WCikuBAWnLuwy60r33trFBY6LkxYWmfxJ8bA41GzTQQejHvh2
 fDBuky1YfbotkK4ulW8pGdbsQlt4kaC+F/21xSno517Mn2E/8owx36fe3zGd1KsiQO
 mDU/XdDw89zUgNRcgJNnSfNFcD3mlI1zeNB1MP2mCkVJUlkw4uToyxzF6+J1Ty58Vz
 PBIJOjNCNVBFgiubAridjRXeowbCoQdTPM5+iqTddQJ90VTYucnhiCMhOIYYXu750w
 bkLWBMZnUmJJA==
Date: Tue, 22 Feb 2022 08:23:27 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Philippe CORNU <philippe.cornu@foss.st.com>
Message-ID: <YhT/73ZM7IytO3+Q@dev-arch.archlinux-ax161>
References: <20220207165304.1046867-1-nathan@kernel.org>
 <CAKwvOdkXe8CB3QGe2e6Fhz8_SLOsOpcMumoKBiAzGE_VTXCkVg@mail.gmail.com>
 <430ee06d-04e7-3b8b-bf11-48a7b62eaf18@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <430ee06d-04e7-3b8b-bf11-48a7b62eaf18@foss.st.com>
Cc: Yannick Fertre <yannick.fertre@foss.st.com>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] drm/stm: Avoid using val uninitialized in
 ltdc_set_ycbcr_config()
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

On Tue, Feb 22, 2022 at 11:54:04AM +0100, Philippe CORNU wrote:
> 
> 
> On 2/7/22 8:44 PM, Nick Desaulniers wrote:
> > On Mon, Feb 7, 2022 at 8:53 AM Nathan Chancellor <nathan@kernel.org> wrote:
> > > 
> > > Clang warns:
> > > 
> > >    drivers/gpu/drm/stm/ltdc.c:625:2: warning: variable 'val' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
> > >            default:
> > >            ^~~~~~~
> > >    drivers/gpu/drm/stm/ltdc.c:635:2: note: uninitialized use occurs here
> > >            val |= LxPCR_YCEN;
> > >            ^~~
> > >    drivers/gpu/drm/stm/ltdc.c:600:9: note: initialize the variable 'val' to silence this warning
> > >            u32 val;
> > >                   ^
> > >                    = 0
> > >    1 warning generated.
> > > 
> > > Use a return instead of break in the default case to fix the warning.
> > > Add an error message so that this return is not silent, which could hide
> > > issues in the future.
> > > 
> > > Fixes: 484e72d3146b ("drm/stm: ltdc: add support of ycbcr pixel formats")
> > > Link: https://github.com/ClangBuiltLinux/linux/issues/1575
> > > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > > ---
> > >   drivers/gpu/drm/stm/ltdc.c | 3 ++-
> > >   1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> > > index 5eeb32c9c9ce..447ddde1786c 100644
> > > --- a/drivers/gpu/drm/stm/ltdc.c
> > > +++ b/drivers/gpu/drm/stm/ltdc.c
> > > @@ -624,7 +624,8 @@ static inline void ltdc_set_ycbcr_config(struct drm_plane *plane, u32 drm_pix_fm
> > >                  break;
> > >          default:
> > >                  /* RGB or not a YCbCr supported format */
> > > -               break;
> > > +               drm_err(plane->dev, "Unsupported pixel format: %u\n", drm_pix_fmt);
> > 
> > This is fine, but in the future you should add an explicit
> > #include <drm/drm_print.h>
> > to avoid implicit header dependencies (like the ones that Mingo is
> > trying to detangle) for the declaration of drm_err. `drm_vprintf`
> > needs it, too.
> > 
> > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> > 
> 
> Hi Nick,
> and thank you for having pointing this.
> 
> Hi Nathan,
> May I ask you please to update your patch changing drm_err(plane->dev, )
> with DRM_ERROR().

Sure thing, v2 has been sent:

https://lore.kernel.org/r/20220222152045.484610-1-nathan@kernel.org/

I used drm_err() as I saw DRM_ERROR() was deprecated but I get internal
driver consistency is important.

Cheers,
Nathan

> Big thank you,
> 
> Philippe :-)
> 
> 
> 
> > > +               return;
> > >          }
> > > 
> > >          /* Enable limited range */
> > > 
> > > base-commit: 542898c5aa5c6a3179dffb1d1606884a63f75fed
> > > --
> > > 2.35.1
> > > 
> > 
> > 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
