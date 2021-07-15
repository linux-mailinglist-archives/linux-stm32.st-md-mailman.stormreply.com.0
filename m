Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B39B83CA16E
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jul 2021 17:27:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65D17C597AA;
	Thu, 15 Jul 2021 15:27:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D32BC59781
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jul 2021 15:27:12 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16FFCArn025316; Thu, 15 Jul 2021 17:27:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=S6mnZioXaQIzCXwO7yP1zsdrYT+pdG005dlqEwtqPcc=;
 b=x3tQGojumsCdIP/4LlWUo2uA/tmIou8I7pt/JZ7AKckcDh6RVZpND9qy9nXnrQZTJlda
 L7ov0kxquZOaRUkz/1uexcFpoWL9UgQTprulGOlONTHV2k6Ky/GSBua6v2OpHLGIPBou
 cG8Iw1eQyCwGoT+p6hxh0yO/nGdL26A36AwEK5MMgPfahZmigS5JPhipyFAlss+nWJqZ
 wRxPbnCcTLqaAincnHQQCu4eCLCwcVLcaBcV+6KdU4nkFpVR9HuRp+1kCYxmukQ91xez
 5nnlUFv3zAcYSE+53iuwg4O1V/ScRueXzgYABBQaPxRJa2ObRkh1jSg8AWIelp2nvzfp pQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39tac3v7qg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Jul 2021 17:27:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 531F010002A;
 Thu, 15 Jul 2021 17:27:07 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 49A5A231526;
 Thu, 15 Jul 2021 17:27:07 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 15 Jul
 2021 17:27:06 +0200
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20210610150306.30072-1-marex@denx.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <a393eb0b-a8d6-e29a-62c8-8988429c9139@foss.st.com>
Date: Thu, 15 Jul 2021 17:27:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210610150306.30072-1-marex@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-15_10:2021-07-14,
 2021-07-15 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Set {bitclock,
 frame}-master phandles on ST DKx
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

Hi Marek

On 6/10/21 5:03 PM, Marek Vasut wrote:
> Fix the following dtbs_check warning:
> cs42l51@4a: port:endpoint@0:frame-master: True is not of type 'array'
> cs42l51@4a: port:endpoint@0:bitclock-master: True is not of type 'array'
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>   arch/arm/boot/dts/stm32mp15xx-dkx.dtsi | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
> index 59f18846cf5d..586aac8a998c 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
> @@ -220,15 +220,15 @@ cs42l51_port: port {
>   			cs42l51_tx_endpoint: endpoint@0 {
>   				reg = <0>;
>   				remote-endpoint = <&sai2a_endpoint>;
> -				frame-master;
> -				bitclock-master;
> +				frame-master = <&cs42l51_tx_endpoint>;
> +				bitclock-master = <&cs42l51_tx_endpoint>;
>   			};
>   
>   			cs42l51_rx_endpoint: endpoint@1 {
>   				reg = <1>;
>   				remote-endpoint = <&sai2b_endpoint>;
> -				frame-master;
> -				bitclock-master;
> +				frame-master = <&cs42l51_rx_endpoint>;
> +				bitclock-master = <&cs42l51_rx_endpoint>;
>   			};
>   		};
>   	};
>

Applied on stm32-next. Thanks to update the DKx board. Note that 
"cirrus,cs42l51.yaml" has to be also updated. Did you also sent yaml 
update aside this patch ?

cheers
Alex

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
