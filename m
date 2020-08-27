Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3013E253E85
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Aug 2020 09:03:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DEF3AC32EA6;
	Thu, 27 Aug 2020 07:03:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ECC60C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Aug 2020 07:03:08 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07R6qpS3005548; Thu, 27 Aug 2020 09:03:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=zTYlE8txNi8j4pKHdQtyqm86ciy1hB6NNeBayyhFyv4=;
 b=xV3TfPG7sPs/B1knAi2ouMJEWOkWCF5gS+9SrVj7yy768JsEC/MzqsCy7iveMwiOYEXh
 y02iEJ98W+LP7wDoVEQfk1mLfyF864qv+os2OeGWLzN92TQCpnB3Z9BWWKkHKafjF6qD
 v1R/LtWed8EkW7go6YMNqKuYCTNJPK4k74Bkkju8z4KEaF2lgSS/EKfq87Sie9uLEV6g
 sc17+1BM8wLw30AvbNm2xiUHiIGLGDZxSOIBJ9NXB1H1htpoCplMc5WrsbjxL48UF2mH
 sJ2gJTfqPlBgkoIEyhLBE8Qa6iqUypwKRsglJbapCvcymDFTNcUTkT9qDpxSzR0AaKnI ow== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 333b6xccj6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Aug 2020 09:03:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D157410002A;
 Thu, 27 Aug 2020 09:03:06 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BFD28210F88;
 Thu, 27 Aug 2020 09:03:06 +0200 (CEST)
Received: from lmecxl0889.tpe.st.com (10.75.127.47) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 27 Aug
 2020 09:03:05 +0200
To: Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20200731114732.12815-1-arnaud.pouliquen@st.com>
 <20200731114732.12815-9-arnaud.pouliquen@st.com>
 <20200825165433.GA4141387@xps15>
 <c1b81b38-c155-3183-ed67-822c4f87ec71@st.com>
 <20200826221030.GB4141387@xps15>
From: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <c6dc8282-7c84-730b-2946-378078b1e514@st.com>
Date: Thu, 27 Aug 2020 09:03:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200826221030.GB4141387@xps15>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-27_02:2020-08-27,
 2020-08-27 signatures=0
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 8/9] rpmsg: virtio: use rpmsg_ns driver to
 manage ns announcement
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



On 8/27/20 12:10 AM, Mathieu Poirier wrote:
> I had another very long look at this...  I haven't had the time to look in your
> next serie so the end result is not yet clear in my head.  But...
> 
> In __rpmsg_create_channel() the new code is testing for VIRTIO_RPMSG_F_NS in
> order to allocate the ops, which means that the rpdev that is fed to
> virtio_rpmsg_announce_create/destroy() are associated with a virtproc_info.
> Moreover there is a test in virtio_rpmsg_announce_create/destroy() that checks 
> for VIRTIO_RPMSG_F_NS already.  So if the rpdev was created from another
> interface than the name announcement then no message would be sent.  
> 
> So it seems to me that the last two patches could be dropped and things would
> still work properly.

Yes the last 2 patches concerns the TX part. Drop them could also be an option.
  
> 
> The good news is that I reviewed V2 today and things look good.  I will wait to
> review your next set before adding RB tags.  The down side is that having spent
> a fair amount of time on your set, I need to look at other people's work if I
> want to be fair to everyone.  As such I have to push back the review of your
> other set to next week.

That's fair! And this will give me time to have a look to the detach series. 

Thanks,
Arnaud

> 
> Thanks,
> Mathieu
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
