Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D9F91A400
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2024 12:38:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 71A69C71282;
	Thu, 27 Jun 2024 10:38:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 148BFC71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 10:37:55 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45R9kc3N005234;
 Thu, 27 Jun 2024 12:37:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 t1qc6hBu5h9ml74wPtGNLWydIMCaeJAySMfkvXXLwT4=; b=V8o3bCQS7MlaSJeO
 wB2uxDlPM7Q2JT6imbygmiVyFqrFYAEDr7mmvPx3rDyGA9onCukU2/RuUHAnpFgm
 fHb56urP0xAJmNxhl0vgFAOjui93FpgOUEGr4Bn7dLy4gxZBMyf2ozIsW9lp8IBV
 fBtuzxWHdWFsDJbECxMetgL8iyehid8xZ3XbMRP+HaKs853vA1YHkXdykNxGh/Zl
 lz2OQe/RraGEDQKK/RVjgR7QjV6+FlmzMsj7THnqZX8IzKkn4RYhhyVicTuW52aa
 v39FvKGKrh5hLKgQs/pkS0O4JeuA4tjX7xWx4idX9cSwBDWKm17chUaOb7XoN/8s
 kcatxw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ywm1gng8x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jun 2024 12:37:46 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id F3BB84002D;
 Thu, 27 Jun 2024 12:37:41 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 34DAB21685D;
 Thu, 27 Jun 2024 12:37:08 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 27 Jun
 2024 12:37:07 +0200
Message-ID: <869899cc-cb6f-4dbf-8a89-5e6f87b8f0eb@foss.st.com>
Date: Thu, 27 Jun 2024 12:37:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Etienne Carriere <etienne.carriere@foss.st.com>,
 <linux-kernel@vger.kernel.org>
References: <20240617091418.2956380-1-etienne.carriere@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20240617091418.2956380-1-etienne.carriere@foss.st.com>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_06,2024-06-27_02,2024-05-17_01
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: OP-TEE async notif
 interrupt for ST STM32MP15x boards
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

Hi Etienne

On 6/17/24 11:14, Etienne Carriere wrote:
> Define the GIC interrupt (PPI 15) to be used on ST STM32MP15x boards
> for OP-TEE async notif.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
> ---
>   arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts | 5 +++++
>   arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts | 5 +++++
>   arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts | 5 +++++
>   arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts | 5 +++++
>   4 files changed, 20 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts b/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts
> index 306e1bc2a514..847b360f02fc 100644
> --- a/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts
> +++ b/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts
> @@ -62,6 +62,11 @@ &m4_rproc {
>   	reset-names = "mcu_rst", "hold_boot";

...

Applied on stm32-next.

Thanks!!

Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
