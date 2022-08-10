Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E93858ED4D
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Aug 2022 15:32:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C8ECC04001;
	Wed, 10 Aug 2022 13:32:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4F6DC035BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Aug 2022 13:32:12 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27A9jLuY021932;
 Wed, 10 Aug 2022 15:32:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=TqnqDMKtZ1WAdVHcFGOzKix6VQ7541Gz7ENNe8e4NxI=;
 b=UoDUF9PUeTVkhoQazHdXjPZaYyF9eOe22/LlYtx1fV+1kIIT1q3Zt0EVrt2OaM0oE6ai
 FTBeplTzArseunk3FfopBfZjDntvkV0I7yx/Gg7gSotBmKIGS7s3FlR8D/RmKAgahdnB
 vPLAg29fE5Mua7O2/Py/N9hjSfhmjsaWQGA8zdCG7r3/aLsgzMDb2uT2qFcQ/s5Oesyb
 u46+QgLlyjKDxwlSM0CeK0wpEz7Xu4uVh7pv5CXqczOfbYVZwYuUP6VzXVmx1U0nVnxr
 h3Hx29PrWpaX2Cw3QWZ8pksv25VJbrHtoHVLIh0pXTH0ZeRgrNPHgQ2v/AvKIYeJgM6s vg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3huwr4msff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Aug 2022 15:32:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1DCDF100034;
 Wed, 10 Aug 2022 15:32:01 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 166B82309E5;
 Wed, 10 Aug 2022 15:32:01 +0200 (CEST)
Received: from [10.201.21.72] (10.75.127.120) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Wed, 10 Aug
 2022 15:32:00 +0200
Message-ID: <38200a6f-fdc1-fa94-7bc6-91ca528235ed@foss.st.com>
Date: Wed, 10 Aug 2022 15:31:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220810093215.794977-1-patrice.chotard@foss.st.com>
 <20220810093215.794977-2-patrice.chotard@foss.st.com>
 <YvOtZtrRHd4AT+j+@sirena.org.uk>
 <d41e3814-3fab-18a3-7218-d5c28eaecff8@foss.st.com>
 <YvOxOg0vXSGrZLfP@sirena.org.uk>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <YvOxOg0vXSGrZLfP@sirena.org.uk>
X-Originating-IP: [10.75.127.120]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-10_08,2022-08-10_01,2022-06-22_01
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/2] spi: stm32_qspi: Add
 transfer_one_message() spi callback
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



On 8/10/22 15:23, Mark Brown wrote:
> On Wed, Aug 10, 2022 at 03:15:08PM +0200, Patrice CHOTARD wrote:
>> On 8/10/22 15:06, Mark Brown wrote:
> 
>>> Do we need to add something to the DT bindings to indicate that
>>> parallel-memories is valid?
> 
>> You mean in the st,stm32-qspi.yaml DT binding file ? Right i think it could be preferable to add it.
> 
> Yes.  Though I'm not clear if the bindings actually want to enforce it
> there, it's a device level property not a controller level one so it
> might not be something where controller support gets validated.

Ah yes, i see, parallel-memories should not be used in our qspi controller node.
So i can't reuse parallel-memories for my purpose.

So i need to add a new proprietary property at controller level as done in the v1 ?

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
