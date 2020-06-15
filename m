Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C2C1F94B7
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Jun 2020 12:39:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4CB58C36B11;
	Mon, 15 Jun 2020 10:39:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F3C2BC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jun 2020 10:39:44 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05FAWmbh003202; Mon, 15 Jun 2020 12:39:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=+F4jY1HeRhewZM8MzbOTtBBvHoX7iWPMn/pDhsYtkiM=;
 b=uBocQdrSSSMoeRwxrI5NC2KcwfBXV8R+joFckdr9h6lID30OI0WKQ58EuGTsUgLPN+Eb
 a4RZAyYxPgrZm0PEWmnJZsAwAUX6fRwGmgucsYVJvNuU4azLblG+PZjnSr5jCdtqLRAi
 UxTcsJPrSQEgn1kdgCqB/MYkhndfq7JMebfav5j5vMDNXndEj5YEjWb5PWB64kwPCbsT
 4f+ZAlBJ1ACsDu99IzspOmQOCALzMLQWycO1YQwuXHmak7pbg6sDnVOEkwpBHMowYf9C
 5A19as0A0DbrgT9BAJcCUGhrEll+vVMv8+Gnw+MQPj7f1b5wkgLDijIQuuX6/8YLU//+ Ag== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31mmjvs5c4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 12:39:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4DBF210002A;
 Mon, 15 Jun 2020 12:39:34 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1D8BD20EAA2;
 Mon, 15 Jun 2020 12:39:34 +0200 (CEST)
Received: from lmecxl0912.tpe.st.com (10.75.127.51) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 15 Jun
 2020 12:39:33 +0200
To: Erwan Le Ray <erwan.leray@st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>
References: <20200528074003.24875-1-erwan.leray@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <b0c3a1f8-217c-968d-dfeb-484afd8eefd5@st.com>
Date: Mon, 15 Jun 2020 12:39:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200528074003.24875-1-erwan.leray@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-15_02:2020-06-15,
 2020-06-15 signatures=0
Cc: devicetree@vger.kernel.org, Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 0/2] STM32 Fix uart nodes in
	stm32mp15-pinctrl
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

Hi Erwan

On 5/28/20 9:40 AM, Erwan Le Ray wrote:
> Fix uart nodes ordering and uart7_pins_a comments in stm32mp15-pinctrl.
> 
> Erwan Le Ray (2):
>    ARM: dts: stm32: fix uart nodes ordering in stm32mp15-pinctrl
>    ARM: dts: stm32: fix uart7_pins_a comments in stm32mp15-pinctrl
> 
>   arch/arm/boot/dts/stm32mp15-pinctrl.dtsi | 130 +++++++++++------------
>   1 file changed, 65 insertions(+), 65 deletions(-)
> 


Series applied on stm32-next.

Regards
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
