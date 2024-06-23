Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 30005913D54
	for <lists+linux-stm32@lfdr.de>; Sun, 23 Jun 2024 19:39:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA5D6C71287;
	Sun, 23 Jun 2024 17:39:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B79FDC6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 23 Jun 2024 17:39:34 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45NHBVjM026625;
 Sun, 23 Jun 2024 19:38:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 8psInQVn9Me0332vc4g9dy61RVy3/pavE8OpH2L34BE=; b=mHvI5iQKUNHIm5+i
 PQ2PwoTrEpayZrTYyD9XtOMMDXTi4zXQNyw5fU8XeJn0XL4hnP/6TUEZzQ5w4O9V
 774FD4oscz/d1IrEn8aBc00zmosa5BRuGq0OuYKSGO+7lwHDzgKtE1HnCLscM//T
 LuKsUYixgwmM01Zd6vd5D+GNvb29d9B+p/T0NStyCLoAb3cXIr4wdDLrFzIcXcL/
 ZOApvk7Lp+e6oSSK3L8T0TznTEiHMoJUQPFVgBnist+8D3sATpdaYPYkEGS/hMqA
 klVb6cTC9KfTCCDVfffq9F+NAMIPgMqk91mfUWv1p2lRTmXtwSDHolWTGwedA4Jq
 12wJ2Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ywnxx3spn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 23 Jun 2024 19:38:58 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A11A04002D;
 Sun, 23 Jun 2024 19:38:50 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 46C932207A7;
 Sun, 23 Jun 2024 19:38:14 +0200 (CEST)
Received: from [192.168.8.15] (10.252.20.50) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sun, 23 Jun
 2024 19:38:13 +0200
Message-ID: <2ee5ec54d3aff6e37ec1245eeb019d52e6a3d63f.camel@foss.st.com>
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Thomas Gleixner <tglx@linutronix.de>, Russell King <linux@armlinux.org.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Date: Sun, 23 Jun 2024 19:38:11 +0200
In-Reply-To: <87le2va7t5.ffs@tglx>
References: <20240620083115.204362-1-antonio.borneo@foss.st.com>
 <20240620083115.204362-8-antonio.borneo@foss.st.com> <87le2va7t5.ffs@tglx>
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-Originating-IP: [10.252.20.50]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-23_09,2024-06-21_01,2024-05-17_01
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 7/8] ARM: stm32: allow build
 irq-stm32mp-exti driver as module
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

On Sun, 2024-06-23 at 19:27 +0200, Thomas Gleixner wrote:
> On Thu, Jun 20 2024 at 10:31, Antonio Borneo wrote:
> 
> > Drop auto-selecting the driver, so it can be built either as a
> > module or built-in.
> 
> How is the driver selected then? Has this to be done manually now?
> 
> If so, doesn't that break things when starting from an empty config?

In patch 6/8 it is already selected through:

+	depends on (ARCH_STM32 && !ARM_SINGLE_ARMV7M) || COMPILE_TEST
+	default y

Regards,
Antonio
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
