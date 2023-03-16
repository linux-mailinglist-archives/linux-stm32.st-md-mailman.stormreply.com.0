Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 133F56BC997
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Mar 2023 09:45:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6868C6904C;
	Thu, 16 Mar 2023 08:45:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F6FCC03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Mar 2023 08:45:46 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32G8ag0k007160; Thu, 16 Mar 2023 09:45:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=+VvmrXu/ffvFh3TQJ7KSmvkzPKsp4yTuF1jOM7wniec=;
 b=JSdlal0NCcbDLkw7dfUkNrpQxEAhVQ6p3/G4VXRssSgDWkLIr46kcX9eRn3J8HPZeOs2
 0F1fw3LlEEQH2t99PBVI7iEIV3rUPdO0dJsMpOU5iT9I3xZqgdDw1ZYDfYqdWgqvGi/W
 /U/6YCaCKjytO5ypOX01/8+nXb4M141V9ljH25E1xLfd/icOK6fO05YnNEL/CVwomoH6
 iEv/Dvh7Kgi8XyvT72jKmXYdAmYXo7Ky6XpMXuzahiDSVAvVE3HS7WXJroofek3iH6UJ
 Sg0ceqpON7qS2e+HKVB5lQF6iJMUcxTIY2y8DhNZg8LB5hsCp0ru9BoGXPVziUSHeKqB bQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3pbpwq2rf2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 09:45:37 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B3F2610002A;
 Thu, 16 Mar 2023 09:45:36 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A8C2E2105A5;
 Thu, 16 Mar 2023 09:45:36 +0100 (CET)
Received: from [10.48.1.102] (10.48.1.102) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Thu, 16 Mar
 2023 09:45:35 +0100
Message-ID: <0473d8b1-aa99-2458-7993-4320f1178e5b@foss.st.com>
Date: Thu, 16 Mar 2023 09:45:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: <hminas@synopsys.com>, <gregkh@linuxfoundation.org>, <maz@kernel.org>,
 <m.szyprowski@samsung.com>
References: <20230315163246.3848102-1-fabrice.gasnier@foss.st.com>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20230315163246.3848102-1-fabrice.gasnier@foss.st.com>
X-Originating-IP: [10.48.1.102]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-16_06,2023-03-15_01,2023-02-09_01
X-Topics: 
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] usb: dwc2: fix a devres leak in hw_enable
 upon suspend resume
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

On 3/15/23 17:32, Fabrice Gasnier wrote:
> Each time the platform goes to low power, PM suspend / resume routines
> call: __dwc2_lowlevel_hw_enable -> devm_add_action_or_reset().
> This adds a new devres each time.
> This may also happen at runtime, as dwc2_lowlevel_hw_enable() can be
> called from udc_start().
> 
> This can be seen with tracing:
> - echo 1 > /sys/kernel/debug/tracing/events/dev/devres_log/enable
> - go to low power
> - cat /sys/kernel/debug/tracing/trace
> 
> A new "ADD" entry is found upon each low power cycle:
> ... devres_log: 49000000.usb-otg ADD 82a13bba devm_action_release (8 bytes)
> ... devres_log: 49000000.usb-otg ADD 49889daf devm_action_release (8 bytes)
> ...
> 
> A second issue is addressed here:
> - regulator_bulk_enable() is called upon each PM cycle (suspend/resume).
> - regulator_bulk_disable() never gets called.
> 
> So the reference count for these regulators constantly increase, by one
> upon each low power cycle, due to missing regulator_bulk_disable() call
> in __dwc2_lowlevel_hw_disable().
> 
> The original fix that introduced the devm_add_action_or_reset() call,
> fixed an issue during probe, that happens due to other errors in
> dwc2_driver_probe() -> dwc2_core_reset(). Then the probe fails without
> disabling regulators, when dr_mode == USB_DR_MODE_PERIPHERAL.
> 
> Rather fix the error path: disable all the low level hardware in the
> error path, by using the "hsotg->ll_hw_enabled" flag. Checking dr_mode
> has been introduced to avoid a dual call to dwc2_lowlevel_hw_disable().
> "ll_hw_enabled" should achieve the same (and is used currently in the
> remove() routine).
> 
> Fixes: 54c196060510 ("usb: dwc2: Always disable regulators on driver teardown")
> Fixes: 33a06f1300a7 ("usb: dwc2: Fix error path in gadget registration")
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---

Hi all,

Please ignore this patch, I just sent a V2 to replace it.

Best Regards,
Fabrice
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
