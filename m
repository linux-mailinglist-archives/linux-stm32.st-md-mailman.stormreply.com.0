Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B054BC4E
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2019 17:04:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66BEBC5C2A7
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2019 15:04:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EFF9FC5C2A6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2019 15:04:57 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5JF1doV024433; Wed, 19 Jun 2019 17:04:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : references
 : cc : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=pmo1Bv+ES9tIvk0vtUKa8hC+z8yY1GRb510dQ0/+90Q=;
 b=IOlJAYb/oqA9f2QUTJJmwqoMPmAYrRr/f32Fu04/AM4HGOA8va0zctT+WjGZRLaSLcJA
 XKXJXaHQMZLhCwvJkjIYeR6cpMuATUB1G0WCoY+ZiNXXGtpUyAEUPAITiKKpBb2G2iqf
 u5l/Ub/ySXFkSxxdgrI7y1esXOgCgBIKLEhPOxUYr42LluLOY7HoZ9/cBDnuimJj3hJc
 n0XowaEZ1sFiHHRlLj9YZ9AEJyl7JLCnvZ0gYYK6VK+OWIIwZ7LbzvFOfXgOBg/wBC6J
 BrI6ziGDfLc0FWrDgTQQZaGeCo0kx3773cgl6Dzx3wkDEljZ+j6+3y33fB3zBNe822qK mw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t781a4jbv-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 19 Jun 2019 17:04:30 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3BD9834;
 Wed, 19 Jun 2019 15:04:30 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1AB4E2AED;
 Wed, 19 Jun 2019 15:04:30 +0000 (GMT)
Received: from [10.48.0.167] (10.75.127.48) by SFHDAG5NODE3.st.com
 (10.75.127.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 19 Jun
 2019 17:04:29 +0200
To: Olivier Moysan <olivier.moysan@st.com>
References: <1560949431-22948-1-git-send-email-olivier.moysan@st.com>
From: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <5a7c1aed-16fa-d13f-b1b4-7847319f62ec@st.com>
Date: Wed, 19 Jun 2019 17:04:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1560949431-22948-1-git-send-email-olivier.moysan@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-19_09:, , signatures=0
Cc: lars@metafoo.de, linux-iio@vger.kernel.org, pmeerw@pmeerw.net,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, knaack.h@gmx.de,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org,
 benjamin.gaignard@st.com
Subject: Re: [Linux-stm32] [PATCH 0/5] iio: adc: stm32-dfsdm: fix and
 improve output data managementiio: adc: stm32-dfsdm: fix and improve output
 data management
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

On 6/19/19 3:03 PM, Olivier Moysan wrote:
> This patch-set provides some fixes and improvements regarding output data format
> for STM32 DFSDM.
> - Fix output data resolution and saturation management in continuous mode
> - Fix data type
> - Apply same processing on data in continuous and triggered mode
> - Add fast mode support to get better resolution for output data
> - Add a comment about 16 bits data transfers
> 
> Olivier Moysan (5):
>   iio: adc: stm32-dfsdm: fix output resolution
>   iio: adc: stm32-dfsdm: fix data type
>   iio: adc: stm32-dfsdm: manage data resolution in trigger mode
>   iio: adc: stm32-dfsdm: add fast mode support
>   iio: adc: stm32-dfsdm: add comment for 16 bits record

Hi Olivier,

For the series,
Acked-by: Fabrice Gasnier <fabrice.gasnier@st.com>

Thanks,
Best Regards,
Fabrice
> 
>  drivers/iio/adc/stm32-dfsdm-adc.c | 233 +++++++++++++++++++++++++++++++-------
>  drivers/iio/adc/stm32-dfsdm.h     |  24 +++-
>  2 files changed, 208 insertions(+), 49 deletions(-)
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
