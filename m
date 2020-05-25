Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 308B41E0E54
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2020 14:23:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E73EFC36B24;
	Mon, 25 May 2020 12:23:56 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28EA2C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2020 12:23:55 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id w10so20603888ljo.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2020 05:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1neDSVvo2exAwO7XG1Q7asHC8C/uLbtbXAanu+QhUvY=;
 b=mHchiWv9d+bl7TypEyswUYJoJBznRNEzkaqNXJ6yZYcwVhCmDlHeQE5uaH/HclG1/A
 Bx4Cg9tDzYVicfaKmVDBhYVOUgLefRTuPj7YFVjqzZ8YnTP/1LLLJTykYqXl+FHN2pZL
 g8xP1m6SXMaHEiGtmqiEB2IP7G+kpZcs9VS8hZv85N+n3X6CdpddRhU6y1nCKsAQzFCY
 4rfmeLIz/oOwhxkepv8pd1oS85BdwpikntEpMCfo0gVE3d09pfC4AhwFL/nAFV+L4+Zb
 mwcQqn4CqSg3gj+nOH2kk2AibQMFcCPYOzlGhx/9SXJpErxweRkVif+GCa4LGQO8gvT9
 9trw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1neDSVvo2exAwO7XG1Q7asHC8C/uLbtbXAanu+QhUvY=;
 b=oz+16hoJbXeVerdHloQ74AGF8NYmUZEP9d+Z9lEfEQKMwQR0bTk3URfltBXW+l7sUA
 3qI5yUrJz+BGvJuswArsgEq1HUAhDiTjTrVkup5NSye07x0QzsVdavdQkbaw3PDalEN6
 Cj90kpVcJcLs6Qg/8C39eSvQDKIVlNCbVZzm5bTUv+KNAspKyUTAnrdFEgAWxJAql3qG
 SmgO9zx2sd0Gvc2BBAf/Ru+w4YAQSc9e36NNKW4sv7gbWXdTZ7+dsDAJrSDM8haGyEYf
 ON/+Yfuozh470y0HPwTnsPptkVueBqK6JYkCwoDDAxlfAF2o27iHH9jNwabBNbCWnXbq
 5HLA==
X-Gm-Message-State: AOAM530QeTRlgVXnXYxycYn30os6HNmkbpo1jYpaJI0K2UsF1fTSONkc
 1Aamd86WjlCPCYPgCfwleHZ2YPob4veunnjWEbF71Q==
X-Google-Smtp-Source: ABdhPJyf5wZA8Fh7xQjtaNnLLHBTpAkEbLAQIKhyb7JglaMhaJDSU7UOMtER0/cndL74Gsc/vcIt53XFGmKsX5AJ0t0=
X-Received: by 2002:a2e:711c:: with SMTP id m28mr13451102ljc.104.1590409434478; 
 Mon, 25 May 2020 05:23:54 -0700 (PDT)
MIME-Version: 1.0
References: <1590378348-8115-1-git-send-email-dillon.minfei@gmail.com>
 <1590378348-8115-7-git-send-email-dillon.minfei@gmail.com>
In-Reply-To: <1590378348-8115-7-git-send-email-dillon.minfei@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 25 May 2020 14:23:43 +0200
Message-ID: <CACRpkda26eQZGMfbq-FL9X532mK=Z87GotjYMu2MWNGgNohp7A@mail.gmail.com>
To: dillon min <dillon.minfei@gmail.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 linux-spi <linux-spi@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v5 6/8] drm/panel: Add ilitek ili9341
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

On Mon, May 25, 2020 at 5:46 AM <dillon.minfei@gmail.com> wrote:

> From: dillon min <dillon.minfei@gmail.com>
>
>     This driver combine tiny/ili9341.c mipi_dbi_interface driver
>     with mipi_dpi_interface driver, can support ili9341 with serial
>     mode or parallel rgb interface mode by register configuration.
>
> Changes since V3:
>
>     accoding to Linus Walleij's suggestion.
>     1 add more comments to driver.
>     2 reduce magic number usage in the driver.
>     3 move panel configuration from common place to system configuration.
>     4 reuse MIPI_DCS_* as more as possible.
>
> Signed-off-by: dillon min <dillon.minfei@gmail.com>

This looks good to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
