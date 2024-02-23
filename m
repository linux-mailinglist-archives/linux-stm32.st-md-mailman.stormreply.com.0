Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B74CA8612EE
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Feb 2024 14:40:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6BB40C6B47A;
	Fri, 23 Feb 2024 13:40:56 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3627C69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Feb 2024 13:40:54 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41NBw6P6025967; Fri, 23 Feb 2024 14:40:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:subject:from:to:cc:date:in-reply-to:references
 :content-type:content-transfer-encoding:mime-version; s=
 selector1; bh=PUdaN+NOyiFko6ApVjfQUO99UPdl8r3ljDhSfM9je4I=; b=gm
 KWY4aCZqrkRS2Qaq06UuV+RBt72dfljhqYIuva4PStKzOdrAyUhPAFIi62vE1MbS
 2QvWTc6PcHoh0LOjJtvqldsTwdA1WJ40G0dNLsf/Q9ynqzLQun+y9ZfAitMFFnck
 4flc3JmzFTAI33MC5OYzUsVHm8U31oMLp2+ISJgRK1tiNOR274sWDh9T/XJlCF3W
 FBuOFov8w40GUcVMQ0lD4vGr96a5EXeP2whCHq4iRzM8XE1pn5NqBosK9yOTRjnS
 GANfQy6gfNQSIOyNjJWJkiP+VAe9n24puIyyfgXpEfpkCy8tTzJPWGSk00SAa9rM
 y6B0VUCQu4nFZJPaXqrA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3wd2024w03-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Feb 2024 14:40:18 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E9FE040044;
 Fri, 23 Feb 2024 14:40:13 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DF21A29D7F4;
 Fri, 23 Feb 2024 14:39:26 +0100 (CET)
Received: from [192.168.8.15] (10.201.20.114) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 23 Feb
 2024 14:39:26 +0100
Message-ID: <2eb11bf9dc0c5f49de3fb72c44dd16d8ca136813.camel@foss.st.com>
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Rob Herring <robh@kernel.org>
Date: Fri, 23 Feb 2024 14:39:25 +0100
In-Reply-To: <20240222234300.GA3809915-robh@kernel.org>
References: <20240216094758.916722-1-antonio.borneo@foss.st.com>
 <20240216094758.916722-3-antonio.borneo@foss.st.com>
 <20240222234300.GA3809915-robh@kernel.org>
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-Originating-IP: [10.201.20.114]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_15,2024-02-23_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 02/12] dt-bindings: interrupt-controller:
 stm32-exti: Add irq nexus child node
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

On Thu, 2024-02-22 at 16:43 -0700, Rob Herring wrote:
> On Fri, Feb 16, 2024 at 10:47:47AM +0100, Antonio Borneo wrote:
> > The mapping of EXTI interrupts to its parent interrupt controller
> > is both SoC and instance dependent.
> > The current implementation requires adding a new table to the
> > driver's code and a new compatible for each new EXTI instance.
> > 
> > Add to the binding an interrupt nexus child node that will be
> > used on the new EXTI instances and can be optionally used on the
> > existing instances.
> > The property 'interrupt-map' in the nexus node maps each EXTI
> > interrupt to the parent interrupt.
> > Align #address-cells and #interrupt-cells between the EXTI node
> > and its nexus node.
> 
> Looks like an abuse of interrupt-map. You avoid adding yourself to the 
> abuser list by putting it in a child node. Clever. (See list in 
> drivers/of/irq.c if you don't know what I'm talking about)

Hi Rob,
thanks for the review.

Yes, I know already about the abuser list but, from the commit
message and the associated comment, I interpret it as an incorrect
use of the property interrupt-map with custom syntax thus relying 
on custom parsing code.
The child nexus node in this series allows using the default parser
in kernel.

From your reply, looks like my interpretation is incorrect and I
missed the real concern about the abuser list.
Could you please explain why this use of interrupt-map is incorrect
and/or which are the correct use cases?

> I assume the EXTI has 0..N interrupts. Just define 'interrupts' with N 
> entries with each entry mapping EXTI interrupt N to 'interrupts' entry 
> N.

Yes, EXTI has 0..N interrupts that can be mapped to multiple
parent interrupt controllers and the mapping table has holes.
While the DT in this series only use one interrupt parent, a second
parent will follow.
So 'interrupts-extended' property would be a better matching than
'interrupts' to handle the multiple parents.

But how to code the missing entries in an 'interrupts-extended' list?
As in the example in Documentation/devicetree/bindings/dma/apple,admac.yaml ?

The 'interrupt-map' contains the matching EXTI index, thus allowing
a 'sparse' map where holes are simply ignored.

Best Regards,
Antonio

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
