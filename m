Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C86027294F0
	for <lists+linux-stm32@lfdr.de>; Fri,  9 Jun 2023 11:25:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C585C65E58;
	Fri,  9 Jun 2023 09:25:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 651AEC06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Jun 2023 09:25:40 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35984NFU013519; Fri, 9 Jun 2023 11:25:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=xifOO1jZLHNUlZ5ScvXzZKU9qzDbfG9UnGzAsvkDh0U=;
 b=IkRaH4pkrz5I8FyXP559Tlx51tEIAz50ru8hjR8LeWRvYBG/yKrrt0Ce6+Y2w0Xn/UGB
 +1/Nvx/m8I5v6BHfrXtZc4MXZU5gBq4wILAE2LkykhvqcGJ2tNz7AaXwaYDb+Cmvq8h0
 HRjbK6qE331ylKo1ijh2QHI6j6xxPd8WDvrrPV3IyquzfEX0VVTzjJrEJY+RsPDolqYY
 40toSQn7ATqGeOPi/fx+B9q3c0QJu+lXOLLzWajOGCAuFiMCnHku6AXivCmmpUdDHH5m
 Y62QjNZ//qsxWhFiqE92XgayiMpyZTeroH/47tVtmfAFMFoCwA2r4HsQXrwilwE+T4sh IA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r3yse8sbs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Jun 2023 11:25:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EC34F10002A;
 Fri,  9 Jun 2023 11:25:26 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E5F4221ADCB;
 Fri,  9 Jun 2023 11:25:26 +0200 (CEST)
Received: from [10.252.12.6] (10.252.12.6) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 9 Jun
 2023 11:25:26 +0200
Message-ID: <1932df58-dbb7-c57b-03c0-fad337090ab9@foss.st.com>
Date: Fri, 9 Jun 2023 11:25:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: Lee Jones <lee.jones@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20230412105542.1231131-1-amelie.delaunay@foss.st.com>
Content-Language: en-US
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <20230412105542.1231131-1-amelie.delaunay@foss.st.com>
X-Originating-IP: [10.252.12.6]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-09_06,2023-06-08_01,2023-05-22_02
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [RESEND PATCH 0/2] STMFX chip init couple of fixes
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

Kind reminder on this series, pending for almost 3 months.

Thanks,
Amelie


On 4/12/23 12:55, Amelie Delaunay wrote:
> This series fixes the behavior of stm32_chip_init function in case
> of errors.
> 
> Amelie Delaunay (2):
>    mfd: stmfx: Fix error path in stmfx_chip_init
>    mfd: stmfx: Nullify stmfx->vdd in case of error
> 
>   drivers/mfd/stmfx.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
