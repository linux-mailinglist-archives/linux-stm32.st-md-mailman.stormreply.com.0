Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A011A3D88DE
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Jul 2021 09:32:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48F6CC597AB;
	Wed, 28 Jul 2021 07:32:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F38E9C5719C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Jul 2021 07:32:08 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16S7GS8K032279; Wed, 28 Jul 2021 09:31:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=YiN7Ert0P1D0sLmnMO0dOPrm2lLJdMkUW9cboyDkkH8=;
 b=wgEzoq8Pf1A7T2XdkhhiUcU4h6HBf2GSy3OjSxnfR6Y89Xr+dw0wII748g5jW+7mp2xU
 w5Kx7t3fRn6M+MvJUfhRe1uGQ2SOrz/YOgk4KzszUjWABcO4tVU7TJobW/D1RiBTGfEm
 7yC8K0F20mW7Un3JLZ6XRlliCyS482+D45crhFwwVxW2Efv/BGEpNJ6ipF+R0BKKvtas
 azz9T4EVF+7fC87H6tfOZMnIOSQPV7poyLSpU/HVzCOdbeCrTA6XUGUdXWGyM2B/3yYe
 Qxlvtd7kgY3SY9zlPplIEnGykTLX5w8XCPHm+17D2o9DwFOAo+JrkJ0pr/7jZ8+OGQ88 EQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3a310b8pa6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Jul 2021 09:31:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BE14510002A;
 Wed, 28 Jul 2021 09:31:56 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 674F12178D5;
 Wed, 28 Jul 2021 09:31:56 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 28 Jul
 2021 09:31:55 +0200
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20210721181040.126714-1-marex@denx.de>
 <fa16ffd9-765d-c82d-d7c3-c4cb4c867177@foss.st.com>
 <d151bcf0-773c-d694-173f-84d138b309ce@denx.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <600f2cba-f1be-7c43-46aa-c79a07a39d76@foss.st.com>
Date: Wed, 28 Jul 2021 09:31:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d151bcf0-773c-d694-173f-84d138b309ce@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-28_05:2021-07-27,
 2021-07-28 signatures=0
Cc: cniedermaier@dh-electronics.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Fix touchscreen IRQ line
 assignment on DHCOM
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

On 7/23/21 7:39 PM, Marek Vasut wrote:
> On 7/23/21 5:18 PM, Alexandre TORGUE wrote:
>> Hi Marek
>>
>> On 7/21/21 8:10 PM, Marek Vasut wrote:
>>> While 7e5f3155dcbb4 ("ARM: dts: stm32: Fix LED5 on STM32MP1 DHCOM PDK2")
>>> fixed the LED0 assignment on the PDK2 board, the same commit did not
>>> update the touchscreen IRQ line assignment, which is the same GPIO line,
>>> shared between the LED0 output and touchscreen IRQ input. To make this
>>> more convoluted, the same EXTI input (not the same GPIO line) is shared
>>> between Button B which is Active-Low IRQ, and touchscreen IRQ which is
>>> Edge-Falling IRQ, which cannot be used at the same time. In case the LCD
>>> board with touchscreen is in use, which is the case here, LED0 must be
>>> disabled, Button B must be polled, so the touchscreen interrupt works as
>>> it should.
>>>
>>> Update the touchscreen IRQ line assignment, disable LED0 and use polled
>>> GPIO button driver for Button B, since the DT here describes baseboard
>>> with LCD board.
>>>
>>> Fixes: 7e5f3155dcbb4 ("ARM: dts: stm32: Fix LED5 on STM32MP1 DHCOM 
>>> PDK2")
>>> Fixes: 34e0c7847dcf ("ARM: dts: stm32: Add DH Electronics DHCOM 
>>> STM32MP1 SoM and PDK2 board")
>>
>> I think you need to keep only one fixes tag.
> 
> Then it is the first one (LED5) if you want to pick it, or shall I 
> resend it ?

I'll do it.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
