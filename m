Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED731D28ED
	for <lists+linux-stm32@lfdr.de>; Thu, 14 May 2020 09:40:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD450C36B13;
	Thu, 14 May 2020 07:40:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0095CC36B10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2020 07:40:15 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04E7X8dr013496; Thu, 14 May 2020 09:40:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=SpEvreKtB+MBazylqO4KkqjFJKRyk5rMPdajWCqdW74=;
 b=yCM4XEEXFY9SoRsTSHZEY9AEh57E74V74fmTZXm3ck9QbjUUud4TOF6GD4yR33DLlOC4
 3MlDS1Y/SNxkbP3U9iYJiwjihRZ4AguTw6iLZxUmefK9etQZphd0rK1DIE3yKtaFKOSy
 CTzIAKDrjVaBA3H388fZT29cVei7U/T/btNO+CO56VPMk/Y+gY0XGDLLPgNFUMER/AM+
 wt0ewGUjoWttF5l8Zr+LzseFAzU6K1KK5XRJMWMCxF+6+nj1DzY8MrdxVntnS8tQggYx
 uofT9FaTm2lVVxeqc7LFLn2CJ8YS7EjV6CeOBfXEEMeyNYjoO6NJ7kge80OCiyZDPybq 1w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3100vyhjd7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 May 2020 09:40:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3AC3A10002A;
 Thu, 14 May 2020 09:39:55 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E1C3C2A594D;
 Thu, 14 May 2020 09:39:55 +0200 (CEST)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 14 May
 2020 09:39:55 +0200
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Thu, 14 May 2020 09:39:55 +0200
From: Benjamin GAIGNARD <benjamin.gaignard@st.com>
To: Rob Herring <robh@kernel.org>
Thread-Topic: [PATCH v3] dt-bindings: mfd: Convert stmfx bindings to
 json-schema
Thread-Index: AQHV6An9BN3fbiJe+Uu+wK6+EyGnQqgtoL2AgHnzXwA=
Date: Thu, 14 May 2020 07:39:55 +0000
Message-ID: <70ee04c9-4f65-6909-32bc-a379c21a031e@st.com>
References: <20200220162246.8334-1-benjamin.gaignard@st.com>
 <20200226162125.GA13349@bogus>
In-Reply-To: <20200226162125.GA13349@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <38B5556472D33343A6C2240B0D499256@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-14_01:2020-05-13,
 2020-05-14 signatures=0
Cc: "mark.rutland@arm.co" <mark.rutland@arm.co>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v3] dt-bindings: mfd: Convert stmfx
 bindings to json-schema
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



On 2/26/20 5:21 PM, Rob Herring wrote:
> On Thu, 20 Feb 2020 17:22:46 +0100, Benjamin Gaignard wrote:
>> Convert stmfx bindings to json-schema
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
>> ---
>>   .../devicetree/bindings/mfd/st,stmfx.yaml          | 124 +++++++++++++++++++++
>>   Documentation/devicetree/bindings/mfd/stmfx.txt    |  28 -----
>>   .../devicetree/bindings/pinctrl/pinctrl-stmfx.txt  | 116 -------------------
>>   3 files changed, 124 insertions(+), 144 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/mfd/st,stmfx.yaml
>>   delete mode 100644 Documentation/devicetree/bindings/mfd/stmfx.txt
>>   delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-stmfx.txt
>>
Hi Lee, Rob,

I haven't been able to found this patch in -next branches, can one of 
you merge it ?

Thanks,
Benjamin
> Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
