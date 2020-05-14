Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B60F1D29DB
	for <lists+linux-stm32@lfdr.de>; Thu, 14 May 2020 10:21:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A8B1C36B13;
	Thu, 14 May 2020 08:21:23 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5414C36B10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2020 08:21:21 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id g4so2539496ljl.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2020 01:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ylNyjxPU0jW9A5cG6J8lYn77ZbNao4PuP4byNxuwb40=;
 b=pL+XB6xDy0cGnanxPxZeCoXI+0/bH/MJrC9FZHLbSFeABMiSHzmaFy/I+vlbadTqdg
 moVU55iWLxpm1nnhHrCGKzA2uK7DqkWVrHrypLWkQ77O98C65VIQg4eWTACmBhqQAvbe
 pHSqklAJtsA1BGN8aJrEPgAzkjuaIRy0vNfWRPOiZ0Gx9pkVb9qjr26pYd9MiqLjtOJr
 54QU9Kl6XwBPNiecFaQ5Q2UN0C0xobJnHAsuUb9l4eWMcWJxS8krPxWVDver5JV680GH
 IzpZdlsYOHiSkmT8GBGTZ0VfuqV8Pk7Uv4HSe7NIk0lkUADLNFPO/dZ01aPB2TJo4RoU
 he7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ylNyjxPU0jW9A5cG6J8lYn77ZbNao4PuP4byNxuwb40=;
 b=Z2lCVOuRbCFcnh4omX7z6w031BK12X5j2usNXxtx48f/0CTDT/qFaugi8dAkxiztXh
 GpN2BqN2sBbVoc/1XDRJ16SJbQKCULdsfUkZqazSewTEhiNpd7q9ofARMZ0delvNLNCW
 m6XiTpVFhQFN6V0AfrC4ESl0IwSWkE4DFXYJkII4JEXlM32mNWm0XYMCYUeM0KkHEYEs
 JKe8ObgKWsRm9CpzjMNsr6n1G3qSz3/rFJ+aXthWzrvQ1ch9JGb+DHS6JjQnKX4TfN52
 uzYVv8cW0bVDxpWO4Fl2bHiHZ1HC5qiWIhxRKY49eZs3nYR5hG/Yo29ieRF9OpWwTD+1
 RXtg==
X-Gm-Message-State: AOAM530WlLEQFFT4SDMthReGNZNJTWvspoUUhrkh7XtQyM7XAPjYD45n
 Jw4BG0GNtGpv0yh4wuT7HFJFswhd4WioOxIsZToCqg==
X-Google-Smtp-Source: ABdhPJyRERMIh+MQZPItj7QatuGXtUx06mgJ88uloHfqTCykxSiONeYCm+tNHIHuv9MC+hs2Hr0mPlFfLP8XGnr3zRA=
X-Received: by 2002:a2e:531e:: with SMTP id h30mr1125043ljb.168.1589444480845; 
 Thu, 14 May 2020 01:21:20 -0700 (PDT)
MIME-Version: 1.0
References: <1589267017-17294-1-git-send-email-dillon.minfei@gmail.com>
 <1589267017-17294-3-git-send-email-dillon.minfei@gmail.com>
In-Reply-To: <1589267017-17294-3-git-send-email-dillon.minfei@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 14 May 2020 10:21:09 +0200
Message-ID: <CACRpkdZUyRh0KZzRxsdfFU_L-F=Ns0j1d3eR-ermhx2Gb0Zrgg@mail.gmail.com>
To: dillon.minfei@gmail.com
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Dave Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 linux-clk <linux-clk@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v3 2/5] dt-bindings: display: panel: Add
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

On Tue, May 12, 2020 at 9:03 AM <dillon.minfei@gmail.com> wrote:

> From: dillon min <dillon.minfei@gmail.com>
>
> Add documentation for "ilitek,ili9341" panel.
>
> Signed-off-by: dillon min <dillon.minfei@gmail.com>

This looks good to me.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
