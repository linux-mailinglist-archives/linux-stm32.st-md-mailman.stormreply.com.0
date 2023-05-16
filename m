Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B558D704AAD
	for <lists+linux-stm32@lfdr.de>; Tue, 16 May 2023 12:33:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 598D9C6A614;
	Tue, 16 May 2023 10:33:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42920C6A5E6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 May 2023 10:33:28 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34G99nmZ028794; Tue, 16 May 2023 12:33:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=aInR0qWWMaxv5JCy0f1J7YC2S/5iWJ3uWMcGklIZzA4=;
 b=PnDMjDm1ARtMdaHYuv8lQfKn3Omw9n/1EvY9ZD+wTKFPn3krY74R3RtO7UEy1JYIATMQ
 8Y73T4wD5ay/j3nNMLQ4ku3drd7zIeKWC4mWcInqxKnhfG0IXsAE1McrDGDt9HGqD32R
 tyI0MYkCD4rIG+EArfWiy0kXZgqHyBlUWMZ2SvH2JRH2EL+zyIywHy1GCY3xOxZojtyx
 dS9VwX06Bbkouqrnde7J4YBtK7skWswaN/75qc+4MGFduK+YJxY60NoQNHbjg+/dV7yG
 BeFeSG1G7DbGotN/ymwBGyeO16UGSF45gdqOayCHgtSNjHG9gYAxaP5hb3MJPu6BNLcP uA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qhyyh8wrb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 May 2023 12:33:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AAE9710002A;
 Tue, 16 May 2023 12:33:16 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A44B021ED2E;
 Tue, 16 May 2023 12:33:16 +0200 (CEST)
Received: from [10.252.0.230] (10.252.0.230) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 16 May
 2023 12:33:16 +0200
Message-ID: <85186963-64f4-385d-2cf2-6ac83ea5b355@foss.st.com>
Date: Tue, 16 May 2023 12:33:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>
References: <20230417180757.v2.1.If11ffa6edfdfef0869478412ec3cec3169483cb9@changeid>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20230417180757.v2.1.If11ffa6edfdfef0869478412ec3cec3169483cb9@changeid>
X-Originating-IP: [10.252.0.230]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-16_04,2023-05-16_01,2023-02-09_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2] ARM: dts: stm32: remove extra space in
 stm32mp15xx-dkx.dtsi
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

On 4/17/23 18:08, Patrick Delaunay wrote:
> Remove unnecessary space in device tree stm32mp15xx-dkx.dtsi.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
> Changes in v2:
> - update commit title to reflect what the change is
>    V1="ARM: dts: stm32: fix typo in stm32mp15xx-dkx.dtsi"
> 
>   arch/arm/boot/dts/stm32mp15xx-dkx.dtsi | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
> index 11370ae0d868..ccd6c4722bd3 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
> @@ -382,21 +382,21 @@ vref_ddr: vref_ddr {
>   				regulator-always-on;
>   			};
>   
> -			 bst_out: boost {
> +			bst_out: boost {
>   				regulator-name = "bst_out";
>   				interrupts = <IT_OCP_BOOST 0>;
> -			 };
> +			};
>   
>   			vbus_otg: pwr_sw1 {
>   				regulator-name = "vbus_otg";
>   				interrupts = <IT_OCP_OTG 0>;
> -			 };
> +			};
>   
> -			 vbus_sw: pwr_sw2 {
> +			vbus_sw: pwr_sw2 {
>   				regulator-name = "vbus_sw";
>   				interrupts = <IT_OCP_SWOUT 0>;
>   				regulator-active-discharge = <1>;
> -			 };
> +			};
>   		};
>   
>   		onkey {

Applied on stm32-next.

Thanks.
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
