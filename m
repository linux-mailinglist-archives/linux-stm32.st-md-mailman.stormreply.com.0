Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F28B9168E65
	for <lists+linux-stm32@lfdr.de>; Sat, 22 Feb 2020 12:22:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A29BFC36B0B;
	Sat, 22 Feb 2020 11:22:44 +0000 (UTC)
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5EE48C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 22 Feb 2020 11:22:42 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id z5so3381474lfd.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 22 Feb 2020 03:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ROzac2uLC7kqowxE+PDOREiBLkFFQM2vDr6O0hYhD9w=;
 b=KIwfoweWr/ifwgofjrdkqltpUNUZq2GNDeSDGFKuhqsdvHJNxmdIxPEpmCMmgi/7Mq
 aMNKFsPFkoFR5pSysGd/DtosSaTDyNSQwX32AvZz47DqFgj2J3Pu3PTt8ehOQWDMIj7z
 YguRXfiiCPKKDVLkQPE15O6mibJ3joOzalY+zwbwEyW6QBrNqbP/UPX6dQxgQjcGg9uG
 uG+DSdYsOSKa7fmNjuDqUqftgkjNvFclBcaIgv0HckE0dX8kDuJJAjZOOQr/yerUveRt
 MTaTskaDiRciaXesfQanOGD6eGT2vwIw/nsWgXKLpCAH17zZvIGn9QThhQIVOqQ8ybcL
 YZdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ROzac2uLC7kqowxE+PDOREiBLkFFQM2vDr6O0hYhD9w=;
 b=ZPtinB7aXwuhW8HIhescpEYOLd46sJQiR19eAYzUeYAXeTYy8KDr/OYQr1giWfSY5X
 FFrGtTUCfhocro1D11nXLGz1YBpacau0RHE9GSkf6KQkTX2eQ0yhyw7KueJ3CZ8bLx+l
 BfIo+yteQZxa/l2tkuJE8h2ncyMI/8GbKdiXjOL3EmL+JDxWiDyHaF6Lq50TXLfdt2jK
 v92tT1LAbdHt/fcRJJL9JsESwNZ5DNtaUihYTq/5e5w+8o2qss81Oq5ruH7Pby01N5vL
 hRkes/dFlskUPrQGY7cl17nAHKVI/HULIJaA+YXZa6sgbs9H8KImM7IGESdCyGYl6MOg
 3JvA==
X-Gm-Message-State: APjAAAUuqbrW1solL16Hj1TknzAGmokIJBv/mO7zJ6zAh9eh8x8pMBSO
 wMrL7IFN3FUWDqKNlP/Q7abmrmrj/78iZ5YvOFP9Xw==
X-Google-Smtp-Source: APXvYqyTywaJiSpbnWFC1W2YkgVQEnrOsf/OK0dEWuaZYFukmvPYTaNDVbNpAJK2yXNZtbzIrXL2ZU197DHrl6cNTek=
X-Received: by 2002:a19:dc14:: with SMTP id t20mr22063257lfg.47.1582370561607; 
 Sat, 22 Feb 2020 03:22:41 -0800 (PST)
MIME-Version: 1.0
References: <20200203140425.26579-1-erwan.leray@st.com>
 <609b5744-cc1e-8ada-fe14-6cc199c0a91d@st.com>
In-Reply-To: <609b5744-cc1e-8ada-fe14-6cc199c0a91d@st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 22 Feb 2020 12:22:30 +0100
Message-ID: <CACRpkdbZDaX71gLvmLTB5XxeE+6R9pGzhUiFEWjhFQUjS2yP8Q@mail.gmail.com>
To: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Russell King <linux@armlinux.org.uk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Clement Peron <peron.clem@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Gerald Baeza <gerald.baeza@st.com>, Olof Johansson <olof@lixom.net>,
 Nathan Huckleberry <nhuck15@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v3 0/4] STM32 early console
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

On Fri, Feb 21, 2020 at 4:58 PM Alexandre Torgue
<alexandre.torgue@st.com> wrote:

> > Erwan Le Ray (4):
> >    ARM: debug: stm32: add UART early console configuration for STM32F4
> >    ARM: debug: stm32: add UART early console configuration for STM32F7
> >    ARM: debug: stm32: add UART early console support for STM32H7
> >    ARM: debug: stm32: add UART early console support for STM32MP1
(...)
> Do I have to take this series in my next PR ? or you'll ?

Sign it off and send a PR to ARM SoC.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
