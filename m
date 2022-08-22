Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EA959C3F6
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Aug 2022 18:21:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26917C64118;
	Mon, 22 Aug 2022 16:21:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5974C640F3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Aug 2022 16:21:39 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27MC5uep010996;
 Mon, 22 Aug 2022 18:21:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=GhxUbNh5RCiYPiqmL1j1FpxzGmHGClyYuT8hQo3nCHY=;
 b=QVzmyqS/8QByMpz0zLd1pYktHZfBhpuda4O5DGivCNBj+rcdLme5sLy7WeBmAc/+0Is+
 cBEAQ1w+mi37EUDuMYK3yZ6nGeuUNS2TEySvzKS1N7AKjhgDzGP2vAw1+gHgmq/aD0yE
 ZE0WeZ8V5zdUbrNwiGNjNbJr4gv9vBeZbPG6ALvwPUgZ0vhItEcg5V2pOsORNqC1vPEQ
 BesAb0oQgkoNhlL0WfW8e9lWbQT3ZVivElMjvtZST1XpGZzlAxWtMgDlOn5ERk0CIEA1
 wU3U53SNvxkAO97NKMjB/LF5nVIVjT/ZE/fhR1oXyoVRjPejOB0RPwYO9mCY0AKo9ZOQ Gw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3j2x2yryc7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Aug 2022 18:21:19 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 74E6B100034;
 Mon, 22 Aug 2022 18:21:17 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DCC1224553B;
 Mon, 22 Aug 2022 18:21:17 +0200 (CEST)
Received: from [10.201.21.72] (10.75.127.116) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 22 Aug
 2022 18:21:17 +0200
Message-ID: <319927f9-5265-81fd-2c6b-7c5146d90687@foss.st.com>
Date: Mon, 22 Aug 2022 18:21:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
References: <20220816161344.2599908-1-patrice.chotard@foss.st.com>
 <166118433897.209120.16190099503428270567.b4-ty@kernel.org>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <166118433897.209120.16190099503428270567.b4-ty@kernel.org>
X-Originating-IP: [10.75.127.116]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-22_10,2022-08-22_02,2022-06-22_01
Cc: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org
Subject: Re: [Linux-stm32] (subset) [PATCH v3 0/2] spi: stm32_qspi: use QSPI
 bus as 8 lines communication channel
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

Hi Mark

I just noticed that the cleanup() callback is useless as the gpiod is 
automatically freed by devm.

As you haven't send your pull request, do you accept a fixup patch you will squash 
with patch [2/2] "spi: stm32_qspi: Add transfer_one_message() spi callback"
or standalone patch ?

Thanks
Patrice


On 8/22/22 18:05, Mark Brown wrote:
> On Tue, 16 Aug 2022 18:13:42 +0200, patrice.chotard@foss.st.com wrote:
>> From: Patrice Chotard <patrice.chotard@foss.st.com>
>>
>> The goal of this series is to allow to use QSPI bus as a 8 lines communication
>> channel for specific purpose.
>>
>> The QSPI block offers the possibility to communicate with 2 flashes in
>> parrallel using the dual flash mode, 8 data lines are then used.
>> Usage of cs-gpios populated and spi-tx-bus-width / spi-rx-bus-width both set to 8,
>> is needed to enable dual flash mode.
>>
>> [...]
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
> 
> Thanks!
> 
> [2/2] spi: stm32_qspi: Add transfer_one_message() spi callback
>       commit: b051161f44d414e736fa2b011245441bae9babd7
> 
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
> 
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
> 
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
> 
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
> 
> Thanks,
> Mark
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
