Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 851791E0E0B
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2020 14:02:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F576C36B24;
	Mon, 25 May 2020 12:02:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A279C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2020 12:02:25 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04PC1l3a014940; Mon, 25 May 2020 14:02:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=NHdYW8W6oNyWhanxcn5zOEFS7q4y89Am/D6CopAhYmk=;
 b=JFtKKQUi4O4ROFbxxgyrzAtHbjcjpobtM/X/o4qJvqQNoGZrI3B1R4YdxRN5rsCHNp4h
 ERSmkBOPeo1NNjEjKZc0joDUrYCzjg7bhBpwKJdKlXUBMK/1/8cG//nTQkmnzOoB2W7V
 z4yTvGj8ELzXL+G6Ad5vDH0nM5GBsBIUf7JByITbQ1tFLG6Z0jZBmmNSNWaTHJay1CvM
 K6vrXg8PJLBwt7sYvpEJpkMBbzB6ngS5sfeL/LbWIFp4FgaKcKBwsrFQPxDfwHCQdfYO
 u3IeViB6T+C5CewptLsukpF8wCn11zBDrdmUHh0n87+5yp68jw01hics9UlBCDLoYy26 pw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 316rya28ch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 May 2020 14:02:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 99413100034;
 Mon, 25 May 2020 14:02:16 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8B9DB21F673;
 Mon, 25 May 2020 14:02:16 +0200 (CEST)
Received: from lmecxl0995.lme.st.com (10.75.127.45) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 25 May
 2020 14:02:15 +0200
To: Lee Jones <lee.jones@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>
References: <20200422090833.9743-1-amelie.delaunay@st.com>
From: Amelie DELAUNAY <amelie.delaunay@st.com>
Message-ID: <f5b3df45-a01a-7cb6-c158-e6edc0117f0f@st.com>
Date: Mon, 25 May 2020 14:02:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200422090833.9743-1-amelie.delaunay@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-05-25_07:2020-05-25,
 2020-05-25 signatures=0
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 0/3] STMFX power related fixes
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

Hi,

Gentle reminder regarding this series sent one month ago.

Regards,
Amelie

On 4/22/20 11:08 AM, Amelie Delaunay wrote:
> With suspend/resume tests on STM32MP157C-EV1 board, on which STMFX is used by
> several devices, some errors could occurred: -6 when trying to restore STMFX
> registers, spurious interrupts after disabling supply...
> This patchset fixes all these issues and cleans IRQ init error path.
> 
> Amelie Delaunay (3):
>    mfd: stmfx: reset chip on resume as supply was disabled
>    mfd: stmfx: fix stmfx_irq_init error path
>    mfd: stmfx: disable irq in suspend to avoid spurious interrupt
> 
>   drivers/mfd/stmfx.c       | 22 ++++++++++++++++++++--
>   include/linux/mfd/stmfx.h |  1 +
>   2 files changed, 21 insertions(+), 2 deletions(-)
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
