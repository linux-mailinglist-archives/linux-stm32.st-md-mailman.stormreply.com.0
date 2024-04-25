Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 322698B1C63
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Apr 2024 10:01:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD5B4C7128B;
	Thu, 25 Apr 2024 08:01:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20DBEC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Apr 2024 08:01:11 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43P6kBGS012219;
 Thu, 25 Apr 2024 10:00:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=YOtHCuQVgrYDXWdRuWwEP3mcQFoNJIbnwBuetJ2gNNU=; b=0Z
 YKrry4yGKBct1MDuCBybElqQy5KsACTBj6pKJ8yGTVCB/ZnT0/hHZZFXYLnOVxgl
 7v7CnCZO2tRSiutP5IB6jIIO8obG8/HYUy1qjWw5fZNQCfbqk73598+quodjDTXa
 SMpvDz4NaeI8cwVQ27xByeMeWCHbhMCH6HUJiXKLFBqFwcfAzRnkFTMijypBchvj
 VRXe2YiIZDiD1QODBx85QtPqSH4EPwcCtxUkLyU8TtdeNLihKNOrZwogeJfbzuEO
 anmZMT8yRMYw5oIF5DSHNKwPpX139M0IIUX0crVLeCUQgKUqcPnVtp3YCQu44RdO
 9C64JBJMgTEi2hnL70og==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xmq90th7w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Apr 2024 10:00:55 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id F3AE54002D;
 Thu, 25 Apr 2024 10:00:51 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 153102132C0;
 Thu, 25 Apr 2024 10:00:07 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 25 Apr
 2024 10:00:06 +0200
Message-ID: <a78007e1-ebc9-433d-9685-7e79dfa37b96@foss.st.com>
Date: Thu, 25 Apr 2024 10:00:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alain Volmat <alain.volmat@foss.st.com>, Andi Shyti
 <andi.shyti@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>
References: <20231215170617.95868-1-alain.volmat@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20231215170617.95868-1-alain.volmat@foss.st.com>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_07,2024-04-25_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor@kernel.org>, linux-i2c@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 0/9] i2c: stm32f7: enhancements and
 support for stm32mp25
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

Hi Alain

On 12/15/23 18:06, Alain Volmat wrote:
> This series first perform enhancements in the way interrupt are handled
> and cleanup in messages.
> Then it adds support for the stm32mp25 which differs in that
> it only has a single irq line for both event/error and has a
> different handling of the FastModePlus.
> Support is then enabled within the stm32mp25 related device-trees.
> 
> Changelog:
> v3: - addition of 2 commits dealing with readl_relaxed(I2C_ISR) in
>        isr handler and a second one to use dev_err_probe during probe
>      - correction of SOB in commit
> 
> v2: - correct st,stm32-i2c.yaml.  Use if then else scheme to indicate
>        number of interrupts / interrupt-names depending on the
>        compatible while keeping the description within the common part
> 
>      - correct 2 maybe-uninitialized warnings
>            * ret in stm32f7_i2c_write_fm_plus_bits
>            * irq_error in stm32f7_i2c_probe, move the platform_get_irq
>              within the same if block as devm_request_threaded_irq
> 
> Alain Volmat (9):
>    i2c: stm32f7: use dev_err_probe upon calls of devm_request_irq
>    i2c: stm32f7: perform most of irq job in threaded handler
>    i2c: stm32f7: simplify status messages in case of errors
>    dt-bindings: i2c: document st,stm32mp25-i2c compatible
>    i2c: stm32f7: perform I2C_ISR read once at beginning of event isr
>    i2c: stm32f7: add support for stm32mp25 soc
>    arm64: dts: st: add all 8 i2c nodes on stm32mp251
>    arm64: dts: st: add i2c2/i2c8 pins for stm32mp25
>    arm64: dts: st: add i2c2 / i2c8 properties on stm32mp257f-ev1
> 
>   .../devicetree/bindings/i2c/st,stm32-i2c.yaml |  28 ++
>   arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi |  36 ++
>   arch/arm64/boot/dts/st/stm32mp251.dtsi        |  96 +++++
>   arch/arm64/boot/dts/st/stm32mp257f-ev1.dts    |  20 +
>   drivers/i2c/busses/i2c-stm32f7.c              | 342 +++++++++---------
>   5 files changed, 358 insertions(+), 164 deletions(-)
> 

DT patches applied on stm32-next. Not that I added acces-controller 
bindings for all I2C nodes.

Thanks!
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
