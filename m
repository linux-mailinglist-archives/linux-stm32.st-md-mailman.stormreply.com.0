Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF7F140DC3
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Jan 2020 16:25:00 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02D65C36B0F;
	Fri, 17 Jan 2020 15:25:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56EF6C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jan 2020 15:24:58 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00HFMOt4010203; Fri, 17 Jan 2020 16:24:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=CJb3tob82/wP4pbaxou0kNBLJitRDfQp4z4aVDs/O7o=;
 b=j8vTRWms+edgNbGbpLlYd5xXj9xcYsGwu1eXYUayEEhuBGjRCMK2XmfQXbrWrxAEX44a
 ejNgmfJ1YVBLYxI/2PTzjtvBoJEdKrxGydRlYhvjphd5ojveOlQe91dSZ2vL4+k/4u4g
 ZlBsHHWvRo885uaTxUCophDiXcgKpoJ+b5qqGo3VLi/38UkD2/cSIGAAG1/3QqpWI9Mz
 fRelayznU5yA2zL3gkbhjWnll8wORSWKd4FE1E9urpSFs7f3HGrehTMpIdilWaME2fi9
 2IkbZ/Vm8ZJUT04YRVMJFZnFnQ43wPmft+jn/1LujJx9VcKPmHtZV8BMPMG1MIhdqL2A Pg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xk0rkc6hr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jan 2020 16:24:54 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D9F6910002A;
 Fri, 17 Jan 2020 16:24:50 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A97962C38DA;
 Fri, 17 Jan 2020 16:24:50 +0100 (CET)
Received: from lmecxl0995.lme.st.com (10.75.127.45) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 17 Jan
 2020 16:24:50 +0100
To: Rob Herring <robh@kernel.org>
References: <20200116144524.16070-1-amelie.delaunay@st.com>
 <20200116144524.16070-2-amelie.delaunay@st.com>
 <20200117144837.GA27455@bogus>
From: Amelie DELAUNAY <amelie.delaunay@st.com>
Message-ID: <5eca6d14-27d8-0ac9-5c4f-9e0bc40d7f93@st.com>
Date: Fri, 17 Jan 2020 16:24:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200117144837.GA27455@bogus>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-17_03:2020-01-16,
 2020-01-17 signatures=0
Cc: Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>,
 devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Minas Harutyunyan <hminas@synopsys.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCHv2 1/2] dt-bindings: usb: dwc2: add support
 for STM32MP15 SoCs USB OTG HS and FS
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

On 1/17/20 3:48 PM, Rob Herring wrote:
> On Thu, Jan 16, 2020 at 03:45:23PM +0100, Amelie Delaunay wrote:
>> Add the specific compatible string for the DWC2 IP found in the STM32MP15
>> SoCs.
>> STM32MP15 SoCs uses sensing comparators to detect Vbus valid levels and
>> ID pin state. usb33d-supply described the regulator supplying Vbus and ID
>> sensing comparators.
>>
>> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
>> ---
>>   Documentation/devicetree/bindings/usb/dwc2.yaml | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml b/Documentation/devicetree/bindings/usb/dwc2.yaml
>> index 71cf7ba32237..0b86250b97a9 100644
>> --- a/Documentation/devicetree/bindings/usb/dwc2.yaml
>> +++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
>> @@ -58,6 +58,8 @@ properties:
>>         - const: st,stm32f4x9-fsotg
>>         - const: st,stm32f4x9-hsotg
>>         - const: st,stm32f7-hsotg
>> +      - const: st,stm32mp15-fsotg
>> +      - const: st,stm32mp15-hsotg
>>         - const: samsung,s3c6400-hsotg
>>   
>>     reg:
>> @@ -103,6 +105,10 @@ properties:
>>     vusb_a-supply:
>>       description: phandle to voltage regulator of analog section.
>>   
>> +  vusb33d_supply:
> 
> Not a valid regulator property.
> 

arrgh, was ok in the v1 in .txt. Will send a v3 fixing it with 
vusb33d-supply instead.

>> +    description: reference to the external VBUS and ID sensing comparators, in
>> +      order to perform OTG operation, used on STM32MP15 SoCs.
> 
> Are they external or part of the SoC? When we have Vbus sense and ID
> GPIOs, those go in the connector node, so this probably should too if
> these are board components.
> 

Yes, they are part of the SoC but external of the DWC2 IP. You can find 
them in the box "3V3 USB Detector" of PWR block diagram of STM32MP15x 
[1]. In OTG block diagram also, it corresponds to "OTG detection" box.
Behind this vusb33d supply, it is a regulator provided by PWR regulator 
driver. Maybe I should say "reference to the VBUS and ID sensing 
comparators *supply*.

[1] 
https://www.st.com/content/ccc/resource/technical/document/reference_manual/group0/51/ba/9e/5e/78/5b/4b/dd/DM00327659/files/DM00327659.pdf/jcr:content/translations/en.DM00327659.pdf

Regards,
Amelie

> Rob
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
