Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A49BCF428A
	for <lists+linux-stm32@lfdr.de>; Mon, 05 Jan 2026 15:37:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9902C57B72;
	Mon,  5 Jan 2026 14:37:10 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76D45C56612
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Jan 2026 14:37:09 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 605BTsY73522063
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 5 Jan 2026 14:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=KZioLkpanDZcBH1dgKOEf56mBqkNVVvEtci
 ludwtIUw=; b=ehNTYIkHAHXAHppeWDGRPgWTfA+ycLAEc2nK9K9HaDbIZZDK+vw
 jJeOxl+RVw2khR8ZrwyDWHIhPR4/lJ4Bckq1rrcCcNO6N8mTB3wBqjHO0E9GQWj1
 ukwXd/nRmrcDFaxN3hU4hHGkN9QndQ+CL6b5kype4UZ36zhZPT9lzbdEV0hRtWav
 K1jTULQE4L+i0CpUcRt42UhAJvv4fNMrLg00qJNV5anqYt8kVic29V7hEkNhzdPp
 uiiYHzLwX3QiKFNscPZO1k2N4prHDU/8aHlYqaZMOcs/kAFfEelg3otIU5Tpix/E
 WMEko5+9m8fi1CnZ2sSi4QYMeHxoXGGm1Cw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg6uu9hvs-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Jan 2026 14:37:08 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4f1d60f037bso318814801cf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Jan 2026 06:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767623827; x=1768228627;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KZioLkpanDZcBH1dgKOEf56mBqkNVVvEtciludwtIUw=;
 b=BCeVhw8qkneaHbifD8qKvqE5v9v0rbMu+WARhORDZhF8A14Qrz+ABx1ACHbtTrHime
 9gAtpVo3RvTvi0m5NP/1U9N6FwZ+LpipKk71T5llimFfNKd4/Fqrc9S5hHCUQvi2PeDI
 D9+pwEhMVoHOMasqRYiM93IES6JOuWVZMx7+zAGTVkYevtTUUznuczc+kUSDUCE4znFw
 2qg6nQ8RqHFVvEPjFJQHDQOXrAdk9r4d9EACVmiaKovAaUts7Ds5e6h0ii483/iP/6ed
 GgRbJxDiSrFDix41yK4n2+jKpgFj5FGOqnEwXx8RXaqQyi8amNIsFWHTb6qc9tpjjADU
 3WJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767623827; x=1768228627;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KZioLkpanDZcBH1dgKOEf56mBqkNVVvEtciludwtIUw=;
 b=NV3OVm39zOyb5/potHFryX+G1BRNVgDQOiPYpn6L+7vlvTfptfsxEe+RqtSFcVHb2b
 A/gViNEVDHoTR20C5Pqko04TTl4TOf3XUvv/TuVko9Kf3fepbs8NFBUHsgXYWistckve
 EP+TV1MVjpx1Rvb3X5aW+PA3C6Xi3Wu6W3oDdaLmx2eYCqjLfoQtcZ6dGc+hokDghHYm
 jmhrBHJrX/75OCwlQqGhm3FWnJIaYNonNPDszmm5bI9tLc3D8iHFE9/ER390HthSKslD
 6/L2iGoMIjhK6FKvKzOvGFSnatA4pbuCCnHRKQ2hjDoxMiSMvZ0Eo73xqX163b6jzPTL
 7Prg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXf3e7Ohud8m0oQOL9eqNShU/QGITiXaB0cLlYARuLVwI1J03Fo1/Lc0Nmnwq89isVtgE2RaBa5vR4eVg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz47Adot7l8KwD0ykk9e76oK91Uj4KkXDXp8rBgZUGeU2m5IYzz
 it7nYTCH5LIttRaATfDdfHXeGC1kRkg6io2R8qPOLl7ppTJqV7XNr+0zwTqynATd6iCkLoy7VL3
 fKhmgCQXpREPfhCHl+PxlHLWb8N2i3PY1oyBj2KAq9CcumKaAEfXgzwCvKjG1bYsMZvRrN4DiYS
 lOWiKqtFE=
X-Gm-Gg: AY/fxX4Na3GOzCfhpYWsXfVnMyULHcef5e/ugv27l09/3CbBQA285apYHX8b6Rlhdwp
 9fkBVz+MaYwzYq2M0uB0kKbMWMmB+Du2fORfcQgDlO+dGX/mrSBHDBJWXFJgojHA/M2KZ8cSDc8
 cswzHHWjaKzRcuEfBWuqNLVBP81jIEGv+qm5cdmETKnXxXjMIzXhMDBDkkOE1m3IGEPUxQLeaSq
 ViiMHysdeHgYWm8hNenqLa+4GKWwnV0HlQcZPL/K0ic1ue6oqlhf1tMIBtJugkkpqCvtA0pKkSD
 hzJS5JxOWgBFOGfaeZaA0Awk5MaDXjp0kiiSFZkUVyUZlRf69v55Mg4QOfZXKc9k9cObHaytgw8
 Kw0wWQAVwxHPNIhNMESawuKWANA==
X-Received: by 2002:a05:622a:a90b:b0:4ff:8da6:2289 with SMTP id
 d75a77b69052e-4ff8da62a41mr50044831cf.27.1767623827377; 
 Mon, 05 Jan 2026 06:37:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETqa4wUKKN9lw1LQlEMOdwGiXBqLZKSYc2WvZI5mrVl4L0Pw9h0qnI9s0mw79oaM7Cdgi0Bw==
X-Received: by 2002:a05:622a:a90b:b0:4ff:8da6:2289 with SMTP id
 d75a77b69052e-4ff8da62a41mr50044161cf.27.1767623826703; 
 Mon, 05 Jan 2026 06:37:06 -0800 (PST)
Received: from quoll ([178.197.218.229]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b84267ba062sm2914066b.71.2026.01.05.06.37.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jan 2026 06:37:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Mon,  5 Jan 2026 15:36:58 +0100
Message-ID: <20260105143657.383621-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1368;
 i=krzysztof.kozlowski@oss.qualcomm.com; 
 h=from:subject; bh=i65eVLxpMZsyFdDY2lrflFwXpIkctLvow8AmMXbS6yY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpW8yJE93S4+M3e+01WVQV077ZGMVXwUKYuZDCy
 eXZDeO2BhOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVvMiQAKCRDBN2bmhouD
 18jQD/9QM/XaR01VMbGWrly6e4KidWj6Gt/bN6D014S4O9L5GkLa7tZ5FN3sINq5Rpnu3e8+Q0Z
 /W9VfJJKNsf7JvBOZn27KCvjH1dQisLMT6aAuS40QQVeHaTawiSZRPZPwe4/S5duNsFZvsLcje/
 3lj9SAVMjbONDK7fznomplvZdjJvyS3KBtCHWZ0hqcXWySEzSmWx5Kp4n+1U7xlytPwOqbyKsEH
 gmU554TqKuWZEWTQx11+GcX+40kaex+OWBBVy5wKbdCPcxjZpZWEZYNby21cpOHlbqCI60glMb/
 akb+QI0sZgvyyy77Ek4u5DuDMXFttmVrDzN2Cd25k3c2+SKgbGHcqvMcxwQmlSdcxTAPo+Ko1u3
 OOsOFvsUC2SqsQvFqhbJ62QYz5hVnwH9r7dF8p9XPZuwYdRn9ZFMDnZRP+Oy9g29+anCoiCO5MN
 L4UNOyGYoP9+0nw/HjY2WndtUL5M2YKyEqPKg46n/OQkYbcf1Yy+zUtN4fert4tdLW16SHbzVZy
 ZnZW4kgzLY7dwShPLlK+G5S6ToTRRO2fvvPB+49mW4IVgVfRfx4Pq+cti1JmVgoBRQpxFwh8Nvp
 eNb/a0ziPUnka4ivNd2MOIwDHfMmGQ2lGPQMs+2ESgKeb6Bcfvyw1P91rHT1NDv7Lg8hr1vqazn
 xbp1u9v0RS24Pkw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEyOCBTYWx0ZWRfXzlf2dCJK6Lob
 eCw3q6UoCVAv/U7WAr54Jbs5wJQY3oS5z2T3WMeFwCMUkGsq9yLBtViGArnMne7BJ4s6tljBkfg
 bBeh1+EuBSlPZzDWz0RES0T7MeXNBwVl6+nmF8k/qRg7OkhZgdcZO+yGKywRhW6Jr5FcChs3tKU
 C/BGdRQwSTMTkK9tLnv9nCb5qK4ABGEYRvvIYS7gFmwKWFyIJYUC2i9M7wFmobwJig0aN4owQdX
 K1C4NghQVZVUPyVUv/TDRnbvKgbTMwc/wvzBlq5rDWFh/O2UOJQTGc+0PDzuZOUFno13wD7DsRw
 6suQ7ObPzo0VM3gbNUdCm0L9nkoZgL7btbKA7C/D50wUIJs0pceB/CIF1iboeI2OSYpCf14FspP
 ou0L7fPQe55a2ybXwuXy1Kavl26MOzF5FNK5oYr4oIkzBBC+qyEoKFmJuC5kgA/hRP6Z3idQaho
 d2K/6XsSsjRplW4d/3w==
X-Authority-Analysis: v=2.4 cv=eZ8wvrEH c=1 sm=1 tr=0 ts=695bcc94 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=mc1TC-L5zOEaToRhIlkA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: rFqyEkCy33CA3ck7hI4hqZ_8TSYoz9sF
X-Proofpoint-ORIG-GUID: rFqyEkCy33CA3ck7hI4hqZ_8TSYoz9sF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050128
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [Linux-stm32] [PATCH v2 1/3] bus: qcom-ebi2: Simplify with scoped
	for each OF child loop
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

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Add Rb tag
---
 drivers/bus/qcom-ebi2.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/bus/qcom-ebi2.c b/drivers/bus/qcom-ebi2.c
index c1fef1b4bd89..be8166565e7c 100644
--- a/drivers/bus/qcom-ebi2.c
+++ b/drivers/bus/qcom-ebi2.c
@@ -292,7 +292,6 @@ static void qcom_ebi2_setup_chipselect(struct device_node *np,
 static int qcom_ebi2_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
-	struct device_node *child;
 	struct device *dev = &pdev->dev;
 	struct resource *res;
 	void __iomem *ebi2_base;
@@ -348,15 +347,13 @@ static int qcom_ebi2_probe(struct platform_device *pdev)
 	writel(val, ebi2_base);
 
 	/* Walk over the child nodes and see what chipselects we use */
-	for_each_available_child_of_node(np, child) {
+	for_each_available_child_of_node_scoped(np, child) {
 		u32 csindex;
 
 		/* Figure out the chipselect */
 		ret = of_property_read_u32(child, "reg", &csindex);
-		if (ret) {
-			of_node_put(child);
+		if (ret)
 			return ret;
-		}
 
 		if (csindex > 5) {
 			dev_err(dev,
-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
