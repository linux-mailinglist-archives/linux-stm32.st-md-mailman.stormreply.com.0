Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E98651BDE1
	for <lists+linux-stm32@lfdr.de>; Thu,  5 May 2022 13:17:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 076FBC5F1FB;
	Thu,  5 May 2022 11:17:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BEFAAC5EC56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 May 2022 11:17:10 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2458kkDS026502;
 Thu, 5 May 2022 13:17:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=7F7Qd30mMslQ1ChrIB5EqTtg88WpZEdEmh+pFm3iuAc=;
 b=mTpA0I5YO+hfAqUnQWSWa2Lm9y5U2jzV6kyFng8CO6JBzQYSQLFql3PlG5a8wk0/R/1l
 i+/JkUGgmBQF1bONp53dqDS8lJBGjijGzNsZg0UZalERxT4BWQ7e45OgoGdtnIF4lQXU
 9QIZ7maKFaa17B64s0gqXLa0EhocnM0nGawL1ckY8fBtb36tU7JdEQqBB6spfznqwTA4
 aUrpsTvtWPf0oQJJLojuUe02U51Vp+72+F9ctLZvQjnWeA+zUlwokypYhEeG/VVVyrKk
 v3vxB0jB28tPlZMeBvX9V2P5c8PyC5c+x8tVR0JMUei6+y64+eH95mXeab5y2Ua81x3l TA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3frt893f5m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 May 2022 13:17:03 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5F14710002A;
 Thu,  5 May 2022 13:16:54 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5965121A20A;
 Thu,  5 May 2022 13:16:54 +0200 (CEST)
Received: from [10.211.8.113] (10.75.127.49) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 5 May
 2022 13:16:53 +0200
Message-ID: <5d5fcb7b-0ef9-09b2-30a8-c6b452fdd90b@foss.st.com>
Date: Thu, 5 May 2022 13:16:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20220505111434.37274-1-amelie.delaunay@foss.st.com>
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <20220505111434.37274-1-amelie.delaunay@foss.st.com>
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-05_04,2022-05-05_01,2022-02-23_01
Cc: dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 0/4] STM32 DMA pause/resume support
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

Please drop this series, truncated :(

On 5/5/22 13:14, Amelie Delaunay wrote:
> This patchset introduces pause/resume support in stm32-dma driver.
> [1/4], [2/4] and [3/4] ease the introduction of device_pause/device_resume
> ops management in [4/4].
> 
> Amelie Delaunay (4):
>    dmaengine: stm32-dma: introduce stm32_dma_sg_inc to manage
>      chan->next_sg
>    dmaengine: stm32-dma: pass DMA_SxSCR value to
>      stm32_dma_handle_chan_done()
>    dmaengine: stm32-dma: rename pm ops before dma pause/resume
>      introduction
>    dmaengine: stm32-dma: add device_pause/device_resume support
> 
>   drivers/dma/stm32-dma.c | 311 ++++++++++++++++++++++++++++++++++------
>   1 file changed, 268 insertions(+), 43 deletions(-)
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
