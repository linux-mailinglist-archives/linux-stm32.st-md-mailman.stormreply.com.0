Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D60197835
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Mar 2020 12:00:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E980C36B0B;
	Mon, 30 Mar 2020 10:00:57 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A4A9BC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Mar 2020 10:00:55 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48rSdf3FPJz1rtyc;
 Mon, 30 Mar 2020 12:00:53 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48rSdd50gxz1r0c4;
 Mon, 30 Mar 2020 12:00:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id Umm6pyC2bxUh; Mon, 30 Mar 2020 12:00:52 +0200 (CEST)
X-Auth-Info: hHMGdqnHqAE6fvhPm1qMt5QwR23l1fijZnvach0Idkg=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 30 Mar 2020 12:00:52 +0200 (CEST)
To: Christophe Kerello <christophe.kerello@st.com>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
 tony@atomide.com
References: <1584975532-8038-1-git-send-email-christophe.kerello@st.com>
 <1584975532-8038-4-git-send-email-christophe.kerello@st.com>
 <f6a2c766-8ae5-fab7-e2f6-db23f39b5d91@denx.de>
 <93fce520-9269-123c-9523-173e75cdce2e@st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <94845952-ae8d-dab1-7bbe-21830d05480b@denx.de>
Date: Mon, 30 Mar 2020 11:30:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <93fce520-9269-123c-9523-173e75cdce2e@st.com>
Content-Language: en-US
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [03/12] bus: stm32-fmc2-ebi: add STM32 FMC2 EBI
	controller driver
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

On 3/30/20 11:19 AM, Christophe Kerello wrote:
> 
> 
> On 3/30/20 3:24 AM, Marek Vasut wrote:
>> On 3/23/20 3:58 PM, Christophe Kerello wrote:
>>> The driver adds the support for the STMicroelectronics FMC2 EBI
>>> controller
>>> found on STM32MP SOCs.
>>>
>>
>> On DH STM32MP1 SoM in PDK2 carrier board,
>> Tested-by: Marek Vasut <marex@denx.de>
>>
>> btw. it seems this sets BTRx DATLAT and CLKDIV to 0xf , it's "Don't
>> care" in the datasheet for Muxed mode, but then it should probably be
>> set to 0.
> 
> Hi Marek,

Hi,

> Thanks for testing.

Sure

> These 2 bit fields (BTRx DATLAT and CLKDIV) are only needed for
> synchronous transactions. Based on your bindings, the transaction type
> is asynchronous.
> CLKDIV bit fields should not be set to 0x0, as this value is reserved
> for this bit field. The driver keeps the reset value when it is not
> needed to update a bit field.

Then I guess that's fine either way.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
