Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 411371072ED
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Nov 2019 14:15:41 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EBB39C36B0B
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Nov 2019 13:15:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3642C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Nov 2019 13:15:38 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAMDC3Zm016600; Fri, 22 Nov 2019 14:15:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=fsOHhYzNXWXB343toBErYF3JFgQsNuXPAR+dwnBzdGI=;
 b=0FAzw4EA1OF5EXTJYHgyEdlBJ+LLlYEYsIyl5Rpius2KHdsBDYFutFMljQDvgXJZSBcj
 WZ9BAnGc+kgpN9AZ/bPRixPvdI5VSary5czGFV3YJUMTE1Oonh02vPb8liPPJoWl0s+C
 xxymM2nU/9hGpRmrPFJlU3I/+ZnWslsGi0NGcF4q/gfT1qWlje1uLUzI83Wi8Cwn7DPN
 u8IhapLtXx2vJ96YYGv9YPRk9zEIuTiX55Zv9Yu5BDBh2a2uTYsaJBEo+ZptplgNeAJe
 Cjnkv8jKvex5+laaI3PUbz+6K3f0QgMrisiDLjZFyHlsozMOANwcjPsQKmPidJ3zP6qT Ag== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2wa9ujgx69-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Nov 2019 14:15:08 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E875110002A;
 Fri, 22 Nov 2019 14:15:07 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D1A902BE244;
 Fri, 22 Nov 2019 14:15:07 +0100 (CET)
Received: from SFHDAG5NODE3.st.com (10.75.127.15) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 22 Nov
 2019 14:15:07 +0100
Received: from SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47]) by
 SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47%20]) with mapi id
 15.00.1473.003; Fri, 22 Nov 2019 14:15:07 +0100
From: Christophe ROULLIER <christophe.roullier@st.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, "wim@linux-watchdog.org"
 <wim@linux-watchdog.org>, "linux@roeck-us.net" <linux@roeck-us.net>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, Alexandre TORGUE
 <alexandre.torgue@st.com>
Thread-Topic: [Linux-stm32] [PATCH v2 1/1] drivers: watchdog: stm32_iwdg: set
 WDOG_HW_RUNNING at probe
Thread-Index: AQHVoQ5NhIxTjK/sUU24wk/cKk90B6eW7F6AgAAucQA=
Date: Fri, 22 Nov 2019 13:15:07 +0000
Message-ID: <70c319bd-866c-5305-e535-ead663652c5f@st.com>
References: <20191122082442.21695-1-christophe.roullier@st.com>
 <ea80ec65-8621-453c-4d5b-af38d8afeb70@pengutronix.de>
In-Reply-To: <ea80ec65-8621-453c-4d5b-af38d8afeb70@pengutronix.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <199B8515659CB941A78B6E41A371D31C@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-22_02:2019-11-21,2019-11-22 signatures=0
Cc: "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH v2 1/1] drivers: watchdog: stm32_iwdg: set
 WDOG_HW_RUNNING at probe
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


On 11/22/19 11:28 AM, Ahmad Fatoum wrote:
> Hello Christophe,
>
> On 11/22/19 9:24 AM, Christophe Roullier wrote:
>> +	/*
>> +	 * In case of CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is set
>> +	 * (Means U-Boot/bootloaders leaves the watchdog running)
>> +	 * When we get here we should make a decision to prevent
>> +	 * any side effects before user space daemon will take care of it.
>> +	 * The best option, taking into consideration that there is no
>> +	 * way to read values back from hardware, is to enforce watchdog
>> +	 * being run with deterministic values.
> What about the "ONF: Watchdog enable status bit" in the IWDG_SR register?
>
> Cheers
> Ahmad
>
Hi,

Thanks Ahmad for your feedback, it is a mistake in our ref manual. This 
bit is not present

in our iwdg IP, we will update our documentation accordingly.

Regards,

Christophe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
