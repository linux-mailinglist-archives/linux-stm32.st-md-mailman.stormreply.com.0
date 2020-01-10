Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA46136A76
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jan 2020 11:06:16 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26B34C36B0B;
	Fri, 10 Jan 2020 10:06:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99E7DC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jan 2020 10:06:14 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00AA4MaJ018437; Fri, 10 Jan 2020 11:05:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Orqb4Kzs44B6SU4aLxj7f+Qu6NMAODCMej4io7GGS5M=;
 b=a7Pfwu94Dfr68ihKVpEQrnWKRtNIAvpCngKjgBGsIOqfhCV8u4TrvXXghrIa0GCrde8I
 fOT8I5ktcFhccr3JMzL9SdKR/f4XLkX/mY87BtGSgCANhN+mnPlhfK9kwaUEiNMRm0lg
 twI2wXR8z5W6brbdDoXVwLh5mmeq0V8XiZ4f5zHNnpeovIAmBTdwaXA1bnRETvO1kOE9
 kfq7Cc/xaFVpDr/E4pmZBgiC9WfHS/8U0QfUMKVbtmzHBJPdXpXhEpae10DayKWQFQeB
 V31tDJ8CqKQrPZMatfh08ZsIpxJQtPUjNTa/1kbP/yguAo/gy6PLEorIyiqpAI3NGDaw DA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xakkb72ge-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Jan 2020 11:05:53 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4EA5B10003A;
 Fri, 10 Jan 2020 11:05:48 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 39C942A6196;
 Fri, 10 Jan 2020 11:05:48 +0100 (CET)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 10 Jan
 2020 11:05:47 +0100
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
 SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
 15.00.1347.000; Fri, 10 Jan 2020 11:05:47 +0100
From: Olivier MOYSAN <olivier.moysan@st.com>
To: "jic23@kernel.org" <jic23@kernel.org>, "knaack.h@gmx.de" <knaack.h@gmx.de>,
 "lars@metafoo.de" <lars@metafoo.de>, "pmeerw@pmeerw.net"
 <pmeerw@pmeerw.net>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 Alexandre TORGUE <alexandre.torgue@st.com>, Fabrice GASNIER
 <fabrice.gasnier@st.com>, "linux-iio@vger.kernel.org"
 <linux-iio@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>,
 Benjamin GAIGNARD <benjamin.gaignard@st.com>
Thread-Topic: [PATCH v2] iio: adc: stm32-dfsdm: fix single conversion
Thread-Index: AQHVpSPpcOskt6+D7kOuxZv5WfyEPKfj4AOA
Date: Fri, 10 Jan 2020 10:05:47 +0000
Message-ID: <1a4261a5-1835-a248-9094-c4e7236e7254@st.com>
References: <20191127130729.18511-1-olivier.moysan@st.com>
In-Reply-To: <20191127130729.18511-1-olivier.moysan@st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <216D40C44CFE484AB49CAC1B044E7CC9@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-10_01:2020-01-10,
 2020-01-09 signatures=0
Subject: Re: [Linux-stm32] [PATCH v2] iio: adc: stm32-dfsdm: fix single
	conversion
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

Hi Jonathan, all,

Kind reminder on this patch.
Regards
Olivier

On 11/27/19 2:07 PM, Olivier Moysan wrote:
> Apply data formatting to single conversion,
> as this is already done in continuous and trigger modes.
>
> Fixes: 102afde62937 ("iio: adc: stm32-dfsdm: manage data resolution in trigger mode")
>
> Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
> ---
> changes in version 2:
> - correct title
> ---
>   drivers/iio/adc/stm32-dfsdm-adc.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-dfsdm-adc.c
> index e493242c266e..0339ecdd06bd 100644
> --- a/drivers/iio/adc/stm32-dfsdm-adc.c
> +++ b/drivers/iio/adc/stm32-dfsdm-adc.c
> @@ -1204,6 +1204,8 @@ static int stm32_dfsdm_single_conv(struct iio_dev *indio_dev,
>   
>   	stm32_dfsdm_stop_conv(adc);
>   
> +	stm32_dfsdm_process_data(adc, res);
> +
>   stop_dfsdm:
>   	stm32_dfsdm_stop_dfsdm(adc->dfsdm);
>   
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
