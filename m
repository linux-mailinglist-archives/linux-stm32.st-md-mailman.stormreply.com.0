Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2798E7053BA
	for <lists+linux-stm32@lfdr.de>; Tue, 16 May 2023 18:27:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6EEEC6A615;
	Tue, 16 May 2023 16:27:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 857CBC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 May 2023 16:27:43 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34GFIIiQ012006; Tue, 16 May 2023 18:27:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=udGhMp0O1RByLfJX0yGSSTgRBYNdT/tj2/Vqssv7rUQ=;
 b=wGS2V22FJvSUHZJ+1N42FintCjkXvCVioWPRDWbOFZMKfGnzD440SjC78P2z9hjt3lXo
 gVGi5IdUsFdu5JhQJAgCdD1Moy+4CPD4vPjbxqGZNg+XjHQcxxBxIFSnCD86b/pKvJv/
 O+WMwmfAymAFXO//I0d+kH3EJZFApXUrTJ9+3ouC5X2yxw793IK5lcFO9VrUtYiwCm1n
 VnFWGPilUHvDxs9y1IA4VgHOhemBgCPo4D4tcXFdEFt8pme5zl/WUe1Kc+4HchXB7Paw
 z9HgsPcSUDe3XSr9Zgbkz2sHwWsxCNxBt55ttUiUJO2kKXEc8nXrviiqpz3h6ATikOUS rg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qkgqx2dre-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 May 2023 18:27:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BEC1910002A;
 Tue, 16 May 2023 18:27:33 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B1AE4235F07;
 Tue, 16 May 2023 18:27:33 +0200 (CEST)
Received: from [10.252.0.230] (10.252.0.230) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 16 May
 2023 18:27:33 +0200
Message-ID: <7839b9dc-0f33-0931-a552-ba4697f64150@foss.st.com>
Date: Tue, 16 May 2023 18:27:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>
References: <20230412151332.3037845-1-fabrice.gasnier@foss.st.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20230412151332.3037845-1-fabrice.gasnier@foss.st.com>
X-Originating-IP: [10.252.0.230]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-16_08,2023-05-16_01,2023-02-09_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [RFC PATCH] ARM: dts: stm32: remove typec port
 dtbs_check warning on stm32mp15xx-dkx
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


On 4/12/23 17:13, Fabrice Gasnier wrote:
> According to usb-connector.yaml, typec connector should always use:
> - ports property
> - with port@0 (required).
> This is also true for a single HS port. This removes dtbs_check warning:
> stusb1600@28: connector: Unevaluated properties are not allowed ('port'
> was unexpected)
> 
> Downside is it introduces another warning when building with W=1:
> 
> Warning (graph_child_address): /soc/i2c@5c002000/stusb1600@28/connector/
> ports: graph node has single child node 'port@0', #address-cells
> /#size-cells are not necessary
> 
> By removing #address-cells/#size-cells as suggested, another couple of
> W=1 warning shows up:
> Warning (avoid_default_addr_size): /soc/i2c@5c002000/stusb1600@28/
> connector/ports/port@0: Relying on default #address-cells value
> Warning (avoid_default_addr_size): /soc/i2c@5c002000/stusb1600@28/
> connector/ports/port@0: Relying on default #size-cells value
> 
> Is there a clean way or necessary change to reach a clean build and clean
> dtbs_check ?
> Maybe this kind of concern has already been addressed ?
> As far as I understand, the OF graph allows a single port {} node (e.g.
> code being reworked here). Could this be added in relevant dtschema, to
> address the single HS port use case (usb-connector.yaml) ?
> 

Rob, Krzysztof, do you an idea to figure out this issue ?

Thanks in advance
Alex


> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
>   arch/arm/boot/dts/stm32mp15xx-dkx.dtsi | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
> index cefeeb00fc22..41e79c8cc752 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
> @@ -259,9 +259,14 @@ connector {
>   			power-role = "dual";
>   			typec-power-opmode = "default";
>   
> -			port {
> -				con_usbotg_hs_ep: endpoint {
> -					remote-endpoint = <&usbotg_hs_ep>;
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				port@0 {
> +					reg = <0>;
> +					con_usbotg_hs_ep: endpoint {
> +						remote-endpoint = <&usbotg_hs_ep>;
> +					};
>   				};
>   			};
>   		};

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
