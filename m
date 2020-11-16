Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2842B3E37
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Nov 2020 09:03:20 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7310C3FADD;
	Mon, 16 Nov 2020 08:03:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E8A8C35E3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Nov 2020 08:03:17 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AG7vGmE008820; Mon, 16 Nov 2020 09:03:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=15L4NF4LrzMNBlJydk+RLjlHfpFcgIJ1T7hYPjOtdB0=;
 b=uhmJkTYquLQ7inyGjOM+A9gv0C9X54l1e483VYjVV0tBkCMF3BpuJRMZCIYCdPYbKEfL
 /rGCoUqKV/XQso7aB1IM4IzvDBQOzfTH6EpQHRm55UCXwAcSw87I+bpd7f86+Ho3dXJ8
 DPxObVRCFUI5IlBu2H5s4OfK1NYou+DoHJwNbobvmGAZXgXERIa8050wqvFJ0++fHb2k
 o4j6gT00+lGTGZT3oJHZ+vNJ+XkGlfk4KYPL+zZGb81q1/LxqbBKr5ObqDjN/q8rQC0T
 oMJYDn7ZOdS6g7BLDk8RPMqWlRPqPt0SQaSpYbdIMAI1unquI/yKxrqbXe7jaIygaviw MA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34t5k4sb7a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Nov 2020 09:03:00 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1D332100038;
 Mon, 16 Nov 2020 09:02:57 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0CA3922E841;
 Mon, 16 Nov 2020 09:02:57 +0100 (CET)
Received: from lmecxl0995.lme.st.com (10.75.127.51) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 16 Nov
 2020 09:02:55 +0100
To: Vinod Koul <vkoul@kernel.org>
References: <20201110102305.27205-1-amelie.delaunay@st.com>
 <20201116073756.GL7499@vkoul-mobl>
From: Amelie DELAUNAY <amelie.delaunay@st.com>
Message-ID: <1b91bea5-ffbf-37fb-98ac-6abc5f373375@st.com>
Date: Mon, 16 Nov 2020 09:02:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201116073756.GL7499@vkoul-mobl>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-16_02:2020-11-13,
 2020-11-16 signatures=0
Cc: Etienne Carriere <etienne.carriere@st.com>, linux-kernel@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] phy: stm32: don't print an error on
	probe deferral
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

Hi Vinod,

On 11/16/20 8:37 AM, Vinod Koul wrote:
> On 10-11-20, 11:23, Amelie Delaunay wrote:
>> Change stm32-usbphyc driver to not print an error message when the device
>> probe operation is deferred.
> 
> Applied all, thanks
> 

I'm sorry for the mess, I sent a v2 for the patch 1/2: 
https://lore.kernel.org/patchwork/patch/1336206/
Indeed, I forgot the "return" before dev_err_probe.

Do you want me to send a fix?

Regards,
Amelie
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
