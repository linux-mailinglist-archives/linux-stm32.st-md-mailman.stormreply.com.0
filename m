Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAF0929D8D
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Jul 2024 09:48:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11D33C6DD96;
	Mon,  8 Jul 2024 07:48:06 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 54486C6DD72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Jul 2024 07:47:59 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4680pvGu005964;
 Mon, 8 Jul 2024 07:47:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 i/uQYDKEprLvHhEtr15EIS+2LOUqtGYnciWz60brKUQ=; b=C8H2jH4Knqhy89w5
 tqFeDHt6hlPjff5e1i7KCwZo3309m1ap0ZNrD071Jn3uzlSG4v8v8ewYLJdEZfSN
 GJKKa99eekiaKcrdXjGyHuw/urdVYF1HTEn5VOepVeCoQJY/20W67edgOXEOm2ad
 o5Di4F6Eyu3IiRTyHrfCbn8k5PNjzMrHSWG/ukDEc0gLDpLuz9CWXEhHlXKmeBCm
 EqOtmEZH6+iDvMofCTH0bsR4YLVKoA1+nUHfxZYMdaxWJIGgulKB/vrGdGTndQXJ
 gKxKzCsX8TvAJoMIGoy/02L8yfqMVZqhYfIx4jgQGbJdkR0BY62oStU0Jr5fgmdl
 O3+5ow==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406wjn2ygd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Jul 2024 07:47:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 4687lV2H006833
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 8 Jul 2024 07:47:31 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 8 Jul 2024
 00:47:09 -0700
Message-ID: <1b32168b-7d1c-4b18-b4f3-a4979232b515@quicinc.com>
Date: Mon, 8 Jul 2024 15:47:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Conor Dooley <conor.dooley@microchip.com>, Krzysztof Kozlowski
 <krzk@kernel.org>
References: <20240703025850.2172008-1-quic_tengfan@quicinc.com>
 <20240703035735.2182165-1-quic_tengfan@quicinc.com>
 <7417fd8c-e852-45ee-bac9-d92921036e2f@kernel.org>
 <20240703-manager-armless-b13b18c79192@wendy>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <20240703-manager-armless-b13b18c79192@wendy>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: jb1WMj5E8gwIWXSbOid-p2-hZhIFeJYQ
X-Proofpoint-GUID: jb1WMj5E8gwIWXSbOid-p2-hZhIFeJYQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-08_02,2024-07-05_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=709 clxscore=1015
 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407080059
Cc: rafael@kernel.org, viresh.kumar@linaro.org, linus.walleij@linaro.org,
 quic_cang@quicinc.com, alim.akhtar@samsung.com, quic_rjendra@quicinc.com,
 linux-clk@vger.kernel.org, kishon@kernel.org, kernel@quicinc.com,
 bvanassche@acm.org, bartosz.golaszewski@linaro.org, jassisinghbrar@gmail.com,
 joabreu@synopsys.com, u.kleine-koenig@pengutronix.de, lpieralisi@kernel.org,
 linux@roeck-us.net, linux-pm@vger.kernel.org, avri.altman@wdc.com,
 robimarko@gmail.com, tglx@linutronix.de, quic_kbajaj@quicinc.com,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, djakov@kernel.org,
 lukasz.luba@arm.com, kw@linux.com, thara.gopinath@gmail.com,
 quic_msarkar@quicinc.com, edumazet@google.com, srinivas.kandagatla@linaro.org,
 manivannan.sadhasivam@linaro.org, quic_kaushalk@quicinc.com,
 quic_bjorande@quicinc.com, daniel.lezcano@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com, iommu@lists.linux.dev,
 ahalaney@redhat.com, linux-watchdog@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, quic_nitirawa@quicinc.com,
 linux-gpio@vger.kernel.org, quic_rohiagar@quicinc.com, bhelgaas@google.com,
 peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org,
 neil.armstrong@linaro.org, sboyd@kernel.org, quic_tsoni@quicinc.com,
 mcoquelin.stm32@gmail.com, krzk+dt@kernel.org, ulf.hansson@linaro.org,
 quic_gurus@quicinc.com, linux-pci@vger.kernel.org, mturquette@baylibre.com,
 amitk@kernel.org, linux-phy@lists.infradead.org, will@kernel.org,
 robh@kernel.org, quic_tingweiz@quicinc.com, luca@z3ntu.xyz, danila@jiaxyga.com,
 pabeni@redhat.com, bhupesh.sharma@linaro.org, athierry@redhat.com,
 quic_devipriy@quicinc.com, conor@kernel.org, konrad.dybcio@linaro.org,
 abel.vesa@linaro.org, davem@davemloft.net, mantas@8devices.com,
 otto.pflueger@abscue.de, linux-riscv@lists.infradead.org,
 quic_wcheng@quicinc.com, quic_rgottimu@quicinc.com,
 herbert@gondor.apana.org.au, linux-scsi@vger.kernel.org, joro@8bytes.org,
 vkoul@kernel.org, quic_sibis@quicinc.com, agross@kernel.org, kuba@kernel.org,
 rui.zhang@intel.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 wim@linux-watchdog.org, quic_shashim@quicinc.com, netdev@vger.kernel.org,
 andersson@kernel.org, krzysztof.kozlowski@linaro.org, quic_tdas@quicinc.com,
 dmitry.baryshkov@linaro.org, robin.murphy@arm.com, quic_aiquny@quicinc.com
Subject: Re: [Linux-stm32] [PATCH 00/47] arm64: qcom: dts: add QCS9100
	support
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



On 7/3/2024 2:28 PM, Conor Dooley wrote:
> On Wed, Jul 03, 2024 at 06:45:00AM +0200, Krzysztof Kozlowski wrote:
>> On 03/07/2024 05:56, Tengfei Fan wrote:
>>> Introduce support for the QCS9100 SoC device tree (DTSI) and the
>>> QCS9100 RIDE board DTS. The QCS9100 is a variant of the SA8775p.
>>> While the QCS9100 platform is still in the early design stage, the
>>> QCS9100 RIDE board is identical to the SA8775p RIDE board, except it
>>> mounts the QCS9100 SoC instead of the SA8775p SoC.
>>
>> The same huge patchset, to huge number of recipients was sent twice.
>> First, sorry, this is way too big. Second, it has way too many
>> recipients, but this is partially a result of first point. Only
>> partially because you put here dozen of totally unrelated emails. Sorry,
>> that does not make even sense. See form letter at the end how this
>> works. Third, sending it to everyone twice is a way to annoy them off
>> twice... Fourth,
>>
>> Please split your work and do not cc dozen of unrelated folks.
> 
> One of the extra recipients is cos that of that patch I sent adding the
> cache bindings to the cache entry, forgetting that that would CC the
> riscv list on all cache bindings. I modified that patch to drop the riscv
> list from the entry.
> 
> Cheers,
> Conor.


Thank you, Conor!

-- 
Thx and BRs,
Tengfei Fan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
