Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 459E49F64D8
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Dec 2024 12:27:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0928C78012;
	Wed, 18 Dec 2024 11:27:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A070EC5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2024 11:27:13 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI6oHKX032719;
 Wed, 18 Dec 2024 12:26:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 WK1PKmsLdMHmuIS4oNCU1BzF7ljmQDQFxfjOUdX1gH4=; b=ckUmMP0WTEqzQtDp
 w8KlcXYffhEfhJxZVedYAeqoFU9W4nL4m7zqd07ylW9k2dkllV3ijQqXafgKYn+d
 xSRtLs11MJEI7qM4f3AkWc2wxTuePPfTGLJMXkHaIdP65zPzjbbQmQtY6Ms8w/LR
 YIu9V8Gi/AjzcP/Fq0fPAz2XDy7dVFg5IjCIGa6MxQ3F+vAHWCz3sU6iXH3rPIfC
 fY29qHXoygRkggYOgp60pV2lyo3/4oV2IYHiWlTEYmU+axWa+8LKOSR5MJtSznKw
 dt45aoxICs9uAsc6YcHkt07stpJsAJkkV7OPvfHfgq4b5uU9FqDh4rxwoaRmPrYh
 SvMrBg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43ksfrh79w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2024 12:26:54 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B5B6840048;
 Wed, 18 Dec 2024 12:25:29 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 42FCB26C440;
 Wed, 18 Dec 2024 12:24:23 +0100 (CET)
Received: from [10.129.178.212] (10.129.178.212) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 18 Dec
 2024 12:24:22 +0100
Message-ID: <d15cec4e-e06a-47f7-aa8a-744c0829d244@foss.st.com>
Date: Wed, 18 Dec 2024 12:24:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20241126155119.1574564-1-christian.bruel@foss.st.com>
 <20241126155119.1574564-3-christian.bruel@foss.st.com>
 <20241203145244.trgrobtfmumtiwuc@thinkpad>
 <ced7a55a-d968-497f-abc2-663855882a3f@foss.st.com>
 <20241218094606.sljdx2w27thc5ahj@thinkpad>
Content-Language: en-US
From: Christian Bruel <christian.bruel@foss.st.com>
In-Reply-To: <20241218094606.sljdx2w27thc5ahj@thinkpad>
X-Originating-IP: [10.129.178.212]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: kw@linux.com, conor+dt@kernel.org, p.zabel@pengutronix.de, robh@kernel.org,
 linux-pci@vger.kernel.org, lpieralisi@kernel.org, linux-kernel@vger.kernel.org,
 cassel@kernel.org, devicetree@vger.kernel.org, quic_schintav@quicinc.com,
 mcoquelin.stm32@gmail.com, bhelgaas@google.com, krzk+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/5] PCI: stm32: Add PCIe host support
	for STM32MP25
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



On 12/18/24 10:46, Manivannan Sadhasivam wrote:
> On Mon, Dec 16, 2024 at 10:00:27AM +0100, Christian Bruel wrote:
> 
> [...]
> 
>>>
>>>> +		msleep(PCIE_T_RRS_READY_MS);
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static void stm32_pcie_stop_link(struct dw_pcie *pci)
>>>> +{
>>>> +	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
>>>> +
>>>> +	regmap_update_bits(stm32_pcie->regmap, SYSCFG_PCIECR,
>>>> +			   STM32MP25_PCIECR_LTSSM_EN, 0);
>>>> +
>>>> +	/* Assert PERST# */
>>>> +	if (stm32_pcie->perst_gpio)
>>>> +		gpiod_set_value(stm32_pcie->perst_gpio, 1);
>>>
>>> I don't like tying PERST# handling with start/stop link. PERST# should be
>>> handled based on the power/clock state.
>>
>> I don't understand your point: We turn off the PHY in suspend_noirq(), so
>> that seems a logical place to de-assert in resume_noirq after the refclk is
>> ready. PERST# should be kept active until the PHY stablilizes the clock in
>> resume. From the PCIe electromechanical specs, PERST# goes active while the
>> refclk is not stable/
>>
> 
> While your understanding about PERST# is correct, your implementation is not.
> You are toggling PERST# from start/stop link callbacks which are supposed to
> control the LTSSM state only. I don't have issues with toggling PERST# in
> stm32_pcie_{suspend/resume}_noirq().

Ah OK. this function is split now into 2 functional blocks in the 
upcoming version

> 
>>
>>>
>>>> +}
>>>> +
>>>> +static int stm32_pcie_suspend(struct device *dev)
>>>> +{
>>>> +	struct stm32_pcie *stm32_pcie = dev_get_drvdata(dev);
>>>> +
>>>> +	if (device_may_wakeup(dev) || device_wakeup_path(dev))
>>>> +		enable_irq_wake(stm32_pcie->wake_irq);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int stm32_pcie_resume(struct device *dev)
>>>> +{
>>>> +	struct stm32_pcie *stm32_pcie = dev_get_drvdata(dev);
>>>> +
>>>> +	if (device_may_wakeup(dev) || device_wakeup_path(dev))
>>>> +		disable_irq_wake(stm32_pcie->wake_irq);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int stm32_pcie_suspend_noirq(struct device *dev)
>>>> +{
>>>> +	struct stm32_pcie *stm32_pcie = dev_get_drvdata(dev);
>>>> +
>>>> +	stm32_pcie->link_is_up = dw_pcie_link_up(stm32_pcie->pci);
>>>> +
>>>> +	stm32_pcie_stop_link(stm32_pcie->pci);
>>>
>>> I don't understand how endpoint can wakeup the host if PERST# gets asserted.
>>
>> The stm32 PCIe doesn't support L2, we don't expect an in-band beacon for the
>> wakeup. We support wakeup only from sideband WAKE#, that will restart the
>> link from IRQ
>>
> 
> I don't understand how WAKE# is supported without L2. Only in L2 state, endpoint
> will make use of Vaux and it will wakeup the host using either beacon or WAKE#.
> If you don't support L2, then the endpoint will reach L3 (link off) state.

I think this is what happens, my understanding is that the device is 
still powered to get the wakeup event (eg WoL magic packet), triggers 
the PCIe wake_IRQ from the WAKE#.

> 
>>>
>>>> +	clk_disable_unprepare(stm32_pcie->clk);
>>>> +
>>>> +	if (!device_may_wakeup(dev) && !device_wakeup_path(dev))
>>>> +		phy_exit(stm32_pcie->phy);
>>>> +
>>>> +	return pinctrl_pm_select_sleep_state(dev);
>>>> +}
>>>> +
>>>> +static int stm32_pcie_resume_noirq(struct device *dev)
>>>> +{
>>>> +	struct stm32_pcie *stm32_pcie = dev_get_drvdata(dev);
>>>> +	struct dw_pcie *pci = stm32_pcie->pci;
>>>> +	struct dw_pcie_rp *pp = &pci->pp;
>>>> +	int ret;
>>>> +
>>>> +	/* init_state must be called first to force clk_req# gpio when no
>>>
>>> CLKREQ#
>>>
>>> Why RC should control CLKREQ#?
>>
>> REFCLK is gated with CLKREQ#, So we cannot access the core
>> without CLKREQ# if no device is present. So force it with a init pinmux
>> the time to init the PHY and the core DBI registers
>>
> 
> Ok. You should add a comment to clarify it in the code as this is not a standard
> behavior.
> 

OK

>>>
>>> Also please use preferred style for multi-line comments:
>>>
>>> 	/*
>>> 	 * ...
>>> 	 */
>>>
>>>> +	 * device is plugged.
>>>> +	 */
>>>> +	if (!IS_ERR(dev->pins->init_state))
>>>> +		ret = pinctrl_select_state(dev->pins->p, dev->pins->init_state);
>>>> +	else
>>>> +		ret = pinctrl_pm_select_default_state(dev);
>>>> +
>>>> +	if (ret) {
>>>> +		dev_err(dev, "Failed to activate pinctrl pm state: %d\n", ret);
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	if (!device_may_wakeup(dev) && !device_wakeup_path(dev)) {
>>>> +		ret = phy_init(stm32_pcie->phy);
>>>> +		if (ret) {
>>>> +			pinctrl_pm_select_default_state(dev);
>>>> +			return ret;
>>>> +		}
>>>> +	}
>>>> +
>>>> +	ret = clk_prepare_enable(stm32_pcie->clk);
>>>> +	if (ret)
>>>> +		goto clk_err;
>>>
>>> Please name the goto labels of their purpose. Like err_phy_exit.
>>
>> OK
>>
>>>
>>>> +
>>>> +	ret = dw_pcie_setup_rc(pp);
>>>> +	if (ret)
>>>> +		goto pcie_err;
>>>
>>> This should be, 'err_disable_clk'.
>>>
>>>> +
>>>> +	if (stm32_pcie->link_is_up) {
>>>
>>> Why do you need this check? You cannot start the link in the absence of an
>>> endpoint?
>>>
>>
>> It is an optimization to avoid unnecessary "dw_pcie_wait_for_link" if no
>> device is present during suspend
>>
> 
> In that case you'll not trigger LTSSM if there was no endpoint connected before
> suspend. What if users connect an endpoint after resume?

Yes, exactly. We don't support hotplug, and plugging a device while the 
system is in stand-by is something that we don't expect. The imx6 
platform does this also.

thanks,

Christian

> 
> - Mani
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
