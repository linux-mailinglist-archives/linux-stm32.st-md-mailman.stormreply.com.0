Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EEB4F55EC
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Apr 2022 08:20:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A6B2C6048F;
	Wed,  6 Apr 2022 06:20:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D978C60479
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Apr 2022 06:20:55 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2365XrT0013557;
 Wed, 6 Apr 2022 08:20:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=pWA9rhfIvXi7xQfjs4g7YC0QlPKyAhkJQh/gCQIhuSQ=;
 b=3ae4B4bsrbgI+RMWdVXpkMVfL6X7hfGzUxfB/h6a+ge23AUTQuieyQQF4LRK0R5o856b
 m//EtojJyA74H64+/uXZBc2LXfyhNKrOymAUrLFCTgxQPmREo/3K2GV21xzj+5w/zmmk
 6GfonvT7x3CvOezuQyv5ZK4FbdbBG7d2QxyQQbqxwCEqgVF3pcCm4uneKQ8B0MIqV2nP
 ZeJy/EnOjsmf81aPqltE4iDGq1fBJimV9PyjCMU9k9XHrD9uRnZgqreJTyP//lDCkUw6
 k9zHPMErHezC0pp3tSpYlgZDKxxyA2/tRjgV3yG01KGzzxeqQaV/PjB1tnygnOSdwFb5 hA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3f6bwk3np1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Apr 2022 08:20:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B8556100034;
 Wed,  6 Apr 2022 08:20:36 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A3BC921FE86;
 Wed,  6 Apr 2022 08:20:36 +0200 (CEST)
Received: from [10.201.21.201] (10.75.127.48) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Wed, 6 Apr
 2022 08:20:36 +0200
Message-ID: <30882dc7-c187-9d7c-726e-117a22dca4e9@foss.st.com>
Date: Wed, 6 Apr 2022 08:20:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Hugh Dickins <hughd@google.com>
References: <481a13f8-d339-f726-0418-ab4258228e91@foss.st.com>
 <95a0d1dd-bcce-76c7-97b9-8374c9913321@google.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <95a0d1dd-bcce-76c7-97b9-8374c9913321@google.com>
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-06_02,2022-04-05_01,2022-02-23_01
Cc: miklos@szeredi.hu, djwong@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-mm@kvack.org,
 mpatocka@redhat.com, zkabelac@redhat.com, linux-fsdevel@vger.kernel.org,
 lczerner@redhat.com, akpm@linux-foundation.org, bp@suse.de, hch@lst.de,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-stm32] Regression with v5.18-rc1 tag on STM32F7 and
	STM32H7 based boards
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

Hi Hugh

On 4/5/22 21:59, Hugh Dickins wrote:
> On Tue, 5 Apr 2022, Patrice CHOTARD wrote:
>>
>> We found an issue with last kernel tag v5.18-rc1 on stm32f746-disco and 
>> stm32h743-disco boards (ARMV7-M SoCs).
>>
>> Kernel hangs when executing SetPageUptodate(ZERO_PAGE(0)); in mm/filemap.c.
>>
>> By reverting commit 56a8c8eb1eaf ("tmpfs: do not allocate pages on read"), 
>> kernel boots without any issue.
> 
> Sorry about that, thanks a lot for finding.
> 
> I see that arch/arm/configs/stm32_defconfig says CONFIG_MMU is not set:
> please confirm that is the case here.

Yes i confirm, CONFIG_MMU is not set.



> 
> Yes, it looks as if NOMMU platforms are liable to have a bogus (that's my
> reading, but it may be unfair) definition for ZERO_PAGE(vaddr), and I was
> walking on ice to touch it without regard for !CONFIG_MMU.
> 
> CONFIG_SHMEM depends on CONFIG_MMU, so that PageUptodate is only needed
> when CONFIG_MMU.
> 
> Easily fixed by an #ifdef CONFIG_MMU there in mm/filemap.c, but I'll hunt
> around (again) for a better place to do it - though I won't want to touch
> all the architectures for it.  I'll post later today.

I did a quick test on my side, and yes, adding #ifdef CONFIG_MMU around 
SetPageUptodate(ZERO_PAGE(0)); allows to boot the boards.

Thanks
Patrice
> 
> Hugh
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
