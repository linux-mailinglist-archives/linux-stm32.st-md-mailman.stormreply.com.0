Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F691B2B993
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Aug 2025 08:37:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2305AC3F942;
	Tue, 19 Aug 2025 06:37:10 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27052C3F940
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Aug 2025 06:37:09 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J2SorF020696
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 19 Aug 2025 06:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lyiKtoOw6v5xNC85LbQnn0O181F2eSfm873V8UTSEA4=; b=bJMZZ1+VRZp2ZgcF
 /LByZH8rEzTSngp8mNSOikSd3O0NTWP7wfWanZc2E9c3jy1om2eHJZJMrGxuYtXr
 YuN+iMeXcG9uIFswqVYqlkvUZexSZtAr/1lJncV3FXMYGGZiXgC/EPnOj7UgUjYs
 UmYMsxEoNTHDO8Ubt6ON0jz14hZSypcKSoqg8XPRRR/LiEN8/mMTXzcZuPmkwxaD
 aCC/9TJ3DVSsBwAoyfpEWXce3PVxGOdqTzjSsB+W+B8qWV9GZGNE3RQStYNQsB9d
 P1GlXir6ATskn+L59jkb9WfCjNZ+cULABOpqolm6r+CV8LqQ2So/6MIuH6OzRJdy
 iZrhpw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhagydyg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Aug 2025 06:37:07 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-24457f54bb2so120454515ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Aug 2025 23:37:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755585427; x=1756190227;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lyiKtoOw6v5xNC85LbQnn0O181F2eSfm873V8UTSEA4=;
 b=FsSDGSw+Ek13nWp0cBWmI0DOKFJZiuEKKf+K5Wmwn/nuaGefvAYrhQPthZgI5srJnB
 wCoYMFR0rprJrZRFZBPzzNNYDkf+yjHVbRSlOvYNU4hcfjEu4gSiXGPNwAbQACuTlPq4
 9qkvAJCSC0M5J3iTfH/gTcREs4Rs/UydcoYdrrZROMNRJhCPj1PmeC4RL+OrFV06Iuqr
 3B8CHnzFYVJmkuVcN4enOJ5Ffwzyv0fGtekBtb55ueND+yLHaN7z9+tL/mfUix7CWRch
 B7viYhGbJi959CaIIG1JaZJsNrHLOOknjEguWKxgfwGhzYkWXyRjb6WoiJ3DxdsxJa+Y
 9XmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJNF2iTDBBw6QU/y6X3v/kt22kjwXppkBjLzTUb+UaYv5nz1XfijWlhb8jYnxSUHDb3WXbrKssXJkuig==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyCFv+NFbsIomQ+QlZPCqiXI5U3ghYtopIWzN28Y8R5VW+/CKPf
 TKIR1IhWqqdAjSkvnQ1KECbpAFkK8UED/OlOcUA0zR+cpa0SvM+yDx+2QNLZZnmCilqXT+Se1No
 vWvdrYfwFNDIyBUDEK0jmhWSXcfcn1npIHkvtRPGexSRTt/qokrdSaOGI29KG17QWs1YsIiMe4l
 hzy2No/N4=
X-Gm-Gg: ASbGncuavbs9dxMeHByngHPS1sR9lP0IvJ5a0E0+ROyrBwB20V/sgF9TRx9WC7PYmq8
 oy+24TYtIyMgS+zHn6M+0qLo9SkTEpBrYdV9l6DhB2vFJ6Sh4r5Udvb05gnpKtDhVXQFMn6ew6f
 lki8qr6rL7JrOyq0dmux0+CYHXakxnkJbx5akOSXE8GvGuaOuSg4S0Cwf1CgHWPLFRy7hPdVmpH
 vi3rLuJYPkl1klOxmPBVCnH01yrUlNpw/0/9M0dMHgSqGu1smsnpipcPSEPg+cJn/vaftAUR7hS
 lUYvO1JkMvpflzImFatflb5MXK0xwut0u9lK56vu1gxQtOKJLmlcmRY50EFMFb4M8WWl9m1ZvCZ
 q2aampsDXbjPY1GWwDibDlDv0gqDBmKjWKQ==
X-Received: by 2002:a17:903:2acd:b0:23f:dc73:7798 with SMTP id
 d9443c01a7336-245e02aa607mr18391575ad.6.1755585426472; 
 Mon, 18 Aug 2025 23:37:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEazJmFdGaBIAHWXLR4lCSydXu9MeqjV3bEY6sPcOpXqB1mWNgIGjkbWAfT3wdTKq1teGvRyA==
X-Received: by 2002:a17:903:2acd:b0:23f:dc73:7798 with SMTP id
 d9443c01a7336-245e02aa607mr18391265ad.6.1755585426036; 
 Mon, 18 Aug 2025 23:37:06 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2446d54fe38sm98120455ad.135.2025.08.18.23.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 23:37:05 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 14:36:00 +0800
MIME-Version: 1.0
Message-Id: <20250819-qcs615_eth-v4-5-5050ed3402cb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755585388; l=972;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=VJbvSPzR7nYekRfOxydBQiO6Zxq0O3MtfapiK80ggjo=;
 b=caBB0fwY7GcFvoMDwpRbiG5mbkhc6TVqdTkdOaZN/liBSLS7pCblke/P68n8ZiPuYBVZRQN/f
 BsIYbowh9CUBMJa+bW1NgLEsQ7AKwPN5rzk5oXw7hs1C185gDkhyaDe
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Authority-Analysis: v=2.4 cv=D9xHKuRj c=1 sm=1 tr=0 ts=68a41b93 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=78Yoz-F5aJHhz6vTWxYA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 7Bw3UMutA5S_2us875_swtpZHc4Skbd7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyNCBTYWx0ZWRfX72FjM1wjsMjO
 I2OOCEKLXymyDGCcw0vEK3A/81l8no3uiUjf+sZeOB1mmyslG5BPDrePwEw4+61MlGysomIqifT
 acTIeSHElg8EAX2ru6SU+tIMHu0PBSqg7xnNI2pEpTvU7HWs6SqFs9rF4t7Ny0yRrCSUq8VP4d8
 BREe+fDl7+y1RBTN8HB46s8YGO5eCzfIoqoBWp2mzyr/3KY/K+3EtoNmK6rDutHsbTvDW8MKQz9
 SnuytCpR5wOS30cDzRwRvgsgVRM4W4qlrHfIeKXZPgrRN/eaJr44f+1bNhzeqTb/B8W2oW71UHM
 Ej4ntyxlnMgn4m8AfjXGZApRDJJfUDiuicv1/wpxgSOVvPIenBvkpA3PXMyP92FqE1IbXb18RFc
 7tdQKpm2
X-Proofpoint-GUID: 7Bw3UMutA5S_2us875_swtpZHc4Skbd7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160024
Cc: stable+noautosel@kernel.org, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Yijie Yang <yijie.yang@oss.qualcomm.com>
Subject: [Linux-stm32] [PATCH v4 5/6] arm64: dts: qcom: qcs404: Inverse
 phy-mode for EVB-4000
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
 arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts b/arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts
index 358827c2fbd3..a3e67e83f69f 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts
@@ -25,7 +25,7 @@ &ethernet {
 	pinctrl-0 = <&ethernet_defaults>;
 
 	phy-handle = <&phy1>;
-	phy-mode = "rgmii";
+	phy-mode = "rgmii-id";
 	mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
