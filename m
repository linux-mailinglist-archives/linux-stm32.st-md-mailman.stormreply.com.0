Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE5DB1D6F3
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Aug 2025 13:51:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 40582C3F951;
	Thu,  7 Aug 2025 11:51:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6DE3EC3F950
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Aug 2025 11:51:20 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 577BcO0H029331;
 Thu, 7 Aug 2025 13:51:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 HVsSu2JQlkuMay902nxoX0MpAL4pe0AraHz4EjlfA/4=; b=1eupmTdait8w75Di
 rmc14oVpRPxnbd94Q+JTpKhZInez4rF4BakuCzwkhYQ5xJrv0nphT8jusphCOV99
 d+FC8Ki805e4PM2bbnIV5nDXr9mkd+pBtznEMX/g7+2H2nbT62V8neuAfek4X5lk
 9K7QxqiGZJU2GaMlbYlrb9fOBiqLMFVFyZBYGthQhpCzzDKq6geeCWOwHMBP1usD
 Mp5mq4H8OvsiOeK4QqEaH2x+9FTMkMS56NH9PfVAvDgJV0bbIfSW+0gdiHXZMeDS
 50nmE+6JxsyyT8OX8dUksu7zFsmsqDEwMhaXt57+O9/2sAj4nA6HvtKQjq6oL/3r
 9zqW8w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48c7pvuxqr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Aug 2025 13:51:10 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 48F9D4004A;
 Thu,  7 Aug 2025 13:50:12 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 769D671FDA0;
 Thu,  7 Aug 2025 13:49:30 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Aug
 2025 13:49:29 +0200
Message-ID: <48d20fc0-3212-499f-881f-9546607b250d@foss.st.com>
Date: Thu, 7 Aug 2025 13:49:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
References: <20250806-upstream_fix_dts_omm-v1-1-e68c15ed422d@foss.st.com>
 <9e0c5453-b8f4-4d0a-8e8d-82014aac67dd@kernel.org>
 <832fb088-8862-4bd7-82a4-0e7ad58efe76@foss.st.com>
 <5924a691-2533-4856-a169-d16c3e577c42@kernel.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <5924a691-2533-4856-a169-d16c3e577c42@kernel.org>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_02,2025-08-06_01,2025-03-28_01
Cc: devicetree@vger.kernel.org, stable@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] arm64: dts: st: Add memory-region-names
 property for stm32mp257f-ev1
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



On 8/6/25 14:44, Krzysztof Kozlowski wrote:
> On 06/08/2025 14:36, Patrice CHOTARD wrote:
>>>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>>>> ---
>>>>  arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
>>>> index 2f561ad4066544445e93db78557bc4be1c27095a..16309029758cf24834f406f5203046ded371a8f9 100644
>>>> --- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
>>>> +++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
>>>> @@ -197,6 +197,7 @@ &i2c8 {
>>>>  
>>>>  &ommanager {
>>>>  	memory-region = <&mm_ospi1>;
>>>> +	memory-region-names = "mm_ospi1";
>>>
>>> It does not look like you tested the DTS against bindings. Please run
>>> `make dtbs_check W=1` (see
>>
>> My bad, i am preparing the v2.
> Why? I claim this is not needed according to your description. You said
> it is necessary to identify "memory-map area's configuration." but
> memory-region already tells that. What exactly is not identified?

Sorry but memory-region doesn't tell if this area is dedicated to ospi1 or ospi2.

In order to set the AMCR register, which configure the memory-region split
between ospi1 and ospi2, we need to identify the ospi instance.

By using memory-region-names, it allows to identify the ospi instance it belongs to.

Thanks
Patrice

> 
> Best regards,
> Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
