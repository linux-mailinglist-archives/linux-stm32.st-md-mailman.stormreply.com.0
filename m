Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0148B34A39D
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Mar 2021 10:05:47 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A33C5C57B79;
	Fri, 26 Mar 2021 09:05:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7F24C57B60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Mar 2021 09:05:44 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12Q91f9o008067; Fri, 26 Mar 2021 10:05:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=SfGDczMFdVs4NsLs7fVrUK95O9Wm/idmWV1zG/3B7ks=;
 b=jL43Rz2N0zLtHTkJh3ufuzEUV8+Z3TbBptIr1IKRqDN8NAiocMg+wO/0XU2hGOyNDTwW
 ji0JrhS0pLXUYBZWbzfUe4zCkA4B5smB/bpIbu1BRy37/gKzIgYmcHW+3MjOekBfu7St
 +q7Odmf1I+Vxhl+x5/cxHpAi37/K5p9/CPuFZLWZVAunbLZSc00vGWhtHFFLfDsMBufx
 5tAJqD6zymWVKRgUiyp7ZUFhcOST0nnyDAAtKv8fEvUiVNXv7PPjlQUvEJ/6C99kbPBv
 iKsINgVvkqEB7VtkWTM2NLgG8bxpW2PuFoTM6SF0eP5EuQXhC4FCK806xy2XFqWfvED8 rg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37h136320v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Mar 2021 10:05:35 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4A44A100034;
 Fri, 26 Mar 2021 10:05:34 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 323C924187A;
 Fri, 26 Mar 2021 10:05:34 +0100 (CET)
Received: from lmecxl0995.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 26 Mar
 2021 10:05:33 +0100
To: Rob Herring <robh@kernel.org>
References: <20210317160954.15487-1-amelie.delaunay@foss.st.com>
 <20210317160954.15487-2-amelie.delaunay@foss.st.com>
 <20210326002851.GA2031564@robh.at.kernel.org>
From: Amelie DELAUNAY <amelie.delaunay@foss.st.com>
Message-ID: <5c0d0bc5-1243-fcda-4578-da6cad80c53c@foss.st.com>
Date: Fri, 26 Mar 2021 10:05:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210326002851.GA2031564@robh.at.kernel.org>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-26_02:2021-03-26,
 2021-03-26 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-phy@lists.infradead.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] dt-bindings: phy: add vbus-supply
 optional property to phy-stm32-usbphyc
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

Hi Rob,

On 3/26/21 1:28 AM, Rob Herring wrote:
> On Wed, Mar 17, 2021 at 05:09:53PM +0100, Amelie Delaunay wrote:
>> This patch adds vbus-supply optional property to phy sub-nodes.
>> A regulator for USB VBUS may be needed for host mode.
>>
>> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
>> ---
>>   Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml b/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml
>> index 018cc1246ee1..ad2378c30334 100644
>> --- a/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml
>> +++ b/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml
>> @@ -71,6 +71,9 @@ patternProperties:
>>         phy-supply:
>>           description: regulator providing 3V3 power supply to the PHY.
>>   
>> +      vbus-supply:
>> +        description: regulator providing 5V Vbus to the USB connector.
> 
> Unless Vbus is powering the phy, then this only belongs in the USB
> connector node.
> 

Do you mean I should declare a connector node as a child of the phy node 
and get the vbus-supply property from this connector node ?

In case of a on-board autonomous hub between the phy and the connectors, 
so no driver to drive it nor to get the vbus-supply property to provide 
VBUS to the hub, then the connectors, how to use connector ?

[USB controller]===[USB PHY]===[(USB HUB)]===|> USB A connector
                               /              |> USB A connector
                             VBUS             |> USB A connector
                                              |> USB A connector

Please advise.

Regards,
Amelie

>> +
>>         "#phy-cells":
>>           enum: [ 0x0, 0x1 ]
>>   
>> -- 
>> 2.17.1
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
