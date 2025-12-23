Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CF0CF2266
	for <lists+linux-stm32@lfdr.de>; Mon, 05 Jan 2026 08:16:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C81F4C5F1FD;
	Mon,  5 Jan 2026 07:16:25 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5B1B5C8F276
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Dec 2025 15:25:52 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BNCgY3L1902630
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 23 Dec 2025 15:25:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=TtEztCWnj7QRqJ0GSyALKfu/qRVEAEmKKSa
 +oTR2QDU=; b=E3nXzk9RnMdtv4PuC0+mk3KKnbAB0gyZfBD7ctQaDriuv++n0m2
 dwTvyN4o/lE/iFITXN/b3TZ7umVEJ4ZwFCxcABdROe3XyJ0HNIshbOxppFzIPBnn
 T2GI1rOvWjgGwefREPJhJjRCsSjiFb1hdWwRzIG2o3StcbKDNfcr+qu1vDgLPiOg
 RLW9Yesx3ErO9Xwgzdi5yovCv+ZkknxxOa3Eq30KomnAb9dDWBZMNUuQV7aG15Ep
 D2kl285l3JFrN9s3XW8j96FbcCdvAzpBlvg6O0terYi3ScUy8vX0gDeZMFkFing/
 sKIE69bKF7PpTyt5dol7CUgdOM8VaWm20AQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b79w8kfva-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Dec 2025 15:25:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8b8738fb141so1508658285a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Dec 2025 07:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766503550; x=1767108350;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TtEztCWnj7QRqJ0GSyALKfu/qRVEAEmKKSa+oTR2QDU=;
 b=LbBqkctUsMTAX/eGdVyZMX8BOzFdodTNXsxLWrMLSmWJKt3K3Imud/XE2m9uxlQn6w
 FijBwGUX0hHdy4PrR2idBGu+SZAddfaZpNyyHMBBFfarSlvU8oIHjVIZMWx1JCzUVip4
 ldz3TSfWZM0XKqdXZOCmp5MjiG5Sl0OyRe4hpf/lwmU/iBuT3IRRSnKfSaSZu8WXWBDM
 I6RVtMEG18hP7rHAa6T08D/bSNw0gifYtuBhtp4LZDJq+BFcOFNvUT4I7m9Jj5lXwjIv
 LWke9mvytogdESzrOhaOVyTVzkEhPaQTPyJCgGooXZ0yPwjuNqVHxhRYrRK5Loq1N7kX
 vKpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766503550; x=1767108350;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TtEztCWnj7QRqJ0GSyALKfu/qRVEAEmKKSa+oTR2QDU=;
 b=LW/D7ihuew9mz96Lrd4wGQW2NsYIuEkylOMnuUzjgydQ3/jppCjDcnq/q6Q2vpOWz3
 R8+qngmtptw93BGU2FD2kIDyrnemzW0pS4A0IkD8+lfNF5X+lxR35BV3bgpofTh3AfBh
 x2zBkEC1ewPAjES02arifcsC4DA5q0kH2f1DFjaBt8F+ayzch8CUIZbtmIJ9EJBzje+q
 4r5NCYngaw7qEZjs9NekXNB4HHqOORqRt0A7C9VMVo8H+oy+OqZzR5XEOG+Xryr8eLQP
 oAE6dqyvZHINozFiDd+p8shwzmqiaCLO1uv1qqJ2+22oIr3OdtnwHocqdpbv7GmWxPQ/
 2clg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlk50imr1nR3BRq8Ov3HFkFZz+Bm/OWH9IykQIEgxyt5Exc18hYrUR1hJPk9FTqALAZ2nc88CHZa+nGA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YygP6X8hgBjUvv0hmjKIBbWL/zRAJ2skHcjCsTJRexC6Y+Ak8hL
 K4+1ompMlV1oxO7tv4XZ2HX5EdkOnFpEarWXBk29+/3X60zF48IEAGwPDzJNHxN7JVnlGGZiS4+
 Ccq57+4oZyxdkbEhC2HFflg1DTW5P3TTc3XsmuHXQKDJMkprH1RAoZlw2Ma/9ofzqpExQBhNeAe
 CJPiHaoFg=
X-Gm-Gg: AY/fxX4eQ29oDrKo7eDo7vediHZAWe6YfSOBB8chBPj+gEBtwFiGSW7CvUTnvSLrSQi
 EIZdtxfowssvtF5RAt5iO5nMjbT3YW3sASBNWyFSlN1XWT+1HjfUUrD5WbpSzXkDL4KmPh+dQKp
 R9+xN3OWc770qjgEFiaJrc6ZmrEwpyROB4S4JCQSr945U/mkiKKP71KIugIXo4dCnqCHKcAHEJo
 fDnq9wROB4QFcUpGRkVLojAj8nMUnQ1Zz1Xj8CxLw2rOsJ8z4CCmIQk7qm3WxIQ4KCvn1PqoY5S
 y6uZvVUbN3kMl08q6Ip85u8hb+/Brpg5gKjw/M/ZXeFKUiVPtrwW/z3hlE8XODSU2SzNjDixcdJ
 XJNaB/EuhhQLlp/dJQC2Zt6JrlZWnrc7bcCR2Lcfqk9OWeQe/+avS/pD1lp39THOUK18=
X-Received: by 2002:a05:622a:510:b0:4f1:c1d5:e37e with SMTP id
 d75a77b69052e-4f35f2b5da0mr261741841cf.0.1766503549723; 
 Tue, 23 Dec 2025 07:25:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGfEiyxKd274Zyf+GFBh17CVqHI7gHxe7xWhTEgn25kY+EbcwJaW0WRnZeTw9IKDZq1o5KycA==
X-Received: by 2002:a05:622a:510:b0:4f1:c1d5:e37e with SMTP id
 d75a77b69052e-4f35f2b5da0mr261741331cf.0.1766503549176; 
 Tue, 23 Dec 2025 07:25:49 -0800 (PST)
Received: from quoll.home (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037f18575sm1401626566b.54.2025.12.23.07.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 07:25:48 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 23 Dec 2025 16:25:45 +0100
Message-ID: <20251223152544.155637-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1512;
 i=krzysztof.kozlowski@oss.qualcomm.com; 
 h=from:subject; bh=TUV9WBdE7XaextWF8pSmMEIyYIZxno9GibptOAlYOOk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpSrR4kCyqhm4Gsiig6bqUTW+5/U52bbrX4IHHk
 Uwz6YjfGo6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUq0eAAKCRDBN2bmhouD
 1wuiD/wOj4LGMQu/gq0pbdXRvVtoSb+cRbxvJrrhYETDzQJ3p0NGp29zy45oNjJnJKf6c176p5L
 oJuVIaMgEPDsosph6UeWCVEr3TX5S19EYrdfjzMHMAhhw4os1RJpjaOW5pnVxbbhFWbu6TyLiKe
 oyDuJaw5DCvh3GR6Ec1CwJo1V9LXPCqjqEkzY8PILB1OeGVbzLoh0jM0th53FG+BFkiJ0PlTdag
 2epNXoTV3yzJ1ZHO897bsVrnHGhEjC5xWLyIj7jZfuR+d1FX4xVWLlYbkhy+XZUnXLZROoMf482
 xBUbDyfx6I2wurISdzHJTariuC0s5q3xxQ6m7BTKeH/dO1Zm7ZF40qRV/ar16dCCs0gYt8Pl4qs
 KwvEmZxn3hi5MHoGXeT/hVsQZNpBAQbND/V1HZWWwa4OGNIhAz7b+PlfEBEFygvtapv0uAXVeJ4
 IrbmZ+g3jrGbVFBu0xbyTnHfRlpHnBLVdvntdKkkgBmsXDuDZnPMEn5Np1xYuby/LXl42cJEbsu
 QK8e0DZ7uueuZK1Mo48Vm+qupHJf57F59Sc8vvG0vO1Hll4MQEVi474Hs6Zvp389ONja9dQRlhP
 kRq1tpeKDru1aep2JZ/a5sOUWD+bTYhRBXSHIwES1aB/sfRpzwTOHwty9lVQpWI4fi9iBEQft5l
 JX3SuTnUt5zIUyw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDEyNyBTYWx0ZWRfX5wbFdp6iv15N
 CMBD85jiZnLqvpOqWKL44Z0v3Xzhiz7NmBgpXqVt0WD2WKj/flOGKRwt/Md/aLEAhdYw6GEhlKo
 6xQUxG5efGtvPq9yySSJuyE5iW2auXF71UBMnkx6eAXV0EvXxYfnMY/9lkDvdYgQY2fExKTq+D6
 6hZZY9HqxgPB10zbXkPw2K2AjpFiHnsPUmxuqAPshNrIbAAkuQ24EA9lIjVIrFNJ+cVa6UIztMz
 7CYTk78QoraU5lE9B/ob3HrVrBoXWacAZ2/ogQr/Wf3hvX96bCyRuuSdx9uS7NO9GGiOIPFPALj
 UHWLdyGYKFbzrkws2d+ExlglbeJOt3GiurIWFZgt7b85zvYbBJPEXHZSf5LE6VOMDIDX7W0VFAk
 23lkqr8sKfm3PosdeRmyK9h31X03Dq/Va68lLwLlow+CsXyJRnQMGQYZIhwFWzH2kn74xGPqc0e
 o5t9hvz0MyOavyRaayw==
X-Proofpoint-GUID: J0JL7goUk-Vp5aFUi2xCRpy-UjJT92o-
X-Proofpoint-ORIG-GUID: J0JL7goUk-Vp5aFUi2xCRpy-UjJT92o-
X-Authority-Analysis: v=2.4 cv=T/eBjvKQ c=1 sm=1 tr=0 ts=694ab47e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=fzvLM_iN_nYskE6_0WEA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 bulkscore=0
 clxscore=1011 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230127
X-Mailman-Approved-At: Mon, 05 Jan 2026 07:16:21 +0000
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [Linux-stm32] [PATCH 1/2] arm64: dts: st: Use hyphen in node names
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

DTS coding style prefers hyphens instead of underscores in the node
names.  Change should be safe, because node names are not considered an
ABI.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Patches done with sed, verified with comparing unflattened DTB and
dtx_diff.
---
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 4 ++--
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index 88e214d395ab..a6658d836122 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -761,11 +761,11 @@ bsec: efuse@44000000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
-			part_number_otp@24 {
+			part-number-otp@24 {
 				reg = <0x24 0x4>;
 			};
 
-			package_otp@1e8 {
+			package-otp@1e8 {
 				reg = <0x1e8 0x1>;
 				bits = <0 3>;
 			};
diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index a8e6e0f77b83..ec5db00b9d72 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1739,11 +1739,11 @@ bsec: efuse@44000000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
-			part_number_otp@24 {
+			part-number-otp@24 {
 				reg = <0x24 0x4>;
 			};
 
-			package_otp@1e8 {
+			package-otp@1e8 {
 				reg = <0x1e8 0x1>;
 				bits = <0 3>;
 			};
-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
