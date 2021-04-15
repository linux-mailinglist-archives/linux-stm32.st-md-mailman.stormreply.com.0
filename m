Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF60360901
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Apr 2021 14:12:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34A07C57B79;
	Thu, 15 Apr 2021 12:12:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD8DDC57192
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Apr 2021 12:12:37 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13FCAoFj023982; Thu, 15 Apr 2021 14:12:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=9LcfNvL3q1nqjhvUfDTxZXWWF0n6sg5Qxq9jRLUkPiY=;
 b=PPvxpkdQ5nKGK1PR3Mid7VGQh5CocddyDY2CkHpeiNmbgwOsZ1TttZIeTwtSgFUfQhAT
 Pmr+99V8UGGaHfWnzhF3arcDvhsNqr/NPUCPqG9clAFnft6fAt9ADFcQJKMPtOoRF2dw
 0a2ywhRjkf2ToXR7NJ8RpysyaS6Fgo4eEvNjoOZ0OOjbL5oezcAcndp364Ygvc/qwUZY
 ENBB8393ZCm4bPQgXrJRrXdWcHKjyT53y3nHpwGn01k6U1YF43zXduXMUEiyR73qYGJC
 KPkNnpGWW5/IxnpVgAaokporDItYeXKYcZPyp3bnyJO4mMYuKplgSYYPG0X3vqNizQDR Wg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37xes0tvug-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 14:12:21 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 29F5D10002A;
 Thu, 15 Apr 2021 14:12:20 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 26D9722D608;
 Thu, 15 Apr 2021 14:12:20 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 15 Apr
 2021 14:12:19 +0200
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, <arnd@arndb.de>,
 <robh+dt@kernel.org>, Marek Vasut <marex@denx.de>,
 <jagan@amarulasolutions.com>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>, Marcin Sloniewski
 <marcin.sloniewski@gmail.com>
References: <20210415101037.1465-1-alexandre.torgue@foss.st.com>
 <20210415101037.1465-11-alexandre.torgue@foss.st.com>
 <9fc27672-765b-9bd3-bb0a-d9159cb7d502@pengutronix.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <906ea3e5-0aaa-2307-e6fb-aaac1a5e5d00@foss.st.com>
Date: Thu, 15 Apr 2021 14:12:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9fc27672-765b-9bd3-bb0a-d9159cb7d502@pengutronix.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-15_04:2021-04-15,
 2021-04-15 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kuba@kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 10/13] dt-bindings: mfd: add
 vref_ddr-supply to st, stpmic1 yaml
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Ahmad

On 4/15/21 12:51 PM, Ahmad Fatoum wrote:
> Hi,
> 
> On 15.04.21 12:10, Alexandre Torgue wrote:
>> Add vref_ddr-supply to the STPMIC1 regulators supplies pattern
>> list.
>>
>> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/st,stpmic1.yaml b/Documentation/devicetree/bindings/mfd/st,stpmic1.yaml
>> index 305123e74a58..ffc32d209496 100644
>> --- a/Documentation/devicetree/bindings/mfd/st,stpmic1.yaml
>> +++ b/Documentation/devicetree/bindings/mfd/st,stpmic1.yaml
>> @@ -184,7 +184,7 @@ properties:
>>           additionalProperties: false
>>   
>>       patternProperties:
>> -      "^(buck[1-4]|ldo[1-6]|boost|pwr_sw[1-2])-supply$":
>> +      "^(buck[1-4]|ldo[1-6]|boost|vref_ddr|pwr_sw[1-2])-supply$":
> 
> IIRC, vref-ddr was a hack because a change in the regulator core broke
> the STM32MP1 boards. I believe vref-ddr should be removed altogether
> instead. It's supplied from BUCK2IN, which is already in the binding,
> so it's redundant.

Correct I forgot this point. We got random crash without this 
vddr_ref_supply but I don't know if regulator FW has been updated to fix 
it. If yes, I'll drop this one and remove
vddr_ref_supply from DT file.

> 
> Cheers,
> Ahmad
> 
>>           description: STPMIC1 voltage regulators supplies
>>   
>>         "^(buck[1-4]|ldo[1-6]|boost|vref_ddr|pwr_sw[1-2])$":
>>
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
