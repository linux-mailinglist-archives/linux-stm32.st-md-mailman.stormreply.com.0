Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF6B59D2DC
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Aug 2022 10:01:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E5403C640F3;
	Tue, 23 Aug 2022 08:01:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D5B4C03FE1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Aug 2022 08:01:20 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27N78hfE024458;
 Tue, 23 Aug 2022 10:01:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=VGil/aQXx8aFFdqtu8yfkzPoDDu+4QVF29mk2llx6+8=;
 b=N9lwxC7NsIUCP0sm2Hnh3ay+sQefIWD7kA9YKHUTuFXYHPNd/5Jg05EqYI1sZ8DfbfYh
 vXP/V9YUaCg8X3TVf9qRZk7lSpivWDXlWCmJlkY5pL4B1SrJCHLpiOe7D9kev/GY1qrF
 SyLqOiZPXMHem1w26SvGpGqS45paQpZ7FcQYavzzJSTRtJZw/hIh24FiR4QIfJM6WT8+
 ARPRw52ob7XKWL2D6z0J+EKE7UmsJttycHPTkuPB0Tjd41+QzKqKlZd3jLr2YSUbdh6X
 uXq8m2hcWqP8IFTqcsYDBl+ViSgqOjivOM8thhYB4gRmDv7eF+wK7RR+NbYpCGGOWEQ7 +w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3j2x2rckyx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Aug 2022 10:01:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C7CA510002A;
 Tue, 23 Aug 2022 10:01:06 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BFFE3216EF4;
 Tue, 23 Aug 2022 10:01:06 +0200 (CEST)
Received: from [10.201.21.72] (10.75.127.47) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 23 Aug
 2022 10:01:06 +0200
Message-ID: <cd7ba3ad-c6d8-618a-c11c-f8b719236af1@foss.st.com>
Date: Tue, 23 Aug 2022 10:01:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220816161344.2599908-1-patrice.chotard@foss.st.com>
 <166118433897.209120.16190099503428270567.b4-ty@kernel.org>
 <319927f9-5265-81fd-2c6b-7c5146d90687@foss.st.com>
 <YwOz4MJ5zc4YOb4s@sirena.org.uk>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <YwOz4MJ5zc4YOb4s@sirena.org.uk>
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-23_03,2022-08-22_02,2022-06-22_01
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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

On 8/22/22 18:50, Mark Brown wrote:
> On Mon, Aug 22, 2022 at 06:21:16PM +0200, Patrice CHOTARD wrote:
>> Hi Mark
>>
>> I just noticed that the cleanup() callback is useless as the gpiod is 
>> automatically freed by devm.
>>
>> As you haven't send your pull request, do you accept a fixup patch you will squash 
>> with patch [2/2] "spi: stm32_qspi: Add transfer_one_message() spi callback"
>> or standalone patch ?
> 
> Normally you should just send an incremental patch but since it was the
> top commit of the branch and I only just pushed it I've dropped this
> commit (b051161f44d414e736fa2b011245441bae9babd7) so you can resend
> with the fix squashed in if you want.


I have resubmited the patch with the fix squashed in : 
https://lore.kernel.org/linux-spi/20220823075850.575043-1-patrice.chotard@foss.st.com/T/#t

Thanks
Patrice
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
