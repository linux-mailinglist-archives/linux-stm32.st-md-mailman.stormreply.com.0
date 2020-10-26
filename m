Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5190329916E
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Oct 2020 16:49:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73A8EC36B37;
	Mon, 26 Oct 2020 15:49:43 +0000 (UTC)
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6CB91C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Oct 2020 15:49:40 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id k65so10375041oih.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Oct 2020 08:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=pZLcxZ2MnUfE2owgeO5H9FxVAp5GYsqgLY4ZhY+S9R8=;
 b=jtSGr9LazkMCJoDk/IxFFP4G5Qs+Y/9svdQos1NCXU8w7ehGZ1EUP/P/1qM5Zn8/Jo
 sdeFpgprcu3SWr7TpeAQolSe02ABLWQf+Pty2W6nb4JyLbLaeZn+PQi2twz5+iUeR+WL
 03CZsOTG45+8p7ykLyG/f2YL6cOKxOwa1DleYjm/yOQyV9F1o5xu8twZBHPHM6TMPbfi
 HZdDc6zw/913iaREkqY3fNRuLIv5jELnWoD25g/3dDPPvbzNVn/oVekUMoMNW7G+/Sjw
 kZ9nnGIUmmxoDjTd8cwh/QyFuWIVpvY47VBot6ALPeaPToOWxzeTVrSlIsJbWkdayyo5
 om6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pZLcxZ2MnUfE2owgeO5H9FxVAp5GYsqgLY4ZhY+S9R8=;
 b=TzA4ZL108sYQYl8M4NHgmL4igp2kti3sJQvjEprtAm0atpufNvA2lEbzejSV/oMMKz
 k/gAF4tbBVBEdmsYnl75qv+eeQ2zBxt+IevJMBCl2nkqs1RnvdbMeAxtHgHiVrCBqZNi
 6kEp95yyM+hgmC+Sz6m9yVVIfJG/fsxbaElDfaKYuGfOLJteDgyJ0Hum/9elVy+NMsut
 3WynJIvc68fX2BRrbVYrBNx5tYdNuDX6XqbfWjsbsCzlbgQrteNFb3wdFx+h2r9zpeCM
 be1jN2ylzKx4FbkMG0+jfnEQHydiq/+u/PLr5nwDMykAXzQoBlPqh/wIvhNxNxSZPlld
 cqxA==
X-Gm-Message-State: AOAM533TgmRoQHn11/Sa+XR/LJxpZMQpJw4TVoVb9ccUIaocOd0lZuDJ
 cnnxnQv6hfkFnYQtPEPv8XLZJQ==
X-Google-Smtp-Source: ABdhPJy5vzb4gSulEItGq7NAbNpQx1Rk+qmcaxsk1uEPTY3pthSMzWWPWLeRubLs4nUV8lHjyEbN1w==
X-Received: by 2002:aca:4d06:: with SMTP id a6mr14494885oib.166.1603727379027; 
 Mon, 26 Oct 2020 08:49:39 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id a16sm3807833otk.39.2020.10.26.08.49.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 08:49:38 -0700 (PDT)
Date: Mon, 26 Oct 2020 10:49:36 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Message-ID: <20201026154936.GA178863@builder.lan>
References: <20201014125441.2457-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201014125441.2457-1-arnaud.pouliquen@st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 0/4] ARM: stm32: add DT properties for
 remote proc synchronisation
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

On Wed 14 Oct 07:54 CDT 2020, Arnaud Pouliquen wrote:

> This series implements the DT part associated to the commit 9276536f455b3
> ("remoteproc: stm32: Parse syscon that will manage M4 synchronisation")
> 
> Delta vs V1 [1]
> - add Rob acked-by on patch 1/4
> - simplify yaml descriptions and align other syscon descriptions
> 
> [1]https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=339339
> 
> Arnaud Pouliquen (4):
>   dt-bindings: arm: stm32: Add compatible for syscon tamp node
>   dt-bindings: remoteproc: stm32_rproc: update for firmware
>     synchronization
>   dt-bindings: remoteproc: stm32_rproc: update syscon descriptions

Applied the dt-bindings updates, expecting the dts change to go throught
he ST soc tree.

Thank you,
Bjorn

>   ARM: dts: stm32: update stm32mp151 for remote proc synchronization
>     support
> 
>  .../bindings/arm/stm32/st,stm32-syscon.yaml   |  1 +
>  .../bindings/remoteproc/st,stm32-rproc.yaml   | 21 +++++++++++++------
>  arch/arm/boot/dts/stm32mp151.dtsi             |  7 +++++++
>  3 files changed, 23 insertions(+), 6 deletions(-)
> 
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
