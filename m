Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FA04B740
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2019 13:42:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9A12C55587
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2019 11:42:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22635C55587
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2019 11:42:42 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5JBfBx0001850; Wed, 19 Jun 2019 13:42:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=jAayPybMAxCHXtDmLft/T64tgWULV2g7e3s0ys/xt7c=;
 b=WTev4s7P/RCeq68dfxKoEPTgP9Bu7gbgDy+JYF9OEUdefIGTl9aNQ7UStjd8GSgen5Ca
 S19TE4IInepLFPfSV1l319VpIXdOHwhEyh1oQr98Jj5BagdyWQ47swgj6IoEbTXM8B54
 gUdZFzYlJvjbCpOgNfuoqGf8SzVcbG89clmuriaSYu2OxcAh9bMCfQQkNeId5K34gby5
 L4qdHbzzuVs+LXlTEKq4ZC1ATUILfD6qqAZsapjsq1CBCrtAzwXXHYkDSMQfnmj2li4v
 6sYjb425JJGipZeGXggc030pb7IiR0K7woGZj7DhMavWYjJ9yH4WY7QDP2e98etQOj9p Tg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t7813bm3k-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 19 Jun 2019 13:42:24 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6AEF331;
 Wed, 19 Jun 2019 11:42:23 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3DCAF26D5;
 Wed, 19 Jun 2019 11:42:23 +0000 (GMT)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG5NODE3.st.com
 (10.75.127.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 19 Jun
 2019 13:42:23 +0200
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Wed, 19 Jun 2019 13:42:22 +0200
From: Benjamin GAIGNARD <benjamin.gaignard@st.com>
To: Fabrice GASNIER <fabrice.gasnier@st.com>, "thierry.reding@gmail.com"
 <thierry.reding@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 Alexandre TORGUE <alexandre.torgue@st.com>
Thread-Topic: [PATCH 2/5] pwm: stm32: use 3 cells ->of_xlate()
Thread-Index: AQHVJoSsYAMsPXn+akirjvBTdUuqe6aiuYoA
Date: Wed, 19 Jun 2019 11:42:22 +0000
Message-ID: <c583094f-2429-d5f1-09df-fff54ab33af1@st.com>
References: <1560937925-8990-1-git-send-email-fabrice.gasnier@st.com>
 <1560937925-8990-3-git-send-email-fabrice.gasnier@st.com>
In-Reply-To: <1560937925-8990-3-git-send-email-fabrice.gasnier@st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <25284ABC327AEA4991DCD1504D64AD22@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-19_07:, , signatures=0
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 2/5] pwm: stm32: use 3 cells ->of_xlate()
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


On 6/19/19 11:52 AM, Fabrice Gasnier wrote:
> STM32 Timers support generic 3 cells PWM to encode PWM number, period and
> polarity.
>
> Fixes: 7edf7369205b ("pwm: Add driver for STM32 plaftorm")
Reviewed-by: Benjamin Gaignard <benjamin.gaignard@st.com>
>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> ---
>   drivers/pwm/pwm-stm32.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/pwm/pwm-stm32.c b/drivers/pwm/pwm-stm32.c
> index 4f84255..740e2de 100644
> --- a/drivers/pwm/pwm-stm32.c
> +++ b/drivers/pwm/pwm-stm32.c
> @@ -608,6 +608,8 @@ static int stm32_pwm_probe(struct platform_device *pdev)
>   	priv->regmap = ddata->regmap;
>   	priv->clk = ddata->clk;
>   	priv->max_arr = ddata->max_arr;
> +	priv->chip.of_xlate = of_pwm_xlate_with_flags;
> +	priv->chip.of_pwm_n_cells = 3;
>   
>   	if (!priv->regmap || !priv->clk)
>   		return -EINVAL;
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
