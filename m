Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 686FA42CF07
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Oct 2021 01:15:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A511C5C837;
	Wed, 13 Oct 2021 23:15:41 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 711E1C5C831
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Oct 2021 23:15:38 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id z20so16711435edc.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Oct 2021 16:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7ju4FdDxKeupxsvqXZ5L35NpfulDrv5TwhuxEV1jN1w=;
 b=JQSjgti/r7jU+WIk4smaWkBESjkcXnhOMhcHqndNqV+pUI+gmV/swSHLTLisx8xvg7
 MSfh8F5cojRM+TCzPq4pgfsrIjiBib8cv+NK3U4ThyvAXXi41u3/Evbm4kcxXXbwQnVo
 NS3NBwoNybumVkfyjt2TNNANNA/rUEOLEDZEJmfDlKeXN5i/jYpevswlCmcTi5AeTeCl
 CH9GgNgBSM1pp7BvWavRnRVXP0OAr11qjcAH54j+x8W4CMv4WMHVYBFZvEB/HP2oTA9Q
 38kv8qxrY786+dL4Ws+G/m1+TGnzm6uSVX5SIO++fw+8mm2P9H+57sOI5/H2ob/fgUkz
 zckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7ju4FdDxKeupxsvqXZ5L35NpfulDrv5TwhuxEV1jN1w=;
 b=QPsTL+rGSKXQDZV7NVLjv0NyPAN5cq/omGSZFuW6Dm7q1I+Xq+mbJR1+N5Xh2+xq3Y
 qmShIR4DgM1U9NPcMDChff2T+42CJeIVdXD2VZfAw9pZOG78Rla/npt9QZNEXezHL3Tz
 PlRw0cCEMu0Ays63XClP5UlDi014Ygb1xY5N9ZuZ0GgHTzPMkdMXV5I0A25WvrSQpKLw
 vxUJBTWlKPt3Vo2IgxPt/EuBz7D2VhLV0talcojAFxZ2J9l2UWeuwH0Qs0W2OjU5/b1+
 U67UcwDns0pcUMckNAvelwhvty67XYOOdkdcSJd8OQpREDXqFge9kEd1IPGBTUUvOUm/
 kyoA==
X-Gm-Message-State: AOAM530p7t6tcS6kbFSWQOXIgvgJPPfuL/a+e+w+Ysf8H/b6yqMzIQWH
 O1sWW+GgQEg84Frip1Palixu/RJrsbSB8pOynXuNcQ==
X-Google-Smtp-Source: ABdhPJzStUrpguO+PBbo8xyJG9VHVWSiDGZsLi1RJWVkaVn7fWA3k08WteQwAsSEmqhYemwIGMD0YpNsH1iotykM0s0=
X-Received: by 2002:a05:6402:34f:: with SMTP id
 r15mr3469367edw.111.1634166938494; 
 Wed, 13 Oct 2021 16:15:38 -0700 (PDT)
MIME-Version: 1.0
References: <20211008122454.617556-1-fabien.dessenne@foss.st.com>
In-Reply-To: <20211008122454.617556-1-fabien.dessenne@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 14 Oct 2021 01:15:27 +0200
Message-ID: <CACRpkdayzVCz5jDneoPWtM+t0CrJ_bY53BWUa0axNu5i66NH+A@mail.gmail.com>
To: Fabien Dessenne <fabien.dessenne@foss.st.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] pinctrl: stm32: do not warn when 'st,
	package' is absent
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

On Fri, Oct 8, 2021 at 2:25 PM Fabien Dessenne
<fabien.dessenne@foss.st.com> wrote:

> Since the 'st,package' property is optional, outputting the "No package
> detected" warning-level log when the property is absent is unsuitable.
> Remove that log.
>
> Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>

Patch applied.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
