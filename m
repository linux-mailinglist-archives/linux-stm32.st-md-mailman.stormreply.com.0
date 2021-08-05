Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F19C3E10E3
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Aug 2021 11:10:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB9EEC597BE;
	Thu,  5 Aug 2021 09:10:46 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8EC31C597AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Aug 2021 09:10:45 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id b6so9672711lff.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Aug 2021 02:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GJwSqkoynJ2MGVTaxaCF6tjvxxMA2tETgRViwoLL+uA=;
 b=BdFbpdP8kIg3G9AXQcWSIAeuhscjDoUZNHs6tTtydjVKNUqX6XH/PSRXgAvDDkibyH
 5y1QnI6iyG41rUI4BShiWsjCdK9reMem48YfsrqtBHdjkZ/XH+7NfJ+Fp2W+rvSiXgIj
 KDzQQqJGe57bSr7SJNVLID1dJ7Ja1FgI6yo4Qu25gQia7UNjomXH2lFAS5NmjX7WzsWP
 7yol4EFp/gL0Qs9PjkuGiH0wi/O1hWWB9WpeJuEpUYm4b83BPy5lLxvlRxVq3VWu52AX
 EJs2V9pNjHHKlGmtbjwr7Ripm4xap7zc2hd36d6NtjMcalc9jcX66PggfAmfrUt4wDpy
 6L3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GJwSqkoynJ2MGVTaxaCF6tjvxxMA2tETgRViwoLL+uA=;
 b=iIX10YQBHmFDla3fq9KN73DYvwP2DUQtOJzWTEfvGhH5Ytxfl7Tr/viAoZaqI6bAXy
 TZAmZX1tUc9/9DrbPZkhFwMZWExWUao2N01JSR0+aXo1o8OXRCAK8tMknEp63wFGwcuD
 7/RHxLyF92ijcDwUC6i80Mxs4nfT3lhWy4g+V5emd4yUhAl+fstc/PHg33x9GlhWFzy0
 YxPWuKEyYxpOEyQVgNtEA+u7+LoY1061hVKKbnN26rMlf/tlZ/qD2gaduo6H9LgNyK6S
 mcrYWMNhsh5DqAunOzrNJdz/GxE8Y3kNQdzliF+tfiuUVSgFHpcGUs1zNva09q7kHmtL
 7ozg==
X-Gm-Message-State: AOAM531KGG9HM928lOQITfZIAWvarBs3LQg0dp+FrzQ55Y/WI+fbPW5v
 T3oX4FHJgUOLzJg3DUZSBJdTK7VEa4wD/6mm3+JV1A==
X-Google-Smtp-Source: ABdhPJzZpUm8mUiTLlF2l2RaGugFmMpQMMqoQ5ipZx5ajfXnBZ534P16n8WUxjIaWbrbZLOd9+eZHKDTwonxKjv8meI=
X-Received: by 2002:ac2:4d0f:: with SMTP id r15mr2833139lfi.649.1628154644990; 
 Thu, 05 Aug 2021 02:10:44 -0700 (PDT)
MIME-Version: 1.0
References: <1627098243-2742-1-git-send-email-dillon.minfei@gmail.com>
 <1627098243-2742-4-git-send-email-dillon.minfei@gmail.com>
In-Reply-To: <1627098243-2742-4-git-send-email-dillon.minfei@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Aug 2021 11:10:33 +0200
Message-ID: <CACRpkdYzrpHgDCW2UXNnFk-NpC_yM5xeSe_jBDJMGa6==5SHXw@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v4 3/3] drm/panel: Add ilitek ili9341
	panel driver
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
> This driver combines tiny/ili9341.c mipi_dbi_interface driver
> with mipi_dpi_interface driver, can support ili9341 with serial
> mode and parallel rgb interface mode by different dts bindings.
>
> Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> v4:
> - fix m68k-allmodconfig build error which reported by lkp, thanks.
> - add Copyright 2018 David Lechner <david@lechnology.com>.

Patch applied to drm-misc-next

Thanks for working on this driver!

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
