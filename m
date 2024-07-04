Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D54E1926CE6
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Jul 2024 03:07:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8498AC71282;
	Thu,  4 Jul 2024 01:07:49 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ECBFDC71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jul 2024 01:07:41 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 463KxJ5w024060;
 Thu, 4 Jul 2024 01:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 dsSxjkGVI8XhNUSGwpkBQkns23Qi4Z/x+ep2PMlQrKA=; b=QAlaIvdjxmxzKyIQ
 QRuKoXner9XOjQXq+dZqhV+d90lw17APFbJyqNps/nJQ1HhF+R6a0pmHUUGgVY6s
 7bZv4l4ZrM0asR8EjHvD9W3IhtGr6OOziRepyhSOfio0irpSU06tpBYoAyu8ziwS
 UCwMsbbeugGdyqa4bg9Q7Pfenv1Kg+veyS+k0nNbTQjvKTM33Llsa71mOON5fBxF
 adUzxjc/3EHfbAGCOiL1guH7YyqyuA8OHvSB1mcwRyqqu5gDnmYyYTbYq+sO7NNi
 KC/0Flb8nXovHy+wBupyMB7apSn4DO1CVdIQHrPqE1kR0Gi+M2ef4lqUHZzc5tGR
 ksujMA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4054ndsn8m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Jul 2024 01:07:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 464171TD016478
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 4 Jul 2024 01:07:01 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 3 Jul 2024
 18:06:40 -0700
Message-ID: <abc2b71d-cf92-4872-bcb2-e300910101e2@quicinc.com>
Date: Thu, 4 Jul 2024 09:06:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jakub Kicinski <kuba@kernel.org>, <patchwork-bot+netdevbpf@kernel.org>
References: <20240703025850.2172008-1-quic_tengfan@quicinc.com>
 <171998042970.21654.12559535993133117436.git-patchwork-notify@kernel.org>
 <20240703114952.6013f05e@kernel.org>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <20240703114952.6013f05e@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: hhdGw5SGDa0ygVxwfed9WbAmVWpjLY8G
X-Proofpoint-ORIG-GUID: hhdGw5SGDa0ygVxwfed9WbAmVWpjLY8G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_18,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 phishscore=0 impostorscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1011 mlxlogscore=431
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407040007
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
 linux-gpio@vger.kernel.org, bhelgaas@google.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org,
 sboyd@kernel.org, quic_tsoni@quicinc.com, mcoquelin.stm32@gmail.com,
 krzk+dt@kernel.org, ulf.hansson@linaro.org, linux-pci@vger.kernel.org,
 mturquette@baylibre.com, amitk@kernel.org, linux-phy@lists.infradead.org,
 will@kernel.org, robh@kernel.org, quic_tingweiz@quicinc.com, luca@z3ntu.xyz,
 danila@jiaxyga.com, pabeni@redhat.com, bhupesh.sharma@linaro.org,
 athierry@redhat.com, quic_devipriy@quicinc.com, conor@kernel.org,
 konrad.dybcio@linaro.org, abel.vesa@linaro.org, davem@davemloft.net,
 mantas@8devices.com, otto.pflueger@abscue.de, quic_wcheng@quicinc.com,
 quic_rgottimu@quicinc.com, herbert@gondor.apana.org.au,
 linux-scsi@vger.kernel.org, quic_aiquny@quicinc.com, vkoul@kernel.org,
 quic_sibis@quicinc.com, agross@kernel.org, rui.zhang@intel.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, wim@linux-watchdog.org,
 quic_shashim@quicinc.com, netdev@vger.kernel.org, andersson@kernel.org,
 krzysztof.kozlowski@linaro.org, quic_tdas@quicinc.com,
 dmitry.baryshkov@linaro.org, robin.murphy@arm.com, joro@8bytes.org
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



On 7/4/2024 2:49 AM, Jakub Kicinski wrote:
> This is some bug / false positive in the bot, to be clear.
> Commit df18948d331e is ("Merge branch 'device-memory-tcp'").
> No idea how it got from that to DTS.

This issue may be due to the patch series being too large. In the 
future, I plan to split the patch series by different subsystem, which 
should prevent similar issue.

-- 
Thx and BRs,
Tengfei Fan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
