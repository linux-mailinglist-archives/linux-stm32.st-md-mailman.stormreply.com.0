Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74355816A4
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Aug 2019 12:15:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 260F8C35E04;
	Mon,  5 Aug 2019 10:15:22 +0000 (UTC)
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 996ECC35E01
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Aug 2019 10:15:21 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id i21so78822547ljj.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Aug 2019 03:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EVUakBz4HVrBvU5WozBP9zRGYaZ2u063yCbTr8IH9wg=;
 b=h7hSXRNhw+BgWJVjsm3CUTt+gZ14IRMN5LjwbEypK2d6eMw0PVs2ntw/YUTNTo6K5c
 YvYdlQu43bwvSdSCHbk9ALOWXZGSYh2Z6De9g/Su7n1CVvElbTYf5Sk4V3CWU/t6arn5
 QL5v+l4NitaSIZfsmJrgpY7tfjio4lzr/M6up+lXW9V3Ps9ZuOirB94gxrz8x1FG8GQs
 RttJ3Vra50Bu2sxlntxYoVh4k7IcugIs4VJCZaH9TonMZSuJSrbdbZTXGgz+gcjtPoyh
 AP/Ox8IvhETub7PSCfZSGGX1tuRPisg0IWmhPaXV0jTRZ/ydreArtzV03pszTkbXybr9
 hJFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EVUakBz4HVrBvU5WozBP9zRGYaZ2u063yCbTr8IH9wg=;
 b=duGYE/gOdCmIRJP5R3+iD6K2iZ14Qs6iBrcV8ccsTwuuA8jEMp6doR3ZDtrPG0DQly
 Y70sHfB/aZ3cq02zdQOBgx9VjFdVj5adSGsFVzoO0YUS8ItdrOTzBtF/Oy4Oz/9JQdaT
 eWmcIbcBNsfgWyb1/ZP5fPEeSTTfSW6YMUL7V/r1GDTdPfo3QrCrm1kkZiw2ju3K2Kk0
 icRO1u2ihypUUI0qVvjj3F7hv1ZFMBK1g35OQKJrApzRS8V3WnurZtU7E7kFjEAGPV5t
 1MwmUR1XqG4Itjbh2WzGbjUv2FgmpYWgAJc/fq3h/kauAQVlynWfh9VWh0lAq9moG3/e
 RNoQ==
X-Gm-Message-State: APjAAAW7GxhGfEsmNWG++IfFfDK9mcPwVfQTJHgyUtw4HedgZiN3MQdd
 B0QyUvDftxKj8w96v8GK36WDJN+exyY4uaguV8XnxQ==
X-Google-Smtp-Source: APXvYqySHuR6d+bEQrsbTHzEENtYOVUi+8awDm/vDpXZ3zt3zWFIJstQGj1Z5v+QGxwqmgpUNdelEqXuxOip7mnqSPc=
X-Received: by 2002:a2e:8195:: with SMTP id e21mr9719149ljg.62.1565000120908; 
 Mon, 05 Aug 2019 03:15:20 -0700 (PDT)
MIME-Version: 1.0
References: <1564053416-32192-1-git-send-email-amelie.delaunay@st.com>
In-Reply-To: <1564053416-32192-1-git-send-email-amelie.delaunay@st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 5 Aug 2019 12:15:09 +0200
Message-ID: <CACRpkdbeTQE1SGFeU0NQzgYxz_rjA_6Lw=3WLmeAF7pyEw7aLA@mail.gmail.com>
To: Amelie Delaunay <amelie.delaunay@st.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] pinctrl: stmfx: update pinconf settings
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

On Thu, Jul 25, 2019 at 1:16 PM Amelie Delaunay <amelie.delaunay@st.com> wrote:

> From: Alexandre Torgue <alexandre.torgue@st.com>
>
> According to the following tab (coming from STMFX datasheet), updates
> have to done in stmfx_pinconf_set function:
>
> -"type" has to be set when "bias" is configured as "pull-up or pull-down"
> -PIN_CONFIG_DRIVE_PUSH_PULL should only be used when gpio is configured as
>  output. There is so no need to check direction.
>
> DIR | TYPE | PUPD | MFX GPIO configuration
> ----|------|------|---------------------------------------------------
> 1   | 1    | 1    | OUTPUT open drain with internal pull-up resistor
> ----|------|------|---------------------------------------------------
> 1   | 1    | 0    | OUTPUT open drain with internal pull-down resistor
> ----|------|------|---------------------------------------------------
> 1   | 0    | 0/1  | OUTPUT push pull no pull
> ----|------|------|---------------------------------------------------
> 0   | 1    | 1    | INPUT with internal pull-up resistor
> ----|------|------|---------------------------------------------------
> 0   | 1    | 0    | INPUT with internal pull-down resistor
> ----|------|------|---------------------------------------------------
> 0   | 0    | 1    | INPUT floating
> ----|------|------|---------------------------------------------------
> 0   | 0    | 0    | analog (GPIO not used, default setting)
>
> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>

Patch applied.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
