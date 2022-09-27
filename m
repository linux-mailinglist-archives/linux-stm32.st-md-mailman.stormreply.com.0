Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A155EBD68
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Sep 2022 10:36:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73629C63326;
	Tue, 27 Sep 2022 08:36:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74816C5F1D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Sep 2022 08:36:18 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28R799DP009702;
 Tue, 27 Sep 2022 10:36:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : from : subject : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=PH7GMSVIWUZ2PsyrJ5RjOgqj6ttxKN9GnlKkZxrYNgQ=;
 b=MQLLeouadt5M/EdscplA+27/isP3GKTcq2yuF4cK0lp4SJEKes95uUEsygqUpW1HqI2h
 h3nYsnTS0ZkULZecm4rn41+H402C5N6YvzkLiuKXjD6HsEbcrSmhnZLbBJcPkbV25ChF
 fal/ROg1atGn6eLKB7R7xOp+F9hqWKbFCEM19btVeS6XdcWx/32MqKTk8LzCEcC7zv/Y
 r+1lfk4kxMx3YEerX+TQIlHdooysC1JRmR5l5aLgBtET87DoAmlkevmpeocSTOCmOA3Y
 lAGbR15FSC7f0AyHF9+fdTOOsrFRRHESaQ8+SNRMYHxO1cmpwzZr/pKgkit6uhMWZf7x iw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jss827yw2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Sep 2022 10:36:09 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 46C2010002A;
 Tue, 27 Sep 2022 10:36:09 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3DB6B2122F3;
 Tue, 27 Sep 2022 10:36:09 +0200 (CEST)
Received: from [10.201.20.178] (10.75.127.116) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Tue, 27 Sep
 2022 10:36:08 +0200
Message-ID: <f14a5c06-6bd8-deb6-56e6-35523a23d3de@foss.st.com>
Date: Tue, 27 Sep 2022 10:35:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: Olivier MOYSAN <olivier.moysan@foss.st.com>
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20220927002023.685128-1-marex@denx.de>
Content-Language: en-US
In-Reply-To: <20220927002023.685128-1-marex@denx.de>
X-Originating-IP: [10.75.127.116]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-27_02,2022-09-22_02,2022-06-22_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Replace SAI format with
 dai-format DT property
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

Hi Marek,

Thanks for your patch.
You can add my:
Reviewed-by: Olivier Moysan <olivier.moysan@foss.st.com>

BRs

On 9/27/22 02:20, Marek Vasut wrote:
> The dai-format and format are handled equally by sound-core.c , the
> later is however the only documented property in audio-graph-port.yaml .
> Switch to the later.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>   arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi      | 4 ++--
>   arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi | 2 +-
>   arch/arm/boot/dts/stm32mp15xx-dkx.dtsi             | 4 ++--
>   3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
> index 5f586f024060f..4709677151aac 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
> @@ -242,7 +242,7 @@ sai2a: audio-controller@4400b004 {
>   		sai2a_port: port {
>   			sai2a_endpoint: endpoint {
>   				remote-endpoint = <&sgtl5000_tx_endpoint>;
> -				format = "i2s";
> +				dai-format = "i2s";
>   				mclk-fs = <512>;
>   				dai-tdm-slot-num = <2>;
>   				dai-tdm-slot-width = <16>;
> @@ -260,7 +260,7 @@ sai2b: audio-controller@4400b024 {
>   		sai2b_port: port {
>   			sai2b_endpoint: endpoint {
>   				remote-endpoint = <&sgtl5000_rx_endpoint>;
> -				format = "i2s";
> +				dai-format = "i2s";
>   				mclk-fs = <512>;
>   				dai-tdm-slot-num = <2>;
>   				dai-tdm-slot-width = <16>;
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
> index aa79ed1cb1f15..50af4a27d6be4 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
> @@ -358,7 +358,7 @@ sai2a: audio-controller@4400b004 {
>   		sai2a_port: port {
>   			sai2a_endpoint: endpoint {
>   				remote-endpoint = <&adv7513_i2s0>;
> -				format = "i2s";
> +				dai-format = "i2s";
>   				mclk-fs = <256>;
>   			};
>   		};
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
> index 6afff983069b6..7798a2e17c5ca 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
> @@ -508,7 +508,7 @@ sai2a: audio-controller@4400b004 {
>   		sai2a_port: port {
>   			sai2a_endpoint: endpoint {
>   				remote-endpoint = <&cs42l51_tx_endpoint>;
> -				format = "i2s";
> +				dai-format = "i2s";
>   				mclk-fs = <256>;
>   				dai-tdm-slot-num = <2>;
>   				dai-tdm-slot-width = <32>;
> @@ -526,7 +526,7 @@ sai2b: audio-controller@4400b024 {
>   		sai2b_port: port {
>   			sai2b_endpoint: endpoint {
>   				remote-endpoint = <&cs42l51_rx_endpoint>;
> -				format = "i2s";
> +				dai-format = "i2s";
>   				mclk-fs = <256>;
>   				dai-tdm-slot-num = <2>;
>   				dai-tdm-slot-width = <32>;
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
