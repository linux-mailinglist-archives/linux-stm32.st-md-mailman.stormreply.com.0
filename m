Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E02CC69F312
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Feb 2023 12:00:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8903BC6A5FC;
	Wed, 22 Feb 2023 11:00:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D497C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Feb 2023 11:00:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 780A2139F;
 Wed, 22 Feb 2023 03:01:14 -0800 (PST)
Received: from [10.57.90.101] (unknown [10.57.90.101])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 45A193F703;
 Wed, 22 Feb 2023 03:00:30 -0800 (PST)
Message-ID: <bf14c6e2-71c4-2987-28c7-e8b51636a46f@arm.com>
Date: Wed, 22 Feb 2023 11:00:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
To: Jinlong Mao <quic_jinlmao@quicinc.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Mike Leach <mike.leach@linaro.org>
References: <1dab6648-c177-17a7-0b36-821e21328753@quicinc.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <1dab6648-c177-17a7-0b36-821e21328753@quicinc.com>
Cc: Coresight ML <coresight@lists.linaro.org>,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [RFC] Add trig_ts function in STM to generate
 TRIG_TS packet periodically
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

On 21/02/2023 06:53, Jinlong Mao wrote:
> Hi all,
> 
> When there is some small packet sent from STM to ETR, the small packet 
> could be stuck between source
> and sink even if manual flush is set when disable ETR.

Why ? The manual flush should trigger a flush request upstream
and eventually cause a flush ? If this doesn't work as expected
we should try to get to the bottom of that first, before jumping
into "software work arounds".

> So there is requirement that flush the STM trace periodically after 
> enabling STM to ETR.
> 
> STM can generate TRIG_TS packet by writing to offset 0xF0 of the driver 
> STM stimulus port.
> ETR has ability to initiate a flush on seeing a TRIG_TS packet.

Why is this different from the "manual flush" and how does it help ?
Is it because one of the components doesn't respond properly to the
flush request ?


Kind regards
Suzuki

> 
> For this requirement, I want to create a sysfs node like trig_ts for STM.
> When writing 1 to this sysfs node, a timer with 1 second periodicity in 
> STM will start to generate the trig_ts packet to ETR.
> Once ETR receive the TRIG_TS packet, it will initiate a flush.
> 
> Could you please help to provide your comments on this requirement ?
> 
> Thanks
> Jinlong Mao
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
