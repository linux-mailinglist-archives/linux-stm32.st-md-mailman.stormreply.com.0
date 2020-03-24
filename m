Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 511D6190665
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Mar 2020 08:37:22 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F15ABC36B0B;
	Tue, 24 Mar 2020 07:37:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4893C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2020 07:37:20 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02O7WDpM005299; Tue, 24 Mar 2020 08:37:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=g7W4uE5VcxjxOWsb90aT0daB739c6IbaAC24AeX7vi8=;
 b=SlgEcPRad+1rytbJmKaI6MRzt+rUVRX2pcTVsM9vVxEI+w+5AE2jibLudzzPo4u0eKuQ
 U3xssMcRlSkHjeuYXt7Isep9BWehqVwK5d2TO9YSWJhLJ+w1OeLzmq0s6MXHbw9JAE1I
 TqmtvP0PGvuxKIAVBWqYHODzbVEhTEF4Ho6w8GYWyP+0h0g03CbJ/eJ4un6iz/dyzgP3
 YlioKTAVtRD7OTfUCuVJR7ncnaorMypPz23Us6w0LetP/qIhO4yj5rf02qbUMAKGaWn1
 TWjYKtA6q2IqmiTIdR775KuLVv1suXQXwWY8DJ5erHeTh7gOvUSPnrtj3F3/ZTUr60Q+ Nw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yw8xdx5fw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Mar 2020 08:37:03 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BD8EB100034;
 Tue, 24 Mar 2020 08:36:59 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A32A32126C9;
 Tue, 24 Mar 2020 08:36:59 +0100 (CET)
Received: from [10.211.5.183] (10.75.127.48) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 24 Mar
 2020 08:36:58 +0100
To: Marek Vasut <marex@denx.de>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <lee.jones@linaro.org>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <tony@atomide.com>
References: <1584975532-8038-1-git-send-email-christophe.kerello@st.com>
 <466cf542-7575-d791-da81-da32c0919505@denx.de>
From: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <156b55b5-1b09-fa7e-e3bc-a0d5dea870db@st.com>
Date: Tue, 24 Mar 2020 08:36:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <466cf542-7575-d791-da81-da32c0919505@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG6NODE1.st.com (10.75.127.16) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-24_01:2020-03-23,
 2020-03-24 signatures=0
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [00/12] add STM32 FMC2 controller drivers
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



On 3/24/20 1:37 AM, Marek Vasut wrote:
> On 3/23/20 3:58 PM, Christophe Kerello wrote:
>> The FMC2 functional block makes the interface with: synchronous and
>> asynchronous static devices (such as PSNOR, PSRAM or other memory-mapped
>> peripherals) and NAND flash memories.
>> Its main purposes are:
>>    - to translate AXI transactions into the appropriate external device
>>      protocol
>>    - to meet the access time requirements of the external devices
>> All external devices share the addresses, data and control signals with the
>> controller. Each external device is accessed by means of a unique Chip
>> Select. The FMC2 performs only one access at a time to an external device.
>>
>> Christophe Kerello (12):
>>    dt-bindings: mfd: stm32-fmc2: add STM32 FMC2 controller documentation
>>    mfd: stm32-fmc2: add STM32 FMC2 controller driver
>>    bus: stm32-fmc2-ebi: add STM32 FMC2 EBI controller driver
>>    mtd: rawnand: stm32_fmc2: manage all errors cases at probe time
>>    mtd: rawnand: stm32_fmc2: remove useless inline comments
>>    mtd: rawnand: stm32_fmc2: use FMC2_TIMEOUT_MS for timeouts
>>    mtd: rawnand: stm32_fmc2: cleanup
>>    mtd: rawnand: stm32_fmc2: use FIELD_PREP/FIELD_GET macros
>>    mtd: rawnand: stm32_fmc2: move all registers
>>    mtd: rawnand: stm32_fmc2: use regmap APIs
>>    mtd: rawnand: stm32_fmc2: use stm32_fmc2 structure in nfc controller
>>    mtd: rawnand: stm32_fmc2: add new MP1 compatible string
> 
> This doesn't apply to either next or 5.6-rc7, do you have a tree
> somewhere with those patches applied ?
> 

Hi Marek,

This implementation has been done on mtd/nand/next branch.

Regards,
Christophe Kerello.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
