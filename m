Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 828367BDAF8
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Oct 2023 14:13:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30DDDC6A61D;
	Mon,  9 Oct 2023 12:13:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37285C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Oct 2023 12:13:22 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3997rFWx025374; Mon, 9 Oct 2023 14:13:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=Js7aNeSM/SCYmsb14dgCNvgdxI7cquNA2ZnKLbNhFyE=; b=Nj
 v3Izd41BIlnR9vOrf1uVhFLA8s3JCkVpAi3cohJSSOAy9XJ5VJZaSMjT/nxUavT6
 eOCCl6Q6zpoXEb3NCPaWbeF4sRyRi9tGM3siErqlqODkKyr4IximXf0E/1e90Y/o
 KUS2D4mKzUx/E5MuQc3bUEN4mcJAjqK0pKHPPXJV9ddgVSRrFaHoVGXwug3k30hS
 LKh6A6sHn47ofgUeW5FDvSixAMoSOdA5xtKhIOjOCM/5g9v23YC6FvcuECq3j5V0
 nYA5Jy/41k4TTDSsVIbU4cQhPLmig7/13trQEJ8YeVKZY/4YTFMy7U88lL8wQHuX
 mGYblL7//oPyns1L0rHQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3tkhk3d1np-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Oct 2023 14:13:09 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1862710005E;
 Mon,  9 Oct 2023 14:13:08 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0EE2F2171DF;
 Mon,  9 Oct 2023 14:13:08 +0200 (CEST)
Received: from [10.201.21.122] (10.201.21.122) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 9 Oct
 2023 14:13:07 +0200
Message-ID: <be5521e7-5093-e8c2-9a9b-ebd09cb11386@foss.st.com>
Date: Mon, 9 Oct 2023 14:13:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Ben Wolsieffer <ben.wolsieffer@hefring.com>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
References: <20231002171339.1594470-1-ben.wolsieffer@hefring.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20231002171339.1594470-1-ben.wolsieffer@hefring.com>
X-Originating-IP: [10.201.21.122]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-09_11,2023-10-09_01,2023-05-22_02
Cc: Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 0/2] ARM: dts: stm32: add SDIO pinctrl
 sleep support on stm32f7
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

Hi Ben

On 10/2/23 19:13, Ben Wolsieffer wrote:
> Add support for switching the SDIO pins on the STM32F7 series to analog
> mode when not in use to save power.
> 
> I don't have any of the disco/eval boards to test, but I have tested
> this on an Emcraft STM32F746 SOM with a UCL-SOM-BSB carrier (using an
> out-of-tree DT) and our custom carrier board.
> 
> Ben Wolsieffer (2):
>    ARM: dts: stm32: add stm32f7 SDIO sleep pins
>    ARM: dts: stm32: add SDIO pinctrl sleep support on stm32f7 boards
> 
>   arch/arm/boot/dts/st/stm32746g-eval.dts   |  3 ++-
>   arch/arm/boot/dts/st/stm32f7-pinctrl.dtsi | 22 ++++++++++++++++++++++
>   arch/arm/boot/dts/st/stm32f746-disco.dts  |  3 ++-
>   arch/arm/boot/dts/st/stm32f769-disco.dts  |  3 ++-
>   4 files changed, 28 insertions(+), 3 deletions(-)
> 

Series applied on stm32-next.

Regards
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
