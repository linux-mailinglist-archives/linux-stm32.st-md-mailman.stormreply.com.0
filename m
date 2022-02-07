Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BA94AC9C9
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Feb 2022 20:45:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 231C8C5E2C5;
	Mon,  7 Feb 2022 19:45:07 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AEA00C5AB61
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Feb 2022 19:45:06 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id o17so21263619ljp.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 07 Feb 2022 11:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lZDpDADdfwq40jZPbE/sznh7Bnymle3eu2MsiKyAnHI=;
 b=BdiDafPxAfgT1LadX6/qdSNo8n3l0Xa/GtCJEktDJMXEmp52SrE42F60zh+yNtgnej
 uafnZUT8MJqOawyMYksVSqsD8w5zXATUGodDDaf2n0OSYIP77vOHkN1WwPFv0stLOa78
 +4ATpfopW4dS5hdH2p54SyosNF1m7zjr8r+2YE4GWs0neqc92bzF3dIJD7hE8cA0PJPs
 kQu1XjE348Lq3znmdTjfrSq9FD04iuxmobdD48LoM7k4xW51/uiPDMkZVxL359FVEki8
 6hN3NzqdifRAShPzrX73QDVc8Pe4IH8JQaohdbJyNHzgPOa0p/tQFkgSdDhkiO0KiTmj
 Kknw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lZDpDADdfwq40jZPbE/sznh7Bnymle3eu2MsiKyAnHI=;
 b=W0JoWyoxEc9ZqpTzUgt1Udiwka9uu3ver/zcPWgdCnhLa1bdfEoNga1XtaCvxjmT3K
 tULOCZNf7MK9t5fh8wgrhsxwoTg5C6XZDc+xRLLqGJi5Sd9TyfdxnxeJTpZr9AGsNGYN
 VPZXYqIfUhZe/f1ir9B3lifa2A1UqwsgrdDe4s+9TXJrwfNnz5mygFmbKoy/WpAIc5tP
 EdU5yZp8pfyEcGi4u5I3ygoQL+qT2SMHBobczj2v78JJyJrjtORzCCO3WCAPtij9yF8m
 eyrma8pCzjWLHjB3+ziGhOezWDORcV7GHMUaBoTXwJTQA6C6QaBcziJ+Fkkki8h4k/dF
 akmA==
X-Gm-Message-State: AOAM532lrXSVnN3fpG6ykGRVZymg4QDvaAFJd/ek5BCy+DX2VgFfwZdh
 HeoDbwNfQZ/zpPfnZPIu87QUCROwBuHAiN8j+H7Z+w==
X-Google-Smtp-Source: ABdhPJwv1WF2F6ndc/bGUuNT+neSxWAOv6iXkCytc6pktYWRpfycPf6E/KpzZmQrd8aUu/NlJ8No19+iCvFMptVtXu4=
X-Received: by 2002:a2e:7c0c:: with SMTP id x12mr648215ljc.526.1644263105665; 
 Mon, 07 Feb 2022 11:45:05 -0800 (PST)
MIME-Version: 1.0
References: <20220207165304.1046867-1-nathan@kernel.org>
In-Reply-To: <20220207165304.1046867-1-nathan@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 7 Feb 2022 11:44:53 -0800
Message-ID: <CAKwvOdkXe8CB3QGe2e6Fhz8_SLOsOpcMumoKBiAzGE_VTXCkVg@mail.gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Yannick Fertre <yannick.fertre@foss.st.com>, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
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

On Mon, Feb 7, 2022 at 8:53 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> Clang warns:
>
>   drivers/gpu/drm/stm/ltdc.c:625:2: warning: variable 'val' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
>           default:
>           ^~~~~~~
>   drivers/gpu/drm/stm/ltdc.c:635:2: note: uninitialized use occurs here
>           val |= LxPCR_YCEN;
>           ^~~
>   drivers/gpu/drm/stm/ltdc.c:600:9: note: initialize the variable 'val' to silence this warning
>           u32 val;
>                  ^
>                   = 0
>   1 warning generated.
>
> Use a return instead of break in the default case to fix the warning.
> Add an error message so that this return is not silent, which could hide
> issues in the future.
>
> Fixes: 484e72d3146b ("drm/stm: ltdc: add support of ycbcr pixel formats")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1575
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/gpu/drm/stm/ltdc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index 5eeb32c9c9ce..447ddde1786c 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -624,7 +624,8 @@ static inline void ltdc_set_ycbcr_config(struct drm_plane *plane, u32 drm_pix_fm
>                 break;
>         default:
>                 /* RGB or not a YCbCr supported format */
> -               break;
> +               drm_err(plane->dev, "Unsupported pixel format: %u\n", drm_pix_fmt);

This is fine, but in the future you should add an explicit
#include <drm/drm_print.h>
to avoid implicit header dependencies (like the ones that Mingo is
trying to detangle) for the declaration of drm_err. `drm_vprintf`
needs it, too.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> +               return;
>         }
>
>         /* Enable limited range */
>
> base-commit: 542898c5aa5c6a3179dffb1d1606884a63f75fed
> --
> 2.35.1
>


-- 
Thanks,
~Nick Desaulniers
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
