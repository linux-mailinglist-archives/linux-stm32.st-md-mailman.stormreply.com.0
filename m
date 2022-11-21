Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4D2631C81
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Nov 2022 10:10:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 834E4C65065;
	Mon, 21 Nov 2022 09:10:00 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E206C6504A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Nov 2022 09:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669021799; x=1700557799;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=YK1fJnwYjE6pEUlQTwqHgFrvyAFXsLhLRFs9q3IFLwA=;
 b=MQL+yl2J6VdU97z4lFwn27K9nlsBXDqNvAWkg6o/opwmOY+U1vAF2YzX
 ShrS+IJpEK2U1kQlHTIOkzK0vqDy8Zp1FSVYFt5elT6zDHjoEn2XwFvFv
 8Vi8w7G+11UZ9oC3X1UPHNMI5rlMkRiT+dys+gMQT47qqQl8Nezj2RpHy
 9dzLCcb/7Mfr7MBZ3dPjr+QSpgF+114OwKHS4Oas8hzVN1QCg0hGc2wm1
 79a6O3LFRdhZA2PMmo9oAYCWwbfcpxtwxLxqGGr4OOtNCXK+5DFW6g1+D
 yP0IATvOBTt9U7Rjq1Vz8xN+7xc1euLx8c0mHJDsOelrLdPengaXHd+2i g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="301055318"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; d="scan'208";a="301055318"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2022 01:09:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="783378100"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; d="scan'208";a="783378100"
Received: from kuha.fi.intel.com ([10.237.72.185])
 by fmsmga001.fm.intel.com with SMTP; 21 Nov 2022 01:09:51 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Mon, 21 Nov 2022 11:09:51 +0200
Date: Mon, 21 Nov 2022 11:09:51 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Message-ID: <Y3tAX8I3EWoIlraR@kuha.fi.intel.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-585-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221118224540.619276-585-uwe@kleine-koenig.org>
Cc: linux-arm-kernel@lists.infradead.org, Corey Minyard <cminyard@mvista.com>,
 kernel@pengutronix.de, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa@kernel.org>, Angel Iglesias <ang.iglesiasg@gmail.com>,
 linux-i2c@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Grant Likely <grant.likely@linaro.org>, Lee Jones <lee.jones@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Colin Ian King <colin.i.king@gmail.com>
Subject: Re: [Linux-stm32] [PATCH 584/606] usb: typec: ucsi: stm32g0:
 Convert to i2c's .probe_new()
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

On Fri, Nov 18, 2022 at 11:45:18PM +0100, Uwe Kleine-K=F6nig wrote:
> From: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> =

> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> =

> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi_stm32g0.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> =

> diff --git a/drivers/usb/typec/ucsi/ucsi_stm32g0.c b/drivers/usb/typec/uc=
si/ucsi_stm32g0.c
> index 7b92f0c8de70..93fead0096b7 100644
> --- a/drivers/usb/typec/ucsi/ucsi_stm32g0.c
> +++ b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
> @@ -626,7 +626,7 @@ static int ucsi_stm32g0_probe_bootloader(struct ucsi =
*ucsi)
>  	return 0;
>  }
>  =

> -static int ucsi_stm32g0_probe(struct i2c_client *client, const struct i2=
c_device_id *id)
> +static int ucsi_stm32g0_probe(struct i2c_client *client)
>  {
>  	struct device *dev =3D &client->dev;
>  	struct ucsi_stm32g0 *g0;
> @@ -763,7 +763,7 @@ static struct i2c_driver ucsi_stm32g0_i2c_driver =3D {
>  		.of_match_table =3D of_match_ptr(ucsi_stm32g0_typec_of_match),
>  		.pm =3D pm_sleep_ptr(&ucsi_stm32g0_pm_ops),
>  	},
> -	.probe =3D ucsi_stm32g0_probe,
> +	.probe_new =3D ucsi_stm32g0_probe,
>  	.remove =3D ucsi_stm32g0_remove,
>  	.id_table =3D ucsi_stm32g0_typec_i2c_devid
>  };

thanks,

-- =

heikki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
