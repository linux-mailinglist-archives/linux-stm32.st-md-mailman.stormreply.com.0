Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45048824FA3
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jan 2024 09:20:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6C46C6C83C;
	Fri,  5 Jan 2024 08:20:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53398C6B452
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jan 2024 08:20:47 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 4052tkx3028984; Fri, 5 Jan 2024 09:19:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=gxrbGKGX0buop+PvuAmG2IkLu4G/QjEo0CpiUPjSvQ4=; b=tT
 6cNXeGAKaJftgTWYQ4btXPz25NJkoN6rwQ97Z+A70hxVGPC2EACwY9KlFCdwin7x
 T0eGIn7cyZvSTfTKL9FDgLEXwhSfQvbd3x/0RqhDxui/1vUCSEUHuwwZr9vaSZe9
 VdlGf5MOsb+NyVQ6ko42YO9d1nlPanGwO/RF/J4coZ/A/Hk91SlDoU+TcPWpChjc
 VMqXebLXrELMYSyaqHnkwRK2oyoxdP/Ov8ew4yZ4CDuu4GeqUPTeGL0AxMTR94Qn
 lXgr3Z1OrXzqkGP1ijFxHO1uxSOuRA4iapRhe6ZvvoZRpbUBJFP4zW8Cc7oNPSVD
 QPxxMGTmlyF9GBQaTcIw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ve9dss0v4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Jan 2024 09:19:56 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 086FC10002A;
 Fri,  5 Jan 2024 09:19:52 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C8B17210587;
 Fri,  5 Jan 2024 09:19:52 +0100 (CET)
Received: from [10.201.20.32] (10.201.20.32) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 5 Jan
 2024 09:19:50 +0100
Message-ID: <9b66bc71-08de-43bd-b7e1-4e7c9defd400@foss.st.com>
Date: Fri, 5 Jan 2024 09:19:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rob Herring <robh@kernel.org>
References: <20231212152356.345703-1-gatien.chevallier@foss.st.com>
 <20231212152356.345703-4-gatien.chevallier@foss.st.com>
 <20231221215316.GA155023-robh@kernel.org>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <20231221215316.GA155023-robh@kernel.org>
X-Originating-IP: [10.201.20.32]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-05_04,2024-01-05_01,2023-05-22_02
Cc: ulf.hansson@linaro.org, linux-iio@vger.kernel.org, catalin.marinas@arm.com,
 edumazet@google.com, Oleksii_Moisieiev@epam.com,
 krzysztof.kozlowski+dt@linaro.org, linux-phy@lists.infradead.org,
 will@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 peng.fan@oss.nxp.com, lars@metafoo.de, herbert@gondor.apana.org.au,
 Frank Rowand <frowand.list@gmail.com>, hugues.fruchet@foss.st.com,
 lee@kernel.org, kuba@kernel.org, pabeni@redhat.com, wg@grandegger.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, andi.shyti@kernel.org,
 alsa-devel@alsa-project.org, richardcochran@gmail.com,
 linux-medi.a@vger.kernel.org, mkl@pengutronix.de, linux-serial@vger.kernel.org,
 mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, arnd@kernel.org,
 rcsekar@samsung.com, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, vkoul@kernel.org, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, davem@davemloft.net,
 jic23@kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v8 03/13] dt-bindings: bus: document RIFSC
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

On 12/21/23 22:53, Rob Herring wrote:
> On Tue, Dec 12, 2023 at 04:23:46PM +0100, Gatien Chevallier wrote:
>> Document RIFSC (RIF security controller). RIFSC is a firewall controller
>> composed of different kinds of hardware resources.
>>
>> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
>> ---
>>
>> Changes in V6:
>> 	- Renamed access-controller to access-controllers
>> 	- Removal of access-control-provider property
>> 	- Removal of access-controller and access-controller-names
>> 	  declaration in the patternProperties field. Add
>> 	  additionalProperties: true in this field.
>>
>> Changes in V5:
>> 	- Renamed feature-domain* to access-control*
>>
>> Changes in V2:
>> 	- Corrected errors highlighted by Rob's robot
>> 	- No longer define the maxItems for the "feature-domains"
>> 	  property
>> 	- Fix example (node name, status)
>> 	- Declare "feature-domain-names" as an optional
>> 	  property for child nodes
>> 	- Fix description of "feature-domains" property
>>
>>   .../bindings/bus/st,stm32mp25-rifsc.yaml      | 96 +++++++++++++++++++
>>   1 file changed, 96 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml b/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml
>> new file mode 100644
>> index 000000000000..95aa7f04c739
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml
>> @@ -0,0 +1,96 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/bus/st,stm32mp25-rifsc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: STM32 Resource isolation framework security controller
>> +
>> +maintainers:
>> +  - Gatien Chevallier <gatien.chevallier@foss.st.com>
>> +
>> +description: |
>> +  Resource isolation framework (RIF) is a comprehensive set of hardware blocks
>> +  designed to enforce and manage isolation of STM32 hardware resources like
>> +  memory and peripherals.
>> +
>> +  The RIFSC (RIF security controller) is composed of three sets of registers,
>> +  each managing a specific set of hardware resources:
>> +    - RISC registers associated with RISUP logic (resource isolation device unit
>> +      for peripherals), assign all non-RIF aware peripherals to zero, one or
>> +      any security domains (secure, privilege, compartment).
>> +    - RIMC registers: associated with RIMU logic (resource isolation master
>> +      unit), assign all non RIF-aware bus master to one security domain by
>> +      setting secure, privileged and compartment information on the system bus.
>> +      Alternatively, the RISUP logic controlling the device port access to a
>> +      peripheral can assign target bus attributes to this peripheral master port
>> +      (supported attribute: CID).
>> +    - RISC registers associated with RISAL logic (resource isolation device unit
>> +      for address space - Lite version), assign address space subregions to one
>> +      security domains (secure, privilege, compartment).
>> +
>> +properties:
>> +  compatible:
>> +    contains:
>> +      const: st,stm32mp25-rifsc
> 
> This needs to be exact and include 'simple-bus'. You'll need a custom
> 'select' with the above to avoid matching all other 'simple-bus' cases.
> 
> With that,
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Thank you for the review,
I'll update this for the next version whilst applying your tag

Gatien
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
