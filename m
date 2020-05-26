Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1781E1DFE
	for <lists+linux-stm32@lfdr.de>; Tue, 26 May 2020 11:09:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB484C36B23;
	Tue, 26 May 2020 09:09:32 +0000 (UTC)
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB4A0C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 May 2020 09:09:30 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id k18so21223165ion.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 May 2020 02:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=65DH7Yx0+fRXnGfTN5n2O+g3E3WvwmCcWicmHyQ3lkw=;
 b=FCv7xAIGa3GDtpOxxLydbMoT+Iw41+0kjN35MW95QkVD8PAPGZ1TxmVabCgrmY78yz
 YECjqBhJyS3zolx/8xJBac4XU6h6cR1XZeg4CU6PHNTd2M9LqK+5kG/wEL7WsNC0nwh2
 gpV6e5BVy/uEF4hB82amE9VWBObm/w9rtxMNYLCy9RJ2jehRXjw+lDnYVC8orvZjHDMT
 rL1IDBgV7Kaq4tgq+ETv5CEvY8otenJzY1txlxblMAVo2Q6SsJnSDaWGL8pbVwNfm6XY
 8lo7KDJvjfz2uLhMVx5UTVNw3KpZA0aLli0XNP1vDH7YD/+aT6hJGg+YsCdtPHB995O1
 j2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=65DH7Yx0+fRXnGfTN5n2O+g3E3WvwmCcWicmHyQ3lkw=;
 b=dkbDuqyhZGx6mQYl9oF38JNy4ZABwZ+tQjt0qzDqxYZ2vK8UZGmyyN8AbQ59VbI2H1
 9+SMttAkFDSj1B6PTlSQNxEYz7MDynpC/tCmGCqnU2P7r89NnEQVELxh1Hz77POZkq+C
 vqwoJnlnLFJN+0Xz1KWicxYLXNSJbUQEKIon9KfGOogWLw4WDM3SeN7jU69G0FSgBet1
 16PyTiWt4yFvUSBd8jikE/6Ghg3/4Wsxh4j3VWnW35rZxq3nL1EavDjdP79wrixYe1GJ
 joNKF3hk+CN2Ssw3JV1ad4l8n92z3AicpNSW/Ot9rcBmmmyqx6flU1TQ/IInSjsNK9vS
 IBXg==
X-Gm-Message-State: AOAM532GEMj32me9+SxiriQDUsmVkZN6ddF3VsEIQSf24k0i04PA1u2l
 2jCSTgpSugdadHvtXPNg3afkAIg5gqz8d8xw4sg=
X-Google-Smtp-Source: ABdhPJx+ZPvWfEF3Pa4JXfWwedh02p2n1SzhlABrsxCC4DunBcpjHogzclvpkhogi3xaE3bp5rzPidO7NY54+A2lD6E=
X-Received: by 2002:a5e:a80e:: with SMTP id c14mr16354378ioa.3.1590484169175; 
 Tue, 26 May 2020 02:09:29 -0700 (PDT)
MIME-Version: 1.0
References: <1590378348-8115-1-git-send-email-dillon.minfei@gmail.com>
 <1590378348-8115-7-git-send-email-dillon.minfei@gmail.com>
 <CAHp75VebSZa6mwAETnM0t42RQCp4iM6_SNjmy3TB48ixsGKV8g@mail.gmail.com>
In-Reply-To: <CAHp75VebSZa6mwAETnM0t42RQCp4iM6_SNjmy3TB48ixsGKV8g@mail.gmail.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Tue, 26 May 2020 17:08:53 +0800
Message-ID: <CAL9mu0+jmcivC6zAXxK0-oXy3n44pAU1QGD7BDq=CT2D7twROQ@mail.gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: devicetree <devicetree@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-spi <linux-spi@vger.kernel.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Mark Brown <broonie@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v5 6/8] drm/panel: Add ilitek ili9341
	panel driver
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

Hi Andy,

Thanks for input.

On Tue, May 26, 2020 at 3:46 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, May 25, 2020 at 6:46 AM <dillon.minfei@gmail.com> wrote:
> >
> > From: dillon min <dillon.minfei@gmail.com>
> >
> >     This driver combine tiny/ili9341.c mipi_dbi_interface driver
> >     with mipi_dpi_interface driver, can support ili9341 with serial
> >     mode or parallel rgb interface mode by register configuration.
>
> Noralf told once that this driver should be unified with mi0283qt.c.
>
> So, what should we do here?
>
> --
> With Best Regards,
> Andy Shevchenko

from sam's suggestion, we can't setup two drivers to support one panel
in the tree. so, i copy the mipi dbi part from tiny/ili9341.c. to this driver
from register settings and dts binding is keep the same to tiny/ili9341.c.

so, in my opinion if tiny/ili9341.c is unified with mi0283qt.c, this
driver should be
too.

thanks.

best regards,

Dillon,
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
