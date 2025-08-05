Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C856FB1B2CE
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Aug 2025 13:53:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29080C3F92E;
	Tue,  5 Aug 2025 11:53:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B2F3C3F92D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Aug 2025 11:53:21 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5759LHwB006190;
 Tue, 5 Aug 2025 13:52:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 vYofx1rgOkS6euoEnD5cIWfWqSH84c0L9K8aBMbtQtY=; b=wwl9iJ+ILPZboT9s
 VKEu1riEx4ojW5MJRXaLYYSUBfJIu7Udwhj68ECEYHqCmhfyyyzFM2QfyiXrVrOk
 9fiMaEDoapg/dierdu9475AIgK/LFHR29eolkKjkWQ3kSIWb1bFJLLCTQA1nIx0N
 3AfT0k2w0KxcKfvE152IijrdQvY20wSMOOaPSjPWQALpNbyusyOVsRHxGgGXUma5
 93LwFNaTONFiqO7vY7OMHGoe3Uutl58Cjnr07T7XrQislLR90oEudhKcTZT8atXI
 rwhGVeIyOnNlRYVHMfiTCRtJ6ja0S4a+mXUAOoGGvMGZ2xh+QVYn63eHXgHbwzun
 GNIyFw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 489v861e7d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Aug 2025 13:52:48 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1851740046;
 Tue,  5 Aug 2025 13:51:21 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4D13273294D;
 Tue,  5 Aug 2025 13:50:31 +0200 (CEST)
Received: from [10.48.87.141] (10.48.87.141) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 5 Aug
 2025 13:50:30 +0200
Message-ID: <54530300-82c5-41af-adc6-8d0a45f9b37b@foss.st.com>
Date: Tue, 5 Aug 2025 13:50:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <20250724-relative_flex_pps-v1-0-37ca65773369@foss.st.com>
 <20250724-relative_flex_pps-v1-1-37ca65773369@foss.st.com>
 <aJHdNMWPqNsU9AiK@shell.armlinux.org.uk>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <aJHdNMWPqNsU9AiK@shell.armlinux.org.uk>
X-Originating-IP: [10.48.87.141]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_03,2025-08-04_01,2025-03-28_01
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/2] drivers: net: stmmac: add
 STMMAC_RELATIVE_FLEX_PPS
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



On 8/5/25 12:30, Russell King (Oracle) wrote:
> On Thu, Jul 24, 2025 at 02:31:18PM +0200, Gatien Chevallier wrote:
>> +config STMMAC_RELATIVE_FLEX_PPS
>> +	bool "Support for STMMAC system time relative flexible PPS generation"
>> +	default n
> 
> There is no need for "default n" because the default default is n.
>

>> +	help
>> +	  Say Y to add the MAC system time to the arguments passed to the
>> +	  PTP driver when requesting a flexible PPS generation. This avoids
>> +	  the tedious task of passing an absolute time value when using sysfs
>> +	  entry.
> 
> How does a distro decide whether to enable or disable this option? What
> does it depend on?
> 
> If it's only for some platforms and not others (due to causing
> regressions) then what is a distro supposed to do with their kernels
> that support multiple platforms?
> 

Hello Russell,

Following Jakub's feedback, I sent a v2 [1] with this config removed.
The idea now is to compare the time value given to the stmmac_ptp driver
and compare it to the MAC system time. If the time value is is the past,
relative to the MAC system time, then it is considered as an offset
relative the the MAC system time.

It's not ideal as it would have probably been better to always consider
an offset but I don't know how popular and used this feature currently
is. Therefore, I did not want to break any existing script by changing
the current behavior.

I'd be very interested to have your take on this as well.

 From what I observed, it's linked to the MAC version. So enabling this
config would have meant knowing what MAC version is embedded. Supporting
multiple platforms then becomes tricky.

[1]: 
https://lore.kernel.org/all/20250729-relative_flex_pps-v2-0-3e5f03525c45@foss.st.com/
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
