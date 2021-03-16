Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA14733DA08
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Mar 2021 18:01:59 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95B5AC57B7B;
	Tue, 16 Mar 2021 17:01:59 +0000 (UTC)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 850F4C57B77
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Mar 2021 13:56:04 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id z13so37205085iox.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Mar 2021 06:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+46g674RBma+ciBzuJpVGTzQLL8+JCKCJVBU3dFl0nU=;
 b=JA7icuejqFeeyZ/IOIMpnOI+hFshDRZOSH4fBbyaemq7qfkwoNIv/qx4mVwll7lXU3
 tjN9Us2sp5TSrTsKVgS4PtP6LZpRnbepFzLciXfKlq4zdF6HqV7ebKC15/nJrYYQ7fY7
 +U4Y8Yy4HiKWLqILRjUmFhESbgzDPKdh/zXyP39x8JaRZwJUXGu9bMxzmpmZr3r5rPdF
 t1WbrEO1e/iGMbayLrT+uU2iURngEG0cGSIha1fgr4K5r/bzN/fWLChJDtpHwgUHWn6W
 rt61kcK1rhZiqwa76VL/1121io2iwwWQ7V2C+59VFPRTEUa7r4hC+Rgf86Cj5WtSZzTe
 A7Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+46g674RBma+ciBzuJpVGTzQLL8+JCKCJVBU3dFl0nU=;
 b=kdUvfRd1VxdJQ9jXIXKqgca5PBsNotQ8fWy9RWZfGY4/HBmvimxWZPMCAEkMLfEZbr
 biK8tD8bI6TdGq+pI07mLoDk8xiJeSyUyCr4T6+DoJoOLh1jtaKZSXfbWPUZRS2JRGKR
 Ls6gZysymIgUpXlKpHTz85+//n5JyW5+Ynfa6x5wVxoFZ3S95rBH3dAymTWM05dz7o9m
 bnGZnVZFzsn9JDkotYgkx7hSL9KZSbLH8/xsBUi+IXG+hSzkSWrff9Bb/Ds0ScEig/3P
 xL7oSR+uggfwJdd/hBjAyDIRX96NntxSc3zbI3BokbQWBmMTzS3EQLhMC+6jsN9n7/ZG
 MKWA==
X-Gm-Message-State: AOAM533GttjSQ1R0aFyJw2LnES+Fnt0JZjAa6m+IL0/kEANkVILaQitF
 S1vTYmW4ledxOKtg3pQkWxebhWRGLyIzpoWsoV8=
X-Google-Smtp-Source: ABdhPJxsQTVIidXXPM7aMIJVsw3A2CX7qX6qFM4TJR8DsZi2gn8eJ682nAaU6vckx6geePwgdiehZqOFuqwusFqi4nE=
X-Received: by 2002:a05:6602:1689:: with SMTP id
 s9mr3265333iow.171.1615902963396; 
 Tue, 16 Mar 2021 06:56:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210316074239.2010897-1-weiyongjun1@huawei.com>
 <CAOc6etYcE-0wbcWxgTH49h1Odepg=Esc_gmfDoUioHOsnNj33Q@mail.gmail.com>
In-Reply-To: <CAOc6etYcE-0wbcWxgTH49h1Odepg=Esc_gmfDoUioHOsnNj33Q@mail.gmail.com>
From: Edmundo Carmona Antoranz <eantoranz@gmail.com>
Date: Tue, 16 Mar 2021 07:55:51 -0600
Message-ID: <CAOc6eta+QttyE_TJwLSTietCE2WiHEYgd-q8Bp-Xu1kdVDfnew@mail.gmail.com>
To: "'w00385741" <weiyongjun1@huawei.com>
X-Mailman-Approved-At: Tue, 16 Mar 2021 17:01:58 +0000
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, netdev@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Joakim Zhang <qiangqing.zhang@nxp.com>, Hulk Robot <hulkci@huawei.com>,
 Jose Abreu <joabreu@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jakub Kicinski <kuba@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: fix missing unlock
	on error in stmmac_suspend()
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

On Tue, Mar 16, 2021 at 7:50 AM Edmundo Carmona Antoranz
<eantoranz@gmail.com> wrote:

> I think you can let it go and check ret after unlocking:
>
>                 /* Disable clock in case of PWM is off */
>                clk_disable_unprepare(priv->plat->clk_ptp_ref);
>                ret = pm_runtime_force_suspend(dev);
>        }
>        mutex_unlock(&priv->lock);
>        if (ret)
>                return ret;

Oh, I C. It would require ret to be set to 0 before starting to use
it, right? Maybe it's worth it?

>
>        priv->speed = SPEED_UNKNOWN;
>        return 0;
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
