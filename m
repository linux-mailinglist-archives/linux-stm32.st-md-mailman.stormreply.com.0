Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0769A2E8AB
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Feb 2025 11:07:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6542DC78F88;
	Mon, 10 Feb 2025 10:07:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37125C78025
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Feb 2025 10:07:35 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A9esgn022216;
 Mon, 10 Feb 2025 11:07:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 KrNQJraXZVjilPFdNhBPtBLSm+xWnPeDyMXrb2bQCls=; b=Rp9EA02hn4j6/zpf
 9WS8gwiAvBc0R7ipgIptAfQyN02mO4Mw5Ll8jIAuhu3B4UVda1tW2VSZVOS8Srmd
 rOLx0G8ukSY/k98zd1YrQn3FkjRV+Ih3fWyjqoclFZzz7pmqj+QZNgVd/BH8mwwI
 PsCghMr5T+r/8EeBqw9I9+txbubOAZzObCz1koLomFf5ZxjYGGFBnXboTwzOnfS1
 POSSuGMf4MYWxJUDbD5kbAhpSYRu3ZBtupaMrj+qItsRrTt1UmVpuCJe5/tjETgj
 G3RRiy6buyBL3CRbwWQSQMD57qpFTpUnWoUkdSt/KITAncS6rQAri3DfxrEqWNfp
 HKqNSA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44p0rhwv3v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Feb 2025 11:07:16 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id AC6B84004D;
 Mon, 10 Feb 2025 11:06:16 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C587A2BEFA0;
 Mon, 10 Feb 2025 11:05:02 +0100 (CET)
Received: from localhost (10.252.6.236) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Feb
 2025 11:05:02 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Mon, 10 Feb 2025 11:04:31 +0100
MIME-Version: 1.0
Message-ID: <20250210-6-14-stm32-media-fixes-v1-2-c64ebe9af8bb@foss.st.com>
References: <20250210-6-14-stm32-media-fixes-v1-0-c64ebe9af8bb@foss.st.com>
In-Reply-To: <20250210-6-14-stm32-media-fixes-v1-0-c64ebe9af8bb@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot
 <sylvain.petinot@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Marek Vasut <marex@denx.de>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.252.6.236]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_05,2025-02-10_01,2024-11-22_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH 2/2] dt-bindings: media: st,
 stmipid02: correct lane-polarities maxItems
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

The MIPID02 can use up to 2 data lanes which leads to having a maximum
item number of 3 for the lane-polarities since this also contains the
clock lane.

CC: stable@vger.kernel.org
Fixes: c2741cbe7f8a ("dt-bindings: media: st,stmipid02: Convert the text bindings to YAML")
Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml b/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml
index b68141264c0e9fe0e530ce3b06fa3434fa712b38..4d40e75b4e1efff673647dff7bf984c89abca4cf 100644
--- a/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml
@@ -71,7 +71,7 @@ properties:
                 description:
                   Any lane can be inverted or not.
                 minItems: 1
-                maxItems: 2
+                maxItems: 3
 
             required:
               - data-lanes

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
