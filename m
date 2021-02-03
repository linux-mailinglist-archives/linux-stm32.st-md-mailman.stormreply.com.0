Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1DA30D1D2
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Feb 2021 03:57:52 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73F70C57186;
	Wed,  3 Feb 2021 02:57:52 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D084C0692F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Feb 2021 02:57:49 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id e19so15698357pfh.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 02 Feb 2021 18:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=Mj181Ap2D9DsZYkVX1SWxRRocq6IiJOQXL4LIKSE2qI=;
 b=rETZciL1SObWCgT8Ed/M0tNvxsDYXKO4c18UMLpvyMUQDP1rSu4J8VjV5ryEND1HPx
 vDrWFqrONhkDU5f07DsXZ1bfXhWt06iBr+6amRveofmiVZ9HuHSSfapdk5hDwEm01a9W
 OqqBvDPsmgGiRY7KIG9cgmp+FdAtE8Mr2ed6DnVPTYT0HGsUgU2IjZgStTjJtjU7NWPe
 MxrEJOPvOL5iwJ/Pxi1iE20OnjZpR0fYiroCRucUTaoiWgzgizxkht/5C30osBEkIIBi
 kmvHyUhnYiEiBrVwOkI7c8Z/4M2HfSoNS+y9dzWdrL9O9LRf8LeE22yaGuNP5SkkyWRS
 gf+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=Mj181Ap2D9DsZYkVX1SWxRRocq6IiJOQXL4LIKSE2qI=;
 b=kkFrDTN7BEUqGPVpuyPmTXpn4sI2LXQYAXwrDTUgKkdZh3qYlXjFS8GHdVD7PQUlx2
 xqrZz8MxuRFDWMgxQ16Xhm1oBlVonGg9wkD0MD5ArRClqEoYh1lQYianGygqCtT3XM8G
 7Ubk1Pv8C2Y8fgl/NtzdvMzdq8mORD/TW09INlEAOVdZn+kWhx9lOAlECEQJzJu76ZCw
 JLlCOnfpQNyXzPSaNY+xrQTB8YJ1OF53N+d1H4EPzoDl72LUJFmsNIaf4FpIzeGM24IS
 pOmVC9HjTq2vWFSgUDzIoHKH8oUXdNUMly3e0dSr0Z5neGdjwzJyrRePtSlWtSXqarRI
 llGQ==
X-Gm-Message-State: AOAM530tjj+zod3jqx8clnL+gWSRNKICJrIGTSLslmWq6w3gU1SgbFDe
 ItQnzVM0fJE0QAAGz82K/CKEkQ==
X-Google-Smtp-Source: ABdhPJxZEQKKmg2ggzDFHqz1rxir2RepMaJA7H59H/b7qyCRgyRAV8n1fv2eYttRmcFa+R2jJeiZEg==
X-Received: by 2002:a63:fa0b:: with SMTP id y11mr1280696pgh.35.1612321068363; 
 Tue, 02 Feb 2021 18:57:48 -0800 (PST)
Received: from localhost ([122.172.59.240])
 by smtp.gmail.com with ESMTPSA id z11sm323556pfk.97.2021.02.02.18.57.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Feb 2021 18:57:47 -0800 (PST)
Date: Wed, 3 Feb 2021 08:27:43 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <20210203025743.uffbfdjsubsjbfrc@vireshk-i7>
References: <20210126165835.687514-1-u.kleine-koenig@pengutronix.de>
 <20210202135350.36nj3dmcoq3t7gcf@pengutronix.de>
 <20210202194308.jm66vblqjwr5wo6v@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210202194308.jm66vblqjwr5wo6v@pengutronix.de>
User-Agent: NeoMutt/20180716-391-311a52
Cc: linux-fbdev@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 kvm@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Eric Anholt <eric@anholt.net>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig.org@pengutronix.de>,
 linux-i2c@vger.kernel.org, Tushar Khandelwal <Tushar.Khandelwal@arm.com>,
 linux-spi@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-watchdog@vger.kernel.org,
 linux-rtc@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
 Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 David Airlie <airlied@linux.ie>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>, Guenter Roeck <linux@roeck-us.net>,
 Mike Leach <mike.leach@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Arnd Bergmann <arnd@arndb.de>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, coresight@lists.linaro.org,
 Vladimir Zapolskiy <vz@mleia.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Mark Brown <broonie@kernel.org>,
 Matt Mackall <mpm@selenic.com>, Dan Williams <dan.j.williams@intel.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cornelia Huck <cohuck@redhat.com>, linux-mmc@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Russell King <linux+pull@armlinux.org.uk>,
 linux-crypto@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Leo Yan <leo.yan@linaro.org>, dmaengine@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] mailbox: arm_mhuv2: make remove callback
	return void
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 02-02-21, 20:43, Uwe Kleine-K=F6nig wrote:
> My build tests failed to catch that amba driver that would have needed
> adaption in commit 3fd269e74f2f ("amba: Make the remove callback return
> void"). Change the remove function to make the driver build again.
> =

> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: 3fd269e74f2f ("amba: Make the remove callback return void")
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
> =

> I guess I missed that driver during rebase as it was only introduced in
> the last merge window. Sorry for that.
> =

> I'm unsure what is the right thing to do now. Should I redo the pull
> request (with this patch squashed into 3fd269e74f2f)? Or do we just
> apply this patch on top?
> =

> FTR, the test robot report is at https://lore.kernel.org/r/202102030343.D=
9j1wukx-lkp@intel.com
> =

> Best regards
> Uwe
> =

>  drivers/mailbox/arm_mhuv2.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> =

> diff --git a/drivers/mailbox/arm_mhuv2.c b/drivers/mailbox/arm_mhuv2.c
> index 67fb10885bb4..6cf1991a5c9c 100644
> --- a/drivers/mailbox/arm_mhuv2.c
> +++ b/drivers/mailbox/arm_mhuv2.c
> @@ -1095,14 +1095,12 @@ static int mhuv2_probe(struct amba_device *adev, =
const struct amba_id *id)
>  	return ret;
>  }
>  =

> -static int mhuv2_remove(struct amba_device *adev)
> +static void mhuv2_remove(struct amba_device *adev)
>  {
>  	struct mhuv2 *mhu =3D amba_get_drvdata(adev);
>  =

>  	if (mhu->frame =3D=3D SENDER_FRAME)
>  		writel_relaxed(0x0, &mhu->send->access_request);
> -
> -	return 0;
>  }
>  =

>  static struct amba_id mhuv2_ids[] =3D {

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- =

viresh
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
