Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E213925558
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jul 2024 10:29:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F847C71280;
	Wed,  3 Jul 2024 08:29:29 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2DF09C6DD96
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jul 2024 08:29:22 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4637YLfS001949;
 Wed, 3 Jul 2024 10:28:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 6Rh2LslZMMANq25IkC1tGRBe0DiLGeoOd/wRbMxgBrk=; b=4CV489sGvTWQM9NP
 ZGgolq1vdNLKVVshdskB5IXydpfRbKETXV88CbllItmX5f0ifEJR/zx19JQrq6Yi
 s3rZdz49gs+Dof5XEN2fEu4L2i8kWcfzITe3HYviDq1Aiy2SFOHGfLV4uv1LstTK
 4QuFw41HQJFQ2x9uN+K391Rwj5YiD7PcLJwVxG7cQtttCj3CfGyAdLTCy8IX3HZg
 XVjO1P1epRuXMBU7zZSs0vbjq+fCTDoxHL0PIdwUeaAzdouj1McP5cLALgONdbR9
 RI8Z6zRolov9PiKk/f65Zq6rGabaSeZbUbEuoiFLmCJMxK7L2Us9CUUXECcRwNME
 R7x+KA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 402w7j524p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Jul 2024 10:28:57 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8FEF540048;
 Wed,  3 Jul 2024 10:28:52 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AC62A215BFA;
 Wed,  3 Jul 2024 10:28:02 +0200 (CEST)
Received: from [10.252.27.110] (10.252.27.110) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 3 Jul
 2024 10:28:01 +0200
Message-ID: <da75ec86-a701-45cc-b573-fde79bcfc104@foss.st.com>
Date: Wed, 3 Jul 2024 10:28:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rob Herring <robh@kernel.org>
References: <20240625150717.1038212-1-olivier.moysan@foss.st.com>
 <20240625150717.1038212-5-olivier.moysan@foss.st.com>
 <20240628213517.GA225013-robh@kernel.org>
Content-Language: en-US
From: Olivier MOYSAN <olivier.moysan@foss.st.com>
In-Reply-To: <20240628213517.GA225013-robh@kernel.org>
X-Originating-IP: [10.252.27.110]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_04,2024-07-02_02,2024-05-17_01
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, alsa-devel@alsa-project.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 4/8] dt-bindings: iio: dfsdm: move to
	backend framework
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

On 6/28/24 23:35, Rob Herring wrote:
> On Tue, Jun 25, 2024 at 05:07:12PM +0200, Olivier Moysan wrote:
>> Change the DFSDM binding to use the new IIO backend framework,
>> along with the adoption of IIO generic channels.
>> This binding change allows to add scaling support to the DFSDM.
>>
>> Keep the legacy binding as deprecated for backward compatibility.
>>
>> The io-backends property is supported only in generic IIO channel
>> binding.
>>
>> - Channel description with the generic binding (Audio and Analog):
>>
>>    Properties superseded by generic properties:
>>      st,adc-channels: becomes "reg" property in channel node
>>      st,adc-channel-names: becomes "label" property in channel node
>>    Properties moved to channel child node:
>>      st,adc-channel-types: becomes st,adc-channel-type
>>      st,adc-channel-clk-src, st,adc-alt-channel
>>
>> - Analog binding:
>>
>>    DFSDM filter channel is configured as an IIO backend consumer.
>>    Add io-backends property in channel child nodes.
>>
>>    DFSDM is no more configured as a channel consumer from SD modulator.
>>    Use of io-channels in DFSDM node is deprecated.
>>
>> - Audio binding:
>>
>>    DFSDM audio DAI is configured as a channel consumer from DFSDM filter.
>>    No change compare to legacy.
>>
>> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
>> ---
>>   .../bindings/iio/adc/st,stm32-dfsdm-adc.yaml  | 157 +++++++++++++++++-
>>   1 file changed, 151 insertions(+), 6 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml b/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
>> index c1b1324fa132..1802120b16b0 100644
>> --- a/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
>> +++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
>> @@ -102,9 +102,11 @@ patternProperties:
>>           items:
>>             minimum: 0
>>             maximum: 7
>> +        deprecated: true
>>   
>>         st,adc-channel-names:
>>           description: List of single-ended channel names.
>> +        deprecated: true
>>   
>>         st,filter-order:
>>           description: |
>> @@ -118,6 +120,12 @@ patternProperties:
>>         "#io-channel-cells":
>>           const: 1
>>   
>> +      '#address-cells':
>> +        const: 1
>> +
>> +      '#size-cells':
>> +        const: 0
>> +
>>         st,adc-channel-types:
>>           description: |
>>             Single-ended channel input type.
>> @@ -128,6 +136,7 @@ patternProperties:
>>           items:
>>             enum: [ SPI_R, SPI_F, MANCH_R, MANCH_F ]
>>           $ref: /schemas/types.yaml#/definitions/non-unique-string-array
>> +        deprecated: true
>>   
>>         st,adc-channel-clk-src:
>>           description: |
>> @@ -139,6 +148,7 @@ patternProperties:
>>           items:
>>             enum: [ CLKIN, CLKOUT, CLKOUT_F, CLKOUT_R ]
>>           $ref: /schemas/types.yaml#/definitions/non-unique-string-array
>> +        deprecated: true
>>   
>>         st,adc-alt-channel:
>>           description:
>> @@ -147,6 +157,7 @@ patternProperties:
>>             If not set, channel n is connected to SPI input n.
>>             If set, channel n is connected to SPI input n + 1.
>>           type: boolean
>> +        deprecated: true
>>   
>>         st,filter0-sync:
>>           description:
>> @@ -165,11 +176,64 @@ patternProperties:
>>         - compatible
>>         - reg
>>         - interrupts
>> -      - st,adc-channels
>> -      - st,adc-channel-names
>>         - st,filter-order
>>         - "#io-channel-cells"
>>   
>> +    patternProperties:
>> +      "^channel@([0-9]|1[0-9])$":
> 
> Unit-addresses are normally hex. And according to reg below, the max
> value is 8.
> 

Right. The maximum number of serial interfaces is 8.
So, the pattern can be reduced to "^channel@([0-7])$":

>> +        type: object
>> +        $ref: adc.yaml
>> +        description: Represents the external channels which are connected to the DFSDM.
>> +
>> +        properties:
>> +          reg:
>> +            items:
>> +              minimum: 0
>> +              maximum: 8
> 
> More than 1 reg entry valid? Either way, you need maxItems. Or you can
> just drop 'items'
> 

Added "maxItems: 1" and dropped items.

>> +
>> +          label:
>> +            description:
>> +              Unique name to identify which channel this is.
>> +
>> +          st,adc-channel-type:
>> +            description: |
>> +              Single-ended channel input type.
>> +              - "SPI_R": SPI with data on rising edge (default)
>> +              - "SPI_F": SPI with data on falling edge
>> +              - "MANCH_R": manchester codec, rising edge = logic 0, falling edge = logic 1
>> +              - "MANCH_F": manchester codec, rising edge = logic 1, falling edge = logic 0
>> +            items:
> 
> 'items' is for arrays, but...
> 

Removed items

>> +              enum: [ SPI_R, SPI_F, MANCH_R, MANCH_F ]
>> +            $ref: /schemas/types.yaml#/definitions/string
> 
> not an array.
> 
>> +
>> +          st,adc-channel-clk-src:
>> +            description: |
>> +              Conversion clock source.
>> +              - "CLKIN": external SPI clock (CLKIN x)
>> +              - "CLKOUT": internal SPI clock (CLKOUT) (default)
>> +              - "CLKOUT_F": internal SPI clock divided by 2 (falling edge).
>> +              - "CLKOUT_R": internal SPI clock divided by 2 (rising edge).
>> +            items:
> 
> ditto
> 

Done

>> +              enum: [ CLKIN, CLKOUT, CLKOUT_F, CLKOUT_R ]
>> +            $ref: /schemas/types.yaml#/definitions/string
>> +
>> +          st,adc-alt-channel:
>> +            description:
>> +              Must be defined if two sigma delta modulators are
>> +              connected on same SPI input.
>> +              If not set, channel n is connected to SPI input n.
>> +              If set, channel n is connected to SPI input n + 1.
>> +            type: boolean
>> +
>> +          io-backends:
>> +            description:
>> +              Used to pipe external sigma delta modulator or internal ADC backend to DFSDM channel.
> 
> How many entries (maxItems)?
> 
>> +
>> +        required:
>> +          - reg
>> +
>> +        additionalProperties: false
> 
> Put this next to the $ref for the node. And switch to
> unevaluatedProperties and drop 'label' from here.
> 

Done

>> +
>>       allOf:
>>         - if:
>>             properties:
>> @@ -199,9 +263,19 @@ patternProperties:
>>                 description:
>>                   From common IIO binding. Used to pipe external sigma delta
>>                   modulator or internal ADC output to DFSDM channel.
>> +              deprecated: true
>>   
>> -          required:
>> -            - io-channels
>> +          if:
>> +            required:
>> +              - st,adc-channels
>> +          then:
>> +            required:
>> +              - io-channels
>> +
>> +          patternProperties:
>> +            "^channel@([0-9]|1[0-9])$":
>> +              required:
>> +                - io-backends
> 
> Don't think this is needed here. If channel node is present, the
> io-backends should always be required, right? Then this can go under the
> node schema.
> 

The io-backends property is required only when we use st,stm32-dfsdm-adc 
compatible. In other words, when we are in an analog use case. In this 
case the channel is a consumer of a backend (typically a sd modulator)
In an audio use case (compatible st,stm32-dfsdm-dmic) the backend is not 
required.

BRs
Olivier

> Rob
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
