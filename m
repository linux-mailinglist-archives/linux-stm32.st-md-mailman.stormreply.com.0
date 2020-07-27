Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 898B422F71A
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Jul 2020 19:55:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A0E0C36B27;
	Mon, 27 Jul 2020 17:55:57 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C72FC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jul 2020 17:55:56 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id n2so12796583edr.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jul 2020 10:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BfQsl2VkPzgMjJHaARqwNqUbw1qIxknvRprBs1qxAqw=;
 b=rvIHSw7X95GJr0+XCFfmmero5cD0/utExmJuKYz5Qs91sBvJXMlcCDzKQXK2BYAF0q
 AOyqJaZngQWr9wfISZQjGxz7+meMd/1D7iHIkUQofP/eBvXJf6CUZyBQGBZBgRfC6trk
 i9V1whbAYAhLMZ1Ng8LBUYQyNA/ltTX7xk7PRr1gOsJQE7fPjvrOOFpVSMbkdKEEGlPd
 xIdBRhbyQRReLzRwZ9apKo1+tqI81oY9UNdZe2783fIH1PaB3ImM/EoqUJ9I2Gjtb1DL
 aZ7sqkAYV32yhov8ktBIyeVgaGarSpP8xTcJTPyK+iDceCdsXg9JT/G41ThxH4puV+mT
 9jUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BfQsl2VkPzgMjJHaARqwNqUbw1qIxknvRprBs1qxAqw=;
 b=JQ9vu9IbbLPiSFtpBwc8QMr4hvi9tKYuFCoxZzTp/A77yk8qmkmZxfoBj1/HAVDmwS
 FT9FF6EnzofCtEGzvwiEHa3IpLRLrlW2+bHxzipKsUwe/mx69PJiMJNpIcZnkPqGbS22
 EJtvb8wfbLjKPyTtgGp0PS9VQFrp8FJ25OQHTKOtt8ZvEDy/hunT2c06J12ilToDSpSh
 oRAmVW6af3jpEBL+g9UvodLxY8CYqmgmq8o2T5y8Cd0LGCTrvjg3zbjceIe3Qwd2gO4O
 IPp87hd7zqeHmbBBJjM8AalWf5LoaSPV0nm+jr5EEK3xdemOetcN0VV9IhPG/pXWNpXn
 efbg==
X-Gm-Message-State: AOAM530mRzj+1kjhpDXO4ikcHis7tXAVNTEBIa3aV3YGyj6SWlsABo0Q
 uI9yV8DQLMPBl7Pk2jsxUX51vqid9lt5FdAfMuw=
X-Google-Smtp-Source: ABdhPJwOE9lGhBvTtOQCpdnEA2roxCZkipXvXyeHn714NvtvMLoTIv9wK2fKfq+w2poL81YL7Lc+OfvmhPCaxPbx1SQ=
X-Received: by 2002:aa7:c788:: with SMTP id n8mr2559169eds.146.1595872555514; 
 Mon, 27 Jul 2020 10:55:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200727092346.19780-1-amelie.delaunay@st.com>
 <20200727092346.19780-3-amelie.delaunay@st.com>
In-Reply-To: <20200727092346.19780-3-amelie.delaunay@st.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 27 Jul 2020 19:55:44 +0200
Message-ID: <CAFBinCBDtuJ19_WZe1H+_BJTJAi=jENyczybPhC1AGYwedNHcQ@mail.gmail.com>
To: Amelie Delaunay <amelie.delaunay@st.com>
Cc: Felipe Balbi <balbi@kernel.org>, devicetree@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Minas Harutyunyan <hminas@synopsys.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 2/3] usb: dwc2: override PHY input
 signals with usb role switch support
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

Hi Amelie,

On Mon, Jul 27, 2020 at 11:23 AM Amelie Delaunay <amelie.delaunay@st.com> wrote:
>
> This patch adds support for usb role switch to dwc2, by using overriding
> control of the PHY voltage valid and ID input signals.
>
> iddig signal (ID) can be overridden:
> - when setting GUSBCFG_FORCEHOSTMODE, iddig input pin is overridden with 1;
> - when setting GUSBCFG_FORCEDEVMODE, iddig input pin is overridden with 0.
>
> avalid/bvalid/vbusvalid signals can be overridden respectively with:
> - GOTGCTL_AVALOEN + GOTGCTL_AVALOVAL
> - GOTGCTL_BVALOEN + GOTGCTL_BVALOVAL
> - GOTGCTL_VBVALEN + GOTGCTL_VBVALOVAL
>
> It is possible to determine valid sessions thanks to usb role switch:
> - if USB_ROLE_NONE then !avalid && !bvalid && !vbusvalid
> - if USB_ROLE_DEVICE then !avalid && bvalid && vbusvalid
> - if USB_ROLE_HOST then avalid && !bvalid && vbusvalid
>
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
please add my:
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

The usb_role_switch part looks correct to me
I don't understand the details of the dwc2 hardware well enough to say
if the rest of this patch is fine or not (which is why I'm giving my
Acked-by instead of Reviewed-by).

Unfortunately I'm still fighting with the Amlogic bits (or my
board...) to make this work on my boards.
That why I can't give my Tested-by yet
At the same time I'm confident that the problem lies within the
Amlogic OTG detection/GPIOs so I don't see a reason to hold your patch
up due to this

Finally, please note that there may be a small conflict due to one
bugfix I sent: [0]
I think it will be trivial to solve (since we're both adding a new error label)


Thank you for your good work again!
Best regards,
Martin


[0] https://patchwork.kernel.org/patch/11687357/
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
