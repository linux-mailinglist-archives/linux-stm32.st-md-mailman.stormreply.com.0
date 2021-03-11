Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F57533770B
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Mar 2021 16:23:40 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F76CC5718B;
	Thu, 11 Mar 2021 15:23:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6D395C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 15:23:38 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12BF72Gh030672; Thu, 11 Mar 2021 16:23:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=v+c1CwgHEdj0dQK0n2xQKNTW00bhBAc+aNy3B1sUE1s=;
 b=MM/4B72DppwMxijMqWZ1+D0idIJJuexFaVBlAKSwoz3i2LuTO/wir0GK9qNzQoatZdtJ
 CoHMDwgiSAi0uMG0llF5QmuZf/WKto07tOv2ecH7VTRrIWhmuxuQoFGs/uBxnAU0dxkL
 BknXIo/M01tLRe+5Kk2kjkub1aDewpSkc5jW6WmAnRwNTDzEiWG+5ZBhwz6Bglso5Jzv
 YtnvIDyGtt42mgP4/xVDV8xDsNY+sOpTcp+TzwOJZj2seET58Sefy+QKUhhzEwOb4/ct
 bX1q58KWr/YuMiNiHum59XdmbA8nqi3As/E/dnL/hF67RIz3sjoz42qNc44lYEd89ivC 2w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 373yrf0ce2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Mar 2021 16:23:35 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0661710002A;
 Thu, 11 Mar 2021 16:23:34 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F028B250E3E;
 Thu, 11 Mar 2021 16:23:33 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 11 Mar
 2021 16:23:33 +0100
To: <linux-kernel@vger.kernel.org>, <soc@kernel.org>
References: <20210216074929.29033-1-patrice.chotard@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <d54db26a-a5c9-e60b-d699-e2a19c229833@foss.st.com>
Date: Thu, 11 Mar 2021 16:23:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210216074929.29033-1-patrice.chotard@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-11_05:2021-03-10,
 2021-03-11 signatures=0
Cc: linux-stm32@st-md-mailman.stormreply.com,
 "patrice.chotard@st.com" <patrice.chotard@st.com>
Subject: Re: [Linux-stm32] [RESEND PATCH 0/3] MAINTAINERS: update
	STMicroelectronics email
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

Hi 

It's just a gentle reminder to not forgot this series.

Thanks

Patrice

On 2/16/21 8:49 AM, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> This series:
>   _ Update st.com to foss.st.com email for some maintainers.
>   _ Remove Vincent Abriou as STI/STM DRM driver
>   _ Add Alain Volmat as STM32 I2C/SMBUS driver maintainer
> 
> Patrice Chotard (3):
>   MAINTAINERS: Update some st.com email addresses to foss.st.com
>   MAINTAINERS: Remove Vincent Abriou for STM/STI DRM drivers.
>   MAINTAINERS: Add Alain Volmat as STM32 I2C/SMBUS maintainer
> 
>  MAINTAINERS | 31 +++++++++++++++----------------
>  1 file changed, 15 insertions(+), 16 deletions(-)
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
