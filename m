Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2010A1AD1E1
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Apr 2020 23:30:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BDB3BC36B0C;
	Thu, 16 Apr 2020 21:30:44 +0000 (UTC)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A1FBC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Apr 2020 21:30:42 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id g30so1488pfr.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Apr 2020 14:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F59MCAy9LQ39t9b94uz/vF55cBc/ty5ftnkMrjUeMVI=;
 b=F+76JoX2R7sUagBs5MiZtTABq0cgtV+vyQR+Pq0aOKntIcRM+e75S9VZPbYgX+4O35
 r2iDAKA9feHsDg2oq2V8HbPB7rb1IbMWWnV91YEmvAeuS/wb00lNv8S/b59cVyCbNmoI
 v0qg2uie9OZvu/aEKifWzzNGkDiYsvXl/ebCuzDMJyooHo9v9plc0T5enusQhD1HRJhQ
 NCib4b4yxg03NdKVXBqT7s7sudY8OZINEnlICKS38rHSiBGGhrFq0m2JNNfJ7smKua9c
 uMwPAEVQOM/3xroHC415fZ323fbfwaGmYwSIWFfIdLZdinMSTPCmG5svP9sswxgVc2Wx
 QHkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F59MCAy9LQ39t9b94uz/vF55cBc/ty5ftnkMrjUeMVI=;
 b=EjTOB6JzQozwtJzZPif/jXOH/H8b2yEOxD7alE408WVNcP9Ko8oL/o2ElBpwAfRm2e
 Z53vP0wvYoZpSYXK+NuK64wmsf87loTyIy8KfV7j1ccZVaiAdw5lKGhW8yl6oy1vmsS7
 lsqYrFwhDm6fU3tbkSoV9Xekp+0LcQbswNE5nbjj5124wUP50wF1+jPb4i6K9wc6AEYz
 RUelWswBJ2gLUYqKIgQokuJBkg2ZeUl7OOzOn6vh6gND7BgD1L8E6mF4ef6+eBSQmhCq
 LFnQe0eeZKnH9DRZtYKHhjykc346pSuX9ZP8IDC0MFy4sAx0lqlupLgJWWVtJQApXunG
 n35g==
X-Gm-Message-State: AGi0PuZWxhHdJ6qhN0QRUfWRvkDVANgx6M5wsaXy8nCB50o2rNPMppKl
 wCY5Cdf1mwXTeJ4AnQWm9f/uXAubs1rIRPe2zWY=
X-Google-Smtp-Source: APiQypKbsEwv7dyMRMPJoBQNj/KvDFB5w7W5P0FHGG1weQUmw4bO5gMc9e2umvdhLDeoCPYVHjIesY8EPzX4ASZJHQA=
X-Received: by 2002:a63:5511:: with SMTP id j17mr17300739pgb.4.1587072641114; 
 Thu, 16 Apr 2020 14:30:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200416175729.5550-1-mani@kernel.org>
In-Reply-To: <20200416175729.5550-1-mani@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 17 Apr 2020 00:30:28 +0300
Message-ID: <CAHp75Ve6V+gm_KXqMpG8bn7KtHjOctomZwk8n_6xwtx6cFdKfw@mail.gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: devicetree <devicetree@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Fabrice GASNIER <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2 0/2] Add CTS/RTS gpio support to STM32
	UART
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

On Thu, Apr 16, 2020 at 8:58 PM <mani@kernel.org> wrote:
>
> From: Manivannan Sadhasivam <mani@kernel.org>
>
> Hello,
>
> This patchset adds CTS/RTS gpio support to STM32 UART controller.
> Eventhough the UART controller supports using dedicated CTS/RTS gpios,
> sometimes we need to use different set of gpios for flow control.
>
> This is necessary for the upcoming STM32MP1 based board called Stinger96
> IoT-Box. On that board, a bluetooth chip is connected to one of the UART
> controller but the CTS/RTS lines got swapped mistakenly. So this patchset
> serves as a workaround for that hardware bug and also supports the
> usecase of using any gpio for CTS/RTS functionality. As per the sugggestion
> provided by Andy for v1, I've now switched to mctrl_gpio driver.
>
> This patchset has been validated with Stinger96 IoT-Box connected to Murata
> WiFi-BT combo chip.
>

Looks good to me,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Thanks,
> Mani
>
> Changes in v2:
>
> As per the review by Andy:
>
> * Switched to mctrl_gpio driver instead of using custom CTS/RTS
>   implementation
> * Removed the use of software flow control terminology.
>
> Manivannan Sadhasivam (2):
>   tty: serial: Add modem control gpio support for STM32 UART
>   dt-bindings: serial: Document CTS/RTS gpios in STM32 UART
>
>  .../bindings/serial/st,stm32-uart.yaml        | 14 ++++++
>  drivers/tty/serial/Kconfig                    |  1 +
>  drivers/tty/serial/stm32-usart.c              | 43 ++++++++++++++++++-
>  drivers/tty/serial/stm32-usart.h              |  1 +
>  4 files changed, 58 insertions(+), 1 deletion(-)
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
