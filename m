Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A8AE4829
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Oct 2019 12:09:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AA4AEC36B0B;
	Fri, 25 Oct 2019 10:09:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 34320C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Oct 2019 10:09:40 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9P9kJ7s013500; Fri, 25 Oct 2019 12:09:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : references
 : from : message-id : date : mime-version : in-reply-to : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=3CmaVffBxE3uJFrNAgwHUb+zxRINz2K1o3h0Psd77+A=;
 b=ME0YWFZWHlV0X3KTUfj053wzdl9tyR1xZ6jkn11lXi//vssFQMNHcByMdjkDZ7RwKm/g
 CAcSY6FL6pxYxqjueeZojXh6EThZ5vsj8rrqZ3LoAHwe7iD6GHVITT1NOQOR/lpKXh13
 12kc0me3h+wV8Ye2CS+q4+uM3bks2tKRQC6sjHk/K1S9ugz0TlyToFh26rY54sF/MoxO
 cSqqEFLTHO023gDA+Dnnk9mWj4YXrWC78Ioi5EOCESR1SQ9z9OKw+mvu7+LDglpr++Z6
 NolohpTVRaF5jJOpR1pQ1kcCYp9t0noNDy1ZR/Df4nAH2y5jpaKPwaxKRKEPMZQlKajW LA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vt9s7f0yr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Oct 2019 12:09:33 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A37B210002A;
 Fri, 25 Oct 2019 12:09:31 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 951842C38A0;
 Fri, 25 Oct 2019 12:09:31 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.47) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 25 Oct
 2019 12:09:31 +0200
To: Pascal Paillet <p.paillet@st.com>, <mcoquelin.stm32@gmail.com>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20191011140533.32619-1-p.paillet@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <cd4f7f4c-1919-acbe-489e-5021fb8499d8@st.com>
Date: Fri, 25 Oct 2019 12:09:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191011140533.32619-1-p.paillet@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-25_05:2019-10-23,2019-10-25 signatures=0
Subject: Re: [Linux-stm32] [PATCH 0/4] update regulator configuration for
	stm32mp157 boards
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

Hi Pascal

On 10/11/19 4:05 PM, Pascal Paillet wrote:
> The goal of this patch-set is to
> - add support of PWR blok regulators on the stm32mp157 boards
> - undapte various regulator configurations
> 
> Pascal Paillet (4):
>    ARM: dts: stm32: add PWR regulators support on stm32mp157
>    ARM: dts: stm32: change default minimal buck1 value on stm32mp157
>    ARM: dts: stm32: Fix active discharge usage on stm32mp157
>    ARM: dts: stm32: disable active-discharge for vbus_otg on
>      stm32mp157a-avenger96
> 
>   arch/arm/boot/dts/stm32mp157a-avenger96.dts |  8 +++++--
>   arch/arm/boot/dts/stm32mp157a-dk1.dts       |  9 ++++++--
>   arch/arm/boot/dts/stm32mp157c-dk2.dts       |  8 -------
>   arch/arm/boot/dts/stm32mp157c-ed1.dts       | 25 ++++++---------------
>   arch/arm/boot/dts/stm32mp157c.dtsi          | 23 +++++++++++++++++++
>   5 files changed, 43 insertions(+), 30 deletions(-)
> 

Series applied on stm32-next.

Regards
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
