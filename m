Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6A5B422B3
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Sep 2025 15:58:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C90C6C3FAC9;
	Wed,  3 Sep 2025 13:58:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 550F5C3FAC8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Sep 2025 13:58:36 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BRm9D016232;
 Wed, 3 Sep 2025 15:58:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 4UlTu2YpLab0/pa6q4pnPYbb7UfqHxugcQ+IeQKpoe8=; b=dv+aGAmrdVz2+GR7
 WbDwiJvebx2c1PJDxXNLuofMlIPs+uPWjzRncV3nJtg529P2gJ38/DUXZI5R9qSl
 q8xEuxTcsC9GTw6bAT8OWdgHd3mqQU6mCLGHVvl0PL58yezEUoff4wlMfedUl7GQ
 vC/SuSvFwhMjOZFIc1uHi8dyse+ZOpaGzp5Pa4DJNAQ1vdb0tKxq0S0/pWyKN15W
 pyt+LdVjNuT6NCU6m/f5aKVTgN1ywevniL28nsQgnW/MkdlHiL+O1bqP5fR9QXOL
 nb44vr2wn/jF/Z5r9DgZBr9Qg9YoPCRFChnxVQnDZ+wpd34L4sO44ppHbMbvgcad
 k+rH0g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48ur6frr2c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Sep 2025 15:58:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 44DEE40048;
 Wed,  3 Sep 2025 15:57:35 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 64962399931;
 Wed,  3 Sep 2025 15:56:57 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 3 Sep
 2025 15:56:56 +0200
Message-ID: <66a94f4b-2efa-4671-9668-71995a9c1ac4@foss.st.com>
Date: Wed, 3 Sep 2025 15:56:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Antonio Borneo <antonio.borneo@foss.st.com>, Linus Walleij
 <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250610152309.299438-1-antonio.borneo@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20250610152309.299438-1-antonio.borneo@foss.st.com>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_07,2025-08-28_01,2025-03-28_01
Cc: linux-arm-kernel@lists.infradead.org,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [RESEND PATCH v2 0/5] STM32 pinctrl: Add mux
	function RSVD
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

Ciao Antonio

On 6/10/25 17:23, Antonio Borneo wrote:
> This v2 is a subset of the v1, split-out to simplify the review.
> 
> This subset:
> - introduces the pinctrl mux function RSVD,
> - adds two use cases requiring RSVD,
> - minor re-format of the dt-bindings.
> 
> Changes v1 -> v2 subset:
> - rebased on v6.16-rc1,
> - added use cases of the new mux function RSVD,
> - added Reviewed-by: on 2/5 (former 04/14 in v1),
> - added commit to re-format the dt-bindings,
> - Link to v1: https://lore.kernel.org/lkml/20241022155658.1647350-1-antonio.borneo@foss.st.com/
> 
> 
> Antonio Borneo (3):
>    ARM: dts: stm32: Add pinmux for CM4 leds pins
>    ARM: dts: stm32: Add leds for CM4 on stm32mp15xx-ed1 and
>      stm32mp15xx-dkx
>    dt-bindings: pinctrl: stm32: Add missing blank lines
> 
> Fabien Dessenne (2):
>    pinctrl: stm32: Handle RSVD pin configuration
>    dt-bindings: pinctrl: stm32: Add RSVD mux function
> 
>   .../bindings/pinctrl/st,stm32-pinctrl.yaml    | 25 +++++++++++++++++++
>   arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi   | 14 +++++++++++
>   arch/arm/boot/dts/st/stm32mp157c-ed1.dts      |  2 ++
>   arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi     |  2 ++
>   drivers/pinctrl/stm32/pinctrl-stm32.c         |  9 +++++++
>   drivers/pinctrl/stm32/pinctrl-stm32.h         |  3 ++-
>   include/dt-bindings/pinctrl/stm32-pinfunc.h   |  1 +
>   7 files changed, 55 insertions(+), 1 deletion(-)
> 
> 
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494

DT patches applied on stm32-next.

Thanks!!
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
