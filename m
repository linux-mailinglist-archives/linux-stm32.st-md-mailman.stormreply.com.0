Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF04704A3C
	for <lists+linux-stm32@lfdr.de>; Tue, 16 May 2023 12:15:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26C49C6A614;
	Tue, 16 May 2023 10:15:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 648FAC6A611
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 May 2023 10:15:22 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34G9MbJu013973; Tue, 16 May 2023 12:15:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=b2O6FR2ovvQRh+31RdmxtB/NfNxgt4m1O3dgHwOSoEc=;
 b=4vZKhhRk8ckCL8Oe18i+UNSo+TO/4sHJM0jp5GK9wd0evrVg5yA0wgO7wviwhi3VBmTE
 AnfZ3q0yTQe9W7Wf5l0r6MBRXn6NGv7R+UdNMFDtLtkzfCE8SAZTx4XR8RkmmgfA/AbG
 Pvr5msfd6a/rdliDZA0lNWdF+1gFZjFABfRn6JDxdGQa9MCm5dB37Mzx+A10LdpKU6Rh
 DJ+HA8geffM1l4juo/plfgo8OSv65pSIOcZQROu/b3LkfrveMuvIMEaLu8g3UVtKgMla
 Y5a29p5njvg3HCo4Hkrlv/kJWLvhez+ti/LQCQbT0jChT1qkspj/TJJ7cTpxujH02552 bg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qhyyh8t1b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 May 2023 12:15:10 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5D5EB100034;
 Tue, 16 May 2023 12:15:09 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 558AC21A21A;
 Tue, 16 May 2023 12:15:09 +0200 (CEST)
Received: from [10.252.0.230] (10.252.0.230) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 16 May
 2023 12:15:08 +0200
Message-ID: <b3084c19-7948-bf64-a63b-eb2f353502a1@foss.st.com>
Date: Tue, 16 May 2023 12:15:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>
References: <20230407203151.1.Ia16c922b77242e5832106fedc76d27f7ed4dd952@changeid>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20230407203151.1.Ia16c922b77242e5832106fedc76d27f7ed4dd952@changeid>
X-Originating-IP: [10.252.0.230]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-16_04,2023-05-05_01,2023-02-09_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: add part number for
	STM32MP15x
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

Hi Patrick

On 4/7/23 20:31, Patrick Delaunay wrote:
> The STM32MP15x Device Part Number is located in the first 8 bits of OTP4,
> this patch add its description as the NVMEM cell.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>   arch/arm/boot/dts/stm32mp151.dtsi | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
> index 4e437d3f2ed6..3cf78f706400 100644
> --- a/arch/arm/boot/dts/stm32mp151.dtsi
> +++ b/arch/arm/boot/dts/stm32mp151.dtsi
> @@ -1620,6 +1620,9 @@ bsec: efuse@5c005000 {
>   			reg = <0x5c005000 0x400>;
>   			#address-cells = <1>;
>   			#size-cells = <1>;
> +			part_number_otp: part-number-otp@4 {
> +				reg = <0x4 0x1>;
> +			};
>   			ts_cal1: calib@5c {
>   				reg = <0x5c 0x2>;
>   			};

Applied on stm32-next.

Thanks.
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
