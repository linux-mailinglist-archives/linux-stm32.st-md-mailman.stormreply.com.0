Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DBE144E8F
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Jan 2020 10:21:27 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 811F8C36B0C;
	Wed, 22 Jan 2020 09:21:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B940C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Jan 2020 09:21:26 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00M9E5T0017505; Wed, 22 Jan 2020 10:20:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=u/gZg5v5O2lvH7c3i8F88g2U2swQh0X4mBt44nns32Q=;
 b=ucm7i3HDueX2khE20HpGolwzNFjIa0Puk/Wtek/QfMVSRNXuR46O93vA/F7MaMiI6YtR
 MvS9+LEBl3UgQe6UrcIUMWfsWkJT9w7MIg8nhQhsefeADdnJNIFtJmH0Z8W4jxwWx3Qv
 jjWH5313tSr/TywHSg1WyyoqE4wTq1Sn9ffN+gJcrhI+fXag0xJ9llSbvK+PcNZGNTtG
 dipOtYSoCjk2Y9VgTWchVnZiLVQXWRTXE+FIve35owCPS+JJjFc3O5pMOTZD3Nm+2RCT
 ElVOBkgxqBld7vOoWEYVewFfiXLuGJuiexxfSqlQFXaC/BX37SkHOaH/RTI8m9bf4vPn pw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xkr1e3jkm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jan 2020 10:20:38 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 923FE10003E;
 Wed, 22 Jan 2020 10:20:30 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 36DBC2AB057;
 Wed, 22 Jan 2020 10:20:30 +0100 (CET)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 22 Jan
 2020 10:20:29 +0100
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
 SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
 15.00.1347.000; Wed, 22 Jan 2020 10:20:29 +0100
From: Olivier MOYSAN <olivier.moysan@st.com>
To: Rob Herring <robh@kernel.org>
Thread-Topic: [PATCH v3] ASoC: dt-bindings: stm32: convert spdfirx to
 json-schema
Thread-Index: AQHV0KYwQJhZ3lJcYU6nre5Twze71af2WFCA
Date: Wed, 22 Jan 2020 09:20:29 +0000
Message-ID: <6a49bf6c-8851-a65c-5606-563776e07c08@st.com>
References: <20200117170352.16040-1-olivier.moysan@st.com>
 <20200121220022.GA12737@bogus>
In-Reply-To: <20200121220022.GA12737@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <C57D8D8E50C2B442847FA8C55AFD97B6@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-17_05:2020-01-16,
 2020-01-17 signatures=0
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "perex@perex.cz" <perex@perex.cz>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v3] ASoC: dt-bindings: stm32: convert
 spdfirx to json-schema
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

Hi Rob,

I did not report your reviewed-by tag, as I have made a extra change in v2.
This change is related to dmas property reported in v2 change log.
Sorry, this extra change was indeed not clearly highlighted in log comments.

Regards
Olivier

On 1/21/20 11:00 PM, Rob Herring wrote:
> On Fri, 17 Jan 2020 18:03:52 +0100, Olivier Moysan wrote:
>> Convert the STM32 SPDIFRX bindings to DT schema format using json-schema.
>>
>> Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
>> ---
>> Changes in v2:
>> - Add "additionalProperties: false"
>> - Also change minItems to 2 for dmas property, as both DMAs are required.
>>
>> Changes in v3:
>> - Drop minItems/maxItems for dmas property, remove ref to stm32-dma.txt.
>> ---
>>   .../bindings/sound/st,stm32-spdifrx.txt       | 56 -------------
>>   .../bindings/sound/st,stm32-spdifrx.yaml      | 80 +++++++++++++++++++
>>   2 files changed, 80 insertions(+), 56 deletions(-)
>>   delete mode 100644 Documentation/devicetree/bindings/sound/st,stm32-spdifrx.txt
>>   create mode 100644 Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml
>>
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
>
> If a tag was not added on purpose, please state why and what changed.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
