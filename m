Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEE06D92A6
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Apr 2023 11:27:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C9D8C6A61D;
	Thu,  6 Apr 2023 09:27:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5FF55C6A61B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Apr 2023 09:27:27 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33683HRQ016292; Thu, 6 Apr 2023 11:27:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=P7D6ks9fp744dQCJwX2wvvZ45DwpKgXSEOKwAyv7Orw=;
 b=uQhMH1yIZOEUWHMnLYH8QQ7vfvax3WVqZB0XU/wknBY6riEt8vDMmlhxzqgG+eI48Y6Q
 h051u3sxKcrlWCVbyO/2zztSc3d/KzNhBgv2NLf9tkevKx52Egw7Cc0mwrhkuWwjCdng
 g5dCNinOPdzrFx1rPzReQ9DPJxtA1swEizMTxy51uRM12u80hpw7OXDVRqHSfm2vM77P
 Mu+VRv91jJ3JxGLCqVqcrm1Uz9EavjEUGnhoLLDwX2kf9O7ujhs6K/1oeBgqIoUJO6Lu
 8tGZHucfedIK61nAzjQdxCAyCZal/1bvd3PyAG8eBOBVhyaBWVw8RTRxygbpYIKKn7+r Pg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ps7cspmrh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Apr 2023 11:27:25 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 72E4210003E;
 Thu,  6 Apr 2023 11:27:02 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 12D8521684A;
 Thu,  6 Apr 2023 11:27:02 +0200 (CEST)
Received: from [10.201.21.210] (10.201.21.210) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Thu, 6 Apr
 2023 11:27:01 +0200
Message-ID: <7d1b13cb-9588-d4c3-73ac-ac6a5a1dacdf@foss.st.com>
Date: Thu, 6 Apr 2023 11:27:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
To: Linus Walleij <linus.walleij@linaro.org>, Stefan Hansson
 <newbyte@disroot.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20230405-pl180-busydetect-fix-v1-0-28ac19a74e5e@linaro.org>
Content-Language: en-US
From: Yann Gautier <yann.gautier@foss.st.com>
In-Reply-To: <20230405-pl180-busydetect-fix-v1-0-28ac19a74e5e@linaro.org>
X-Originating-IP: [10.201.21.210]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-06_04,2023-04-05_01,2023-02-09_01
Cc: linux-mmc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 00/13] Fix busydetect on Ux500 PL180/MMCI
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

On 4/5/23 08:50, Linus Walleij wrote:
> This series fixes a pretty serious problem in the MMCI
> busy detect handling, discovered only after going up and
> down a ladder of refactorings.
> 
> The code is written expecting the Ux500 busy detect
> to fire two interrupts: one at the start of the busy
> signalling and one at the end of the busy signalling.
> 
> The root cause of the problem seen on some devices
> is that only the first IRQ arrives, and then the device
> hangs, waiting perpetually for the next IRQ to arrive.
> 
> This is eventually solved by adding a timeout using
> a delayed work that fire after 10 ms if the busy detect
> has not stopped at this point. (Other delay spans can
> be suggested.) This is the last patch in the series.
> 
> I included the rewrite of the entire busy detect logic
> to use a state machine as this makes it way easier to
> debug and will print messages about other error
> conditions as well.
> 
> The problem affects especially the Skomer
> (Samsung GT-I9070) and Kyle (Samsung SGH-I407).
> 
> It is fine to just apply this for the -next kernel,
> despite it fixes the busy detect that has been broken
> for these devices for a while, we can think about
> backporting a simpler version of the timeout for
> stable kernels if we want.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Linus Walleij (13):
>        mmc: mmci: Only call busy_complete if callback defined
>        mmc: mmci: Clear busy_status when starting command
>        mmc: mmci: Unwind big if() clause
>        mmc: mmci: Stash status while waiting for busy
>        mmc: mmci: Break out error check in busy detect
>        mmc: mmci: Make busy complete state machine explicit
>        mmc: mmci: Retry the busy start condition
>        mmc: mmci: Use state machine state as exit condition
>        mmc: mmci: Use a switch statement machine
>        mmc: mmci: Break out a helper function
>        mmc: mmci: mmci_card_busy() from state machine
>        mmc: mmci: Drop end IRQ from Ux500 busydetect
>        mmc: mmci: Add busydetect timeout
> 
>   drivers/mmc/host/mmci.c             | 165 +++++++++++++++++++++++++++---------
>   drivers/mmc/host/mmci.h             |  17 ++++
>   drivers/mmc/host/mmci_stm32_sdmmc.c |   6 +-
>   3 files changed, 149 insertions(+), 39 deletions(-)
> ---
> base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
> change-id: 20230405-pl180-busydetect-fix-66a0360d398a
> 
> Best regards,

Hi Linus,

With this series, it is no more possible to switch to UHS modes on 
STM32MP1. I will add some traces and try to see what's wrong or missing 
to have it working again.
I've tested on STM32MP157F-EV1 board and got those traces:
[    3.186504] mmc0: Skipping voltage switch
[    3.302170] mmc0: new high speed SDHC card at address aaaa

Whereas with the previous version I had:
[    1.882084] mmc0: new ultra high speed DDR50 SDHC card at address aaaa
[    1.899142] mmcblk0: mmc0:aaaa SC16G 14.8 GiB

On STM32MP13 that can do SDR104 (tested on an internal board), it fails 
to initialized the card:
[    3.194072] mmc0: error -110 whilst initialising SD card

When adding some dynamic debug traces, I can see this in the trace:
[   78.039648] mmc0: Signal voltage switch failed, power cycling card

I'll try to add more traces to see what happens exactly.


Best regards,
Yann
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
