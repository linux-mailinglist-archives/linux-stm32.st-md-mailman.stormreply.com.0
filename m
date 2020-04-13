Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DE31A648A
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Apr 2020 11:17:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97F8CC36B0B;
	Mon, 13 Apr 2020 09:17:36 +0000 (UTC)
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63964C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Apr 2020 09:17:35 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id v2so3191308plp.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Apr 2020 02:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+Es/1kSX+2DTfIEl11xOgF+dKXSLyBYadIDMkf6JWRY=;
 b=uD88jc+H5svxYWnFnmOVmZGhizFVGLAqr3CGeRWDO71LcsasJpC+gS6bTbGRjKJPM3
 oZ9POJtkVxjLCFTbcL+p8nnQySxbLL31W4FoXcAJX3ZzjWVGDARV0SImqIOX2W/pEOon
 VNWH55nNVoBjMsIDFb8wwRfiKr0nqmZqI1/dBsNbIj2R9CC6u/yGTisg10eG5ytX8cMI
 EvG8HXr+df/G5G78N96KOfukqqYSuC0n4PXJR38NSI3N1XwImkZhSlFym87QkkP6mlcN
 uuEiLWJ+0805c7VirFoRpj+kz8ZQJXGK5w90D5bDCpywG0dKP5HsHGALfFUSO/gVPw4l
 oR6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+Es/1kSX+2DTfIEl11xOgF+dKXSLyBYadIDMkf6JWRY=;
 b=A+p6eObxnYugZtm8YU185KXSxMHIfsoTmnQB/bZliY56/YwF94FTBP6Rrj1Eo7HINw
 +wjiykZZOtUQMxHn0onQunZscoeERURQlYBqptz6+B9xliByENGHZgTYt6veuPuzYvr7
 fhjFTIj1/AGChq63Hx4S+rfCHtKgils7YNRqXHga/t8LhUpwWdIj4oJh8T0qOe2ifBoH
 ZJex9Fp+VwTZz+GNkoXy6ACgHpOe/kS+3VZ0pcfu0Cmp3pYKuvq35Yy9wT+xNCuUxqXX
 JYGbfcAcWJsdfRSF1ryk+btENOe6MEZYfXnUfiLAebFmZEMs7nSFXnkVilAjls/pMTQ4
 A08A==
X-Gm-Message-State: AGi0PubjEo0X3O/ircw/By8nR2yKk/oZ47/RYL2Yp7EcmdseWwzPm6fB
 vw8vsFFLIZUO7EjEBynA0OLgblX48OYCobUUdno=
X-Google-Smtp-Source: APiQypKrhwIBdb9K5xK6+BTvgkhgXaWgjvsbqf2WCnQLazfGOFLVhIlgZpBJQNARmhWX7ScRLGvI/AGMLB5ktOM49e0=
X-Received: by 2002:a17:902:9306:: with SMTP id
 bc6mr16330033plb.255.1586769453549; 
 Mon, 13 Apr 2020 02:17:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200412180923.30774-1-mani@kernel.org>
In-Reply-To: <20200412180923.30774-1-mani@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 13 Apr 2020 12:17:21 +0300
Message-ID: <CAHp75VfDUoFMWg42OFHZtKQ972eoR3UDLVAs+BQjJm3h3-fOGw@mail.gmail.com>
To: mani@kernel.org
Cc: devicetree <devicetree@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 0/2] Add software flow control support for
	STM32 UART
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

On Mon, Apr 13, 2020 at 7:06 AM <mani@kernel.org> wrote:
>
> From: Manivannan Sadhasivam <mani@kernel.org>
>
> Hello,
>
> This patchset adds software flow control support for STM32 UART controller.
> This is necessary for the upcoming STM32MP1 based board called Stinger96
> IoT-Box. On that board, a bluetooth chip is connected to one of the UART
> controller but the CTS/RTS lines got swapped mistakenly. So in order to
> workaround that hardware bug and also to support the usecase of using only
> Tx/Rx pins, this patchset adds software flow control support.
>
> This patchset has been validated w/ Stinger96 IoT-Box connected to Murata
> WiFi-BT combo chip.
>

I think it's a mix of terminology or so. Looking into the patches I
found that it's required to have GPIOs for SW flow control.
No, SW flow control does not require any additional signals, except RxD/TxD.

On top of that, it seems you adding mctrl-gpio functionality. Why
can't you use that one? And thus no bindings needs to be updated.

> Thanks,
> Mani
>
> Manivannan Sadhasivam (2):
>   dt-bindings: serial: Add binding for software flow control in STM32
>     UART
>   tty: serial: Add software flow control support for STM32 USART
>
>  .../bindings/serial/st,stm32-uart.yaml        |  15 +-
>  drivers/tty/serial/stm32-usart.c              | 143 +++++++++++++++++-
>  drivers/tty/serial/stm32-usart.h              |   4 +
>  3 files changed, 155 insertions(+), 7 deletions(-)
>
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
