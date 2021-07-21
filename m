Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8023D1063
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jul 2021 16:00:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C5D4C5A4C0;
	Wed, 21 Jul 2021 14:00:48 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 152A9C597BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jul 2021 14:00:46 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id a12so3301117lfb.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jul 2021 07:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zsvJRDxyY5UbCVX7sGabd497i4VkHjlUGB0A4qGDBiM=;
 b=blMhE7FHuYJvQ1jjr+eBeAoe0VtX2eu7Ve2CWtDtuuospCBc5iAQLUu0A6jR/ynetF
 SPnplHFagBkDTKPQ7D4dX1CTKIT+Zpq0RGWPMEagc0uYZ66Sd+VQ35EWVZjiRNXHExOn
 FjwJcVQx6m3GkAkZdxYrV1EF0HAKW+t5CI29SFuf5n2wnFPEFo7pgOCzZLaLYJZRPMgs
 Edn645SrSlfVxr4SLzgTjeuM7Frlr+GZ5OFpRZNtLSNy4TCHJfKM0vEY3m2FfgUbP5pi
 5TmpbmrV+zyjRWlnXOYbMXbn93WMk4AWn8PwpwMOCdVj7OFWg9tcDeVD/dOp9o+DDvTM
 dvRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zsvJRDxyY5UbCVX7sGabd497i4VkHjlUGB0A4qGDBiM=;
 b=tZJDoCm3f45sUqC//Aza3nvCz8bE+nVckcf/XzQxSR3ESw3TfPRJ8hQBhrDsDMy+d0
 CWTV769i+O0KSWWa+HEiNeCkDkCFo2GD8/++Y3PXs7d0VlMXOqEzK5c4Ve2tnLtEh8jI
 65VEF1s+n4d+tbpSzcIvFZ9lqR8B3AJxyOk1KCJQKg3qmhHpGXLLAHuzund8lu8ltkWH
 u/7OqTUQ+CYj0qDaM3g+LbDhcqQPOb6Hr2Al2hsZYB5216XLL90JMVD7Gv67zir0R7z/
 rqPIdpWHzsviNVYkLJqcq1WftcsQ/BWbSreOiulDo3tFaNccQEVqVcY+xuYnI0mB8jJp
 0zwA==
X-Gm-Message-State: AOAM530R2RA3e6AF1VkFT8RsfjFBHmCYdWY1Yy88E+d2lq7No4k9ghBw
 p4kHTPboLuxrhZOXOE6DMeG1ixvOENo0a0A4ZSsjJw==
X-Google-Smtp-Source: ABdhPJxEOaTZyJ//VL0xm+qjsBbECijs8kafihDiLsk9j4fdAjhS7j5/f6rj7V9/XmHDPmtM1H58IrDvM4Y9VTGHhKs=
X-Received: by 2002:a05:6512:3f1f:: with SMTP id
 y31mr19471776lfa.29.1626876046329; 
 Wed, 21 Jul 2021 07:00:46 -0700 (PDT)
MIME-Version: 1.0
References: <1626853288-31223-1-git-send-email-dillon.minfei@gmail.com>
 <1626853288-31223-2-git-send-email-dillon.minfei@gmail.com>
In-Reply-To: <1626853288-31223-2-git-send-email-dillon.minfei@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 Jul 2021 16:00:35 +0200
Message-ID: <CACRpkdYerVu_LyNOJoxMTqhuNd9QBSFWTM7bfRnrsOyrxqE_kw@mail.gmail.com>
To: dillon min <dillon.minfei@gmail.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Dave Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Doug Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2 1/3] dt-bindings: display: panel: Add
 ilitek ili9341 panel bindings
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

On Wed, Jul 21, 2021 at 9:41 AM <dillon.minfei@gmail.com> wrote:

> From: Dillon Min <dillon.minfei@gmail.com>
>
> Add documentation for "ilitek,ili9341" panel.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
