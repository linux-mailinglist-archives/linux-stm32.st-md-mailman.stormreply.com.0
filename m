Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 06ABF47BB4
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2019 09:54:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC956CE8FFF
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2019 07:54:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 772ACCE8FFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2019 07:54:42 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5H7rvFm026612; Mon, 17 Jun 2019 09:54:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=t1pIXwC6qKMp7Evdyj53O8stjYaD2xF5xcWOfJEKCQM=;
 b=1BUzi8rYjfd3WsBgAkJxfn5BE6hVwyPAZLfVhsAK98Q1s+kQeiwYRwQWznB/j/mprjDM
 pAD0yIVXV8rz9gw17zwLiqv/+7KNwOG6Fi50uAWk0N+2wgD5IimxLb3GsdpIVM3gaN9I
 T1/m146BnSTl0/4E42WwI9qRJti4n8VL3WtrWtx1zbySpH0FapzYbUnj7Vg3VRNaazFQ
 klmbJZ2a+lh2hEqLZFd27GljA2dsmsntpUU0IKIKgWaM2f25bVGTFNluB4BAp362E2/H
 Ra6KIPoZ+OIfUg3/e7fCV9Hb4mxeIUQN31seC9Y4hvwr+P6TwqnBh8RTcYEZb04oI3NY PA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2t4nt81hc3-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 17 Jun 2019 09:54:33 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 51CF031;
 Mon, 17 Jun 2019 07:54:33 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CDCD9166A;
 Mon, 17 Jun 2019 07:54:32 +0000 (GMT)
Received: from [10.48.0.167] (10.75.127.50) by SFHDAG5NODE3.st.com
 (10.75.127.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 17 Jun
 2019 09:54:32 +0200
To: Wolfram Sang <wsa@the-dreams.de>
References: <1558020594-1498-1-git-send-email-fabrice.gasnier@st.com>
 <20190614205322.GA17899@ninjato>
From: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <b1fb50c0-b5ee-dd73-0b8e-f025dd843cbe@st.com>
Date: Mon, 17 Jun 2019 09:54:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190614205322.GA17899@ninjato>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-17_05:, , signatures=0
Cc: pierre-yves.mordret@st.com, marc.w.gonzalez@free.fr,
 linux-kernel@vger.kernel.org, fabien.dessenne@st.com,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] i2c: i2c-stm32f7: fix the get_irq
	error cases
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

On 6/14/19 10:53 PM, Wolfram Sang wrote:
> Hi Fabrice,
> 
>> +		return irq_event ? irq_event : -ENODEV;
> 
> Maybe -ENOENT instead of -ENODEV? I mean you have a dev_err there, so
> the driver core should probably also complain?
> 
> You could also shorten the ternary operator to:
> 
> 	return irq_event ? : -E<whatyouprefer>;
> 
> However, both are minor nits. If you prefer to keep the patch as is,
> fine with me.

Hi Wolfram,

Thanks for reviewing,
I've sent a v3 with your suggestions.

Regards,
Fabrice
> 
> Regards,
> 
>    Wolfram
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
