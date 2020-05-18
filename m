Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FACC1D7175
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2020 09:05:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A09EC36B22;
	Mon, 18 May 2020 07:05:07 +0000 (UTC)
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CEB12C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 May 2020 07:05:04 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id i22so8135249oik.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 May 2020 00:05:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mwst2oJ9ZiHpuFTk/EHEIXQxKyuYO4XvyCKHwPLuFvQ=;
 b=db+8V1Iqs513Yp6NdGXK7RLaTMxl88PiKKafIB5sdDLpGTvhMj6icDsfwW7n1W1B/h
 5suf8gYWBt1WUm2w0PHsVJ/F/kw+fJEm1fMWg4rAdV+Ap6lwqXjwzkafa1hRJxmJ0ZWW
 JPNvNboUWbaZmYKxYrHKHsRCtnbPAQInM3TSHBO9dd6Lgm1q9hlvWbZcRJZ6i+jOoszx
 aalB2im4T6MKb96IVWxmaKkEbPDQncnwBhF0JtaGUCMby3EjlSD67U9tSVH/RplXcpYS
 JWDgllOYq6Q/eBa1vmhXiVXA3ua+fdlVWfGYBoj1Yp9yGyIPnbn/EqHSql5x4mGjT5yh
 ZoBg==
X-Gm-Message-State: AOAM530tSESXGveZbeCtPw/SVGqcVJ8GuPXwJBLCJquuFF79J8UyVuvo
 mVWpLx/iHlm3VADs9lUipvUsoDIpY59TA28IfoY=
X-Google-Smtp-Source: ABdhPJy0eVnNyTzrW2/omSLVxGe8kfaMI2pqw3I/+FsC+Cu9/M01gEwxja6I4ke0ixSRPXiGHWR5yNXw9vPFyMYbXzQ=
X-Received: by 2002:aca:895:: with SMTP id 143mr9591469oii.153.1589785503554; 
 Mon, 18 May 2020 00:05:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200420170204.24541-1-mani@kernel.org>
 <20200420170204.24541-2-mani@kernel.org>
In-Reply-To: <20200420170204.24541-2-mani@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 May 2020 09:04:52 +0200
Message-ID: <CAMuHMdVGem_2BGQK4dqZQb3sOd0LZk+RS_z4SvSRcNECEJHdwA@mail.gmail.com>
To: mani@kernel.org
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v3 1/2] dt-bindings: serial: Document
 CTS/RTS gpios in STM32 UART
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

Hi Mani,

On Mon, Apr 20, 2020 at 7:02 PM <mani@kernel.org> wrote:
> From: Manivannan Sadhasivam <mani@kernel.org>
>
> Document the use of CTS/RTS gpios for flow control in STM32 UART
> controller. These properties can be used instead of 'st,hw-flow-ctrl'
> for making use of any gpio pins for flow control instead of dedicated
> pins. It should be noted that both CTS/RTS and 'st,hw-flow-ctrl'
> properties cannot co-exist in a design.
>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>

> --- a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml

> @@ -55,6 +61,14 @@ properties:
>    linux,rs485-enabled-at-boot-time: true
>    rs485-rx-during-tx: true
>
> +if:
> +  required:
> +    - st,hw-flow-ctrl

Perhaps "st,hw-flow-ctrl" should be deprecated, in favor of the standard
"uart-has-rtscts" property?
Of course the driver needs to gain support for the latter first.

> +then:
> +  properties:
> +    cts-gpios: false
> +    rts-gpios: false
> +
>  required:
>    - compatible
>    - reg

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
