Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC01FA16844
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Jan 2025 09:36:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73EECC78002;
	Mon, 20 Jan 2025 08:36:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56950CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Jan 2025 08:36:32 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50K8VeAT027721;
 Mon, 20 Jan 2025 09:36:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 iPRD2KWoZvbHZFTPohaghCcVvZX1drMbrOqQgWvHJmg=; b=CXYXMxsVof+3Wz47
 pE44y6yoapWMYfryXmQmgwWCVrd1MV0ICGv6PCjjCMpIGQttUaApGosIU58zgpIy
 vfdnQJxX6cGKfRGAp3ZpqnpIE7lZsFFFXHdLnyFbraBYqqeX3+/5oAX1Pbbh1H/g
 Z1zTGqiGugZk7RQcr0gTqlv93umVokS7DlAb9sFO5hlHNEJSBXw0+ZY+mD6TTi8q
 wd2UcMwGP0xxMcy1k29Bv3kXT/8msT6uHT/J0WL9iuUCn+QdGxedMk/pXBcccG5m
 0McvNf2JQUoo1Ch89bbYfGv1cFMej52XR4TunA24staAgIpqHMkvR8bmpyyMAHax
 nVGU9g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 449jdf875u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jan 2025 09:36:03 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1005640048;
 Mon, 20 Jan 2025 09:33:58 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 17DC127B404;
 Mon, 20 Jan 2025 09:32:10 +0100 (CET)
Received: from [192.168.8.15] (10.48.86.148) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 20 Jan
 2025 09:32:09 +0100
Message-ID: <98652dc2f29b172a9caafe55d04cb965768e2a66.camel@foss.st.com>
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Len Brown <len.brown@intel.com>, Pavel Machek
 <pavel@ucw.cz>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Dmitry
 Torokhov" <dmitry.torokhov@gmail.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Linus Walleij
 <linus.walleij@linaro.org>, Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>
Date: Mon, 20 Jan 2025 09:32:07 +0100
In-Reply-To: <20250103-wake_irq-v2-6-e3aeff5e9966@nxp.com>
References: <20250103-wake_irq-v2-0-e3aeff5e9966@nxp.com>
 <20250103-wake_irq-v2-6-e3aeff5e9966@nxp.com>
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-Originating-IP: [10.48.86.148]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_01,2025-01-20_02,2024-11-22_01
Cc: linux-rtc@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 06/12] rtc: stm32: Use resource managed
 API to simplify code
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

On Fri, 2025-01-03 at 16:41 +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Use devm_pm_set_wake_irq and devm_device_init_wakeup to cleanup the
> error handling code and 'driver.remove()' hook.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Antonio Borneo <antonio.borneo@foss.st.com>

Thanks,
Antonio
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
