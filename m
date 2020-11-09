Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF482AB539
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Nov 2020 11:44:47 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB350C3FAE2;
	Mon,  9 Nov 2020 10:44:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76902C36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Nov 2020 10:44:45 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A9AaaSZ012098; Mon, 9 Nov 2020 11:44:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=VKmoMZP0b9LWLJaY4v2pp2GCzEy9aDh1mNfM0Ws3yQY=;
 b=Y/zt+CqpJDReINvKTs7KRef391ZISVl6IQNRlKKKk/tvj0l9Za797qh8bNg/YzZRVeSm
 2yVc3LlnxEqhJsYxm+h3MQJkmJSuSUr+qHsqKuZH/P+5MtvqRplUgmNjtiBT+IPmXyTL
 GMhyZEr7U6wvQQxPJ+TctM2ZsokHRaVUDq36yETrp6wByv8sTLNX9DUivHqHNvyuYfZ3
 wfxRIzV8TIOnBbnADa0vt78qFOcFpxGjBNLWPPgHQdxEredu5VojPCGoPMHbGP7iHm6f
 pSsFC/4xis+U0Kb7Eycqo7fP1lGRkaext+FOqnBVFd7WV9Sf39UiH4vo9bsLfNM+18+s OA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34nkbmshx5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Nov 2020 11:44:33 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5A8B9100034;
 Mon,  9 Nov 2020 11:44:32 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1E1E623C37E;
 Mon,  9 Nov 2020 11:44:32 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.45) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 9 Nov
 2020 11:44:31 +0100
To: Krzysztof Kozlowski <krzk@kernel.org>, Serge Semin
 <Sergey.Semin@baikalelectronics.ru>
References: <20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru>
 <20201020115959.2658-9-Sergey.Semin@baikalelectronics.ru>
 <20201020123616.GF127386@kozik-lap>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <d1967974-4bb6-bc4f-bda8-4d49423642c1@st.com>
Date: Mon, 9 Nov 2020 11:43:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201020123616.GF127386@kozik-lap>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-09_02:2020-11-05,
 2020-11-09 signatures=0
Cc: Felipe Balbi <balbi@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 08/29] arm: dts: stm32: Harmonize
	EHCI/OHCI DT nodes name
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

Hi Serge

On 10/20/20 2:36 PM, Krzysztof Kozlowski wrote:
> On Tue, Oct 20, 2020 at 02:59:38PM +0300, Serge Semin wrote:
>> In accordance with the Generic EHCI/OHCI bindings the corresponding node
>> name is suppose to comply with the Generic USB HCD DT schema, which
>> requires the USB nodes to have the name acceptable by the regexp:
>> "^usb(@.*)?" . Make sure the "generic-ehci" and "generic-ohci"-compatible
>> nodes are correctly named.
>>
>> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
>> Acked-by: Amelie Delaunay <amelie.delaunay@st.com>
>> ---
>>   arch/arm/boot/dts/stm32mp151.dtsi | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> Best regards,
> Krzysztof
> 

Applied on stm32-next (I just fix cosmetic in commit title).

Thanks.
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
