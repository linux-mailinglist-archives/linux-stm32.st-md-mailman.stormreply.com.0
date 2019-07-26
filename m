Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CC576EBD
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Jul 2019 18:18:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F05FC16363;
	Fri, 26 Jul 2019 16:18:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1212C1635F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jul 2019 16:18:50 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6QG6Hpo030144; Fri, 26 Jul 2019 18:18:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=IXxLWvTNmiUU59JMUeszE0o+fXSHf9wp+bJ4iqAv/do=;
 b=U88KFzuVSXQpIKzDDIIFqcilRxMXyICiEVyjCMNY+rbxk9rSKnFDcH/P278PPIbd4rLf
 aPDtJWnkFTk9gQFloRyeusVw4Dx/TADtO+SHjPK2xrfnFjXoc0gGkfxP8zWKu7IN5wFh
 AiC+yx8mYfw3irtzXVPlv690ZPfQvA1xaKmmxypjVC2uIeQC6vfR9w8T6W4QnM85zDet
 wWQNU8sEubADekjpmE28/XSiEcRq/cGjNXAqKvvmfW5X3HCC/8IJOIOffSRUpFb9yljP
 CuB400jQn4GQzeKNj69eW6R8Okf8JVlYPImBfQCVDv7HKdhS2zXXb62smI2pbOKo8rhJ bA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tx604bj0f-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 26 Jul 2019 18:18:39 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 08D2E31;
 Fri, 26 Jul 2019 16:18:39 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D00874FB7;
 Fri, 26 Jul 2019 16:18:38 +0000 (GMT)
Received: from lmecxl0912.lme.st.com (10.75.127.48) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 26 Jul
 2019 18:18:37 +0200
To: Fabien Dessenne <fabien.dessenne@st.com>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn
 Andersson <bjorn.andersson@linaro.org>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-remoteproc@vger.kernel.org>
References: <1557822423-22658-1-git-send-email-fabien.dessenne@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <334f2829-fa5e-3f81-5872-730b2aa8b757@st.com>
Date: Fri, 26 Jul 2019 18:18:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1557822423-22658-1-git-send-email-fabien.dessenne@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-26_12:, , signatures=0
Subject: Re: [Linux-stm32] [PATCH v4 0/8] stm32 m4 remoteproc on STM32MP157c
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

Hi Fabien

On 5/14/19 10:26 AM, Fabien Dessenne wrote:
> STMicrolectronics STM32MP157 MPU are based on a Dual Arm Cortex-A7 core and a
> Cortex-M4.
> This patchset adds the support of the stm32_rproc driver allowing to control
> the M4 remote processor.
> 

...

>      driver
>    remoteproc: stm32: add an ST stm32_rproc driver
>    ARM: dts: stm32: add m4 remoteproc support on STM32MP157c
>    ARM: dts: stm32: declare copro reserved memories on STM32MP157c-ed1
>    ARM: dts: stm32: enable m4 coprocessor support on STM32MP157c-ed1
>    ARM: dts: stm32: declare copro reserved memories on STM32MP157a-dk1
>    ARM: dts: stm32: enable m4 coprocessor support on STM32MP157a-dk1
> 

DT patches applied on stm32-next.

Regards
Alexandre
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
