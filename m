Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB82A14C33
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Jan 2025 10:32:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60D00C78F80;
	Fri, 17 Jan 2025 09:32:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 090BFC78F7F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jan 2025 09:32:31 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50H7ofrQ003450;
 Fri, 17 Jan 2025 10:32:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 nzk3vN0PU+1PX8MuEwqsadD2DtLatqF+L56fha42moE=; b=IO0PR02t/r2eS/sG
 FsXVSlFjKwizVS+KjMt/WsUWlrqrWfE9JF6wS74M2EgDP7rke2Cd28VuEPOArKKd
 aFgdzVqbrbD2eZDcZ9YjT+JyTKNvj3kDieVGz7/XLfPMujC1z6B7lHG4i0odNdb3
 xvJQ2by55TTSCqfAYGppaq91OajfsJPQu4ULjcujMmwM4IcBjnl5rJccyLTVobjQ
 ft55oLYdVqD0W5UAK8xVHDEeFlE9a6gzlq+vJpt2ELKTzWhRDyKqm/th+Mxes/7b
 KyHdUqKR024AuZVTZt/z/nZLFOvS17rtF6pvZ6GL3YodI4GGuV2BirCtDW91OO6M
 efeQeQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 447k62re8c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jan 2025 10:32:10 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 890E040045;
 Fri, 17 Jan 2025 10:30:45 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 503FF26E373;
 Fri, 17 Jan 2025 10:29:55 +0100 (CET)
Received: from [10.129.178.212] (10.129.178.212) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 17 Jan
 2025 10:29:54 +0100
Message-ID: <4350969b-9e69-4943-9642-a45603b08beb@foss.st.com>
Date: Fri, 17 Jan 2025 10:29:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dan Carpenter <dan.carpenter@linaro.org>, <oe-kbuild@lists.linux.dev>,
 <vkoul@kernel.org>, <kishon@kernel.org>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>, <p.zabel@pengutronix.de>,
 <linux-phy@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <fabrice.gasnier@foss.st.com>
References: <d40db5ae-5db8-4541-8d20-e7bacef4ecf2@stanley.mountain>
Content-Language: en-US
From: Christian Bruel <christian.bruel@foss.st.com>
In-Reply-To: <d40db5ae-5db8-4541-8d20-e7bacef4ecf2@stanley.mountain>
X-Originating-IP: [10.129.178.212]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-17_03,2025-01-16_01,2024-11-22_01
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [Linux-stm32] [PATCH v2] phy: stm32: Optimize tuning values
	from DT.
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

Hi Dan,

Thanks for reporting. I think this error is a false positive.

In this situation, the impedance values that are looked-up are ordere 
(the compiler probably doesn't analysis this) so the imp_looup test that 
defines the imp_of must have matched.
Note that the boundaries was checked during probe.

already discussed here:
https://lore.kernel.org/all/ef1ea5da-4344-4c59-8d2b1b52533ef0cd@foss.st.com/

I'll provide a new revision to make this code more friendly with this error

Regards

Christian

On 1/17/25 09:38, Dan Carpenter wrote:
> Hi Christian,
> 
> kernel test robot noticed the following build warnings:
> 
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Bruel/phy-stm32-Optimize-tuning-values-from-DT/20250113-172435
> base:   v6.13-rc7
> patch link:    https://lore.kernel.org/r/20250113092001.1344151-1-christian.bruel%40foss.st.com
> patch subject: [PATCH v2] phy: stm32: Optimize tuning values from DT.
> config: arm-randconfig-r071-20250117 (https://download.01.org/0day-ci/archive/20250117/202501171619.0XDYDyBZ-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202501171619.0XDYDyBZ-lkp@intel.com/
> 
> New smatch warnings:
> drivers/phy/st/phy-stm32-combophy.c:147 stm32_impedance_tune() error: buffer overflow 'imp_lookup' 8 <= 8 (assuming for loop doesn't break)
> drivers/phy/st/phy-stm32-combophy.c:564 stm32_combophy_probe() warn: passing zero to 'dev_err_probe'
> 
> vim +147 drivers/phy/st/phy-stm32-combophy.c
> 
> 31219ca5436f01 Christian Bruel 2025-01-13  119  static void stm32_impedance_tune(struct stm32_combophy *combophy)
> 47e1bb6b4ba098 Christian Bruel 2024-09-30  120  {
> 47e1bb6b4ba098 Christian Bruel 2024-09-30  121  	u8 imp_of, vswing_of;
> 2de679ecd724b8 Arnd Bergmann   2024-11-11  122  	u32 regval;
> 47e1bb6b4ba098 Christian Bruel 2024-09-30  123
> 31219ca5436f01 Christian Bruel 2025-01-13  124  	if (combophy->microohm) {
> 2de679ecd724b8 Arnd Bergmann   2024-11-11  125  		regval = 0;
> 2de679ecd724b8 Arnd Bergmann   2024-11-11  126  		for (imp_of = 0; imp_of < ARRAY_SIZE(imp_lookup); imp_of++) {
> 31219ca5436f01 Christian Bruel 2025-01-13  127  			if (imp_lookup[imp_of].microohm <= combophy->microohm) {
> 2de679ecd724b8 Arnd Bergmann   2024-11-11  128  				regval = FIELD_PREP(STM32MP25_PCIEPRG_IMPCTRL_OHM, imp_of);
> 47e1bb6b4ba098 Christian Bruel 2024-09-30  129  				break;
> 2de679ecd724b8 Arnd Bergmann   2024-11-11  130  			}
> 2de679ecd724b8 Arnd Bergmann   2024-11-11  131  		}
> 
> If we don't hit the break sttaement above
> 
> 47e1bb6b4ba098 Christian Bruel 2024-09-30  132
> 47e1bb6b4ba098 Christian Bruel 2024-09-30  133  		dev_dbg(combophy->dev, "Set %u micro-ohms output impedance\n",
> 47e1bb6b4ba098 Christian Bruel 2024-09-30  134  			imp_lookup[imp_of].microohm);
>                                                                                     ^^^^^^
> Then this is an out of bounds access.
> 
> 47e1bb6b4ba098 Christian Bruel 2024-09-30  135
> 47e1bb6b4ba098 Christian Bruel 2024-09-30  136  		regmap_update_bits(combophy->regmap, SYSCFG_PCIEPRGCR,
> 47e1bb6b4ba098 Christian Bruel 2024-09-30  137  				   STM32MP25_PCIEPRG_IMPCTRL_OHM,
> 2de679ecd724b8 Arnd Bergmann   2024-11-11  138  				   regval);
> 47e1bb6b4ba098 Christian Bruel 2024-09-30  139  	} else {
> 31219ca5436f01 Christian Bruel 2025-01-13  140  		/* default is 50 ohm */
> 31219ca5436f01 Christian Bruel 2025-01-13  141  		imp_of = 3;
> 47e1bb6b4ba098 Christian Bruel 2024-09-30  142  	}
> 47e1bb6b4ba098 Christian Bruel 2024-09-30  143
> 31219ca5436f01 Christian Bruel 2025-01-13  144  	if (combophy->microvolt) {
> 2de679ecd724b8 Arnd Bergmann   2024-11-11  145  		regval = 0;
> 2de679ecd724b8 Arnd Bergmann   2024-11-11  146  		for (vswing_of = 0; vswing_of < ARRAY_SIZE(imp_lookup[imp_of].vswing); vswing_of++) {
> 31219ca5436f01 Christian Bruel 2025-01-13 @147  			if (imp_lookup[imp_of].vswing[vswing_of] >= combophy->microvolt) {
> 2de679ecd724b8 Arnd Bergmann   2024-11-11  148  				regval = FIELD_PREP(STM32MP25_PCIEPRG_IMPCTRL_VSWING, vswing_of);
> 47e1bb6b4ba098 Christian Bruel 2024-09-30  149  				break;
> 2de679ecd724b8 Arnd Bergmann   2024-11-11  150  			}
> 2de679ecd724b8 Arnd Bergmann   2024-11-11  151  		}
> 47e1bb6b4ba098 Christian Bruel 2024-09-30  152
> 47e1bb6b4ba098 Christian Bruel 2024-09-30  153  		dev_dbg(combophy->dev, "Set %u microvolt swing\n",
> 47e1bb6b4ba098 Christian Bruel 2024-09-30  154  			 imp_lookup[imp_of].vswing[vswing_of]);
> 47e1bb6b4ba098 Christian Bruel 2024-09-30  155
> 47e1bb6b4ba098 Christian Bruel 2024-09-30  156  		regmap_update_bits(combophy->regmap, SYSCFG_PCIEPRGCR,
> 47e1bb6b4ba098 Christian Bruel 2024-09-30  157  				   STM32MP25_PCIEPRG_IMPCTRL_VSWING,
> 2de679ecd724b8 Arnd Bergmann   2024-11-11  158  				   regval);
> 47e1bb6b4ba098 Christian Bruel 2024-09-30  159  	}
> 47e1bb6b4ba098 Christian Bruel 2024-09-30  160  }
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
