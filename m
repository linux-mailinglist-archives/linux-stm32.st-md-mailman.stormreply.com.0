Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9430F26A926
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Sep 2020 17:55:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53A11C3FADF;
	Tue, 15 Sep 2020 15:55:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F4C3C3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Sep 2020 15:55:39 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08FFhaGC017288; Tue, 15 Sep 2020 17:54:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=xiFhVzR1YyqGzg2OheLi0xZmDY1r+Df1efVdmesMDrs=;
 b=yXJ1OBpPKdC02sxYdOGPBGVcEih1BjLc1inPNM7UXQ9ma1jBybK/Ur4xgJPHBq6vouiw
 24iBFiloH/Kxkr8PR+3STffYTp0lz5qP2qi+ZI6PoUI8JMHbkzFeX+hgu/eePGH8DXDj
 VbPxpqw3GdBEWb9s1TEJneaRuJ3HRlGrcteJy2YSYnlzwPCcK9gFs2Ybjab4s0w3hgYV
 YZ5TpypfeI4uXgAmOyptsdQRQIZ26/9Y9cfNIZ/rGwzgziUvIcmQyJP9IXLaVn9TjYNY
 J7wx6YllWxMX+RilZYB5iGWM+kV92VYLUePQ63MI7mikXiVBR6tnT4EquZ+zDY1waQZG Wg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33gkt0gpac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Sep 2020 17:54:44 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0E08D10002A;
 Tue, 15 Sep 2020 17:54:41 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 995D02BA2DB;
 Tue, 15 Sep 2020 17:54:41 +0200 (CEST)
Received: from SFHDAG6NODE1.st.com (10.75.127.16) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 15 Sep
 2020 17:54:41 +0200
Received: from SFHDAG6NODE1.st.com ([fe80::8d96:4406:44e3:eb27]) by
 SFHDAG6NODE1.st.com ([fe80::8d96:4406:44e3:eb27%20]) with mapi id
 15.00.1473.003; Tue, 15 Sep 2020 17:54:41 +0200
From: Nicolas TOROMANOFF <nicolas.toromanoff@st.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Thread-Topic: [PATCH] crypto: stm32/crc32 - Avoid lock if hardware is already
 used
Thread-Index: AQHWgq4lZ9k8lMJnVkmAkne1J9B/yKliwQwAgAcJHIA=
Date: Tue, 15 Sep 2020 15:54:41 +0000
Message-ID: <28561e25-1140-9a08-1546-4422150b65f7@st.com>
References: <20200904112527.15677-1-nicolas.toromanoff@st.com>
 <20200911042816.GA5531@gondor.apana.org.au>
In-Reply-To: <20200911042816.GA5531@gondor.apana.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <7BA07147189E834E80D683C23146B657@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-15_11:2020-09-15,
 2020-09-15 signatures=0
Cc: "David S . Miller" <davem@davemloft.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Ard
 Biesheuvel <ardb@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] crypto: stm32/crc32 - Avoid lock if
 hardware is already used
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

Hello Herbert,

On 9/11/20 6:28 AM, Herbert Xu wrote:
> On Fri, Sep 04, 2020 at 01:25:27PM +0200, Nicolas Toromanoff wrote:
>> If STM32 CRC device is already in use, calculate CRC by software.
>>
>> This will release CPU constraint for a concurrent access to the
>> hardware, and avoid masking irqs during the whole block processing.
>>
>> Fixes: 7795c0baf5ac ("crypto: stm32/crc32 - protect from concurrent accesses")
>>
>> Signed-off-by: Nicolas Toromanoff <nicolas.toromanoff@st.com>
>> ---
>>   drivers/crypto/stm32/Kconfig       |  2 ++
>>   drivers/crypto/stm32/stm32-crc32.c | 15 ++++++++++++---
>>   2 files changed, 14 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/crypto/stm32/Kconfig b/drivers/crypto/stm32/Kconfig
>> index 4ef3eb11361c..8d605b07571f 100644
>> --- a/drivers/crypto/stm32/Kconfig
>> +++ b/drivers/crypto/stm32/Kconfig
>> @@ -3,6 +3,8 @@ config CRYPTO_DEV_STM32_CRC
>>   	tristate "Support for STM32 crc accelerators"
>>   	depends on ARCH_STM32
>>   	select CRYPTO_HASH
>> +	select CRYPTO_CRC32
>> +	select CRYPTO_CRC32C
> 
> Shouldn't this be "select CRC32"?

Correct "select CRC32" is enough.
I'll send a version 2 with only "select CRC32".


Nicolas.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
