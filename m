Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEF8367B1E
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Apr 2021 09:32:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23267C58D5C;
	Thu, 22 Apr 2021 07:32:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6B89CFAC55
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Apr 2021 07:32:07 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13M7RMLf020720; Thu, 22 Apr 2021 09:31:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=wTJYNLz+GeIRx9UYWWVLcnY81+zxFAKyL59IOj+tgpk=;
 b=LY/jstysQPl3u7xXFTEOpByLaLm1oYHRFir4cFClLkEt75V/f/T5PpCY9HTqIAdPW/c5
 eR7X4IgRsNiaRIoroxxRmMWXfbIsEGDRp97wBeDz0Weny/nZ/ZDzyHtnPUpg4PiKmGgm
 UbiowOdNdV8KQifSXNJD+p5P6uUq7WsHDeQxCrRv5ZRN7GMiqxqMbrswpDnd+UPgp0p8
 9vwcHe0d0wYTqd3dtc7fUfhj2CYc5Jdxf4xHN8P6eGqcK5hQCanarYS2u+aXoJUl5SRz
 DQ0vh5ml/EuoR78PtkbgDo+6xdZm9hfmSwTj1yeB1h1HEvKy0eS58LaenJcLuxLT8cJL mw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 382fften23-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Apr 2021 09:31:47 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7CDE310002A;
 Thu, 22 Apr 2021 09:31:46 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6B5A321F0AA;
 Thu, 22 Apr 2021 09:31:46 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 22 Apr
 2021 09:31:45 +0200
To: Arnd Bergmann <arnd@kernel.org>, Mark Brown <broonie@kernel.org>
References: <20210421140653.3964725-1-arnd@kernel.org>
 <20210421150510.GA36785@sirena.org.uk>
 <CAK8P3a0CWp_H-tm2QcZyH1FDXwzMgxY_9dc1Y8pA28MQKT-q=A@mail.gmail.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <b970a557-b869-c867-3825-370a36feef68@foss.st.com>
Date: Thu, 22 Apr 2021 09:30:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a0CWp_H-tm2QcZyH1FDXwzMgxY_9dc1Y8pA28MQKT-q=A@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-22_01:2021-04-21,
 2021-04-21 signatures=0
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Zhang Qilong <zhangqilong3@huawei.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-spi <linux-spi@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] spi: stm32-qspi: fix debug format string
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

Hi Mark, Arnd

Regarding this issue, how do you prefer to proceed ? 

Patrice

On 4/21/21 5:22 PM, Arnd Bergmann wrote:
> On Wed, Apr 21, 2021 at 5:05 PM Mark Brown <broonie@kernel.org> wrote:
>>
>> On Wed, Apr 21, 2021 at 04:06:48PM +0200, Arnd Bergmann wrote:
>>> From: Arnd Bergmann <arnd@arndb.de>
>>>
>>> Printing size_t needs a special %zd format modifier to avoid a
>>> warning like:
>>
>> This doesn't apply against current code, please check and resend.
> 
> It appears that you just applied 1b8a7d4282c0 ("spi: stm32-qspi:
> Fix compilation warning in ARM64") after today's linux-next was
> cut.
> 
> I suspect Patrice's patch now causes a warning on all architectures
> on which size_t is defined as 'unsigned int'.
> 
>        Arnd
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
