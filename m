Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 294C224C24
	for <lists+linux-stm32@lfdr.de>; Tue, 21 May 2019 12:04:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5298C73B2C
	for <lists+linux-stm32@lfdr.de>; Tue, 21 May 2019 10:04:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AAAD3C73B2B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 May 2019 10:04:04 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4LA2dvX025126; Tue, 21 May 2019 12:03:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=DnSyyYeMPo/Rj8IttHG/PRL144k6IF0UugMb5dguwto=;
 b=X8moGV0rKXL8AO+QlnbiNcn5/jyDNgN0YBqNpyYLCk09Gt9HZDooVSWLOvbtv0mX5d2g
 Wd6tbe52dF2Tv2BliOtW+j5sf8LNl9Fmm3CqZBKz88BLL1D9AynI6TkLLXIx18sb9BUV
 jMoleQzC1Dtca8wyDZOLPSnw80bxN8vrC/H2R2YtwZhrydob6lMO1AktMH+B/RlthHAO
 pqd3/WWO8fU2lxzXhrOZZcBR/VOXzFU2j4T4fFHGFNqUuhTNXyZTylMKipkUb6MRY7aD
 gsqHgSpDeflshYkgMg4qjWnY5JLgKz2Ln+xmNGdILETJ0bjVQWUsWjuudUTZgEvGIQqC 7A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sj8xg8kb6-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 21 May 2019 12:03:57 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AD49E38;
 Tue, 21 May 2019 10:03:56 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8ECDC25A3;
 Tue, 21 May 2019 10:03:56 +0000 (GMT)
Received: from [10.48.0.204] (10.75.127.49) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 21 May
 2019 12:03:55 +0200
To: Hugues Fruchet <hugues.fruchet@st.com>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
References: <1551363945-19497-1-git-send-email-hugues.fruchet@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <6ba8698f-0c05-5293-4811-2f632bf1b047@st.com>
Date: Tue, 21 May 2019 12:03:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1551363945-19497-1-git-send-email-hugues.fruchet@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-21_01:, , signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 0/4] Enable stm32mp1 camera support
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

Dear Hugues,

On 2/28/19 3:25 PM, Hugues Fruchet wrote:
> This patchset serie enables camera of stm32mp157c evaluation board.
> To do so, both stm32mp157c DCMI camera interface driver and OV5640 camera
> module driver are enabled in devicetree.
> 
> DCMI camera interface driver is enabled by default in multi_v7 configuration
> but OV5640 driver remains to be selected at kernel configuration time.
> 
> This patchset depends on STMicroelectronics Multi-Function eXpander
> (STMFX) support [1].
> 
> [1] https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1944108.html
> 
> Hugues Fruchet (4):
>    ARM: dts: stm32: add 2v8 fixed regulator for stm32mp157c-ed1 board
>    ARM: dts: stm32: add DCMI camera interface support on stm32mp157c
>    ARM: dts: stm32: add DCMI pins to stm32mp157c
>    ARM: dts: stm32: enable OV5640 camera on stm32mp157c-ev1 board
> 
>   arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 41 ++++++++++++++++++++++
>   arch/arm/boot/dts/stm32mp157c-ed1.dts     |  8 +++++
>   arch/arm/boot/dts/stm32mp157c-ev1.dts     | 56 +++++++++++++++++++++++++++++++
>   arch/arm/boot/dts/stm32mp157c.dtsi        | 12 +++++++
>   4 files changed, 117 insertions(+)
> 

Patch 2 to 4 applied on stm32-next. Patch 1 is no longer needed as 
regulators are now provided by PMIC.

thanks
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
