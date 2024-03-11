Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 538338786CC
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Mar 2024 18:56:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0820BC6DD9E;
	Mon, 11 Mar 2024 17:56:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55F23C6DD73
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Mar 2024 17:56:27 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42BBTHgA031821; Mon, 11 Mar 2024 18:55:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=
 selector1; bh=NQG+2qhjNjjYXPhRwsqUC5kmwQUxn53pvpUv3WEV40M=; b=N5
 RQs48/N6jDwH5C8ioEjmzE3xw/uhDcWeKMKxrdmbfMUWsxm2DuUoV+Y+pG/QCg0z
 aC3SCZibf00/yODCjOQeInIt+k0QsvltTrQL7Dt7CU+UORWwGghYXmqAhVJQ9+wD
 /sGEiY4vxe7ajGQggmtesaqWiSuRW9EO+TMsvPm2W6e7y3XjNcsFJMaay1U7fU0G
 byuX77weaCLtKovuG7gJD6PgfUCByKt7St3OwmII7scNN2WgEpqivWwPO8kCAAgF
 IK56X4/4lqCiudXiBJVioFpqY9C3n4f/yz64aTYn3blF/ihP9etXtS3xxB4l0Otl
 1eAB8RqHT37tovMYwJpA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3wrfhfh8mb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Mar 2024 18:55:49 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C15C840044;
 Mon, 11 Mar 2024 18:55:45 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 885B42967F6;
 Mon, 11 Mar 2024 18:55:13 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 11 Mar
 2024 18:55:13 +0100
Date: Mon, 11 Mar 2024 18:55:07 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <20240311175442.GA109372@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
 <u.kleine-koenig@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-media@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
References: <cover.1708692946.git.u.kleine-koenig@pengutronix.de>
 <7e85adb3c2f11fc10e5a18bb341c5af8b35c4d88.1708692946.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7e85adb3c2f11fc10e5a18bb341c5af8b35c4d88.1708692946.git.u.kleine-koenig@pengutronix.de>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-11_10,2024-03-11_01,2023-05-22_02
Cc: kernel@pengutronix.de, Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 4/5] media: stm32-dcmipp: Convert to
 platform remove callback returning void
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

Hi Uwe,

thank you for your patch.

On Fri, Feb 23, 2024 at 01:59:07PM +0100, Uwe Kleine-K=F6nig wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> =

> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> =

> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> =

> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Alain Volmat <alain.volmat@foss.st.com>

> ---
>  drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> =

> diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b=
/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> index 32c6619be9a2..bce821eb71ce 100644
> --- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> +++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> @@ -517,7 +517,7 @@ static int dcmipp_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  =

> -static int dcmipp_remove(struct platform_device *pdev)
> +static void dcmipp_remove(struct platform_device *pdev)
>  {
>  	struct dcmipp_device *dcmipp =3D platform_get_drvdata(pdev);
>  	unsigned int i;
> @@ -534,8 +534,6 @@ static int dcmipp_remove(struct platform_device *pdev)
>  	media_device_cleanup(&dcmipp->mdev);
>  =

>  	v4l2_device_unregister(&dcmipp->v4l2_dev);
> -
> -	return 0;
>  }
>  =

>  static int dcmipp_runtime_suspend(struct device *dev)
> @@ -588,7 +586,7 @@ static const struct dev_pm_ops dcmipp_pm_ops =3D {
>  =

>  static struct platform_driver dcmipp_pdrv =3D {
>  	.probe		=3D dcmipp_probe,
> -	.remove		=3D dcmipp_remove,
> +	.remove_new	=3D dcmipp_remove,
>  	.driver		=3D {
>  		.name	=3D DCMIPP_PDEV_NAME,
>  		.of_match_table =3D dcmipp_of_match,
> -- =

> 2.43.0
> =


Regards,
Alain
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
