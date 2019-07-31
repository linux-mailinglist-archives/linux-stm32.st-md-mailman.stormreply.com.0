Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E277C33A
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Jul 2019 15:21:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7B2EC35E01;
	Wed, 31 Jul 2019 13:21:49 +0000 (UTC)
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A323C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Jul 2019 13:21:48 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id z3so17299011iog.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Jul 2019 06:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qEmtqV6jxIm1Hf7XCoFWbgfozoS82kQ9/Zb5qc7DFzQ=;
 b=iLKtDYhQ1/laEfKGBtuXbMfooXiyjZ2AmkBlkslHGjFZItiG4iB2z0M9LzNcR7awVf
 9ik3RbeyAKgBKGiDRVsmk4WWMlNOzJcOSY2VbRleml4zG9+0sCTCeoWJQGKFCOQ3qytm
 d0Kil5SswxA4ZMoBjhJpnI0igtkGv1aCEns0ueRxAMmhGlFNDOZrRRIg+e71N153QivE
 3Vxp8UR8I2IM/2cinG7q6TgyuG6e3qwhmvoBhAL5BYgkj6fwkHOFEdqitUzOqfPq2xaV
 4VCZiI1aosV9SKIiWWLwn3A05GqHn3MByxVWAIJqRor+QNYZylU8JC191piLfQFLLEtH
 fp3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qEmtqV6jxIm1Hf7XCoFWbgfozoS82kQ9/Zb5qc7DFzQ=;
 b=mlHcBxbtMchvrbamtSthu1kK7xo5YqLwhowlpDr5JiJ+W5Ss887C++M5AacoZjViu+
 5tZdkwBxqaYsLNhnO/SMxVorJZ/u2C6N8/lHrSG4IVMeSs7duhau1nky5U4tWNrZ0/Jn
 JkQsurcu7S//nyaBHVOlHx74z6IJHkI6ACGGoJwXYKdeIwHBP/5J2+g5LvteDuOfutSR
 q+F3znl3FuFpAXi/ybZZKaCjebQd0m/aIZMvw6iJL3j333bWY5Dvg/GTjKf+M/3yT1H9
 +lecAzUpgJXTwnfq4ZyPe438M6i4Ltr0BObKj3UvXMfDyEGmxlFFAuKTVO6iQjTPUCWg
 qmTw==
X-Gm-Message-State: APjAAAWzVOaelpnBUOFujnvEeK3vz/5saDEd4bxaOvj8JW2lTtP3jki+
 Tdb14Ze3BWXg4iwg6lh1qKsbsrtjrEk46mdQpcw=
X-Google-Smtp-Source: APXvYqzPVMAFcVhfX7nef6PXLS/pYiwVYlTrHmhyyV8Mlbt2TQ+kXJroNOKFGdZUkM4UDziKIKKtIjxDZXRuH16p/bU=
X-Received: by 2002:a02:16c5:: with SMTP id
 a188mr128658135jaa.86.1564579306847; 
 Wed, 31 Jul 2019 06:21:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190729135505.15394-1-patrice.chotard@st.com>
 <CAOesGMg-3xt2qjjZ569pUE+d6tn7nz264AN9ARkBT_Ej4TFC2A@mail.gmail.com>
 <de6ab910-380e-6271-88d8-6fe670525e60@st.com>
 <CAOesGMgi2cLUZGZnzKY+4i2tZSFyLe2TEK5SPY5yu0qSh_BRxg@mail.gmail.com>
In-Reply-To: <CAOesGMgi2cLUZGZnzKY+4i2tZSFyLe2TEK5SPY5yu0qSh_BRxg@mail.gmail.com>
From: Olof Johansson <olof@lixom.net>
Date: Wed, 31 Jul 2019 15:21:35 +0200
Message-ID: <CAOesGMirq=42Cj4kT=dLSqUiG-yee5zuqFhg5t=ud5KPmQJYBw@mail.gmail.com>
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

On Wed, Jul 31, 2019 at 3:20 PM Olof Johansson <olof@lixom.net> wrote:
>
> Hi,
>
> On Wed, Jul 31, 2019 at 8:48 AM Alexandre Torgue
> <alexandre.torgue@st.com> wrote:
> >
> > Hi Olof
> >
> > On 7/30/19 7:36 PM, Olof Johansson wrote:
> > > Hi Patrice,
> > >
> > > If you cc soc@kernel.org on patches you want us to apply, you'll get
> > > them automatically tracked by patchwork.
> > >
> >
> > Does it means that you will take it directly in arm-soc tree ?
> > I mean, I used to take this kind of patch (multi-v7_defconfig patch
> > linked to STM32 driver) in my stm32 branch and to send PR for them.
>
> You can do that too -- it was unclear to me whether you posted the
> patch with us in the To: line because you wanted it applied or not.

Also, we request that platform maintainers keep the defconfig updates
in a separate branch, since we normally track them in a separate
branch on our side. So if you do it in the future, please send
separate PR.

For single patches, it's just as easy to send us the patch as a pull request.


Thanks,

-Olof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
