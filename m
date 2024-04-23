Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 313E98AE9D1
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Apr 2024 16:47:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6741C7128A;
	Tue, 23 Apr 2024 14:47:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 73B7BC57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Apr 2024 14:47:51 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43ND6DeN029735;
 Tue, 23 Apr 2024 16:47:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=tsJ3O9D5pmdcFP8aKelU9b9B12GbBogw1A8qeP8d7fU=; b=mi
 K2/9667VUERmzU2kC2m6eT0JPhU/vPE5POVystv72OjeoVs0OUxykrpdZpcJKHJA
 i9srr2let0ZDydK5fY2jjxVNCjv1Jw4PBzTZhiH2dic2QvXIX3ejP6pN9585HyMk
 gel1ZgTd5oPw/crxJ8iD9PDFiS0wDSlqkKZo12bPh+rkbNzi7ZFGvrL6OS5zr0iJ
 ESTEUcj90Amq5fPCsSqCjEsjanNRPUA8tw3q94/gdjNoKI/g9onuf9iiPl88C8Ti
 ovFrwG/8hFVRg5192XIaiLni8RK0O6z84I6JwkqoEsGseePZluRWLeeFE03q6P/i
 nxliQfiePYWMS2S7TAWQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xmq90j1m9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Apr 2024 16:47:40 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6586940044;
 Tue, 23 Apr 2024 16:47:35 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 88B6A2085D9;
 Tue, 23 Apr 2024 16:46:45 +0200 (CEST)
Received: from [10.48.86.143] (10.48.86.143) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 23 Apr
 2024 16:46:44 +0200
Message-ID: <19d55a2c-791a-4681-96ca-eb1137913e94@foss.st.com>
Date: Tue, 23 Apr 2024 16:46:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rob Herring <robh@kernel.org>
References: <20240423123302.1550592-1-amelie.delaunay@foss.st.com>
 <20240423123302.1550592-2-amelie.delaunay@foss.st.com>
 <171388024017.101826.4338039717721212935.robh@kernel.org>
Content-Language: en-US
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <171388024017.101826.4338039717721212935.robh@kernel.org>
X-Originating-IP: [10.48.86.143]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-23_12,2024-04-23_02,2023-05-22_02
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-hardening@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 01/12] dt-bindings: dma: New directory for
 STM32 DMA controllers bindings
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

On 4/23/24 15:50, Rob Herring wrote:
> 
> On Tue, 23 Apr 2024 14:32:51 +0200, Amelie Delaunay wrote:
>> Gather the STM32 DMA controllers bindings under ./dma/stm32/
>>
>> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
>> ---
>>   .../devicetree/bindings/dma/{ => stm32}/st,stm32-dma.yaml     | 4 ++--
>>   .../devicetree/bindings/dma/{ => stm32}/st,stm32-dmamux.yaml  | 4 ++--
>>   .../devicetree/bindings/dma/{ => stm32}/st,stm32-mdma.yaml    | 4 ++--
>>   3 files changed, 6 insertions(+), 6 deletions(-)
>>   rename Documentation/devicetree/bindings/dma/{ => stm32}/st,stm32-dma.yaml (97%)
>>   rename Documentation/devicetree/bindings/dma/{ => stm32}/st,stm32-dmamux.yaml (89%)
>>   rename Documentation/devicetree/bindings/dma/{ => stm32}/st,stm32-mdma.yaml (96%)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> 
> 
> doc reference errors (make refcheckdocs):
> Warning: Documentation/devicetree/bindings/spi/st,stm32-spi.yaml references a file that doesn't exist: Documentation/devicetree/bindings/dma/st,stm32-dma.yaml
> Documentation/devicetree/bindings/spi/st,stm32-spi.yaml: Documentation/devicetree/bindings/dma/st,stm32-dma.yaml
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240423123302.1550592-2-amelie.delaunay@foss.st.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

Indeed. I'll wait for reviews of the whole series before sending a v2 
fixing this warning.

Regards,
Amelie
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
