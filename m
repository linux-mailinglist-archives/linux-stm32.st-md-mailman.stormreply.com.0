Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D0FB2B997
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Aug 2025 08:37:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F7C9C3F942;
	Tue, 19 Aug 2025 06:37:16 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9703EC3F940
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Aug 2025 06:37:14 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J17A7J003589
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 19 Aug 2025 06:37:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NPgiFAJ7QYLG2oWj/sNVs7ofikmUpmx59tiZmMh5Oas=; b=FEEiPTOsUZeFu/qe
 +jNrfAA1WrSJLADQFgBeTqO8iKt92jHLHJ/BiGhzjA0ceEjv4YwOgLKuL807UJLo
 uGIbkBatZVjtcAkZZiGW1cDnpaCVD7jeVGHZF6/P8u/aoj8R9dKd/LitOHQvGx7V
 BsldcVCDya8C+8C9UcDpM2OWD4vUQtXPEeLdSGtNoWOTUhbiFtQ6mKEBuSlus6at
 cDN3wFXdNyWSSZ5EUqqsinu3JeNjHw8tsbXbI7HQc67vKtwu4A5CLFdnN2Dfb2wp
 JVcOIF4Q8SFRbmNiQL2ZMWCbNipI+VTBWdnPVvmd+DFM4BHSM0i+dh7gyPojtET8
 cuxzbA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jj747ga8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Aug 2025 06:37:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2430c5d4d73so67752655ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Aug 2025 23:37:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755585432; x=1756190232;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NPgiFAJ7QYLG2oWj/sNVs7ofikmUpmx59tiZmMh5Oas=;
 b=eMv018u+z4aLDlzk8RK01OFpVBcXktMjKJbOMDp1BhVawRtMm7md6Ido078r77hF9a
 zTqxlde9f8cfv4eJCusjVVR9uTdIDTQ9CTA3Q62+NRgievQQk9ofv/yJtDAnsU36zT8o
 v0G++85lEWh5T2B7MFaLZwlSsvhs3X8uWd2XOIbzc2QBIav03ciBMyRtGWdQ236f2X7x
 btvlKFmor5g7QNLLWvMuowE4+RGBHj8VRIPUjA0rAWUmL2XhQyF2i9YehnlaE+/jR7MQ
 rxJx1vYAN4Mrv4ZxFt4PXajyKEY3e3iCIL3gP/PL6HMkCQ0XPXmAlMqEFcOOrg4Xczt7
 BjYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoxJk9AjDgIyN1N3+LdZIyJAU6yB34fqiiNHSUHTtzt9E3AGJmiqTvJuBygY/+MoG83A56PeFmcxOKJg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzRW4IsqpOr1NABG9XZx/lP4tdKfPeKdHFSnzrwZ7ADkwnNRY3F
 l/F75Fm9AjFUZBOdWyYvaIbmRmXtx/vAIRrgPDOQzNeHIceYSCOIzrjq7sx+BGlyRiaaLmGGTzf
 FlvIee96FDatqheryVZAHRcjqmWfP2tpWGqTS7jbVaS5SLhVsB7DFLltuC1hjQ7XsonskJxQCgo
 Q0R4xtZpg=
X-Gm-Gg: ASbGncuJA0rl0zwg0D7A7eNJzVz2AVZaHZj9Yl+VGk0AXZw7BppGKrnG6w59Bf/shvK
 SlzPPDkJ6LVZB0FIm9RS0orGrrpw1dIYVqcDqyQgytG7RMDtLOouLwfjjISzoMHMGhQ3o4pWW/y
 FR+6kdoLIEOsLDHkTyZFe+xXP/leJUp5bJEyhnS1sqKwtfJ3u+3KWaNoEsrl3AAXtaVGJ7bPrVb
 YLUKkg8tYgbUMrayC+p69zumC3VC1w9/f5lwZb0T4mBEXimlHiTalk8blJGnAW+Xd44fCtUgEUE
 VwMtcxTkfpCTWb3786OgrToWsYh3kS63CYNm0c3RmwcEXW892F0Cg10hQ5Vw8iFdTSOwOuIHXc3
 QsCfEmsBKQFIgDKS89J/1XLOwH4wGfuqxmg==
X-Received: by 2002:a17:902:dacf:b0:23f:75d1:3691 with SMTP id
 d9443c01a7336-245e0ebd338mr17897335ad.15.1755585432129; 
 Mon, 18 Aug 2025 23:37:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGs5sSOdxz4RmFjmlJHx9g8dTbVBE1WGeTusAu1XpGUGqae1RKUVGWzRGqVqz2wkAnydBOXQw==
X-Received: by 2002:a17:902:dacf:b0:23f:75d1:3691 with SMTP id
 d9443c01a7336-245e0ebd338mr17896935ad.15.1755585431668; 
 Mon, 18 Aug 2025 23:37:11 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2446d54fe38sm98120455ad.135.2025.08.18.23.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 23:37:11 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 14:36:01 +0800
MIME-Version: 1.0
Message-Id: <20250819-qcs615_eth-v4-6-5050ed3402cb@oss.qualcomm.com>
References: <20250819-qcs615_eth-v4-0-5050ed3402cb@oss.qualcomm.com>
In-Reply-To: <20250819-qcs615_eth-v4-0-5050ed3402cb@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>
X-Mailer: b4 0.15-dev-5bbf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755585389; l=949;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=UVRoIFA7YXNnu/vJQ5olTkDt4U/pPMeeSryOJu9KTBM=;
 b=tsf+6WvUJKGOAH+FBQ4hmhftcJq+MxJgP5hpWHWfw7nVpRZpaoDF3ljPE8azKnO8ViTgXsSGS
 YPtA30xLy2ODO3YSOHN1nrjjEXlEbtXd3G+JBkkD4/mZWXfZrbYVwV0
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Proofpoint-GUID: 9XL4ILz4bXVxOOYsQtg_jRNfGj2BnW2X
X-Proofpoint-ORIG-GUID: 9XL4ILz4bXVxOOYsQtg_jRNfGj2BnW2X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMyBTYWx0ZWRfXxGu4ZETdck0v
 FV6xwWu17VQkPwX1mAk6lgIMBvV9glCBF3jUjwcf4tbosTZxP+FP1L4K8yAGj3rkTK2pc+H82Lw
 hvH935djgU9PykLzS6s8De2StB6rp5KVwZnf4wCNEH5bPcXyJ7SDLY+FHTJYN01QADTuGg4mJHV
 3A1zC4l6hrAakpBph3utupK9trVbyUt9yw9KaS45EQDX+RFYtormKegL682TMJJeaPgaVliSjJx
 klehfzG7kYtefoUKEU/zGnFIzn2AlEBodFj4DdpkeF8Ebes6ZLZyN9Ri1L7SFA0OLLaOi7bC8Kv
 l/TDnnKOJXJR069OLzFMZ8a8RXckzoxarkTI3Et61og+SY/bq3mMGD2P26rNCJZWdHguhJTkVEB
 GyYYNpu5
X-Authority-Analysis: v=2.4 cv=MJtgmNZl c=1 sm=1 tr=0 ts=68a41b99 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=78Yoz-F5aJHhz6vTWxYA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160033
Cc: stable+noautosel@kernel.org, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Yijie Yang <yijie.yang@oss.qualcomm.com>
Subject: [Linux-stm32] [PATCH v4 6/6] arm64: dts: qcom: sa8155p-adp: Inverse
	phy-mode
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

This board expects the MAC to add the delay. Set `phy-mode = "rgmii-id"`
in DTS to match upstream definition and work correctly with the updated
driver, which switches the semantic handling of 'rgmii' and 'rgmii-id'.

Breaking ABI compatibility is acceptable for this board, as it has no
known users or interest from any users.

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sa8155p-adp.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
index 388d5ecee949..4ac1a5b09e30 100644
--- a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
+++ b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
@@ -325,7 +325,7 @@ &ethernet {
 	pinctrl-0 = <&ethernet_defaults>;
 
 	phy-handle = <&rgmii_phy>;
-	phy-mode = "rgmii";
+	phy-mode = "rgmii-id";
 
 	mdio {
 		compatible = "snps,dwmac-mdio";

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
