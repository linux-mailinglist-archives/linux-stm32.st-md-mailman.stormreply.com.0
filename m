Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FAD14F07B
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Jan 2020 17:13:39 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5BADC36B0C;
	Fri, 31 Jan 2020 16:13:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A59EBC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jan 2020 16:13:36 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00VG8Ufu012526; Fri, 31 Jan 2020 17:13:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=HUDBBixwA13IQ1SSxhBd1lmaKx9dqoz2nLZDQib/1NY=;
 b=M+YcKaeJ2bnVCl5PayaMJx+tFQAQGf39itcySN6HFpedQJV60UeyQR+C3dnWO5cUftet
 GbGDnNSjoRvGb9p5bocMIOMMVwwq6udnrw3lR1x5yiYRmZ1YDuGEt2eXJNuD+ssGRoYx
 DjnZc2l2lbGzI7hEmfHpDQSH0dYvYPFdkMCxSkvSBI/IvDSKrIvzxHaLm2ARDTIwEYTc
 BYlmU1xUEQVqRMpTLmrVAQC3dHPdMcbckmJMZvJe+QMnLRdD24sLLFwULK9Avg3kl0JA
 6pgph/GNCKKc7UGzCSmm2hWL1nyDuQWkHvTU2pEuyecFki1KCmFXRjOvMEDRpx3H4opv oQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xrc13pvvx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jan 2020 17:13:31 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BC12810002A;
 Fri, 31 Jan 2020 17:13:26 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A0DEE2D3796;
 Fri, 31 Jan 2020 17:13:26 +0100 (CET)
Received: from lmecxl0995.lme.st.com (10.75.127.48) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 31 Jan
 2020 17:13:25 +0100
To: Felipe Balbi <balbi@kernel.org>, Minas Harutyunyan <hminas@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
References: <20200124084131.23749-1-amelie.delaunay@st.com>
 <20200124084131.23749-2-amelie.delaunay@st.com> <87imkr7nou.fsf@kernel.org>
From: Amelie DELAUNAY <amelie.delaunay@st.com>
Message-ID: <c29867bd-8056-a82f-2273-101470395e78@st.com>
Date: Fri, 31 Jan 2020 17:13:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <87imkr7nou.fsf@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG6NODE1.st.com (10.75.127.16) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-31_04:2020-01-31,
 2020-01-31 signatures=0
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v3 1/2] dt-bindings: usb: dwc2: add
 support for STM32MP15 SoCs USB OTG HS and FS
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

Hi,

On 1/31/20 2:36 PM, Felipe Balbi wrote:
> Hi,
> 
> Amelie Delaunay <amelie.delaunay@st.com> writes:
> 
>> Add the specific compatible string for the DWC2 IP found in the STM32MP15
>> SoCs.
>> STM32MP15 SoCs uses sensing comparators to detect Vbus valid levels and
>> ID pin state. usb33d-supply described the regulator supplying Vbus and ID
>> sensing comparators.
>>
>> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
> 
> This doesn't apply. dwc2 bindings is still in .txt format. I have taken
> patch 2, though.
>

Thanks for taking driver patch.

Rob, would you mind to take patch 1 (Yaml binding update) in your tree ?

Regards,
Amelie

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
