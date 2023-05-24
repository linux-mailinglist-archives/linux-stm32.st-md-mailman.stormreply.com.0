Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF8B70F82B
	for <lists+linux-stm32@lfdr.de>; Wed, 24 May 2023 16:01:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D189C6B442;
	Wed, 24 May 2023 14:01:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11C6EC01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 May 2023 14:01:35 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34OCxk8w017501; Wed, 24 May 2023 16:01:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=RAAm+AX0qyb+kRbhxWkN1xkrpeGaJzZQEwR5kRwe2Nw=;
 b=kMTpYOYiRB6jJbKtryLg7tWY8/FSoXts15ruhQzQ0ufCRJeoEitDNiPAhTePtqwL5Ou+
 2zlvdcpRXH8UkEcUMXwnvNAsbYsLfPJGTn+WQCUdM6KND3lZOw04C+Bsqvbv4Ziu3nEk
 uFAVgopKzQi09gNs+Or3Jf4yC0Q9Ym/TwemN6scyjw1NbZsRyON2iRKVEyHf063O0ghs
 Qo8s3Tj+/hTnXE5OLREvjYEPXBrf+FQDAV9EPtVebl5b8io7yIkyj9MgW360zTH0JNyj
 j581Udh60uj3NOsIzQtn4JQIjhfxdS4iCDQgr29PWbmXtMyE+vvutrRnFfOXE5NMXPuW 7g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qrspnsf9s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 May 2023 16:01:19 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2416910002A;
 Wed, 24 May 2023 16:01:18 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EC59822A6EF;
 Wed, 24 May 2023 16:01:18 +0200 (CEST)
Received: from [10.201.21.9] (10.201.21.9) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 24 May
 2023 16:01:15 +0200
Message-ID: <18a8528d-7d9d-6ed0-0045-5ee47dd39fb2@foss.st.com>
Date: Wed, 24 May 2023 16:01:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Christoph Hellwig <hch@infradead.org>
References: <20230523091350.292221-1-arnaud.pouliquen@foss.st.com>
 <20230523091350.292221-2-arnaud.pouliquen@foss.st.com>
 <ZG2yw0xZ6XGGp9E5@infradead.org>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <ZG2yw0xZ6XGGp9E5@infradead.org>
X-Originating-IP: [10.201.21.9]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-24_09,2023-05-24_01,2023-05-22_02
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 op-tee@lists.trustedfirmware.org, Jens Wiklander <jens.wiklander@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RFC PATCH 1/4] tee: Re-enable vmalloc page
 support for shared memory
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

Hello Christoph,

On 5/24/23 08:46, Christoph Hellwig wrote:
> On Tue, May 23, 2023 at 11:13:47AM +0200, Arnaud Pouliquen wrote:
>> This patch revert commit c83900393aa1 ("tee: Remove vmalloc page support")
> 
> As per the discussion back then: don't just blindly do the same dumb
> thing again and fix the interfae to actually pass in a page array,
> or iov_iter or an actually useful container that fits.
> 

I suppose your are speaking about this discussion:
https://lore.kernel.org/all/20221002002326.946620-3-ira.weiny@intel.com/

If I'm not mistaken, I should modify at tee_shm_register_kernel_buf API and
register_shm_helper inernal function, right?

Seems that Jens has also pointed out the free part...

What about having equivalent of shm_get_kernel_pages in an external helper (to
defined where to put it), could it be an alternative of the upadate of the
tee_shm API?

Thanks,
Arnaud
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
