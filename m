Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F045547F61
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jun 2022 08:10:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E63AAC5F1FA;
	Mon, 13 Jun 2022 06:10:55 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D10BC03FFF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jun 2022 15:53:18 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id d23so5315210qke.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jun 2022 08:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=yhiWlIGhbuZmmSfDVxbp8Dfh9EAKlh+Pg7Cz8rcIYp8=;
 b=jGMORZ2t0/US8hVh5+7ZmIZriYNuhSM6OIGyulLhTB7H0gQkSmPJYSB5xLPS7d22aP
 D+tz/mT5y4gtZtMFdJ954oID+mstf9COy6e93A5nnpuQFllAdJj5o8yIwMdUjHpqvalL
 lFh9G5kAf21MS2Dr6EZE+AHHdYotrT29w1su/Ldqu/ukHHqLipCwDAKwvN/GYw2u3dIz
 sKWYfoJLxjyVTRnGgzvKwImY72wft0H6epKkKr2FJoHFgGQzxhZkEi9nxjT+kdqp1B2t
 VGVO/ogDyl7OgUDIhtK2S8mzdsKJv4TeoUwFCSzSYu0HHPVfZoFj1E++fPponlge746g
 5sGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=yhiWlIGhbuZmmSfDVxbp8Dfh9EAKlh+Pg7Cz8rcIYp8=;
 b=Dk2uiLCYHFaI2HZsYVIkdseaxfTmH+MH8xGotN0Yrx0E20MM6W3LEJA7Xbezuc5kKO
 PTcxGGsIp71wZi39q6lNGuYge2qY7cPwpttnCV+uFmisl5Ce4uW94vPSepaEjinAep01
 fCWCP9J6/oON7+b5iiU8oY+vCe2OVJt/ZecnF9WiNyzIHYLPSd0gWyoqBRIeZPINzuMx
 AjidlX1bzypT5X7c+UbovMo0wQ5BM2oCvE25BzlzXdc9p5/4no+6TVxaaMb5V3cAQmvd
 oSwhTg6ZdiZWXdBAP/IGzBr2keIFdQn7Wlebn2T6dDDIMjT/bLPmX2IFc5afpPUNjevs
 W5ng==
X-Gm-Message-State: AOAM5331kMkfLBU15u7UcoD5qMvWbrCrMYEIsulMyjiHFXJ5ISN+F/P6
 jzWc6zmr0OMiAbezu3WkjLc=
X-Google-Smtp-Source: ABdhPJzRextq/3cg41qdTg/dMr4D8hpI+nm7RgN1SE+Jb+3+lwY6nJSL58jBT92WELa3x3rvHmk61g==
X-Received: by 2002:a37:4454:0:b0:69f:c339:e2dc with SMTP id
 r81-20020a374454000000b0069fc339e2dcmr29221348qka.771.1654876397181; 
 Fri, 10 Jun 2022 08:53:17 -0700 (PDT)
Received: from spruce (c-71-206-142-238.hsd1.va.comcast.net. [71.206.142.238])
 by smtp.gmail.com with ESMTPSA id
 j74-20020a37a04d000000b006a7284e5741sm3245028qke.54.2022.06.10.08.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 08:53:16 -0700 (PDT)
Date: Fri, 10 Jun 2022 11:53:13 -0400
From: Joe Simmons-Talbott <joetalbott@gmail.com>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Message-ID: <YqNo6U8r80aNFzUr@spruce>
References: <20220610084545.547700-1-nuno.sa@analog.com>
 <20220610084545.547700-35-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220610084545.547700-35-nuno.sa@analog.com>
X-Mailman-Approved-At: Mon, 13 Jun 2022 06:10:54 +0000
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Tomer Maimon <tmaimon77@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Paul Cercueil <paul@crapouillou.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Guenter Roeck <groeck@chromium.org>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 chrome-platform@lists.linux.dev, Lars-Peter Clausen <lars@metafoo.de>,
 Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org,
 Jishnu Prakash <quic_jprakash@quicinc.com>, Haibo Chen <haibo.chen@nxp.com>,
 Nancy Yuen <yuenn@google.com>, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Andy Gross <agross@kernel.org>, linux-imx@nxp.com,
 Zhang Rui <rui.zhang@intel.com>,
 Christophe Branchereau <cbranchereau@gmail.com>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-mediatek@lists.infradead.org,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Gwendal Grignou <gwendal@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Benson Leung <bleung@chromium.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 linux-mips@vger.kernel.org, Thara Gopinath <thara.gopinath@linaro.org>,
 linux-renesas-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Cai Huoqing <cai.huoqing@linux.dev>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 34/34] iio: inkern: fix coding style
	warnings
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

On Fri, Jun 10, 2022 at 10:45:45AM +0200, Nuno S=E1 wrote:
> Just cosmetics. No functional change intended...
> =

> Signed-off-by: Nuno S=E1 <nuno.sa@analog.com>
> ---
>  drivers/iio/inkern.c | 64 ++++++++++++++++++++++----------------------
>  1 file changed, 32 insertions(+), 32 deletions(-)
> =

> diff --git a/drivers/iio/inkern.c b/drivers/iio/inkern.c
> index 7eb536560ded..526519cefcb9 100644
> --- a/drivers/iio/inkern.c
> +++ b/drivers/iio/inkern.c
> @@ -45,13 +45,13 @@ int iio_map_array_register(struct iio_dev *indio_dev,=
 struct iio_map *maps)
>  	int i =3D 0, ret =3D 0;
>  	struct iio_map_internal *mapi;
>  =

> -	if (maps =3D=3D NULL)
> +	if (!maps)
>  		return 0;
>  =

>  	mutex_lock(&iio_map_list_lock);
> -	while (maps[i].consumer_dev_name !=3D NULL) {
> +	while (!maps[i].consumer_dev_name) {

Shouldn't this be?:
while (maps[i].consumer_dev_name) {

Thanks,
Joe
>  		mapi =3D kzalloc(sizeof(*mapi), GFP_KERNEL);
> -		if (mapi =3D=3D NULL) {
> +		if (!mapi) {
>  			ret =3D -ENOMEM;
>  			goto error_ret;
>  		}
> @@ -69,7 +69,6 @@ int iio_map_array_register(struct iio_dev *indio_dev, s=
truct iio_map *maps)
>  }
>  EXPORT_SYMBOL_GPL(iio_map_array_register);
>  =

> -
>  /*
>   * Remove all map entries associated with the given iio device
>   */
> @@ -163,7 +162,7 @@ static int __fwnode_iio_channel_get(struct iio_channe=
l *channel,
>  =

>  	idev =3D bus_find_device(&iio_bus_type, NULL, iiospec.fwnode,
>  			       iio_dev_node_match);
> -	if (idev =3D=3D NULL) {
> +	if (!idev) {
>  		fwnode_handle_put(iiospec.fwnode);
>  		return -EPROBE_DEFER;
>  	}
> @@ -196,7 +195,7 @@ static struct iio_channel *fwnode_iio_channel_get(str=
uct fwnode_handle *fwnode,
>  		return ERR_PTR(-EINVAL);
>  =

>  	channel =3D kzalloc(sizeof(*channel), GFP_KERNEL);
> -	if (channel =3D=3D NULL)
> +	if (!channel)
>  		return ERR_PTR(-ENOMEM);
>  =

>  	err =3D __fwnode_iio_channel_get(channel, fwnode, index);
> @@ -293,7 +292,7 @@ static struct iio_channel *fwnode_iio_channel_get_all=
(struct device *dev)
>  =

>  	/* NULL terminated array to save passing size */
>  	chans =3D kcalloc(nummaps + 1, sizeof(*chans), GFP_KERNEL);
> -	if (chans =3D=3D NULL)
> +	if (!chans)
>  		return ERR_PTR(-ENOMEM);
>  =

>  	/* Search for FW matches */
> @@ -318,7 +317,7 @@ static struct iio_channel *iio_channel_get_sys(const =
char *name,
>  	struct iio_channel *channel;
>  	int err;
>  =

> -	if (name =3D=3D NULL && channel_name =3D=3D NULL)
> +	if (!name && !channel_name)
>  		return ERR_PTR(-ENODEV);
>  =

>  	/* first find matching entry the channel map */
> @@ -333,11 +332,11 @@ static struct iio_channel *iio_channel_get_sys(cons=
t char *name,
>  		break;
>  	}
>  	mutex_unlock(&iio_map_list_lock);
> -	if (c =3D=3D NULL)
> +	if (!c)
>  		return ERR_PTR(-ENODEV);
>  =

>  	channel =3D kzalloc(sizeof(*channel), GFP_KERNEL);
> -	if (channel =3D=3D NULL) {
> +	if (!channel) {
>  		err =3D -ENOMEM;
>  		goto error_no_mem;
>  	}
> @@ -349,7 +348,7 @@ static struct iio_channel *iio_channel_get_sys(const =
char *name,
>  			iio_chan_spec_from_name(channel->indio_dev,
>  						c->map->adc_channel_label);
>  =

> -		if (channel->channel =3D=3D NULL) {
> +		if (!channel->channel) {
>  			err =3D -EINVAL;
>  			goto error_no_chan;
>  		}
> @@ -441,7 +440,7 @@ struct iio_channel *iio_channel_get_all(struct device=
 *dev)
>  	int mapind =3D 0;
>  	int i, ret;
>  =

> -	if (dev =3D=3D NULL)
> +	if (!dev)
>  		return ERR_PTR(-EINVAL);
>  =

>  	chans =3D fwnode_iio_channel_get_all(dev);
> @@ -465,7 +464,7 @@ struct iio_channel *iio_channel_get_all(struct device=
 *dev)
>  =

>  	/* NULL terminated array to save passing size */
>  	chans =3D kcalloc(nummaps + 1, sizeof(*chans), GFP_KERNEL);
> -	if (chans =3D=3D NULL) {
> +	if (!chans) {
>  		ret =3D -ENOMEM;
>  		goto error_ret;
>  	}
> @@ -479,7 +478,7 @@ struct iio_channel *iio_channel_get_all(struct device=
 *dev)
>  		chans[mapind].channel =3D
>  			iio_chan_spec_from_name(chans[mapind].indio_dev,
>  						c->map->adc_channel_label);
> -		if (chans[mapind].channel =3D=3D NULL) {
> +		if (!chans[mapind].channel) {
>  			ret =3D -EINVAL;
>  			goto error_free_chans;
>  		}
> @@ -541,14 +540,14 @@ struct iio_channel *devm_iio_channel_get_all(struct=
 device *dev)
>  EXPORT_SYMBOL_GPL(devm_iio_channel_get_all);
>  =

>  static int iio_channel_read(struct iio_channel *chan, int *val, int *val=
2,
> -	enum iio_chan_info_enum info)
> +			    enum iio_chan_info_enum info)
>  {
>  	int unused;
>  	int vals[INDIO_MAX_RAW_ELEMENTS];
>  	int ret;
>  	int val_len =3D 2;
>  =

> -	if (val2 =3D=3D NULL)
> +	if (!val2)
>  		val2 =3D &unused;
>  =

>  	if (!iio_channel_has_info(chan->channel, info))
> @@ -560,9 +559,10 @@ static int iio_channel_read(struct iio_channel *chan=
, int *val, int *val2,
>  					vals, &val_len, info);
>  		*val =3D vals[0];
>  		*val2 =3D vals[1];
> -	} else
> +	} else {
>  		ret =3D chan->indio_dev->info->read_raw(chan->indio_dev,
>  					chan->channel, val, val2, info);
> +	}
>  =

>  	return ret;
>  }
> @@ -573,7 +573,7 @@ int iio_read_channel_raw(struct iio_channel *chan, in=
t *val)
>  	int ret;
>  =

>  	mutex_lock(&iio_dev_opaque->info_exist_lock);
> -	if (chan->indio_dev->info =3D=3D NULL) {
> +	if (!chan->indio_dev->info) {
>  		ret =3D -ENODEV;
>  		goto err_unlock;
>  	}
> @@ -592,7 +592,7 @@ int iio_read_channel_average_raw(struct iio_channel *=
chan, int *val)
>  	int ret;
>  =

>  	mutex_lock(&iio_dev_opaque->info_exist_lock);
> -	if (chan->indio_dev->info =3D=3D NULL) {
> +	if (!chan->indio_dev->info) {
>  		ret =3D -ENODEV;
>  		goto err_unlock;
>  	}
> @@ -606,7 +606,8 @@ int iio_read_channel_average_raw(struct iio_channel *=
chan, int *val)
>  EXPORT_SYMBOL_GPL(iio_read_channel_average_raw);
>  =

>  static int iio_convert_raw_to_processed_unlocked(struct iio_channel *cha=
n,
> -	int raw, int *processed, unsigned int scale)
> +						 int raw, int *processed,
> +						 unsigned int scale)
>  {
>  	int scale_type, scale_val, scale_val2;
>  	int offset_type, offset_val, offset_val2;
> @@ -639,7 +640,7 @@ static int iio_convert_raw_to_processed_unlocked(stru=
ct iio_channel *chan,
>  	}
>  =

>  	scale_type =3D iio_channel_read(chan, &scale_val, &scale_val2,
> -					IIO_CHAN_INFO_SCALE);
> +				      IIO_CHAN_INFO_SCALE);
>  	if (scale_type < 0) {
>  		/*
>  		 * If no channel scaling is available apply consumer scale to
> @@ -684,19 +685,19 @@ static int iio_convert_raw_to_processed_unlocked(st=
ruct iio_channel *chan,
>  }
>  =

>  int iio_convert_raw_to_processed(struct iio_channel *chan, int raw,
> -	int *processed, unsigned int scale)
> +				 int *processed, unsigned int scale)
>  {
>  	struct iio_dev_opaque *iio_dev_opaque =3D to_iio_dev_opaque(chan->indio=
_dev);
>  	int ret;
>  =

>  	mutex_lock(&iio_dev_opaque->info_exist_lock);
> -	if (chan->indio_dev->info =3D=3D NULL) {
> +	if (!chan->indio_dev->info) {
>  		ret =3D -ENODEV;
>  		goto err_unlock;
>  	}
>  =

>  	ret =3D iio_convert_raw_to_processed_unlocked(chan, raw, processed,
> -							scale);
> +						    scale);
>  err_unlock:
>  	mutex_unlock(&iio_dev_opaque->info_exist_lock);
>  =

> @@ -711,7 +712,7 @@ int iio_read_channel_attribute(struct iio_channel *ch=
an, int *val, int *val2,
>  	int ret;
>  =

>  	mutex_lock(&iio_dev_opaque->info_exist_lock);
> -	if (chan->indio_dev->info =3D=3D NULL) {
> +	if (!chan->indio_dev->info) {
>  		ret =3D -ENODEV;
>  		goto err_unlock;
>  	}
> @@ -737,7 +738,7 @@ int iio_read_channel_processed_scale(struct iio_chann=
el *chan, int *val,
>  	int ret;
>  =

>  	mutex_lock(&iio_dev_opaque->info_exist_lock);
> -	if (chan->indio_dev->info =3D=3D NULL) {
> +	if (!chan->indio_dev->info) {
>  		ret =3D -ENODEV;
>  		goto err_unlock;
>  	}
> @@ -815,7 +816,7 @@ int iio_read_avail_channel_raw(struct iio_channel *ch=
an,
>  	int type;
>  =

>  	ret =3D iio_read_avail_channel_attribute(chan, vals, &type, length,
> -					 IIO_CHAN_INFO_RAW);
> +					       IIO_CHAN_INFO_RAW);
>  =

>  	if (ret >=3D 0 && type !=3D IIO_VAL_INT)
>  		/* raw values are assumed to be IIO_VAL_INT */
> @@ -899,7 +900,7 @@ int iio_get_channel_type(struct iio_channel *chan, en=
um iio_chan_type *type)
>  	/* Need to verify underlying driver has not gone away */
>  =

>  	mutex_lock(&iio_dev_opaque->info_exist_lock);
> -	if (chan->indio_dev->info =3D=3D NULL) {
> +	if (!chan->indio_dev->info) {
>  		ret =3D -ENODEV;
>  		goto err_unlock;
>  	}
> @@ -926,7 +927,7 @@ int iio_write_channel_attribute(struct iio_channel *c=
han, int val, int val2,
>  	int ret;
>  =

>  	mutex_lock(&iio_dev_opaque->info_exist_lock);
> -	if (chan->indio_dev->info =3D=3D NULL) {
> +	if (!chan->indio_dev->info) {
>  		ret =3D -ENODEV;
>  		goto err_unlock;
>  	}
> @@ -960,9 +961,8 @@ unsigned int iio_get_channel_ext_info_count(struct ii=
o_channel *chan)
>  }
>  EXPORT_SYMBOL_GPL(iio_get_channel_ext_info_count);
>  =

> -static const struct iio_chan_spec_ext_info *iio_lookup_ext_info(
> -						const struct iio_channel *chan,
> -						const char *attr)
> +static const struct iio_chan_spec_ext_info *
> +iio_lookup_ext_info(const struct iio_channel *chan, const char *attr)
>  {
>  	const struct iio_chan_spec_ext_info *ext_info;
>  =

> -- =

> 2.36.1
> =

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
