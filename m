Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD3058CBD8
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Aug 2022 18:09:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 533D4C04001;
	Mon,  8 Aug 2022 16:09:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05454C03FDB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Aug 2022 16:09:18 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 278BeAh0022290;
 Mon, 8 Aug 2022 18:09:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=rf79dk1iiMXWP3qcuM7pMgLmAweJ/wxrLQJ66XbRxFc=;
 b=S2UxETO7/2Zq2pKp71n5vrL2HZpPfqQtHZk65AhuEGIwmyT7zOZDvtmnYmuRniEw3U3M
 FhTZBIZIPBSGifuI8x7CAB30JJO7mqVd71fRol9RINJMxO4jyAbKuX+quXmakdX1Tt1D
 xT4Qm5T9Bk+tbHzZj+duojwrPeRvOBWSyipcuaQdhiHnV9pDQ0CrldPt0K+S707iDioq
 kofTBdJ1PJsLr4a1nuoiUiRT+RWbiI1xInSs1IehGeyRCsBnvsO+FD30cx1rRFWT0nqA
 lPOsnEvldrlkdjZdgAtpMp9hTdhYQAY7J9dc9vJiQTDd2jWLNks56bGKnQOBjpGX19yG rg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3hsfn0ames-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Aug 2022 18:09:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C6A5E10002A;
 Mon,  8 Aug 2022 18:09:00 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B18B3257AB8;
 Mon,  8 Aug 2022 18:09:00 +0200 (CEST)
Received: from [10.201.21.72] (10.75.127.46) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 8 Aug
 2022 18:09:00 +0200
Message-ID: <79fd7e19-ceef-14fb-5a83-603740735f8f@foss.st.com>
Date: Mon, 8 Aug 2022 18:08:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Mark Brown
 <broonie@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>
References: <20220808074051.44736-1-patrice.chotard@foss.st.com>
 <20220808074051.44736-2-patrice.chotard@foss.st.com>
 <9ad4b4a8-988e-f185-f80c-6f15f341ce8c@linaro.org>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <9ad4b4a8-988e-f185-f80c-6f15f341ce8c@linaro.org>
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-08_10,2022-08-08_01,2022-06-22_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/3] dt-bindings: spi: stm32: Add st,
 dual-flash property in st, stm32-qspi.yaml
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

Hi Krzystof

On 8/8/22 11:01, Krzysztof Kozlowski wrote:
> On 08/08/2022 10:40, patrice.chotard@foss.st.com wrote:
>> From: Patrice Chotard <patrice.chotard@foss.st.com>
>>
>> Add new property st,dual-flash which allows to use the QSPI interface as a
>> communication channel using up to 8 qspi line.
>> This mode can only be used if cs-gpios property is defined.
>>
>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>> ---
>>  Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml b/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml
>> index 6ec6f556182f..5e4f9109799e 100644
>> --- a/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml
>> +++ b/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml
>> @@ -46,6 +46,14 @@ properties:
>>        - const: tx
>>        - const: rx
>>  
>> +  st,dual-flash:
>> +    type: boolean
>> +    description:
>> +      Allows to use 8 data lines in case cs-gpios property is defined.
> 
> It's named dual-flash, but what if you want to use QSPI to connect for
> example to FPGA?
> 
> Also how is this related to parallel-memories property?

I called it "dual-flash" simply because it enable the dual flash feature of the QSPI block (bit CR_DFM : Dual Flash Mode)
which allows to use the 8 lines simultaneously of our dual QSPI block.

Best regards
Patrice


> 
> Best regards,
> Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
