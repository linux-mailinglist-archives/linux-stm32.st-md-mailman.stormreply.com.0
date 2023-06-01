Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9F471EF70
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Jun 2023 18:46:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1DFBC6A61D;
	Thu,  1 Jun 2023 16:46:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50527C65042
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Jun 2023 16:46:51 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 351FlpAS010603; Thu, 1 Jun 2023 18:46:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : from : subject : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=HqU/+Xh6ddKc8jiStCeFLG1QAjrATFCxOKZdk/TGvuM=;
 b=cXMY7fb0YFHMksJ+ic8MRcb1/QlFgJ0mErUDXX7IXdAlBRvA9tu4O0DQZeys/iF0n1yq
 qFJn3mFbI0VL4O+3aGvC/SBNegKGaL32W9YhTn+AyvAC278PMiVxQlsbLqMEIlzY/vok
 nLqVKFJvD2NpkK64cm8GwwTPwzJVizIir/NAW2e177A9jiyr7DNbep61/Sb5lkquFCEs
 bCykLSyaqYmXYvotsdmKM6aw/0XccuYg6paAcwjSI8BSW886uPrOdUN4bYnUd9UbCBMw
 WGho/aeyBl1xMPd3TvSzxbgvGBmWzwDleXda2R+TKvk3fFEojk9JThu7MJsphAos7PdE 3Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qx3152cu1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jun 2023 18:46:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4135710002A;
 Thu,  1 Jun 2023 18:46:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 30D60267E28;
 Thu,  1 Jun 2023 18:46:38 +0200 (CEST)
Received: from [10.129.178.187] (10.129.178.187) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 1 Jun
 2023 18:46:37 +0200
Message-ID: <b343ab21-2787-4602-57f8-4c2bf62db523@foss.st.com>
Date: Thu, 1 Jun 2023 18:46:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>,
 Philippe CORNU - foss <philippe.cornu@foss.st.com>, yannick Fertre
 <yannick.fertre@foss.st.com>
References: <20230531231044.574541-1-marex@denx.de>
Content-Language: en-US
In-Reply-To: <20230531231044.574541-1-marex@denx.de>
X-Originating-IP: [10.129.178.187]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-01_08,2023-05-31_03,2023-05-22_02
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Deduplicate DSI node
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Marek,


On 6/1/23 01:10, Marek Vasut wrote:
> All boards using the DSI node duplicate the same pattern common pattern
> in board DTs, that pattern is ports with endpoint labels and the same
> in-SoC regulator connection. Move that common pattern into stm32mp157.dtsi
> instead.

I think that is a good idea, while it did not crossed my mind implementing it
this way on the first time.

I'll let my peers Philippe and Yannick review and ack it this time. I tested it
on DK2, it seems fine.


Thanks :)

> The two boards which do define panel@0 directly in the DSI bridge node now
> have #address-cells/#size-cells in their board DT instead of it being in
> stm32mp157.dtsi and activated incorrectly for all boards, even the ones
> which use e.g. another DSI-to-something bridge.
>
> Signed-off-by: Marek Vasut <marex@denx.de>


Reviewed-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>


> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
>  arch/arm/boot/dts/stm32mp157.dtsi             | 18 ++++++++++++
>  ...tm32mp157a-icore-stm32mp1-ctouch2-of10.dts | 24 ++++------------
>  .../stm32mp157a-icore-stm32mp1-edimm2.2.dts   | 28 ++++++-------------
>  arch/arm/boot/dts/stm32mp157c-dk2.dts         | 28 ++++++-------------
>  arch/arm/boot/dts/stm32mp157c-ev1.dts         | 28 ++++++-------------
>  5 files changed, 48 insertions(+), 78 deletions(-)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
