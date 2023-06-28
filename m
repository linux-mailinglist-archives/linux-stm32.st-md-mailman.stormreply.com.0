Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B57A74163F
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Jun 2023 18:21:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C9D6C6B454;
	Wed, 28 Jun 2023 16:21:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 988C1C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Jun 2023 16:21:45 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35SD9iJ3001700; Wed, 28 Jun 2023 18:21:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=cANbp4lTIZBNTyBSNmcaauw6ZYCKFuy+gZZ75QOuzgo=;
 b=J2xKykgXCi1cE3T71GEW/fHR4RPb/8j49w4V28i1v0YuvSoTYyhudjvZOexJJxlw2BMw
 HH5t+0IGtmGK2hPCcUhgmfjCwFP25xNXHrN9ByZKKK6uMxzrl0x4WOdCgGF/4lZqnTU/
 4jRsdxBW4+Jv98tXRUZqSaaHJVuo29u7AeNZc0GSkU2u0QfQXhZNyhvfvB/nALT9p4ST
 RF09N+r13ndFQOXHRLKcGYAn2RmZCPZkTjEI0dmxK9MMfQoUpBap996H4+CZGGDBG2be
 /TdkkA4bl/MR9h8Pjn9b0kJ7wovOxnjmBHHJeKHFPrlHE//F52h82fL3+vB1TBuzhEa/ Zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rgngn92ad-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Jun 2023 18:21:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BD9D8100057;
 Wed, 28 Jun 2023 18:21:12 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A0A0623152C;
 Wed, 28 Jun 2023 18:21:12 +0200 (CEST)
Received: from [10.201.20.168] (10.201.20.168) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 28 Jun
 2023 18:21:12 +0200
Message-ID: <c232e3f1-b703-d8d2-7e2d-19ed3f5fc3ad@foss.st.com>
Date: Wed, 28 Jun 2023 18:21:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Mark Brown
 <broonie@kernel.org>
References: <20230627123906.147029-1-valentin.caron@foss.st.com>
 <0815474b-a8fa-f486-fc6e-a85df88ed9b9@linaro.org>
Content-Language: en-US
From: Valentin CARON <valentin.caron@foss.st.com>
In-Reply-To: <0815474b-a8fa-f486-fc6e-a85df88ed9b9@linaro.org>
X-Originating-IP: [10.201.20.168]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-28_11,2023-06-27_01,2023-05-22_02
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] spi: stm32: disable device mode with
 st, stm32f4-spi compatible
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

Hi,

On 6/27/23 15:39, Krzysztof Kozlowski wrote:
> On 27/06/2023 14:39, Valentin Caron wrote:
>> STM32 SPI driver is not capable to handle device mode with stm32f4 soc.
>> Stop probing if this case happens, and print an error with involved
>> compatible.
>>
> ...
>
>>   
>>   static const struct of_device_id stm32_spi_of_match[] = {
>> @@ -1798,8 +1802,16 @@ static int stm32_spi_probe(struct platform_device *pdev)
>>   	struct device_node *np = pdev->dev.of_node;
>>   	bool device_mode;
>>   	int ret;
>> +	const char *compatible =
>> +		of_match_device(pdev->dev.driver->of_match_table, &pdev->dev)->compatible;
> The goal was to replace it, so drop it.
Is is still needed for dev_err, so I can't
 > dev_err(&pdev->dev, "spi-slave not yet supported with %s\n", 
compatible);
>
>> +	const struct stm32_spi_cfg *cfg = (const struct stm32_spi_cfg *)
> Why do you need the cast? To drop the const? Are you sure it is really
> needed?
Effectively, this cast is useless, I will drop it.
>> +		of_device_get_match_data(&pdev->dev);
> Best regards,
> Krzysztof

Thanks,
Valentin

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
