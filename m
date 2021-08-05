Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2733D3E10E8
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Aug 2021 11:11:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E29ABC597BE;
	Thu,  5 Aug 2021 09:11:45 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ACAE5C597AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Aug 2021 09:11:44 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id f42so9699611lfv.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Aug 2021 02:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JGy6Zf1Gz/DvNLOUOgVqZw1voM6TCsaMrfyL2VVTA2M=;
 b=Czpou3fdBuvMRgQdRobXPBNmSPmet30GmWm2xaQ8xlkiaXiT9pq1VJ5Sz3m72V5qwc
 3gA09WBzEqX4wBMbAWb2aL+u3uxCI5tSmxJK2GrkgtzaztR0jzf0hXqnh/rxekaLRzCH
 XQ9NRRqtzN5mRX5BxSFi8xj4rJHxMs28Tw4tL+iOXcP378akJNAZm9rLVJ3kQ7Gx/wqU
 hmc9MxNHu7e2hVUrAzorRfo7qKK8MPzvzo8I0Z4M4QcsLfDNwbKFbO3Onvasga885UF+
 MuD438vz+7ymSeAsFMLiFokCcNh8DTEfPEy5F5HPk3V4dvqE2xr2ESyF0X6dAPBaiE+4
 WRVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JGy6Zf1Gz/DvNLOUOgVqZw1voM6TCsaMrfyL2VVTA2M=;
 b=tdQ25HczGezvbc389Ckifdyjp3Zqakv+5LT6TBg4aiFQFZVsmHXbUD377L9QQ7ng/a
 Tegh5+8DBGGrxgR+rk8G90J1Ls5JjBOrZ6xomM36tsrDgadGz6KkoAJBPl1tRi3CPJfj
 nr9q63vZMsYMsqz0ZbNZ9RxL1n/qpsFAem45zP7cv/R2cFV+r4AElE+8ULTD22beKZBQ
 xUD5/qzF1A8q3FNa+LPwdGADZp0dZNQGCstVjlRkEYpaeeHI8O8CN9FD2EX3RoyxvnDi
 B+SNqtWlKKpW4hBuGcXPfLktEXVvl+gTH9b6wwiEaYskbUJaiTRxU6SweykNv8aji1pk
 gLNw==
X-Gm-Message-State: AOAM530BD3/C6hHuN803wCIpE2sUr772Gp1QE080OhrGm9kqCknZES+V
 21b1JiCXH6Vlu992CWcNnULsf7O0M/yZkc7oMnsrgQ==
X-Google-Smtp-Source: ABdhPJxrf9wmOoKiTifiOSKjkHpaxgSpZEW0ggxZq8N4Li6hZYEwsHuFZuOzq7JEu33rr4FIZfdLktcn7Mucw0+3gv4=
X-Received: by 2002:a05:6512:132a:: with SMTP id
 x42mr2814304lfu.291.1628154703391; 
 Thu, 05 Aug 2021 02:11:43 -0700 (PDT)
MIME-Version: 1.0
References: <1627098243-2742-1-git-send-email-dillon.minfei@gmail.com>
 <1627098243-2742-3-git-send-email-dillon.minfei@gmail.com>
In-Reply-To: <1627098243-2742-3-git-send-email-dillon.minfei@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Aug 2021 11:11:31 +0200
Message-ID: <CACRpkdYReUdg_7oSTqcsA_+9tS9w6MH90=KV1rGyr4YWT=NW-w@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v4 2/3] ARM: dts: stm32: fix dtbs_check
 warning on ili9341 dts binding
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
> Since the compatible string defined from ilitek,ili9341.yaml is
> "st,sf-tc240t-9370-t", "ilitek,ili9341"
>
> so, append "ilitek,ili9341" to avoid the below dtbs_check warning.
>
> arch/arm/boot/dts/stm32f429-disco.dt.yaml: display@1: compatible:
> ['st,sf-tc240t-9370-t'] is too short
>
> Fixes: a726e2f000ec ("ARM: dts: stm32: enable ltdc binding with ili9341, gyro l3gd20 on stm32429-disco board")
> Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> Reported-by: kernel test robot <lkp@intel.com>
> ---
> v4: no change.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Please funnel this patch through the STM and ARM SoC tree.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
