Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 729376FC05A
	for <lists+linux-stm32@lfdr.de>; Tue,  9 May 2023 09:24:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06BB1C6A608;
	Tue,  9 May 2023 07:24:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 258D8C6A5F7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 May 2023 07:24:34 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3495mG7d029670; Tue, 9 May 2023 09:24:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=selector1;
 bh=2p4B4VsX8mwlIJ0lOLM/WNkj+IlVckkXoyqXM1FAEX8=;
 b=oHptbxkDEgro/cDRgDNPGEOYjyJxHmXJW30D962A47M1Z+d4YtS9/lvuYccm9h1UENlY
 Tc/7GtexCWXWaaMSyjcL0N3uZucwrwSYfWUHYSzIz320dOBI0wQVDGVXBNdMA1TqslI8
 QRXKKwPHpKcm04whzM3pqN71JcFGdNTtrbJybkdyytsKyf65kmSDMGMWyK6pUns1IZ01
 XUGXZDqU98goYWCRaZ4KPpK4eE/My3zuUHHYU58mEmcs8duB4R/EsoNCNWxr9QR5E2o6
 fgJhxgtKJte9IvEoexMyjSU41U6fU7NoLLtmpRLO3nCogUGjrgSDK11f6GfycG321OW7 oQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qf790jumv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 May 2023 09:24:21 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2FB5710002A;
 Tue,  9 May 2023 09:24:20 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 267B321231E;
 Tue,  9 May 2023 09:24:20 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 9 May
 2023 09:24:19 +0200
Date: Tue, 9 May 2023 09:24:18 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <20230509072418.GB1593946@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
 <u.kleine-koenig@pengutronix.de>, 
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
 <20230508205306.1474415-70-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230508205306.1474415-70-u.kleine-koenig@pengutronix.de>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_04,2023-05-05_01,2023-02-09_01
Cc: kernel@pengutronix.de, Wolfram Sang <wsa@kernel.org>,
 linux-i2c@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 69/89] i2c: stm32f4: Convert to platform
 remove callback returning void
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

Hi,

Acked-by: Alain Volmat <alain.volmat@foss.st.com>

Regards,
Alain

On Mon, May 08, 2023 at 10:52:46PM +0200, Uwe Kleine-K=F6nig wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> =

> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> =

> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/i2c/busses/i2c-stm32f4.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> =

> diff --git a/drivers/i2c/busses/i2c-stm32f4.c b/drivers/i2c/busses/i2c-st=
m32f4.c
> index eebce7ecef25..6ad06a5a22b4 100644
> --- a/drivers/i2c/busses/i2c-stm32f4.c
> +++ b/drivers/i2c/busses/i2c-stm32f4.c
> @@ -861,15 +861,13 @@ static int stm32f4_i2c_probe(struct platform_device=
 *pdev)
>  	return ret;
>  }
>  =

> -static int stm32f4_i2c_remove(struct platform_device *pdev)
> +static void stm32f4_i2c_remove(struct platform_device *pdev)
>  {
>  	struct stm32f4_i2c_dev *i2c_dev =3D platform_get_drvdata(pdev);
>  =

>  	i2c_del_adapter(&i2c_dev->adap);
>  =

>  	clk_unprepare(i2c_dev->clk);
> -
> -	return 0;
>  }
>  =

>  static const struct of_device_id stm32f4_i2c_match[] =3D {
> @@ -884,7 +882,7 @@ static struct platform_driver stm32f4_i2c_driver =3D {
>  		.of_match_table =3D stm32f4_i2c_match,
>  	},
>  	.probe =3D stm32f4_i2c_probe,
> -	.remove =3D stm32f4_i2c_remove,
> +	.remove_new =3D stm32f4_i2c_remove,
>  };
>  =

>  module_platform_driver(stm32f4_i2c_driver);
> -- =

> 2.39.2
> =

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
