Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B74116DE9
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Dec 2019 14:28:25 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7AADC36B0B;
	Mon,  9 Dec 2019 13:28:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F2AFC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Dec 2019 13:28:23 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB9DMhDR001394; Mon, 9 Dec 2019 14:28:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=Cm28hvfhvY97v4kLNgG8xtvd1BicsLopvjHAPEFSsbc=;
 b=iW/ZLijtTxiPtXEIvr95+nezSEyelFNFdfdpVDlOjkRmru7D6/I84slTKT8OvgZEqADM
 74RUhX+aFUUU+7nxsTxbiQYeVaoOIPM3O9C/DIDY/Rq5KJ8W7BAy7DKohQFTyONflp9p
 8Hx0FTNDEl7XYv5eH45NuZKbxSLH/heIVOoY9QZPmIzOxbY/epY/JSdbJl8wmNOT/gE9
 nadw/+v7nNCqGhoIfl33WUYX4PfHQobi+jjiUpxkkD2qFdbk+UVyZB4eENy2D0veuanF
 Ub1UrWtjN5wZ9RU3gzsSJsQQ7hrqnX8jDnXj2Gq7JV5/uqh4xpiDbFxCXlRonVLVKlM0 Pw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2wradh7m4b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Dec 2019 14:28:17 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BE6C310002A;
 Mon,  9 Dec 2019 14:28:16 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B119B2D3767;
 Mon,  9 Dec 2019 14:28:16 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.49) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 9 Dec
 2019 14:28:16 +0100
To: Benjamin Gaignard <benjamin.gaignard@st.com>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>
References: <20191204155333.25401-1-benjamin.gaignard@st.com>
 <20191204155333.25401-2-benjamin.gaignard@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <a3738b5d-4ffb-4717-a910-73efe9bb52eb@st.com>
Date: Mon, 9 Dec 2019 14:28:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191204155333.25401-2-benjamin.gaignard@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-09_04:2019-12-09,2019-12-09 signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2] ARM: dts: stm32: remove "@" and "_"
 from stm32f7 pinmux groups
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

Hi Benjamin

On 12/4/19 4:53 PM, Benjamin Gaignard wrote:
> Replace all "@" and "_" by "-" in pinmux groups for stm32f7 family.
> This avoid errors when using yaml to check the bindings.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
> changes in version 2:
> - replace @ and _ by -
> 
>   arch/arm/boot/dts/stm32f7-pinctrl.dtsi | 22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32f7-pinctrl.dtsi b/arch/arm/boot/dts/stm32f7-pinctrl.dtsi
> index 9314128df185..fe4cfda72a47 100644
> --- a/arch/arm/boot/dts/stm32f7-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/stm32f7-pinctrl.dtsi

Applied on stm32-next.

Thanks.
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
