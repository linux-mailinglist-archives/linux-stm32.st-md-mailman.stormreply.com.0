Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D623374B67
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Jul 2019 12:21:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2ECDDCFAC72;
	Thu, 25 Jul 2019 10:21:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05413C35E02
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jul 2019 10:20:57 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6PAGBi3023124; Thu, 25 Jul 2019 12:20:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=PuANcSYUEr2h1YiccGZF5KbI11ZnNfnGmreQcfFcH0U=;
 b=fZjQNeAlzyROf+NRDgI5o941gWC5rqhiFUKF7WOkjv6ekb1mK3ZzaWnd1/9gHoh6QATr
 Uv3RD3OZRTek5QmSeNEAXGDJtC8oKhB7JKmA5SlnhyQ3OSRsQzohm+xvNqnI27a5x7pR
 CRcUDQNabZA9KPQIx772g8fVoy+K3aRz0j3WlxKo7ISAZEae0MeZOilBTh2007t1SRZ9
 ddZ/1ThE/uKHHQv+y3tAwp7KLJTHXwtYiz0LXYsIFlv6eLK9dg5bZ5faKgjOXT3DdvYW
 9uifGSCOLaaal21dfTH3iSEA2XMbavAMEBTcEKXfvfn7ZKQld7PXHmt3pIUJBnKb4HT6 Fw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tx60433ce-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 25 Jul 2019 12:20:37 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6B4223A;
 Thu, 25 Jul 2019 10:20:36 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 31C672945;
 Thu, 25 Jul 2019 10:20:36 +0000 (GMT)
Received: from lmecxl0912.lme.st.com (10.75.127.48) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 25 Jul
 2019 12:20:35 +0200
To: Christophe Kerello <christophe.kerello@st.com>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <linux@armlinux.org.uk>, <olof@lixom.net>,
 <arnd@arndb.de>
References: <1561128590-14621-1-git-send-email-christophe.kerello@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <cc4c56ca-c3cb-fc8c-e223-4b98754d3592@st.com>
Date: Thu, 25 Jul 2019 12:20:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1561128590-14621-1-git-send-email-christophe.kerello@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-25_04:, , signatures=0
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 0/4] ARM: dts: stm32: enable FMC2 NAND
 controller on stm32mp157c-ev1
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

Hi Christophe

On 6/21/19 4:49 PM, Christophe Kerello wrote:
> This patchset adds and enables FMC2 NAND controller used on
> stm32mp157c-ev1.
> 
> Christophe Kerello (4):
>    ARM: dts: stm32: add FMC2 NAND controller support on stm32mp157c
>    ARM: dts: stm32: add FMC2 NAND controller pins muxing on
>      stm32mp157c-ev1
>    ARM: dts: stm32: enable FMC2 NAND controller on stm32mp157c-ev1
>    ARM: multi_v7_defconfig: add FMC2 NAND  controller support
> 
>   arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 44 +++++++++++++++++++++++++++++++
>   arch/arm/boot/dts/stm32mp157c-ev1.dts     | 16 +++++++++++
>   arch/arm/boot/dts/stm32mp157c.dtsi        | 19 +++++++++++++
>   arch/arm/configs/multi_v7_defconfig       |  1 +
>   4 files changed, 80 insertions(+)
> 

Series applied on stm32-next.
Note, I changed capital letter in patch1 directly (As I responded late).

Regards
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
