Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 917EC58ED9F
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Aug 2022 15:52:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53BA0C04001;
	Wed, 10 Aug 2022 13:52:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC989C035BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Aug 2022 13:52:56 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27A9Wteb004678;
 Wed, 10 Aug 2022 15:52:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=piHnlhdm1DFxcQ49aY1RvFb5vNaq7I7eTpLUu/D0dt8=;
 b=7gcqO79dpnMIJRV40lMblFDM9tS+pYwYwqAfz3/PDmTpBzu39TVu12fR9meWOhedeQaN
 gbM1RY6dzPSnh4hwu0kKC1hn/3Bjf6BKmgHOiCnLLJqd5GeJTBt3ThdNAfZYynKDDuP2
 0yKXj/R8hdHq1Wtq4BhDG+he0vc3gYTtoFA8SFqxXDLc8ULI8AZCLw8jlxzQWoGjFDmI
 06EkJeRkD/DNAj8Zi5DJ0nq9fdW22rLAvjt2B01m9S33wX4we1qhwrewYTI6xR+cmh0L
 OVwfAu0hzRc+ttmd0jkCRSvO2OBF2HcIgW4a4x1TnPVed//yUuLuzcpqy7we38KWd9wD BQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3huwpmcx0v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Aug 2022 15:52:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EEAA0100034;
 Wed, 10 Aug 2022 15:52:40 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E6A4122FA31;
 Wed, 10 Aug 2022 15:52:40 +0200 (CEST)
Received: from [10.201.21.72] (10.75.127.49) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Wed, 10 Aug
 2022 15:52:40 +0200
Message-ID: <cfc882a2-c8f3-0ec8-706e-a16dccc9fda7@foss.st.com>
Date: Wed, 10 Aug 2022 15:52:39 +0200
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
 <38200a6f-fdc1-fa94-7bc6-91ca528235ed@foss.st.com>
 <YvO1U7VB7WQv0oKR@sirena.org.uk>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <YvO1U7VB7WQv0oKR@sirena.org.uk>
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
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



On 8/10/22 15:40, Mark Brown wrote:
> On Wed, Aug 10, 2022 at 03:31:59PM +0200, Patrice CHOTARD wrote:
>> On 8/10/22 15:23, Mark Brown wrote:
>>> On Wed, Aug 10, 2022 at 03:15:08PM +0200, Patrice CHOTARD wrote:
> 
>>> Yes.  Though I'm not clear if the bindings actually want to enforce it
>>> there, it's a device level property not a controller level one so it
>>> might not be something where controller support gets validated.
> 
>> Ah yes, i see, parallel-memories should not be used in our qspi controller node.
>> So i can't reuse parallel-memories for my purpose.
> 
>> So i need to add a new proprietary property at controller level as done in the v1 ?
> 
> Can't the controller figure this out by looking at the properties of the
> connected devices?  You'd need to just return an error if we ever
> triggered transfer_one_message() on a device that can't support the
> operation.

It should be a solution.

I just noticed another point, property parallel-memories is an array of uint64 which represent device's size.
In case a FPGA is connected to the qspi 8 line bus, parallel-memories property will be set with what ?
simply random value to make dtbs_check happy ?

IMHO, adding a new proprietary property would be cleaner.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
