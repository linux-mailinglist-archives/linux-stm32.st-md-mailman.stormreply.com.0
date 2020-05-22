Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 357691DE26D
	for <lists+linux-stm32@lfdr.de>; Fri, 22 May 2020 10:54:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE930C36B25;
	Fri, 22 May 2020 08:54:12 +0000 (UTC)
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96BF1C36B23
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 May 2020 08:54:08 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id f15so4148789plr.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 May 2020 01:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KrT1SoD15NLfQ8qq9A2L0z3L7OIW2vz0cfwoycZIaSk=;
 b=qjnD8pyzQ9vLSGK+9aXm4h6rt56i4s0ANzW6Vh27qbaJB1MZkwcLIaZitcpOn1XAoT
 O5wzjfLRVQ7eurTzJi/uB64raupxzP+oBMlxnXbiuP4QdlKuhKrnMtylQPMWFigxEvlm
 LIfHwh5uL2pKKcXGUNAkVxR4dxtZDEZIyZ/6H44opVpDR8rrrlBwOJzLs8iNe7g5J0TH
 gg5A5VFwSm+7CGU15o78QgWK5okcvbRKe+6UGIg2/kMi4vEmUS82SVeB3naQ8jmRcvrC
 iIMmvVtr33HdqpOuPv0o4OOS54U1vu4PL+jfQ/ftMRFRFoN9075NHtRNKC0mhg+jIsG4
 r7og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KrT1SoD15NLfQ8qq9A2L0z3L7OIW2vz0cfwoycZIaSk=;
 b=oFmwwhx/x9rj9pDJ5xD8yxevbFJU3BnI7SYuPdqadlugElKEd68zS6XOauF24bEetK
 gwq5M+G/E6+Zxe5GguG8I8TyEQqpa62KLY28bUerSRgbJWX+ITBdd1qxqs5g/hXCU6Qm
 Dlbnbg49PhirHMLoHSjuk1wQef9P0MafSb+fy2zoh3n58LzhTLQ+ns6tgHOPX8pBDJwD
 oBblPRXn7k7CisK4NjRA35B27fnR8CubEaE96pgti6aB1nO+pMCSjvkS5eBU9ofgnNeU
 d4KR+XZ3TobIgfFjGJhPEnq7Cexx9dgHRLbeaaxTohz9f0XHn5vZIH75HWPwNchEsj61
 9EJQ==
X-Gm-Message-State: AOAM533VmhBPKtFrHNTZ2rtskab/XRix11Z6rjSsB8EPeExQyxja4idN
 ymQV1YTd6CFMNES1rUMQkXzvp08fhiKAd51RoOk=
X-Google-Smtp-Source: ABdhPJySNKcXXQ4O+svlbz8UMlrw8yXexA5v6PdsFEo3QaiPpyqed+BtGvQDsL+oQ2C+xIYCZ8vw55AsPQiGlSKaAfE=
X-Received: by 2002:a17:90b:3651:: with SMTP id
 nh17mr3325673pjb.228.1590137647307; 
 Fri, 22 May 2020 01:54:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200522082208.383631-1-alexandru.ardelean@analog.com>
 <20200522082208.383631-5-alexandru.ardelean@analog.com>
In-Reply-To: <20200522082208.383631-5-alexandru.ardelean@analog.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 22 May 2020 11:53:50 +0300
Message-ID: <CAHp75VewoA-jcRDpvNdoRyS4Tdaw_QsBDJ5_ETc6crwuuefdyg@mail.gmail.com>
To: Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc: milo.kim@ti.com, tomislav.denis@avl.com,
 Dan Robertson <dan@dlrobertson.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 linux-aspeed@lists.ozlabs.org, linux-iio <linux-iio@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Eddie James <eajames@linux.ibm.com>,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Song Qiang <songqiang1304521@gmail.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
 linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 tduszyns@gmail.com, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 agross@kernel.org, linux-input <linux-input@vger.kernel.org>,
 orsonzhai@gmail.com, Linux PM <linux-pm@vger.kernel.org>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Jiri Kosina <jikos@kernel.org>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>,
 Hans de Goede <hdegoede@redhat.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Andreas Klinger <ak@it-klinger.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-amlogic@lists.infradead.org, Fabrice GASNIER <fabrice.gasnier@st.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Scott Branden <sbranden@broadcom.com>, rmfrfs@gmail.com,
 Shawn Guo <shawnguo@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Azael Avalos <coproscefalo@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ray Jui <rjui@broadcom.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, zhang.lyra@gmail.com,
 baolin.wang7@gmail.com, Kevin Tsai <ktsai@capellamicro.com>,
 Syed Nayyar Waris <syednwaris@gmail.com>, Peter Rosin <peda@axentia.se>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 5/5] iio: remove left-over parent
	assignments
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

On Fri, May 22, 2020 at 11:37 AM Alexandru Ardelean
<alexandru.ardelean@analog.com> wrote:
>
> These were found by doing some shell magic:
> ------------
> for file in $(git grep -w devm_iio_device_alloc | cut -d: -f1 | sort | uniq) ; do
>         if grep 'parent =' $file | grep -v trig | grep -vq devm_; then
>                 echo "$file -> $(grep "parent =" $file)"
>         fi
> done
> -----------

Side note: time to learn coccinelle or shell better :-)

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
