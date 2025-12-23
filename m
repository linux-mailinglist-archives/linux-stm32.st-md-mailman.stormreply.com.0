Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D041CF2268
	for <lists+linux-stm32@lfdr.de>; Mon, 05 Jan 2026 08:16:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DAB16C5F1FF;
	Mon,  5 Jan 2026 07:16:25 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B56AC8F276
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Dec 2025 15:25:53 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BNB77vm1356381
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 23 Dec 2025 15:25:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=UdW1aYhvWI0
 surAr2E3GwiYANfzJ7XxjkfIeaqYtXoE=; b=BkZ9QdlJ8Z5uZ2zJYghIid4QPgS
 OSeCArKOoFfat/9sEuS6uH4rAVZwZthBCnhEMhjftv9+JCu9hSXdQ+TbSYRGevrX
 Ac1DNhga3r6YV4VpejBjP5RxIV33bbRapAQVSCAfa+fxDn3udSwsPKsLHqmWfg1S
 dyi3Jen9dPKYejBmBlg8UXtdFJVTBBuS5EpLL1bSQCu9j2asqa/uLqCOUpr0hNhZ
 uJW127TC2BoDH1+t0Fo6g9InwPy67FJDKLnlh4n2uCcUxayFS1CwNt2zfLj7J2+K
 uVO71QyWBBq6ZT6jqrl2q0tcedgRolU/mEEo3PO7Y3H2OHDjsJYTFbwBO+A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b78xc3nnk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Dec 2025 15:25:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8b4f267ba01so1568554385a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Dec 2025 07:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766503552; x=1767108352;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UdW1aYhvWI0surAr2E3GwiYANfzJ7XxjkfIeaqYtXoE=;
 b=PSkQJ2NLiBl6PY4KerCIVtHJrnIoIptr6PFRfaDMmIVrfzOjbAqsaqcT1J3vF4y9Uw
 2Y+NWxTqxQoVr1QCVHV0nMQlASCpnoFgCSBIDUvUqVnV9Hqc6p6SxtPSeeYMKi4dIXkG
 CmFhA53kjNmmwCj9kHa+2qVP2fHOl+PGmblHVHaV3MrufmuzYx6+HetLf0wXQxt7GBCh
 GKQNdHxXpdUK4Rrdm2BEsZ5fX38AEpOfb6CTkjn/xKE8EbrQVW5kgdDUGwVWrruEn6xQ
 YzD/TZmwJ7OikaHe2LS8ny7pFKyzpN29Wn2hInUM0+gXOTolRqiSR/EvqwayH4ImmtdJ
 cBJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766503552; x=1767108352;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UdW1aYhvWI0surAr2E3GwiYANfzJ7XxjkfIeaqYtXoE=;
 b=fM6AwJIDBFg1U2Q1+RHi4HDDQWBiuowPblxUy5hfhwTjXeOxCCeVcGv2Oc8muqjYSh
 nfvmeP/C0cniJPw+gBedLk/JhqM7BDtNn39niKXFjCoiD6dHuOvhBfP5+HzhI/pYoSt7
 ljGoD77z9sSo2u1JFZb0kThFLwKcY0hbl8Az+23wRBiydLvPnf8HPLPVwim8q4ygACw4
 d63ny372uEekvLT/rarLMdEQJpbCMVQw66YAln3yDZdWj35othpV9P9I0fH3vAQcCYkS
 mx7zycSsHscfgcAb/3boOaSCIKVMcFF4h883f2oAQAX4nqKaaC9rbb1VDne5w4ch3UeP
 ehBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuWt1TBScbwJL62wopcIJzu1hw1yyyLbAALuJ6x40JXft1oGmvZsWmudngWxzVBjM/EiSK57WX1WBPQA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwysQACJGwG0yiOfTA53p+/Gk2Q3b9IIZzNAlmeTFVlhy6yKYvZ
 i4N47uyMXMInS8OwCTFMeHVMjP86/KGbZjdjB5OtPHw1MJS1TSImSlR5NfwxvxzxxPz92sMElQY
 33crMOzk8NuoLh0uwx0yVGpFc7C6xFlx9oysZOhRa53Tyk2POQK+UKJGfODiOma7+8oe7y3qa4a
 rdp2Xg2NQ=
X-Gm-Gg: AY/fxX67SpF/rqmXhgg4G1Oh7FfqiZET9YeNlLuBcrDuXbIo/lrCXbisnjOM9bsoU/w
 6+8WVWH+gCw4cDuOEWaECwaY8N6YZg4ySBxtJ22OmnrzqcqXDsKHgL8bPU7tg+9J5xHXpPx+VJ1
 Pk6ZMhAWAzHGTO+MJp9YCwAYqZI++E7bQeVvqqFoB9DJIjKC8zAzhyLIBsG0JMHSKstmsPUM8cZ
 7UZOGqvoiotk/JTS+GLKN+hjpr089h4aKQFcuYGJh6p2T+dTjBOZiRSiCOqeS4XhMA9o7TUI/yd
 sj70HGV7j6arXJqwJbNDfrSmP1wz9AjsAmBtgqW7CapFNkcuyT4v01javf2RTSqpp7LEbI/xegw
 vNsyIW6STlkQvFKUcPrFgt1u+lm2UXFGG3RioEcsbjUoLuUyyyPh0FEfTXzAbyWBr9zQ=
X-Received: by 2002:ac8:5a81:0:b0:4ee:26b3:e512 with SMTP id
 d75a77b69052e-4f35f3b7834mr261949871cf.13.1766503551545; 
 Tue, 23 Dec 2025 07:25:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFCNDdleerV1/mr7P7xnuU+g14yJD9qFowrQWc2bYEBnzRPcsjZ3dwIcpaeMjLcAMNRqp69yA==
X-Received: by 2002:ac8:5a81:0:b0:4ee:26b3:e512 with SMTP id
 d75a77b69052e-4f35f3b7834mr261949381cf.13.1766503550971; 
 Tue, 23 Dec 2025 07:25:50 -0800 (PST)
Received: from quoll.home (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037f18575sm1401626566b.54.2025.12.23.07.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 07:25:50 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 23 Dec 2025 16:25:46 +0100
Message-ID: <20251223152544.155637-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251223152544.155637-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251223152544.155637-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1983;
 i=krzysztof.kozlowski@oss.qualcomm.com; 
 h=from:subject; bh=FBEZSzQ0rqkvVrjYCGkubQOeZuQXJmK12Qqhdra07SY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpSrR5CLCbMPCA+E3qJtui3ASvK8v0kBEUlo0Oy
 NQlwLFyfOWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUq0eQAKCRDBN2bmhouD
 1+QOEACamFldQRPk9FJbt40Z8CFaom3KSBw0pKmn8z0AJWEldRgP1HS/UX4s6dDYER0i144hxw2
 uR4moxseidWd3P20gX34IKLMao+wSN9KLkWbS/ExhknL80EreoZeU2gDW/QapEwsyYJ9nhPCISL
 OEVSYmRU5TnuJKvciCsORmIRx2mav5ze2EBzSvvqGjUuVwaTUcJAZFmtklYltmDwU92dW7xR0f2
 YxOQ2785PllvGACqJBknyip6lqYPfWJKA8c8gb8ZI88xPceP+lJDVN/Qx2DCNEWDVGSaENzcf1w
 bQuWL2YFIMzz/5f9vKWiwfQzlj7hKFVWsNGGOQl8pLSTt+jKBDpDJpXZqw7uhlJUeXcoStLzTi7
 qi0x5H7LcZrlohKtK4pyp0LknbngbouA8MPo+/E2aZnBhqf5S5liZgvv2Xc5b66PmpqPhd8vCSP
 EA4HqT35Isk1gFWSK2gEzT0KZtyfYshB9LNdfaYlvhXH1r8N3MDJg4aLNGzWM4NLRirexwTscHB
 WhqaYDdM7CwmOUIGi2fOlGQBfTgrTFtockKTF3huEw9bNmnGRxon1k8XQsQnxKhW+sIw+HRgM5j
 BIuXJNDOyUr46C2wKZqUBNgkMybEecAEDjVa7Njg1Nhft5OBN4v6gbLEfTNWGrKGc2pKDcC/St2
 ep5cAKFKILMBRdw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: dfq9anCSE0BpqxMWTA2Y70WzVK5pwKZO
X-Proofpoint-ORIG-GUID: dfq9anCSE0BpqxMWTA2Y70WzVK5pwKZO
X-Authority-Analysis: v=2.4 cv=cuKWUl4i c=1 sm=1 tr=0 ts=694ab480 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=sndkAbgyudk1eiRVjvgA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDEyNyBTYWx0ZWRfX3O10bEugpgv2
 Zy40sUi9M5IF4jBmpVeRJnuAt1Sz/lbAC08M65hl3ROFoyUMN+hI3MecWIFb6aYzDgy4YNVlNDx
 bgrzDSS4TO2sXS5gUj5vBknl8AQg4T+yXoVwowtCuVGw9zxhCCVLCJ34L8EwZMB5CkWAo62PDsd
 Bi44nVwlP5O8yqzfV2cwBjx/EtntwFPDpRkiQW0EOl8RfH036qwTUAxpNtwpE7c5lW4XaHE7/1T
 CMZLoGQFcxH2jk1VLcYZ5Y7dshtjhSVSqWBL/GXxgMf7D1+G8In+7QaDrjPxaBBnQ76K7Zx6Y1R
 1e5TX7UzTkxNkM3D0k6uR8IjIknQ+IhoNl6+XjigL8usEclOGz2YuBdvF/B2qEBMpG6tc8V87IO
 4O9COT1U0En9iY2rGahbbNDBVByhLSC4GRtjBEDUgjVqvp2/0gDrXQ9JeLrGOnvp4YSYEhWDEGw
 nS/5ut9p1ocnc6RDKGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 clxscore=1011 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230127
X-Mailman-Approved-At: Mon, 05 Jan 2026 07:16:22 +0000
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [Linux-stm32] [PATCH 2/2] arm64: dts: st: Minor whitespace cleanup
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

The DTS code coding style expects exactly one space around '=' and
before '{' characters.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/st/stm32mp235f-dk.dts  | 2 +-
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts  | 2 +-
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp235f-dk.dts b/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
index c3e688068223..9a2b2f50df76 100644
--- a/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
@@ -93,7 +93,7 @@ mdio {
 		phy1_eth1: ethernet-phy@1 {
 			compatible = "ethernet-phy-id001c.c916";
 			reg = <1>;
-			reset-gpios =  <&gpioa 2 GPIO_ACTIVE_LOW>;
+			reset-gpios = <&gpioa 2 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
 			reset-deassert-us = <80000>;
 		};
diff --git a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
index e718d888ce21..4a489a8d9aca 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
@@ -93,7 +93,7 @@ mdio {
 		phy1_eth1: ethernet-phy@1 {
 			compatible = "ethernet-phy-id001c.c916";
 			reg = <1>;
-			reset-gpios =  <&gpioa 2 GPIO_ACTIVE_LOW>;
+			reset-gpios = <&gpioa 2 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
 			reset-deassert-us = <80000>;
 		};
diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index bb6d6393d2e4..0c5fc7a7be8d 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -186,7 +186,7 @@ mdio {
 		phy1_eth1: ethernet-phy@4 {
 			compatible = "ethernet-phy-id001c.c916";
 			reg = <4>;
-			reset-gpios =  <&gpioj 9 GPIO_ACTIVE_LOW>;
+			reset-gpios = <&gpioj 9 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
 			reset-deassert-us = <80000>;
 		};
-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
