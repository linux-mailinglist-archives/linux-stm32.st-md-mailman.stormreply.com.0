Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E54AB54C16B
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jun 2022 08:01:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95BE4C5E2C6;
	Wed, 15 Jun 2022 06:01:19 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF0F4C03FDF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jun 2022 05:41:03 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id p8so9858538oip.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jun 2022 22:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=D2EWwlUlr5NDApMuW0QW5eqZ1KcFUZhOJoWNpNGn5UQ=;
 b=inABKqLUisCRzrq/R/nmX9NqfNIphA3UYq3YfV+uAxg5j4Fvh4RG9wil4TyMXR3qAH
 o5hBr510hyAF2EljwlDhWP0QBeSsGNBFi2bVTv8h+NEUP0mHZ/XIYKw6j11s5tYRy7q3
 dCWdsJCmOEdFW4gToXCcYH/WjBAUHkP3yqyX6kmlg+2rCugL1KymATuqnDDvcnmYQGnL
 m4TEefvFPvlmDuhX+lccSqH6SEEaf7/4Miy0oB7piiw18nmRqGuoAGiHPzGksZpUZm/0
 +532eHUV0ZZ3eLCBSdd+9KcCBYmEykzJl19X9Ip5A1aCDMvebvaJxvI3nIJH7HULUUA4
 gp1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=D2EWwlUlr5NDApMuW0QW5eqZ1KcFUZhOJoWNpNGn5UQ=;
 b=qKerOGyDRjNDLR1dedfabDPES3pTquWvlWUbLkLHYMrJE6y3AB2QGxYtRjcIv3TJR5
 8oh0Wc7sMpZvngXFr+pA5n76HQKLM2zzYzIdL5jBvNS2/vlUzLF1LDr4DMqulrEWD3is
 WNp8aXEBJgq/vNTLuPY35+BixobhOhApXNBXXLIj9k2k31OVoqKt/SrWNUUWu9a9UxJG
 xPAy+bfm4zj8FqSTCKJXcuVH7AARUUeBIgQJOq/m3QpRuPAC2D5zBlj+dEzq1ehJHHaL
 kW+BEMfJrCtsJRpgeAJwTx+NK2q9tjugNcYvVx805r2Q9UpgUfsU4lWFgEUPf/tBJByo
 jpDA==
X-Gm-Message-State: AOAM533aVLOHFBuO9ETcaDhbyI2Wa9pshQb8u8m6dR8aI4osooQo9F4L
 +3+50+nrjtUKkut2ZapRJxPbAemwpfJJHK8zHFQ/zaqzqX8=
X-Google-Smtp-Source: ABdhPJw8RtVVJfw9YkiVAkBY4Rvi6bgpr7DXPgB3cE9NN59VHQCcKoC8hxTPWHBroI27FUPjbqBkckYWrjCbOrnjNEI=
X-Received: by 2002:a05:6808:2012:b0:32f:31d2:499a with SMTP id
 q18-20020a056808201200b0032f31d2499amr3869483oiw.15.1655271662733; Tue, 14
 Jun 2022 22:41:02 -0700 (PDT)
MIME-Version: 1.0
From: Kegl Rohit <keglrohit@gmail.com>
Date: Wed, 15 Jun 2022 07:41:59 +0200
Message-ID: <CAMeyCbhVim1AxYGD76yezzkfx6+cXrdpGOOfgPYhB4p7yPtdWQ@mail.gmail.com>
To: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Approved-At: Wed, 15 Jun 2022 06:01:18 +0000
Subject: [Linux-stm32] STM32MP151A sysfs
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

Hello!

I could notice following issue with kernel version 5.10.61:
Exporting GPIO PB12 and PD12 via sysfs triggers a kernel ERROR.
After the error happend the gpio still got exported and seem to function.

Both Pins are unclaimed:
grep -e PB12 -e PD12
/sys/kernel/debug/pinctrl/soc\:pin-controller@50002000/pinmux-pins
pin 28 (PB12): UNCLAIMED
pin 60 (PD12): UNCLAIMED

root@dev:/sys/class/gpio# echo 60 > export
root@dev:/sys/class/gpio# echo 28 > export
[   30.467370] stm32mp157-pinctrl soc:pin-controller@50002000: irq
line 12 already requested.

The order does not matter:
root@dev:/sys/class/gpio# echo 60 > export
root@dev:/sys/class/gpio# echo 28 > export
[   20.768493] stm32mp157-pinctrl soc:pin-controller@50002000: irq
line 12 already requested.

This is the dev_err code part:
https://github.com/STMicroelectronics/linux/commit/8eb2dfee9fb1277f635ce369ef8669df0ec421bc#diff-549d83503a258940ffa6617dbbf4859d463fcac94f376b45b1744d243ffe9b16R381

Seems that gpio sysfs requests an IRQ every time and there is some
shared IRQ limitation which is not implemented / handled yet.

Can someone reproduce this? Maybe it is only a usage / kernel /
devicetree setup error by me...
Or is this a STM32MP1 limitation? gpio sysfs bug with STM32MP1? ...


Thanks in advance.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
