Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B6B3406A9
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Mar 2021 14:17:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A631C57B7C;
	Thu, 18 Mar 2021 13:17:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7645BC57B77
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Mar 2021 13:16:59 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12ID1rwX030658; Thu, 18 Mar 2021 14:16:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Q3fg+ZhC8rZuokIL+rmXhyDST60kwy28bssDlRJCJTs=;
 b=UI1PqTnpEkDEbAg4dEZJeMIWaZqEa+9pMo6F9AzVYrmqtw7DheWkSTRf2jSnjNDRQnJ1
 zJF7ADFpgt8BjmYD80UNPbt+CgoHNJjNr58JVxdBrER4m0Mmi/hRjmjih3m4HRawkg7A
 csqhnLwzNBoCVRJeNplZF3ZIy00hTZNQJZnxCK++djXmqP9Wg91pP3v5vje3USFr82bw
 gxRBW2mOYvMKJKbS28lIr9jK4zl+N90pg6Iur7viWaCc+T0mfRR5nFVW6QKkpwyikSOs
 FcwuFd04eU2WolVY+PsdFLaNIQhX541kbImpg6oo0p36b3rD26UdaIHs50FD/uW1pGHe 0Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37a8prbg9q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Mar 2021 14:16:47 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 51B6210002A;
 Thu, 18 Mar 2021 14:16:46 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1086824E75B;
 Thu, 18 Mar 2021 14:16:46 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 18 Mar
 2021 14:16:45 +0100
To: Wolfram Sang <wsa@kernel.org>, Alain Volmat <alain.volmat@foss.st.com>
References: <1612515104-838-1-git-send-email-alain.volmat@foss.st.com>
 <1612515104-838-5-git-send-email-alain.volmat@foss.st.com>
 <20210318105537.GF974@ninjato>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <52fc8d91-8799-65fd-a72a-1707ae3e3a10@foss.st.com>
Date: Thu, 18 Mar 2021 14:16:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210318105537.GF974@ninjato>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-18_07:2021-03-17,
 2021-03-18 signatures=0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 4/5] ARM: dts: stm32: enable the analog
 filter for all I2C nodes in stm32mp151
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

Hi Wolfram

On 3/18/21 11:55 AM, Wolfram Sang wrote:
> On Fri, Feb 05, 2021 at 09:51:43AM +0100, Alain Volmat wrote:
>> Enable the analog filter for all I2C nodes of the stm32mp151.
>>
>> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> 
> I usually don't take DTS patches, but they can go in now via arm-soc as
> I applied the patches to the driver.
> 

I'll take it in my stm32 tree.

Thanks
Alex

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
