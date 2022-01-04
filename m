Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BE3483FD8
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Jan 2022 11:24:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C4E8C5F1F6;
	Tue,  4 Jan 2022 10:24:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DCEB1C5F1F1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Jan 2022 10:24:37 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 204921b2032531;
 Tue, 4 Jan 2022 11:24:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=jQOEkjv+oFG4DTmflm0xSJivgDmwx+FaIxE6wZz/9xU=;
 b=UBGycnH5gW1kKxuGt1tRNpxKYvIS0YoxAFBxiA+z2Sp1zvmDlR46DksWwMX4klYy3cBo
 koaJSrl8CxsEYejv2ZlQBaN9d/Vub6XiTjNcnA9LG+6Pk1AAL5+1j5gEod3rYL8sNd4Y
 j7xhNHDqX/ZuOQVFWQtg6nm7KKVHzybbHfWhiZdWWbTm/6bEZELJ0Tos49uyRS/zvBnl
 khoFblj1DZ1f4wFqZQM11f1D/g875QIoaTIWgCveZSMwyQORzvJWCV657p/6s1RxHj4f
 a+ewcpwliQtJoMBRDzBg0HiF3j5eHd50ofyG6iCToEu5UCVvR0ypc/K4GZnLx0btsPQE Mw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dcagraa96-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 11:24:31 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3879A10002A;
 Tue,  4 Jan 2022 11:24:31 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 30B68233C82;
 Tue,  4 Jan 2022 11:24:31 +0100 (CET)
Received: from lmecxl0993.lme.st.com (10.75.127.47) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 4 Jan
 2022 11:24:30 +0100
To: Yannick Fertre <yannick.fertre@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20211215214817.20310-1-yannick.fertre@foss.st.com>
From: Philippe CORNU <philippe.cornu@foss.st.com>
Message-ID: <f40fef15-48ac-07fa-ef83-dac92a7461f9@foss.st.com>
Date: Tue, 4 Jan 2022 11:24:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211215214817.20310-1-yannick.fertre@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-04_05,2022-01-04_01,2021-12-02_01
Subject: Re: [Linux-stm32] [PATCH 3/5] drm/stm: ltdc: add per plane update
	support
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



On 12/15/21 10:48 PM, Yannick Fertre wrote:
> Recent ltdc hardware versions offer the ability
> to update a plane independently of others planes.
> This is could be useful especially if a plane is
> assigned to another OS.
> 
> Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
> ---
>   drivers/gpu/drm/stm/ltdc.c | 26 +++++++++++++++++++++++---
>   drivers/gpu/drm/stm/ltdc.h |  1 +
>   2 files changed, 24 insertions(+), 3 deletions(-)
> 

Hi Yannick,
many thanks for your patch.
Acked-by: Philippe Cornu <philippe.cornu@foss.st.com>
Reviewed-by: Philippe Cornu <philippe.cornu@foss.st.com>
Philippe :-)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
