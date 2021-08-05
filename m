Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9E23E10DF
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Aug 2021 11:09:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7DCAC597BC;
	Thu,  5 Aug 2021 09:09:07 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55BD5C57B51
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Aug 2021 09:09:03 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id x8so9749604lfe.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Aug 2021 02:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8fY/oxeThB23V+9UG1Edzhasn4C+9ragDJgqZ7k9gIw=;
 b=H49voNK1g+G8urIyGYiAgsJPEAbkGA6DS0f+onn3MiQT2Su6rWS4gKB7NCYVSHsRsr
 dl1CGmKWiTmd9NPn8MdOp6Hfb4ghau3PWU4670rnDYv0GuqdtX91YasNnuxoQRdbNE+0
 O3FXuc8lVPWMvg00OyZkUCg7LFHpMW+eZvOL2Z0nzI/aXYslgWuJbXDtR+P76dcTxMF8
 rdRDG74oSWg/O05nwExHu4GoAoSgkcfIhx3pmDGh9L6aY364AaF1ROfpoU1KauKVULjf
 FmrxPhVj4L17We+I4zMT19/47onr4iF7btZGkwb54yYmD9y23RlPcxKp31vopw7oA8JC
 8JNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8fY/oxeThB23V+9UG1Edzhasn4C+9ragDJgqZ7k9gIw=;
 b=cLIKSSUKsRgpHYRoEAm2UmYsUpZ7AVm7NZvh/WGZXGHUs/B8HjFzxwor6cofTOb6KY
 TrSm8u4OazfQDZPc0/X9vLz6c7DPz9cZwT28M5ONEScJxXmbSYm66t6U/g7uZLPL1XvL
 VGz4TJ1SdPkyGMR5An1vvUPolIMkLTXNEqu8E009gkObLTcHWKG3/tm6Z5NCCxh1FhTU
 P+vF+AAs6z8mos3b2Hs7XC7mif6nhnYd0ALQz9W+JOgDFnXpITJKRlbBGZD69Jj8T+2R
 Dusrw+FVyytAKG4KLGyFn+wZ4h/1LVDI8bsVgr3rPEIZQCd4bbB8RIghUryTWb0zBoMG
 iyeQ==
X-Gm-Message-State: AOAM531CyMYrB6teqEizFO8VCGZghCI2Cw/ttgGqMarpw48oFsa8+kES
 BDA1FmRVhFO7KLcfBgxviXEE+UZUXhgsRGTDqGZ4RA==
X-Google-Smtp-Source: ABdhPJxqty0NGuXhYp4Sy3H2W5aZNxbWZCoi8hI7ymIGAcMh8xNGz6zqsExVUV5mnZ5ZSm+iwxpYBLFqDqCMYi8/beg=
X-Received: by 2002:a05:6512:1084:: with SMTP id
 j4mr2991518lfg.586.1628154542193; 
 Thu, 05 Aug 2021 02:09:02 -0700 (PDT)
MIME-Version: 1.0
References: <1627098243-2742-1-git-send-email-dillon.minfei@gmail.com>
 <1627098243-2742-2-git-send-email-dillon.minfei@gmail.com>
In-Reply-To: <1627098243-2742-2-git-send-email-dillon.minfei@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Aug 2021 11:08:51 +0200
Message-ID: <CACRpkdYEWDKrcUGcnDLKrx7+cGH4BvKLC0du1wYpkXTiJwn8_g@mail.gmail.com>
To: dillon min <dillon.minfei@gmail.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, kbuild-all@lists.01.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Dave Airlie <airlied@linux.ie>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v4 1/3] dt-bindings: display: panel: Add
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

On Sat, Jul 24, 2021 at 5:44 AM <dillon.minfei@gmail.com> wrote:

> From: Dillon Min <dillon.minfei@gmail.com>
>
> Add documentation for "ilitek,ili9341" panel.
>
> Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Link: https://lore.kernel.org/lkml/1626853288-31223-2-git-send-email-dillon.minfei@gmail.com/

Patch applied to drm-misc-next.

Thanks for working on this!

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
