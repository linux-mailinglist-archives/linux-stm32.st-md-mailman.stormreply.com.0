Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2156B1ABD2E
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Apr 2020 11:46:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9C9FC36B0C;
	Thu, 16 Apr 2020 09:46:51 +0000 (UTC)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E28CEC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Apr 2020 09:46:49 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id w12so2501681otm.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Apr 2020 02:46:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RM/nTDzMiJT/jjtvKRl0rtdDn36SiM29khhvLS3Fy9U=;
 b=CQ4aSeoWVIJYl2Gjf8RFK7zGl4a75/oCfQhHlq8vwV+oSl8kuggCaYVj2SXYpe1Vli
 86o3IrRSD1lSVCKV51QRSi2X6vz/JKXN2S1DG6z4CC+jJxWBq7uKJie0DgbEaBXXa/zD
 99uT3pjTmoys21kN0Q11LemIxQesYQTdPKb4i8CMF5Gw7DU3Ah3okJdEmbb1bxR/MP8Q
 9gY/FCGPntttDv/DCKSngj5V4fYQrelVm2HzOa4rfce5LYVNCSDEeqYBbISJT6HgpfaA
 sc1j7c4u+pWP8srTtyrTa5koPeTFbciiSz61RQ08nU9d+TaNJNl2Qg2mmrKAU0Nf+LFG
 13YA==
X-Gm-Message-State: AGi0PuYCC02xVAFGUCWTtaLQRxj6QV3IQ7Fm8aoIdQzFttvTQSW2uQE3
 ORFEFT8iJyabQvvdgZiDcxQmPXcbWemyaol5GtQ=
X-Google-Smtp-Source: APiQypIl3DcyhF0BNQx8p7xql+qmz/EnqLfrFLnv69mUOw78OJnDaQgEns2mc5nF+ZGDxENyc+UKCUv1ihzy5/CmGB4=
X-Received: by 2002:a9d:6299:: with SMTP id x25mr20179548otk.107.1587030408635; 
 Thu, 16 Apr 2020 02:46:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1586946605.git.mchehab+huawei@kernel.org>
 <221ac8f88034bb55c7029c162c0273eccd6b6480.1586946605.git.mchehab+huawei@kernel.org>
In-Reply-To: <221ac8f88034bb55c7029c162c0273eccd6b6480.1586946605.git.mchehab+huawei@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Apr 2020 11:46:37 +0200
Message-ID: <CAMuHMdXuq0SVUUE3gN5sF2pPaHfhQXX8JsXaR6+qXdnBXVikHg@mail.gmail.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Ettore Chimenti <ek5.chimenti@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Guenter Roeck <groeck@chromium.org>, linux-stm32@st-md-mailman.stormreply.com,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Kukjin Kim <kgene@kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Benson Leung <bleung@chromium.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [Linux-stm32] [PATCH v2 3/6] media: move CEC platform drivers
	to a separate directory
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

Hi Mauro,

On Wed, Apr 15, 2020 at 12:32 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
> As CEC support doesn't depend on MEDIA_SUPPORT, let's
> place the platform drivers outside the media menu.

Thanks for your patch!

> As a side effect, instead of depends on PCI, seco driver
> can select it (and DMI).

I don't think that's a good idea, as it suddenly enables selecting all PCI
drivers on platforms that do not have PCI.

    WARNING: unmet direct dependencies detected for PCI
      Depends on [n]: HAVE_PCI [=n]
      Selected by [m]:
      - CEC_SECO [=m] && MEDIA_CEC_SUPPORT [=y] && (X86 || IA64 ||
COMPILE_TEST [=y])

However, it already exposed some bugs that were hidden by PCI=n ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
