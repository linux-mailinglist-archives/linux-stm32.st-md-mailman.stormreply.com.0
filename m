Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C52B42706
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Sep 2025 18:37:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB60AC36B2E;
	Wed,  3 Sep 2025 16:37:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B740C36B2C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Sep 2025 16:37:33 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583GF4h9004481;
 Wed, 3 Sep 2025 18:37:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 dWrHhZZ5Y+olcUt6NWxG3dwik630us9WBSc1ItXrPyA=; b=jwNFTUJVQWe3AyRQ
 BLz2ELpsAgKAhizZ89xkl9oXPtRcy4FzgmTFpEjmGC0A1Kl7rPIt39oz29kCYtwV
 YCjBXyVwyK+Dkrvtaf53HdguP4+kKW6vRDHovmWpdBwMGVgekoaI6I9CCYDPRffJ
 WkZv54WRwVC11tzmDifVWwgruXmYhKIP38le9pYA/jMRDo54A8Rwzx8DZhqt9iov
 kw+q95DEJVxhnwLD5x0Pk+dQfAZVLE/KzK5WyLIcKBOjdukU2sPwtg0be3BHZavT
 vtSMcErkSUS260hwQcjk5ygM8CiS6E1743qkhnk+4G094DJ77qkbLHQgIILrE++3
 ScBuMg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48vav2qrj4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Sep 2025 18:37:27 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2956940045;
 Wed,  3 Sep 2025 18:36:39 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 53CAF39EDBD;
 Wed,  3 Sep 2025 18:36:16 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 3 Sep
 2025 18:36:15 +0200
Message-ID: <7d810c0d-12f4-42da-b6d9-b981ef5415eb@foss.st.com>
Date: Wed, 3 Sep 2025 18:36:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jonathan Corbet <corbet@lwn.net>, Akshaykumar Gunari
 <akshaygunari@gmail.com>, <mcoquelin.stm32@gmail.com>
References: <20250807145119.2214-1-akshaygunari@gmail.com>
 <078fb552-c848-49ef-b917-14aec0e4b6aa@foss.st.com>
 <87plc7zlcx.fsf@trenco.lwn.net>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <87plc7zlcx.fsf@trenco.lwn.net>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_08,2025-08-28_01,2025-03-28_01
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH RESEND] docs: arm: stm32: fix typo
	"busses" -> "buses"
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

Hi Jon

On 9/3/25 16:01, Jonathan Corbet wrote:
> Alexandre TORGUE <alexandre.torgue@foss.st.com> writes:
> 
>> Hi
>>
>> On 8/7/25 16:51, Akshaykumar Gunari wrote:
>>> Fix the spelling of "busses" to the preferred form "buses" in STM32 ARM
>>> architecture documentation.
>>>
>>> Signed-off-by: Akshaykumar Gunari <akshaygunari@gmail.com>
>>> ---
>>>    Documentation/arch/arm/stm32/stm32f746-overview.rst  | 2 +-
>>>    Documentation/arch/arm/stm32/stm32f769-overview.rst  | 2 +-
>>>    Documentation/arch/arm/stm32/stm32h743-overview.rst  | 2 +-
>>>    Documentation/arch/arm/stm32/stm32h750-overview.rst  | 2 +-
>>>    Documentation/arch/arm/stm32/stm32mp13-overview.rst  | 2 +-
>>>    Documentation/arch/arm/stm32/stm32mp151-overview.rst | 2 +-
>>>    6 files changed, 6 insertions(+), 6 deletions(-)
>>>
>>
>> Applied on stm32-next.
> 
> I had already done so (and copied you) on August 12.  I can drop my
> copy, I suppose, if that's how you want to do it?

Sorry I missed it. Let me drop it on my side (my fault).

Thank
Alex

> 
> Thanks,
> 
> jon

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
