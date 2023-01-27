Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 479C367EBCF
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Jan 2023 18:02:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB882C65E4B;
	Fri, 27 Jan 2023 17:02:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 240DEC64110
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Jan 2023 17:02:06 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30REGmZ8019692; Fri, 27 Jan 2023 18:01:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=QNH1ux7cYrF5KW+Ey5DCbKnkWudemJAed1CdOisOzwU=;
 b=aWrFglN6WN9lJ9UfkuNRCOf+eZLqOK/K/MwebDvkvlJ9BbraR7IaDQjfWJsuxG3qEl+w
 /zcbla1ATkb34/cgfv+jY98hV15W4tnl5ImuyPNlwMV+YJAdJjbH1aopG15aLRkh8wmM
 l4dhdDRjV+hC6xAWQteP9ugkWvZRUn+2SbiSOelz6JrhmEzzjMybo5hBxA3Bcimg9qnY
 zdsENVEPxj6CymobQqyNOE70uQpKyrM9lu7NqbOzhejcg3jASSLXeSHG2+UOFLtTC114
 gDpaZ6/KFUEeQG46+8MaDOHr4QDhzeheFE/3snJXRXDYFzO0erPQuMETrlvse78cpBw2 ww== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3n89chde7x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Jan 2023 18:01:06 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8FD5D100039;
 Fri, 27 Jan 2023 18:00:43 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6F28D21F0C6;
 Fri, 27 Jan 2023 18:00:43 +0100 (CET)
Received: from [10.201.21.177] (10.201.21.177) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Fri, 27 Jan
 2023 18:00:40 +0100
Message-ID: <179fe90c-0ac9-bb43-6e49-8b1d7ec520df@foss.st.com>
Date: Fri, 27 Jan 2023 18:00:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 <Oleksii_Moisieiev@epam.com>, <gregkh@linuxfoundation.org>,
 <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <alexandre.torgue@foss.st.com>, <vkoul@kernel.org>, <jic23@kernel.org>,
 <olivier.moysan@foss.st.com>, <arnaud.pouliquen@foss.st.com>,
 <mchehab@kernel.org>, <fabrice.gasnier@foss.st.com>,
 <ulf.hansson@linaro.org>, <edumazet@google.com>, <kuba@kernel.org>,
 <pabeni@redhat.com>
References: <20230127164040.1047583-1-gatien.chevallier@foss.st.com>
 <20230127164040.1047583-2-gatien.chevallier@foss.st.com>
 <1e498b93-d3bd-bd12-e991-e3f4bedf632d@linaro.org>
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <1e498b93-d3bd-bd12-e991-e3f4bedf632d@linaro.org>
X-Originating-IP: [10.201.21.177]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-27_10,2023-01-27_01,2022-06-22_01
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-iio@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-serial@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 1/6] dt-bindings: Document common
 device controller bindings
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

Hello Krzysztof,

On 1/27/23 17:49, Krzysztof Kozlowski wrote:
> On 27/01/2023 17:40, Gatien Chevallier wrote:
>> From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
>>
>> Introducing of the common device controller bindings for the controller
>> provider and consumer devices. Those bindings are intended to allow
>> divided system on chip into muliple domains, that can be used to
>> configure hardware permissions.
>>
>> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
>> ---
>>
>> No change since V1. I'm letting this patch for dependency with bindings to
>> avoid noise with dt/bindings checks. Therefore, it should be reviewed on the
>> appropriate thread.
> 
> There was a v6 already, this is v3 and I don't understand this comment.
> What do you let? Whom? If it is not for review and not for merging,
> please annotate it in the title ([IGNORE PATCH] or something).
> 

Sorry for not being clear in the previous comment.

I meant I'm letting this patch in this patch set so the dependencies on 
the feature-domain-controller.yaml file are satisfied.

I will annotate it with [IGNORE PATCH], as you suggest.

> Best regards,
> Krzysztof
> 

Best regards,
Gatien
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
