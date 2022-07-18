Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3530B577EDE
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Jul 2022 11:44:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E895EC0AA15;
	Mon, 18 Jul 2022 09:44:25 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E25BBC03FDB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Jul 2022 09:44:24 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id k85so17155489ybk.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Jul 2022 02:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5wBUnOf/PDET8AmlCX8OvyjBFXuqlGhDmogYFmZCAB8=;
 b=u3TBNUuRGe4osn54l9zQKp0+DfA+1BvW6W3W5ValZ/lQMBpBtRiZ0My+V7Vdp4nlus
 Qr0ovsCrLdOezRtIcEEk6TRti4RNGoEKc0EvzCd9upCPnia4QIZGkOpAatAMH8rcHB6G
 EP6710HoempEUxSoNK6sgJNjk0g+4buD3AEAoU0jX3tlNK8k4idq8uTAY6zxoPoVo9YC
 edqQ4TvkaQKKg2nAWVCms3e1rX28PhE41/2pjGNRP7+vjyYQbDWKkKN9TFD7WPF/izcM
 tRo0ikOri50rHLVyCCiuIc7b/1t2n4myIX78AmgR4g8zShf6WrhPxDApE2iL4a7KkDsh
 1emA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5wBUnOf/PDET8AmlCX8OvyjBFXuqlGhDmogYFmZCAB8=;
 b=7hyDCFwpHO3zhJNcxV4BNOn0l2rUgDWCjRpopDiUiivEPM1VBaGTIFvy+SOmBiA9Lu
 CY68Y2JhZto1CtnvUNuX6XWV2PHE1S3hHzXSgW7i+u2pfqnMq3i2D6oOTsNUdA2fBGuy
 0+grci5o6aETteLw9sMxm28yjbNCICLIlEKI/RrLBwBT6vAmyPSTwAdk0TXHNcxLdhlC
 eiK0FOr8KPDvvimkHVRp5EwM3pITkm8eYhayNV2ShtBkF2tpvp+YdNkFIcR9dNZu/cup
 GnHcV/pHTN5UyXLdEUDumNktRHIfU/wFIKAn1ybAZaQ805Fe0hH/kALgY6UnJMXyUtYp
 N3fQ==
X-Gm-Message-State: AJIora83GWfRO+oIm8f0jq8nlrahghGjokblrfKOKqCN5SA8BxKoySA+
 tgxc4gf/kXkMxjh20Q6O5QzUUD+6Gv+Z8FEtWzZYYw==
X-Google-Smtp-Source: AGRyM1sn+IOhz2GaMI0qahc2BOoqiLGlQX+/66qO44EGm0YsFMPIGOPvL8uJKGEiUBaeQT2YmKDP2xNG3hEwveFuS/0=
X-Received: by 2002:a5b:9c5:0:b0:66e:cbbf:2904 with SMTP id
 y5-20020a5b09c5000000b0066ecbbf2904mr24718556ybq.220.1658137463785; Mon, 18
 Jul 2022 02:44:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220712110232.329164-1-francesco.dolcini@toradex.com>
 <20220712110232.329164-3-francesco.dolcini@toradex.com>
In-Reply-To: <20220712110232.329164-3-francesco.dolcini@toradex.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Jul 2022 11:44:12 +0200
Message-ID: <CACRpkdZDRjadHc4TBHouWPSYhLoCAynXzKejKi+H98C5ioCW6A@mail.gmail.com>
To: Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-iio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-input@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 2/4] dt-bindings: gpio: stmpe: Remove
	node name requirement
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

On Tue, Jul 12, 2022 at 1:02 PM Francesco Dolcini
<francesco.dolcini@toradex.com> wrote:

> STMPE driver does not require a specific node name anymore, only the
> compatible is checked, update binding according to this.
>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>

Another leftover from the early days of device tree. (This was one
of the first ARM drivers converted to DT).
Thanks for fixing!

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
