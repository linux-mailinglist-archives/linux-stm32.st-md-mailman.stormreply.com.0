Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E767BA77
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Jul 2019 09:15:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B944C35E01;
	Wed, 31 Jul 2019 07:15:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D87F2C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Jul 2019 07:15:40 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6V77nIl002302; Wed, 31 Jul 2019 09:15:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=jPifBTLgBqCxGV4h1cRoINLa/YtV3LtiY9n5IGSEb0E=;
 b=dwXW2TJGkhxhA+NT+wv22LEUSW8qsl3plVpTSmEnPXa8B9vDFvYqU4llpcU2cBuaatqW
 iZsoKkcktlVw6ls+oXl6qRnHHzzdu7YF0Uznhyu4n5yr4Mhb//s1DsNi4ASuOPQpsQTx
 dbD0MO+U0mfd3rg1idFr1IGzddSfmX3y9U+mYlh3n08l7J74X6z0yPZruYANaoklYmOD
 maVxmc8yuogaO3nu9xYOHfdXDTVl74bvhh6gx1TZOLK7GN+CKe9tgZfvqEyzvyc72wh3
 zGQQoO4ZCArEgYJNiAqmeGtBBFDVTyBm2bW34RtG/tSU2Pc29y31goNl9l0QVZ6+/tYn Fg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2u0ccwpt0x-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 31 Jul 2019 09:15:26 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8E84231;
 Wed, 31 Jul 2019 07:15:25 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6CFEB1313;
 Wed, 31 Jul 2019 07:15:25 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 31 Jul
 2019 09:15:24 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 31 Jul 2019 09:15:25 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Olof Johansson <olof@lixom.net>
Thread-Topic: ARM: multi_v7_defconfig: Enable SPI_STM32_QSPI support
Thread-Index: AQHVRhVB0n1KQugbLUyWfFzNn/AIwabjTQKAgADkvQA=
Date: Wed, 31 Jul 2019 07:15:25 +0000
Message-ID: <fa683cde-04d1-0842-4082-b4b8b102e87a@st.com>
References: <20190729135505.15394-1-patrice.chotard@st.com>
 <CAOesGMg-3xt2qjjZ569pUE+d6tn7nz264AN9ARkBT_Ej4TFC2A@mail.gmail.com>
In-Reply-To: <CAOesGMg-3xt2qjjZ569pUE+d6tn7nz264AN9ARkBT_Ej4TFC2A@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <72C19610F7E9264599FB770633BD4475@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-31_03:, , signatures=0
Cc: Arnd Bergmann <arnd@arndb.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] ARM: multi_v7_defconfig: Enable SPI_STM32_QSPI
	support
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

Hi OLof

On 7/30/19 7:36 PM, Olof Johansson wrote:
> Hi Patrice,
>
> If you cc soc@kernel.org on patches you want us to apply, you'll get
> them automatically tracked by patchwork.

Thanks for the information, i will resubmit it.

Patrice


>
>
> -Olof
>
> On Mon, Jul 29, 2019 at 3:55 PM <patrice.chotard@st.com> wrote:
>> From: Patrice Chotard <patrice.chotard@st.com>
>>
>> Enable support for QSPI block on STM32 SoCs.
>>
>> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
>> ---
>>  arch/arm/configs/multi_v7_defconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
>> index 6a40bc2ef271..78d1d93298af 100644
>> --- a/arch/arm/configs/multi_v7_defconfig
>> +++ b/arch/arm/configs/multi_v7_defconfig
>> @@ -403,6 +403,7 @@ CONFIG_SPI_SH_MSIOF=m
>>  CONFIG_SPI_SH_HSPI=y
>>  CONFIG_SPI_SIRF=y
>>  CONFIG_SPI_STM32=m
>> +CONFIG_SPI_STM32_QSPI=m
>>  CONFIG_SPI_SUN4I=y
>>  CONFIG_SPI_SUN6I=y
>>  CONFIG_SPI_TEGRA114=y
>> --
>> 2.17.1
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
