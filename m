Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D45E56E
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Apr 2019 16:52:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59A08C35E09
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Apr 2019 14:52:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5A27C35E09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Apr 2019 14:52:58 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3TEkhZ8010167; Mon, 29 Apr 2019 16:52:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=TyPRd72EOTNxUHmCFP26ytz0WAo+pQKVeLQsjdaqgnk=;
 b=eElTUTRNNmM5K+IXe/iJ9+ne/67zKFY0vPqXABt8HzZ0tAM8KhSpDCvnu+HDdyf15AP1
 X+tv3g03fJgAzFSn4d8JrI7fJnYh05t3cjqS9JGv4nZFnCegbJtA6u6bZ0Ll4weypwhY
 K7180Q169y3lc8bSuRYkfLlPO8ceQq2F+MsAl4hIExqFH3ecnEqcF+Xm1tNIoVvpRVKz
 zLUI7GXiZGLwC8bflVL3jw/fYFc6OLn7FVxIy/ovxq9VRlLNYj1c1utPnnbsyvKoyL1h
 XYZTkLvF040jy2s6uiBjtKWKPz1eJGS0sNVODGQUSBtkHkfX1A4uvQAbAOwDCn4XBFLB CA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2s61r08hhu-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 29 Apr 2019 16:52:52 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 252FB31;
 Mon, 29 Apr 2019 14:52:52 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ED593272F;
 Mon, 29 Apr 2019 14:52:51 +0000 (GMT)
Received: from [10.48.0.131] (10.75.127.50) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 29 Apr
 2019 16:52:51 +0200
To: Vinod Koul <vkoul@kernel.org>
References: <1553689316-6231-1-git-send-email-arnaud.pouliquen@st.com>
 <20190426121751.GC28103@vkoul-mobl>
 <6894b54e-651f-1caf-d363-79d1ef0eee14@st.com>
 <20190429051310.GC3845@vkoul-mobl.Dlink>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Openpgp: preference=signencrypt
Autocrypt: addr=arnaud.pouliquen@st.com; prefer-encrypt=mutual; keydata=
 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
 8mOik8I/F6EW8XyQAA2P
Message-ID: <26fa7710-76cb-e202-a367-c2e2408b6808@st.com>
Date: Mon, 29 Apr 2019 16:52:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190429051310.GC3845@vkoul-mobl.Dlink>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-29_08:, , signatures=0
Cc: dmaengine@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] dmaengine: stm32-dma: fix residue
 calculation in stm32-dma
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



On 4/29/19 7:13 AM, Vinod Koul wrote:
> On 26-04-19, 15:41, Arnaud Pouliquen wrote:
>>>> During residue calculation. the DMA can switch to the next sg. When
>>>> this race condition occurs, the residue returned value is not valid.
>>>> Indeed the position in the sg returned by the hardware is the position
>>>> of the next sg, not the current sg.
>>>> Solution is to check the sg after the calculation to verify it.
>>>> If a transition is detected we consider that the DMA has switched to
>>>> the beginning of next sg.
>>>
>>> Now, that sounds like duct tape. Why should we bother doing that.
>>>
>>> Also looking back at the stm32_dma_desc_residue() and calls to it from
>>> stm32_dma_tx_status() am not sure we are doing the right thing
>> Please, could you explain what you have in mind here?
> 
> So when we call vchan_find_desc() that tells us if the descriptor is in
> the issued queue or not..  Ideally it should not matter if we have one
> or N descriptors issued to hardware.
> 
> So why should you bother checking for next_sg.
> 
>>> why are we looking at next_sg here, can you explain me that please
>>
>> This solution is similar to one implemented in the at_hdmac.c driver
>> (atc_get_bytes_left function).
>>
>> Yes could be consider as a workaround for a hardware issue...
>>
>> In stm32 DMA Peripheral, we can register up to 2 sg descriptors (sg1 &
>> sg2)in DMA registers, and use it in a cyclic mode (auto reload). This
>> mode is mainly use for audio transfer initiated by an ALSA driver.
>>
>> >From hardware point of view the DMA transfers first block based on sg1,
>> then it updates registers to prepare sg2 transfer, and then generates an
>> IRQ to inform that it issues the next transfer (sg2).
>>
>> Then driver can update sg1 to prepare the third transfer...
>>
>> In parallel the client driver can requests status to get the residue to
>> update internal pointer.
>> The issue is in the race condition between the call of the
>> device_tx_status ops and the update of the DMA register on sg switch.
> 
> Sorry I do not agree! You are in stm32_dma_tx_status() hold the lock and
> IRQs are disabled, so even if sg2 was loaded, you will not get an
> interrupt and wont know. By looking at sg1 register you will see that
> sg1 is telling you that it has finished and residue can be zero. That is
> fine and correct to report.
> 
> Most important thing here is that reside is for _requested_ descriptor
> and not _current_ descriptor, so looking into sg2 doesnt not fit.
> 
>> During a short time the hardware updated the registers containing the
>> sg ID but not the transfer counter(SxNDTR). In this case there is a
>> mismatch between the Sg ID and the associated transfer counter.
>> So residue calculation is wrong.
>> Idea of this patch is to perform the calculation and then to crosscheck
>> that the hardware has not switched to the next sg during the
>> calculation. The way to crosscheck is to compare the the sg ID before
>> and after the calculation.
>>
>> I tested the solution to force a new recalculation but no real solution
>> to trust the registers during this phase. In this case an approximation
>> is to consider that the DMA is transferring the first bytes of the next sg.
>> So we return the residue corresponding to the beginning of the next buffer.
> 
> And that is wrong!. The argument is 'cookie' and you return residue for
> that cookie.
> 
> For example, if you have dma txn with cookie 1, 2, 3, 4 submitted, then currently HW
> is processing cookie 2, then for tx_status on:
> cookie 1: return DMA_COMPLETE, residue 0
> cookie 2: return DMA_IN_PROGRESS, residue (read from HW)
> cookie 3: return DMA_IN_PROGRESS, residue txn length
> cookie 4: return DMA_IN_PROGRESS, residue txn length
> 
> Thanks
> 
I think i miss something in my explanation, as from my humble POV (not
enough expert in DMA framework...) we only one cookie here as only one
cyclic transfer...

Regarding your answers it looks like my sg explanation are not clear and
introduce confusions... Sorry for this, i was used sg for internal STM32
DMA driver, not for the framework API itself.

Let try retry to re-explain you the stm32 DMA cyclic mode management.

STM32 STM32 hardware:
-------------------
(ref manual:
https://www.st.com/content/ccc/resource/technical/document/reference_manual/group0/51/ba/9e/5e/78/5b/4b/dd/DM00327659/files/DM00327659.pdf/jcr:content/translations/en.DM00327659.pdf)

The stm32 DMA supports cyclic mode using a hardware double
buffer mode.
In this double buffer, we can program up to 2 transfers. When one is
completed, the DMA automatically switch on the other. This could be see
as a hardware LLI with only 2 transfer descriptors.
A hardware bit CT (current target) is used to determine the
current transfer (CT = 0 or 1).
A hardware NDT (num of data to transfer) counter can be read to
determine DMA position in current transfer.
An IRQ is generated when this CT bit is updated to allows driver to
update the double buffer for the next transfer.

On client side (a.e audio):
-------------------------
The client requests a cyclic transfer by calling
stm32_dma_prep_dma_cyclic. For instance it can request the transfer of a
buffer divided in 10 periods. In this case only one cookie submitted
(right?).

At stm32dma driver level these 10 periods are registered in an internal
software table (desc->sg_req[]).As cyclic, the last sg_req point to the
first one.

So to be able to transfer the whole software table, we have to update
the STM32 DMA double buffer at each end of transfer period.
The filed chan->next_sg points to the next sg_req in the software table.
that should be write in the STM32 DMA double buffer.

Residue calculation:
-------------------
During a transfer we can get the position in a period thanks to the
NDT(num of data to transfer) bit-field.

So the calculation is :
1) Get the NDT field value
3) add the periods remaining in the desc->sg_req[] table.

In parallel the STM32 DMA hardware updates the transfer buffer in 3 steps:
1) update CT register field.
2) Update NDT register field.
3) generate the IRQ (As you mention the IRQ is not treated during the
device_tx_status as protected from interrupts).

We are facing issue when computing the residue during the update of the
CT and the NDT. The CT and NDT can as been updated ( both or only CT...)
without driver context update (IRQ disabled).
In this case we can point to the beginning of the current transfer(
completed) instead of the next_transfer. This generates a residue error
and for audio a time-stamp regression (so video freeze or audio plop).

So the patch proposed consists in:
1) getting the current NDT value
2) reading CT and check that the hardware does not point to the next_sg.
	if yes:
	- CT has been updated by hardware but IRQ still not treated.
	- By default we consider the current_sg as completed, so we
	  point to the beginning of the next_sg buffer.

Hope that will help to clarify.
Thanks
arnaud



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
