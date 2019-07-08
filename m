Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F416761C20
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Jul 2019 11:13:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98F69C58904
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Jul 2019 09:13:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A591C58902
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Jul 2019 09:13:10 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x68967am006024; Mon, 8 Jul 2019 11:12:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=J+VrRoM1vmsyKivpX5U+CqP541ilP0xEicODEegVLtM=;
 b=PIV2XdbgB0aZJqgtreP6xTwlrWKCNkvJeRx2dKmHokXB9K9FELlV+YSQc6+QRoX/Me7z
 TDtZikvgNRGqiCMZRB6CxGHEcgaz716HWePA8rGEnMVFAgb6Jp7OzvWQw2lUc+ooOdFD
 P0QAYK42RYrC65eNtzvHzYcSo9p6i1felTNSB4wdhz+Vv4IvE/Jj5+3ZUGGWDBviHQOh
 NyJOFo8BoqHSL1kyigcxpIpdMnprg4MYIpTXZv+mDaEzkbA2VwNJXmZRdSyvdjWSE4FS
 TcTm26B+l+W5qLnlT9uiMEkQcH3zFSb5JwxnzketnNSAkFZWo9PJOWX8ha62R74IJ8TL pQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tjh405r6f-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 08 Jul 2019 11:12:54 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4971D34;
 Mon,  8 Jul 2019 09:12:53 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 07A2D2763;
 Mon,  8 Jul 2019 09:12:53 +0000 (GMT)
Received: from SFHDAG3NODE2.st.com (10.75.127.8) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 8 Jul
 2019 11:12:52 +0200
Received: from SFHDAG3NODE2.st.com ([fe80::b82f:1ce:8854:5b96]) by
 SFHDAG3NODE2.st.com ([fe80::b82f:1ce:8854:5b96%20]) with mapi id
 15.00.1347.000; Mon, 8 Jul 2019 11:12:52 +0200
From: Amelie DELAUNAY <amelie.delaunay@st.com>
To: Markus Elfring <Markus.Elfring@web.de>, "linux-rtc@vger.kernel.org"
 <linux-rtc@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Alessandro Zummo
 <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre TORGUE <alexandre.torgue@st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Russell King <linux@armlinux.org.uk>
Thread-Topic: [PATCH v2] rtc: stm32: One condition check and function call
 less in stm32_rtc_set_alarm()
Thread-Index: AQHVNWk64H5f1akvVEOEc4o7Pyqv/6bATj4A
Date: Mon, 8 Jul 2019 09:12:52 +0000
Message-ID: <b614006a-17ac-e738-a3f3-08649f69a42c@st.com>
References: <f04277da-8a98-473e-2566-ac7846f9f8e1@web.de>
 <20190707211638.sehikkear25dffah@shell.armlinux.org.uk>
 <4da614a4-83c6-548c-a112-033b846c561b@web.de>
In-Reply-To: <4da614a4-83c6-548c-a112-033b846c561b@web.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <7C37AB1342C2294A8941E133C33BA759@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-08_02:, , signatures=0
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2] rtc: stm32: One condition check and
 function call less in stm32_rtc_set_alarm()
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

On 7/8/19 10:42 AM, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 8 Jul 2019 10:26:47 +0200
> 
> A condition check was repeated in this function implementation despite of
> a corresponding check in the stm32_rtc_alarm_irq_enable() function.
> Thus delete redundant source code here.
> 
> Suggested-by: Russell King <linux@armlinux.org.uk>
> Link: https://lore.kernel.org/lkml/20190707211638.sehikkear25dffah@shell.armlinux.org.uk/
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Reviewed-by: Amelie Delaunay <amelie.delaunay@st.com>

> ---
> 
> v2:
> Russell King pointed the change possibility out to omit a condition check
> at this place.
> 
> 
>   drivers/rtc/rtc-stm32.c | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-stm32.c b/drivers/rtc/rtc-stm32.c
> index 8e6c9b3bcc29..773a1990b93f 100644
> --- a/drivers/rtc/rtc-stm32.c
> +++ b/drivers/rtc/rtc-stm32.c
> @@ -519,11 +519,7 @@ static int stm32_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
>   	/* Write to Alarm register */
>   	writel_relaxed(alrmar, rtc->base + regs->alrmar);
> 
> -	if (alrm->enabled)
> -		stm32_rtc_alarm_irq_enable(dev, 1);
> -	else
> -		stm32_rtc_alarm_irq_enable(dev, 0);
> -
> +	stm32_rtc_alarm_irq_enable(dev, alrm->enabled);
>   end:
>   	stm32_rtc_wpr_lock(rtc);
> 
> --
> 2.22.0
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
