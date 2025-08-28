Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02234B39CB1
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Aug 2025 14:16:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63603C3F95D;
	Thu, 28 Aug 2025 12:16:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8CC4CC30883
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Aug 2025 12:16:46 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SAJbT7003220;
 Thu, 28 Aug 2025 14:15:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 H2VjxPIys7d1tJoSW05HXWGO8B1PQC1RoUMeQHH1la8=; b=gyABa5URoIdL0qys
 8nCirTWeTflyOsuJyYXpsDDVA3hHboNWQpco+hkmcJZ4hpecA3kRy3o+RGR41538
 YlgI7saSguc+YAAM6UsqKjzRb6l582ilE/u6LaPff8muKBs9qp2hDkdvdObtHIb6
 Em6ELCC29h/Noubjyln1OLyPnAdp+HSOnO0de509FCkMiDJOkxL07lFkQ7nznvMy
 ydQWuw7sEn3myU8qdzK2+gQ/Lyq41sz8ocCROVnTgiZv4TyRCADCeSh2/9bMTu6B
 Wfv6BdSRNqc2ek/eZ9iJrCR1z9VRjVYabdE3vl9g3DLzWIDMGQV13qQd1y00iFFL
 sZ5Jbw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48q5tt5139-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Aug 2025 14:15:55 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id EA37D40048;
 Thu, 28 Aug 2025 14:14:08 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2A75372766C;
 Thu, 28 Aug 2025 14:13:02 +0200 (CEST)
Received: from [10.130.77.120] (10.130.77.120) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 28 Aug
 2025 14:13:00 +0200
Message-ID: <9133348a-f6a4-4425-98e2-a784a7620b3a@foss.st.com>
Date: Thu, 28 Aug 2025 14:12:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Christian Bruel <christian.bruel@foss.st.com>
To: Bjorn Helgaas <helgaas@kernel.org>
References: <20250827185825.GA894342@bhelgaas>
Content-Language: en-US
In-Reply-To: <20250827185825.GA894342@bhelgaas>
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_03,2025-08-28_01,2025-03-28_01
Cc: linux-doc@vger.kernel.org, linux-pci@vger.kernel.org, lpieralisi@kernel.org,
 quic_schintav@quicinc.com, linux-stm32@st-md-mailman.stormreply.com,
 kwilczynski@kernel.org, namcao@linutronix.de, robh@kernel.org, corbet@lwn.net,
 linux-arm-kernel@lists.infradead.org, linus.walleij@linaro.org,
 mayank.rana@oss.qualcomm.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 mcoquelin.stm32@gmail.com, mani@kernel.org, qiang.yu@oss.qualcomm.com,
 linux-gpio@vger.kernel.org, bhelgaas@google.com, johan+linaro@kernel.org,
 shradha.t@samsung.com, thippeswamy.havalige@amd.com, inochiama@gmail.com,
 linux-kernel@vger.kernel.org, p.zabel@pengutronix.de, krzk+dt@kernel.org
Subject: Re: [Linux-stm32] [PATCH v13 06/11] PCI: stm32: Add PCIe Endpoint
 support for STM32MP25
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



On 8/27/25 20:58, Bjorn Helgaas wrote:
> On Wed, Aug 20, 2025 at 09:54:06AM +0200, Christian Bruel wrote:
>> Add driver to configure the STM32MP25 SoC PCIe Gen1 2.5GT/s or Gen2 5GT/s
>> controller based on the DesignWare PCIe core in endpoint mode.
> 
>> +static void stm32_pcie_perst_deassert(struct dw_pcie *pci)
>> +{
>> +	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
>> +	struct device *dev = pci->dev;
>> +	struct dw_pcie_ep *ep = &pci->ep;
>> +	int ret;
>> +
>> +	dev_dbg(dev, "PERST de-asserted by host\n");
>> +
>> +	ret = pm_runtime_resume_and_get(dev);
>> +	if (ret < 0) {
>> +		dev_err(dev, "Failed to resume runtime PM: %d\n", ret);
>> +		return;
>> +	}
>> +
>> +	ret = stm32_pcie_enable_resources(stm32_pcie);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to enable resources: %d\n", ret);
>> +		goto err_pm_put_sync;
>> +	}
>> +
>> +	/*
>> +	 * Need to reprogram the configuration space registers here because the
>> +	 * DBI registers were incorrectly reset by the PHY RCC during phy_init().
> 
> Is this incorrect reset of DBI registers a software issue or some kind
> of hardware erratum that might be fixed someday?  Or maybe it's just a
> characteristic of the hardware and thus not really "incorrect"?
> 
> I do see that qcom_pcie_perst_deassert() in pcie-qcom-ep.c also calls
> dw_pcie_ep_init_registers() in the qcom_pcie_ep_perst_irq_thread()
> path.
> 
> So does pex_ep_event_pex_rst_deassert() (pcie-tegra194.c) in the
> tegra_pcie_ep_pex_rst_irq() path.
> 
> But as far as I can tell, none of the other dwc drivers need this, so
> maybe it's something to do with the glue around the DWC core?

The RCC PHY reset is connected to the Synopsys cold reset logic, which 
explains why the registers need to be restored. This point has been 
addressed in the reference manual.

I am not sure if the tegra194 and qcom drivers restore the registers for 
the same reason. But refactoring this into the DWC core would require a 
runtime condition to test for persistent registers or support for warm 
reset.

Best Regards

Christian


> 
>> +	 */
>> +	ret = dw_pcie_ep_init_registers(ep);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to complete initialization: %d\n", ret);
>> +		goto err_disable_resources;
>> +	}

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
