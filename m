Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8085D925413
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jul 2024 08:53:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 429ADC78F75;
	Wed,  3 Jul 2024 06:53:37 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D200C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jul 2024 03:54:22 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 462HA2dD030501;
 Wed, 3 Jul 2024 03:53:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bYAfpUlFjbaa4SA/HYukb2Go5nF9etYjbNG9JEuBfxc=; b=PAPFf3dche9B457+
 h/mwFiCOKH+Z2LIN8Zrs39qSbk/TvDRcL1hYcgHTzY66AZx3r7FmTlVbahLt/YcF
 lRx3/Xjj7LHQiewcolyiXxC3c8E/6LklGGLBZdSh4lK1f0mN5P02cAXp0ks0+S6R
 0SBegO51uCeJMbB++ucKnzPgtu7fpiT543A7YeyoNrsqt+qvBp0R1goGF72JQowq
 2P+0TjLUsGXTOUMmcsnM4gxr9uZMXtUv39xzs0mZhcYtK9gsZYfQWHvEHA3OyNDe
 YIauPwrIGMzYUHMdHtVJGx7bNK3+Fmx5a0jKJ5TyDwUnVhCR73BL3FRMAzOgLdSi
 +RPXKA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4029uxfjwj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Jul 2024 03:53:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 4633rr72000404
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 3 Jul 2024 03:53:53 GMT
Received: from tengfan-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 2 Jul 2024 20:53:31 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
To: <andersson@kernel.org>, <konrad.dybcio@linaro.org>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <djakov@kernel.org>,
 <mturquette@baylibre.com>, <sboyd@kernel.org>,
 <jassisinghbrar@gmail.com>, <herbert@gondor.apana.org.au>,
 <davem@davemloft.net>, <manivannan.sadhasivam@linaro.org>,
 <will@kernel.org>, <joro@8bytes.org>, <conor@kernel.org>,
 <tglx@linutronix.de>, <amitk@kernel.org>, <thara.gopinath@gmail.com>,
 <linus.walleij@linaro.org>, <wim@linux-watchdog.org>,
 <linux@roeck-us.net>, <rafael@kernel.org>, <viresh.kumar@linaro.org>,
 <vkoul@kernel.org>, <edumazet@google.com>, <kuba@kernel.org>,
 <pabeni@redhat.com>, <mcoquelin.stm32@gmail.com>
Date: Wed, 3 Jul 2024 11:51:40 +0800
Message-ID: <20240703035154.2182083-4-quic_tengfan@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240703035154.2182083-1-quic_tengfan@quicinc.com>
References: <20240703025850.2172008-1-quic_tengfan@quicinc.com>
 <20240703035154.2182083-1-quic_tengfan@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ZPzCt_eDFvtT4uZ_UHHKd-pXbZWSsDQ-
X-Proofpoint-ORIG-GUID: ZPzCt_eDFvtT4uZ_UHHKd-pXbZWSsDQ-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-02_18,2024-07-02_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 mlxscore=0
 clxscore=1015 phishscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407030027
X-Mailman-Approved-At: Wed, 03 Jul 2024 06:53:34 +0000
Cc: joabreu@synopsys.com, ulf.hansson@linaro.org, quic_kaushalk@quicinc.com,
 quic_gurus@quicinc.com, kw@linux.com, linux-pci@vger.kernel.org,
 lpieralisi@kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 srinivas.kandagatla@linaro.org, alim.akhtar@samsung.com,
 quic_rjendra@quicinc.com, otto.pflueger@abscue.de,
 linux-riscv@lists.infradead.org, quic_tsoni@quicinc.com,
 linux-clk@vger.kernel.org, linux-watchdog@vger.kernel.org, kishon@kernel.org,
 quic_sibis@quicinc.com, kernel@quicinc.com, quic_bjorande@quicinc.com,
 bvanassche@acm.org, linux-scsi@vger.kernel.org, bartosz.golaszewski@linaro.org,
 quic_tingweiz@quicinc.com, daniel.lezcano@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com, luca@z3ntu.xyz,
 iommu@lists.linux.dev, agross@kernel.org, danila@jiaxyga.com,
 u.kleine-koenig@pengutronix.de, rui.zhang@intel.com, ahalaney@redhat.com,
 quic_rgottimu@quicinc.com, bhupesh.sharma@linaro.org,
 quic_devipriy@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_nitirawa@quicinc.com, athierry@redhat.com,
 Tengfei Fan <quic_tengfan@quicinc.com>, avri.altman@wdc.com,
 robimarko@gmail.com, quic_rohiagar@quicinc.com, bhelgaas@google.com,
 peppe.cavallaro@st.com, quic_cang@quicinc.com, quic_shashim@quicinc.com,
 linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org,
 quic_kbajaj@quicinc.com, linux-gpio@vger.kernel.org,
 gregkh@linuxfoundation.org, linux-pm@vger.kernel.org,
 linux-usb@vger.kernel.org, quic_msarkar@quicinc.com, quic_wcheng@quicinc.com,
 krzysztof.kozlowski@linaro.org, quic_tdas@quicinc.com, mantas@8devices.com,
 linux-crypto@vger.kernel.org, netdev@vger.kernel.org,
 dmitry.baryshkov@linaro.org, abel.vesa@linaro.org, robin.murphy@arm.com,
 quic_aiquny@quicinc.com, lukasz.luba@arm.com
Subject: [Linux-stm32] [PATCH 33/47] interconnect: qcom: add driver support
	for qcs9100
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

Introduce QCS9100-specific interconnect driver support.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
 drivers/interconnect/qcom/sa8775p.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/interconnect/qcom/sa8775p.c b/drivers/interconnect/qcom/sa8775p.c
index a729775c2aa4..72eb94a8873d 100644
--- a/drivers/interconnect/qcom/sa8775p.c
+++ b/drivers/interconnect/qcom/sa8775p.c
@@ -2499,6 +2499,20 @@ static const struct qcom_icc_desc sa8775p_system_noc = {
 };
 
 static const struct of_device_id qnoc_of_match[] = {
+	{ .compatible = "qcom,qcs9100-aggre1-noc", .data = &sa8775p_aggre1_noc, },
+	{ .compatible = "qcom,qcs9100-aggre2-noc", .data = &sa8775p_aggre2_noc, },
+	{ .compatible = "qcom,qcs9100-clk-virt", .data = &sa8775p_clk_virt, },
+	{ .compatible = "qcom,qcs9100-config-noc", .data = &sa8775p_config_noc, },
+	{ .compatible = "qcom,qcs9100-dc-noc", .data = &sa8775p_dc_noc, },
+	{ .compatible = "qcom,qcs9100-gem-noc", .data = &sa8775p_gem_noc, },
+	{ .compatible = "qcom,qcs9100-gpdsp-anoc", .data = &sa8775p_gpdsp_anoc, },
+	{ .compatible = "qcom,qcs9100-lpass-ag-noc", .data = &sa8775p_lpass_ag_noc, },
+	{ .compatible = "qcom,qcs9100-mc-virt", .data = &sa8775p_mc_virt, },
+	{ .compatible = "qcom,qcs9100-mmss-noc", .data = &sa8775p_mmss_noc, },
+	{ .compatible = "qcom,qcs9100-nspa-noc", .data = &sa8775p_nspa_noc, },
+	{ .compatible = "qcom,qcs9100-nspb-noc", .data = &sa8775p_nspb_noc, },
+	{ .compatible = "qcom,qcs9100-pcie-anoc", .data = &sa8775p_pcie_anoc, },
+	{ .compatible = "qcom,qcs9100-system-noc", .data = &sa8775p_system_noc, },
 	{ .compatible = "qcom,sa8775p-aggre1-noc", .data = &sa8775p_aggre1_noc, },
 	{ .compatible = "qcom,sa8775p-aggre2-noc", .data = &sa8775p_aggre2_noc, },
 	{ .compatible = "qcom,sa8775p-clk-virt", .data = &sa8775p_clk_virt, },
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
