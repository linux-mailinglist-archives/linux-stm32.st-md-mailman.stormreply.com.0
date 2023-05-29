Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D3839714559
	for <lists+linux-stm32@lfdr.de>; Mon, 29 May 2023 09:21:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4DEFCC6A608;
	Mon, 29 May 2023 07:21:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ACF04C6904B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 May 2023 07:21:30 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34T6TFJd022657; Mon, 29 May 2023 09:21:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=R7U12OfPWbuKgyybSdqlH6r+NAGEknQL5yOH75+Ki/o=;
 b=mWTzap13IJD3sGmFPOA13Bs0t5d4pbafMu/Co6c4yHZ6oMTKxRLdVzGEToWs0IGUroNE
 QP8XfIRu9woFIYgnX97OZuo95eM/AFE1JWze1wNiqzOKITvsJ1CLLDxfMBUTIlm+ZFZ/
 FBrZ6qj9twziD55xCwawiWR/CNMciHj8YUaZa+z1Br7LL4tV528fSTPjtWU59aU92Db2
 eOpkZZ6wwruqY0h27P58IQd+Br0quuuOXF5mYuYH6E/WG1ObvkGfGUCKr115WlqWnG/g
 QfRuciXKo3pg0Dsakv3Ll9/s+AK8ty6lMl0IzMFg6wbiuu/JxiG6F3KJJduixrcFexxJ SQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3quag27vxa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 May 2023 09:21:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 03EAB100039;
 Mon, 29 May 2023 09:21:04 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EEF0B2132FC;
 Mon, 29 May 2023 09:21:03 +0200 (CEST)
Received: from [10.201.21.9] (10.201.21.9) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 29 May
 2023 09:21:02 +0200
Message-ID: <312a7c7a-165c-eb17-b6af-4c708d33afb4@foss.st.com>
Date: Mon, 29 May 2023 09:17:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Christoph Hellwig <hch@infradead.org>
References: <20230523091350.292221-1-arnaud.pouliquen@foss.st.com>
 <20230523091350.292221-2-arnaud.pouliquen@foss.st.com>
 <ZG2yw0xZ6XGGp9E5@infradead.org>
 <18a8528d-7d9d-6ed0-0045-5ee47dd39fb2@foss.st.com>
 <ZHCoJEkVinvsB2lZ@infradead.org>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <ZHCoJEkVinvsB2lZ@infradead.org>
X-Originating-IP: [10.201.21.9]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-29_04,2023-05-25_03,2023-05-22_02
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



On 5/26/23 14:37, Christoph Hellwig wrote:
> On Wed, May 24, 2023 at 04:01:14PM +0200, Arnaud POULIQUEN wrote:
>>> As per the discussion back then: don't just blindly do the same dumb
>>> thing again and fix the interfae to actually pass in a page array,
>>> or iov_iter or an actually useful container that fits.
>>>
>>
>> I suppose your are speaking about this discussion:
>> https://lore.kernel.org/all/20221002002326.946620-3-ira.weiny@intel.com/
> 
> Yes.
> 
>>
>> If I'm not mistaken, I should modify at tee_shm_register_kernel_buf API and
>> register_shm_helper inernal function, right?
>>
> 
>> What about having equivalent of shm_get_kernel_pages in an external helper (to
>> defined where to put it), could it be an alternative of the upadate of the
>> tee_shm API?
> 
> I think the fundamentally right thing is to pass an iov_iter to
> register_shm_helper, and then use the new as of 6.3
> iov_iter_extract_pages helper to extract the pages from that.  For
> the kernel users you can then simply pass down an ITER_BVEC iter
> that you can fill with vmalloc pages if you want.
> 

Thanks for the advice!

Regards,
Arnaud
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
