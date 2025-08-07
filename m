Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4892DB1D36D
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Aug 2025 09:35:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2424C3F942;
	Thu,  7 Aug 2025 07:35:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7541BC3F940
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Aug 2025 07:35:45 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5776Y6k6008798;
 Thu, 7 Aug 2025 09:35:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=TrfZdnEzM8YI3DydNQ0/ut
 FTCYg5k0TRMMcoKD0jcS8=; b=15WPNXIqawe1InQtQS6TSQ7l19vx8wRzokD1YL
 JX3/zXFuyzz5TtJrOWn2Xp66pICNI8wj98GWT3UZ7WYqw2bjZ2Dk8Fk23dOO9oDF
 jCn39Tkb0mpexYUSFm1r38PeLTP0B4WYP/DjQqxlsYOEx/RElBTWflhMj5Rj1Iog
 KG4nK4TYItqmOS4zJgFWL+lEoM5KXMuVkHj8vPYcqIpQ3dG2oYb3Iszy1LZFyCFF
 P5FGPzk/JuN9yOFEGdolwa6TS/rFj+deMJR4hcDE3ukiRmX9roLV7PF4WGncL6eY
 AZ8f8rF+A2LMpVJcergbpPDF3H4kSox0TZnLvU91k6cZAKCg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48cq00g955-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Aug 2025 09:35:26 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D4AC94005B;
 Thu,  7 Aug 2025 09:34:36 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0AEF871860B;
 Thu,  7 Aug 2025 09:34:11 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Aug
 2025 09:34:10 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Thu, 7 Aug 2025 09:34:09 +0200
MIME-Version: 1.0
Message-ID: <20250807-upstream_omm_fix_req2ack_test_condition-v2-1-d7df4af2b48b@foss.st.com>
X-B4-Tracking: v=1; b=H4sIAPBWlGgC/5WNQQ7CIBQFr2JYSwNYhbryHqYhCB9LDKXysdE0v
 bvYG7icl5eZhSDkAEjOu4VkmAOGNFYQ+x2xgxnvQIOrTAQTR6bYib4mLBlM1ClG7cNbZ3gKYx+
 6ABZt0+hCqQ4qJSh/Y44fnCLVNmWo76107SsPAUvKny0889/6f2PmlNNWyc5wJ73s2otPiA2Wx
 qZI+nVdvyRBBrTgAAAA
X-Change-ID: 20250806-upstream_omm_fix_req2ack_test_condition-77e8fb0d13d8
To: Krzysztof Kozlowski <krzk@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_05,2025-08-06_01,2025-03-28_01
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2] memory: stm32_omm: Fix req2ack update test
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

If "st,omm-req2ack-ns" property is found and its value is not 0,
the current test doesn't allow to compute and set req2ack value,
Fix this test.

Fixes: 8181d061dcff ("memory: Add STM32 Octo Memory Manager driver")
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
Changes in v2:
- Add more detail in commit message
- Remove "Cc: <stable@vger.kernel.org>" tag as the fixed patch is not part of a LTS.
- Link to v1: https://lore.kernel.org/r/20250806-upstream_omm_fix_req2ack_test_condition-v1-1-4879a1d7f794@foss.st.com
---
 drivers/memory/stm32_omm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/stm32_omm.c b/drivers/memory/stm32_omm.c
index 79ceb1635698f6bc8bd4a39fdeaced1ec318e1f6..9efc56a85b5ecca49eb6dfc0ef83880f89591cd1 100644
--- a/drivers/memory/stm32_omm.c
+++ b/drivers/memory/stm32_omm.c
@@ -247,7 +247,7 @@ static int stm32_omm_configure(struct device *dev)
 		if (mux & CR_MUXEN) {
 			ret = of_property_read_u32(dev->of_node, "st,omm-req2ack-ns",
 						   &req2ack);
-			if (!ret && !req2ack) {
+			if (!ret && req2ack) {
 				req2ack = DIV_ROUND_UP(req2ack, NSEC_PER_SEC / clk_rate_max) - 1;
 
 				if (req2ack > 256)

---
base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
change-id: 20250806-upstream_omm_fix_req2ack_test_condition-77e8fb0d13d8

Best regards,
-- 
Patrice Chotard <patrice.chotard@foss.st.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
