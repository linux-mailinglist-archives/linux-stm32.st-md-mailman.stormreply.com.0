Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AF37C333
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Jul 2019 15:20:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BCA99C35E01;
	Wed, 31 Jul 2019 13:20:43 +0000 (UTC)
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8AE40C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Jul 2019 13:20:41 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id k20so136129748ios.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Jul 2019 06:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uiJuwZiymlEb9kJ2URB/qON8yQUNY8MIwM0Qk6MZ00E=;
 b=SS1frxnBsvEYqQ9PkeQtYGNQgRQYmycAW3dEtWmFlhjk2/ZiVnf0aKFPyZv6VXdQ9g
 JFv6UbF9X/+/lUq3RWA+SC81hijNvXH1RQPeve+613wWX5RP//rfOWNDskOL9rqHG87F
 65OdOfqOJTx/sYfcmAolfdThTEno9o6F9KensMlglqchm+1hUdX93sFV+J5FGxNdKOXm
 Jwfgc4W85+EknuqcW0wbypg5fr/X3k0oHFkN56T3PAiqXAlWNvUmcIPIXzi9x3lOBT8r
 hOr8uCEsz9W7WgDlYJwcTKfuNPEbsTAbmwyY9Hi2YUG/JdYDRH5Ca1AlA+EoyJrE8aD0
 k5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uiJuwZiymlEb9kJ2URB/qON8yQUNY8MIwM0Qk6MZ00E=;
 b=m416qg6vKTpOrls/HCjRzGdKt/Oa5ZLGdTT1YOUqSt2YsSuhkTAHLw1EqPT0AM+tox
 93kvdUmoW5zMotzDC3aM4MRWwPHr444GPyie9pFMZxaeg7jizwFNBY44ejIJdzeWYA+O
 8f9XNQDmGvHxTf2xd2dDLMe8mw+5HOAeFJHaMXLO8rodGDC/5GlLlKc8VzrMC/g9LQO1
 Xs+H6ZjIcHvEXGI3loFJPZ6il6uysSvwU9S4wY+TICrf+pNULJdygyQR1cvzxiTQjCT4
 502Ba2MYjwVHrfHOioNHtDvOo7WHSNA2ZUZ8DkL6DpSL2lh3HGw437IvlWvNVOyEjqX5
 C0lg==
X-Gm-Message-State: APjAAAXOEs4optsIYBjVSto0meBv2GCsUGtwtxE9W5o3OdghJcvSKwtd
 +xdYTusAgfwBwT04tD4XQxRS/5U+gBN1RCbEq1k=
X-Google-Smtp-Source: APXvYqy110YP4z9YGjyJCXUWIQe2bV7DMu+WU5DQ0hrRwBoddF/3YS3yVQYKaputJMUd9/exV5xavgrEbbw2HT/b5jM=
X-Received: by 2002:a5d:94d0:: with SMTP id y16mr73259624ior.123.1564579240224; 
 Wed, 31 Jul 2019 06:20:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190729135505.15394-1-patrice.chotard@st.com>
 <CAOesGMg-3xt2qjjZ569pUE+d6tn7nz264AN9ARkBT_Ej4TFC2A@mail.gmail.com>
 <de6ab910-380e-6271-88d8-6fe670525e60@st.com>
In-Reply-To: <de6ab910-380e-6271-88d8-6fe670525e60@st.com>
From: Olof Johansson <olof@lixom.net>
Date: Wed, 31 Jul 2019 15:20:27 +0200
Message-ID: <CAOesGMgi2cLUZGZnzKY+4i2tZSFyLe2TEK5SPY5yu0qSh_BRxg@mail.gmail.com>
To: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] ARM: multi_v7_defconfig: Enable SPI_STM32_QSPI
	support
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

Hi,

On Wed, Jul 31, 2019 at 8:48 AM Alexandre Torgue
<alexandre.torgue@st.com> wrote:
>
> Hi Olof
>
> On 7/30/19 7:36 PM, Olof Johansson wrote:
> > Hi Patrice,
> >
> > If you cc soc@kernel.org on patches you want us to apply, you'll get
> > them automatically tracked by patchwork.
> >
>
> Does it means that you will take it directly in arm-soc tree ?
> I mean, I used to take this kind of patch (multi-v7_defconfig patch
> linked to STM32 driver) in my stm32 branch and to send PR for them.

You can do that too -- it was unclear to me whether you posted the
patch with us in the To: line because you wanted it applied or not.


-Olof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
