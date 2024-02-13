Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF2B853572
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Feb 2024 16:58:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99209C6C83D;
	Tue, 13 Feb 2024 15:58:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 821CFC65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Feb 2024 15:58:33 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41DFfl8Z015351; Tue, 13 Feb 2024 16:58:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=/7j7puYAJdXGzVp6s9NPsesdHRXPxVYZpy3cSzTw1+k=; b=Z3
 OGAhtmBsX3EzNnf9vnuK9f5xiPfL8KXPnbhAUrp8ltB0PpZ84bso1c7mc+arFnoJ
 t0IUOEepyKndq6KgjWWbRQH8fQzt+/rsoSbsy2GGkTUp42omdve3TN4ku90xQPei
 vIQtByTB4CFeUaPCe/eP5RcWcgs6qCO9DELiuZTnm/0+ntnwjHGJ/Xj0dUT4Ug6p
 lwDEPwK8DABFYlEOuA/LOiRd9OQ4/Gnnp20g1uj0oLbtt2VAjzABY65IgDqNZU7Y
 7MUs15CRtMA4agZy0XNOK1RH81msXYIj5F7GDK6gcToHtSM61EGURc87l1DVX9gi
 040yBb9Zgx0S2EbzP9VQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3w62jsbpu4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Feb 2024 16:58:24 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 52B4840044;
 Tue, 13 Feb 2024 16:58:19 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0ADF62747D6;
 Tue, 13 Feb 2024 16:57:33 +0100 (CET)
Received: from [10.201.22.200] (10.201.22.200) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 13 Feb
 2024 16:57:32 +0100
Message-ID: <44f24885-eb62-4730-86fd-f42b3a3cca34@foss.st.com>
Date: Tue, 13 Feb 2024 16:57:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Conor Dooley
 <conor@kernel.org>
References: <20240212174822.77734-1-christophe.kerello@foss.st.com>
 <20240212174822.77734-3-christophe.kerello@foss.st.com>
 <20240212-chemicals-skinny-18eda1cfe781@spud>
 <c57b8094-be08-4ae4-ba85-f48522e5d2a8@foss.st.com>
 <52be1d88-51a1-4ec7-8aaf-6046f5a469f4@linaro.org>
From: Christophe Kerello <christophe.kerello@foss.st.com>
In-Reply-To: <52be1d88-51a1-4ec7-8aaf-6046f5a469f4@linaro.org>
X-Originating-IP: [10.201.22.200]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-13_08,2024-02-12_03,2023-05-22_02
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, vigneshr@ti.com,
 richard@nod.at, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org,
 miquel.raynal@bootlin.com, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 02/12] dt-bindings: memory-controller: st,
 stm32: add 'power-domains' property
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



On 2/13/24 12:57, Krzysztof Kozlowski wrote:
> On 13/02/2024 11:57, Christophe Kerello wrote:
>>
>>
>> On 2/12/24 19:33, Conor Dooley wrote:
>>> On Mon, Feb 12, 2024 at 06:48:12PM +0100, Christophe Kerello wrote:
>>>> From: Patrick Delaunay <patrick.delaunay@foss.st.com>
>>>>
>>>> On STM32MP25 SOC, STM32 FMC2 memory controller is in a power domain.
>>>> Allow a single 'power-domains' entry for STM32 FMC2.
>>>
>>> This should be squashed with patch 1, since they both modify the same
>>> file and this power-domain is part of the addition of mp25 support.
>>
>> Hi Conor,
>>
>> Ok, I will squash this patch with patch 1.
>>
>>>
>>> If the mp1 doesn't have power domains, shouldn't you constrain the
>>> property to mp25 only?
>>>
>>
>> As this property is optional, I do not see the need to constrain the
>> property to MP25 only, but if you think that it should be the case, I
>> will do it.
> 
> The question is: is this property valid for the old/existing variant?
> 

Hi Krzysztof,

It is not currently valid but there is a plan to move MP1 on PSCI 
OS-initiated.

Regards,
Christophe Kerello.

> Best regards,
> Krzysztof
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
