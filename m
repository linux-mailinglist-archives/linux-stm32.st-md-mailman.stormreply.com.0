Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BB01E7B7A
	for <lists+linux-stm32@lfdr.de>; Fri, 29 May 2020 13:17:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D9DAC36B22;
	Fri, 29 May 2020 11:17:20 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DBC87C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 May 2020 10:16:13 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id o9so1919874ljj.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 May 2020 03:16:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Qb23YrFge2bev6B+pdY5MYpRbBAt1YLbxMOSUywPdHk=;
 b=RLqLI1MwbkjwUvXfMvnO7ZEE/xT/2xAwLdNRKhlV4hFOLmIp172u0OwFwMsdDjwQVX
 NlCOL4eJAb5G41ZU4RfGVoumL3Mg2o44dZHJY36UFNgoDBa7Xj3D8W7kyzfjT5ULnxFi
 +PIZuiA2uBGfGbMYPEfSxu3bSthlg2NQWLjyKJGEIWjNwO+1SAL+z6O0+ZTSSn4aWWJ3
 RZPQI0T8Z19wePfu4x7w8TtJBbE+nu+zuIM/pHun7/wswmr1y/Z/WVsd39yOY4HqTuxx
 Xv5FOCKHsKrEYyzSkeiwiaDtiB8YlJFjb1wAVZhUtQ5FvygZ7+1CVTyLmXfZOrCwmXeX
 rQpA==
X-Gm-Message-State: AOAM532pExxiZ6UTnopT4STTmV+ZeXKOcP776TNEpl/dMpD5PtS6Mmr6
 CzxwwAEV+XCiuwtRcxU0mKQ=
X-Google-Smtp-Source: ABdhPJyb49lJcndlDqUtkrSajYOpqC0lpLBM00Du0tW1RABChW4sreguvSnQJV4+HR28+sDilaHYIw==
X-Received: by 2002:a05:651c:39b:: with SMTP id
 e27mr3886282ljp.253.1590747373144; 
 Fri, 29 May 2020 03:16:13 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se.
 [85.228.174.190])
 by smtp.gmail.com with ESMTPSA id h26sm2236339lja.0.2020.05.29.03.16.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 03:16:12 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1jec3c-0004TR-D6; Fri, 29 May 2020 12:16:08 +0200
Date: Fri, 29 May 2020 12:16:08 +0200
From: Johan Hovold <johan@kernel.org>
To: Alexandru Ardelean <alexandru.ardelean@analog.com>
Message-ID: <20200529101608.GC19480@localhost>
References: <20200522082208.383631-1-alexandru.ardelean@analog.com>
 <20200522082208.383631-4-alexandru.ardelean@analog.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200522082208.383631-4-alexandru.ardelean@analog.com>
X-Mailman-Approved-At: Fri, 29 May 2020 11:17:18 +0000
Cc: milo.kim@ti.com, tomislav.denis@avl.com, dan@dlrobertson.com,
 heiko@sntech.de, linux-aspeed@lists.ozlabs.org, linux-iio@vger.kernel.org,
 linus.walleij@linaro.org, eajames@linux.ibm.com,
 platform-driver-x86@vger.kernel.org, paul@crapouillou.net,
 lorenzo.bianconi83@gmail.com, songqiang1304521@gmail.com,
 srinivas.pandruvada@linux.intel.com, linux-stm32@st-md-mailman.stormreply.com,
 devel@driverdev.osuosl.org, linux-samsung-soc@vger.kernel.org,
 khilman@baylibre.com, tduszyns@gmail.com, krzk@kernel.org,
 linux-rockchip@lists.infradead.org, wens@csie.org, kgene@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, agross@kernel.org,
 linux-input@vger.kernel.org, orsonzhai@gmail.com, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, s.hauer@pengutronix.de, jikos@kernel.org,
 vilhelm.gray@gmail.com, mripard@kernel.org, vz@mleia.com, hdegoede@redhat.com,
 linux-mediatek@lists.infradead.org, ak@it-klinger.de, matthias.bgg@gmail.com,
 linux-amlogic@lists.infradead.org, fabrice.gasnier@st.com,
 linux-arm-kernel@lists.infradead.org, sbranden@broadcom.com, rmfrfs@gmail.com,
 shawnguo@kernel.org, dmitry.torokhov@gmail.com, coproscefalo@gmail.com,
 linux-kernel@vger.kernel.org, rjui@broadcom.com, slemieux.tyco@gmail.com,
 bjorn.andersson@linaro.org, mcoquelin.stm32@gmail.com, zhang.lyra@gmail.com,
 baolin.wang7@gmail.com, ktsai@capellamicro.com, syednwaris@gmail.com,
 peda@axentia.se, jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH 4/5] iio: light: lm3533-als: remove
 explicit parent assignment
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

On Fri, May 22, 2020 at 11:22:07AM +0300, Alexandru Ardelean wrote:
> This assignment is the more peculiar of the bunch as it assigns the parent
> of the platform-device's device (i.e. pdev->dev.parent) as the IIO device's
> parent.
>
> It's unclear whether this is intentional or not.
> Hence it is in it's own patch.

Yeah, we have a few mfd drivers whose child drivers registers their
class devices directly under the parent mfd device rather than the
corresponding child platform device.

Since it's done consistently I think you need to update them all if you
really want to change this. 

And it may not be worth it since at least in theory someone could now be
relying on this topology.

> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
> ---
>  drivers/iio/light/lm3533-als.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/iio/light/lm3533-als.c b/drivers/iio/light/lm3533-als.c
> index bc196c212881..0f380ec8d30c 100644
> --- a/drivers/iio/light/lm3533-als.c
> +++ b/drivers/iio/light/lm3533-als.c
> @@ -852,7 +852,6 @@ static int lm3533_als_probe(struct platform_device *pdev)
>  	indio_dev->channels = lm3533_als_channels;
>  	indio_dev->num_channels = ARRAY_SIZE(lm3533_als_channels);
>  	indio_dev->name = dev_name(&pdev->dev);
> -	indio_dev->dev.parent = pdev->dev.parent;
>  	indio_dev->modes = INDIO_DIRECT_MODE;
>  
>  	als = iio_priv(indio_dev);

Johan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
