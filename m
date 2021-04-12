Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E91335CBC5
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Apr 2021 18:27:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15789C57B79;
	Mon, 12 Apr 2021 16:27:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F91EC57B76
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Apr 2021 16:27:30 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13CGQIJT029160; Mon, 12 Apr 2021 18:27:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=5KDL4+wCL/RdEldQijS3CgPsT7I4YVF6zQxSMq/morU=;
 b=ugOAcuft2aUQCAUioP4D+MJ41O+4Ho7dnag/F0nzVxrCpIZavKbbkAQ7nm23WBRhnNBB
 Wf7oXeV3qx6dr+IPnEdVpSflHpLK/YAwdKQeV8jCkIFgHtkKClLPiu2vc4CmILhI51Rv
 295hQK/v4ps8EAlHOtEfriwo2hBkEFrmPShztjb84AjL5sDxrYnwfXyPJaD3PnIxkmLZ
 ARfcPKBq0V9AFXkEmx1/mC1lmJLQ/tC33+bC/gszIpRfhGvvmahpb86z6brb4Ojhda3E
 dIxK2dS/kDm3GIDE9rXYWDLEu7DeV4SUW3QTSPDNjTF5qFXNmht7b3OA6iCtmfdBAGMs kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37vrp58dsx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Apr 2021 18:27:25 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 777AD10002A;
 Mon, 12 Apr 2021 18:27:25 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 66253232C79;
 Mon, 12 Apr 2021 18:27:25 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 12 Apr
 2021 18:27:25 +0200
To: Arnd Bergmann <arnd@arndb.de>
References: <20210216074929.29033-1-patrice.chotard@foss.st.com>
 <1cd91834-6df8-a655-a3b1-0e16f5fe470d@foss.st.com>
 <52c32145-7f29-8944-58dc-dc2fb406ffb0@foss.st.com>
 <CAK8P3a1upDuztHd0pH_dM+OpMp8WtiMPAZN8p=9xxtCSVJGZMw@mail.gmail.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <2a3edcb1-df18-fed9-c91c-1e014033004c@foss.st.com>
Date: Mon, 12 Apr 2021 18:27:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1upDuztHd0pH_dM+OpMp8WtiMPAZN8p=9xxtCSVJGZMw@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-12_11:2021-04-12,
 2021-04-12 signatures=0
Cc: SoC Team <soc@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
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



On 4/12/21 3:48 PM, Arnd Bergmann wrote:
> On Mon, Apr 12, 2021 at 12:19 PM Patrice CHOTARD
> <patrice.chotard@foss.st.com> wrote:
>>
>> Hi
>>
>> I think this series has been forgotten, any chance to see it merged into v5.13 ?
> 
> It's in -rc7, but it appears that my email reply went missing when I merged it.
> 
>       Arnd
> 

Perfect, thanks for confirmation ;-) 

Patrice
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
