Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C21108C817D
	for <lists+linux-stm32@lfdr.de>; Fri, 17 May 2024 09:32:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73B64C6DD6D;
	Fri, 17 May 2024 07:32:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6DCF3C6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 May 2024 07:32:49 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44H79nsp009975;
 Fri, 17 May 2024 09:32:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=HvU8GeBGqT8dJ0UI3cbIoZdXlAiRynjiAUrWYrcXiCo=; b=Fm
 nzMAo+sq5wW9Us60uIDdHRpCnDqt/AMwCEk9CD5t6FbyMo+Uid38fgDFdb7ZqSZX
 bFUQceF3IRwSGworx6yugo0lElGR2Dq8ltHZP1z1vTQmawqBOR7IO6/vNw/38MVn
 Oe8Afsd2UXny0ZDqKun6M4vI2YAuoWx7Hh7MYnumZ/xZwSeI6JF+lVMkeYJG3qsP
 90RDHUpoQQH9ybIyoGmfGZI7BWzD6oDTSCFva8nVOD7dWpMBH6P1WrhQnaPD8JWZ
 Muws3mA0lmmmc3rSt+HSF9ZkX1JWdTBRKuo9oJ/eBiQ5IIsRbLk0jwK+/oyDHKhc
 9bE5ZnP+USB05o3YQZJg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3y4sxv8ttk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 May 2024 09:32:20 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B919740044;
 Fri, 17 May 2024 09:32:15 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0AC34211602;
 Fri, 17 May 2024 09:30:57 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 17 May
 2024 09:30:56 +0200
Message-ID: <f94d3cd6-df2a-4c2f-b09f-e424be63ccf7@foss.st.com>
Date: Fri, 17 May 2024 09:30:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <20240426125707.585269-1-christophe.roullier@foss.st.com>
 <20240426125707.585269-11-christophe.roullier@foss.st.com>
 <43024130-dcd6-4175-b958-4401edfb5fd8@denx.de>
 <8bf3be27-3222-422d-bfff-ff67271981d8@foss.st.com>
 <9c1d80eb-03e7-4d39-b516-cbcae0d50e4a@denx.de>
 <5544e11b-25a8-4465-a7cc-f1e9b1d0f0cc@foss.st.com>
 <4b17d7e4-c135-4d91-8565-9a8b2c6341d2@lunn.ch>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <4b17d7e4-c135-4d91-8565-9a8b2c6341d2@lunn.ch>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
Cc: Marek Vasut <marex@denx.de>, Jose Abreu <joabreu@synopsys.com>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 10/11] ARM: dts: stm32: add ethernet1
 and ethernet2 for STM32MP135F-DK board
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



On 5/16/24 14:22, Andrew Lunn wrote:
>>> I suspect it might make sense to add this WoL part separately from the
>>> actual ethernet DT nodes, so ethernet could land and the WoL
>>> functionality can be added when it is ready ?
>>
>> If at the end we want to have this Wol from PHY then I agree we need to
>> wait. We could push a WoL from MAC for this node before optee driver patches
>> merge but not sure it makes sens.
> 
> In general, it is better if the PHY does WoL, since the MAC can then
> be powered down. MAC WoL should only be used when the PHY does not
> support the requested WoL configuration, but the MAC can. And
> sometimes you need to spread it over both the PHY and the MAC.
>

thanks Andrew. So lets wait the optee driver missing part.

alex


> 	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
