Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B72C8A1525
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Apr 2024 14:58:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9E58C6C83C;
	Thu, 11 Apr 2024 12:58:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3FD03C6C820
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Apr 2024 12:58:45 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43BCl6GX029833; Thu, 11 Apr 2024 14:58:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=SCP/OM/t7m+EjiP6PIvcvQc/MwCc6wLfedFPwnczz9U=; b=q2
 r76ijWKXtRiFqvL9fTrLv8DqwVeIzyFsQfcnygRPVNquSsWnMImP7RF0Ps/xdMq9
 c35oceeUjLaj5xx4xkWQUcGmuysFeg6tsNhsCZtbK1nGBm5lQ3LRBgJM47Obn6VG
 ZRE2xMSf3ShPfjFPpbW14/1yC3IQEzHbUC8eXBdvyAkserUy2CVOB2b9ExHzFXBT
 h8ChFm1JUi+JXk85GZnXrnrZfSEH42ekvWZk0TERvnFsyhPweKQRzoNr10Shk/KZ
 YvA/WjGZ2teNssP/8WQqfHWneUvmvtCzsTNMObyBsZ18+aPnBRIexZXQyodX25sX
 Ei9xy53M3hhBq7T1JhVw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xbfy13bq6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Apr 2024 14:58:24 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E705D4002D;
 Thu, 11 Apr 2024 14:58:20 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0C59A214550;
 Thu, 11 Apr 2024 14:57:38 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 11 Apr
 2024 14:57:37 +0200
Message-ID: <278bccaa-edc0-4f3d-8e9e-6159d2b47394@foss.st.com>
Date: Thu, 11 Apr 2024 14:57:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rob Herring <robh@kernel.org>, Hugues Fruchet <hugues.fruchet@foss.st.com>
References: <20240410144222.714172-1-hugues.fruchet@foss.st.com>
 <171276671618.403884.13818480350194550959.robh@kernel.org>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <171276671618.403884.13818480350194550959.robh@kernel.org>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-11_06,2024-04-09_01,2023-05-22_02
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] media: dt-bindings: media: add
 access-controllers to STM32MP25 video codecs
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

Hi Rob

On 4/10/24 18:31, Rob Herring wrote:
> 
> On Wed, 10 Apr 2024 16:42:22 +0200, Hugues Fruchet wrote:
>> access-controllers is an optional property that allows a peripheral to
>> refer to one or more domain access controller(s).
>>
>> Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
>> ---
>>   .../devicetree/bindings/media/st,stm32mp25-video-codec.yaml   | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/st,stm32mp25-video-codec.yaml: access-controllers: missing type definition
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240410144222.714172-1-hugues.fruchet@foss.st.com
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

This patch depends on STM32 firewall bus YAML which has been recently 
added in stm32-next branch. I tested it on top of stm32-next and there 
is no YAML issues (neiter dt-bindings checks nor dtbs_check). If you 
agree to ack it, I could merge it on stm32-next.

Thanks
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
