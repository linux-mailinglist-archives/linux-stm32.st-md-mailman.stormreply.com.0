Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B37265C5A
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Sep 2020 11:20:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E923C3FAFE;
	Fri, 11 Sep 2020 09:20:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8C4CCC3FADD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Sep 2020 09:20:45 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08B9GrU1022506; Fri, 11 Sep 2020 11:20:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=3OR8qxZpq3JUZtn+62eu3HHTqXzgdbLMzpf40hJBmi0=;
 b=JlokXir+4V+MLlcPGz7yfLqDge+HwQS//ZGrCDY6Q2ctmwVeySzbg2YiiYCtz9qgF5ND
 NBSI58IRoi7wwyHvDSEVP6/uQSVYKFX0d1eazQKJSruCQzSlCN7q1NaOeBlRtNU8KlpE
 JBM3SkQNR8IUwBf5hjiND2XUKUHXj78oOdjqRDDjOnN0gRNFepP9GsxVLLzqcdC9Efqx
 5xQm4SPUUxhwFdB6qXF7QD6dFJc7FyRkdskms9eG7dZUcXFERcc6y/YJN3zIlKyfVLG8
 QZaR2K20CXkGH4mBKSE9fPYEiFUE6idqcQLB2mQuyc2mrGivTeEZIm4uDB2RJqeV/W9l RQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33c0ev88a1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Sep 2020 11:20:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 42FBA100034;
 Fri, 11 Sep 2020 11:20:24 +0200 (CEST)
Received: from Webmail-eu.st.com (gpxdag6node5.st.com [10.75.127.81])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2DD1721FEBE;
 Fri, 11 Sep 2020 11:20:24 +0200 (CEST)
Received: from localhost (10.75.127.44) by GPXDAG6NODE5.st.com (10.75.127.81)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 11 Sep 2020 11:20:23 +0200
From: Olivier Moysan <olivier.moysan@st.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <alexandre.torgue@st.com>, <robh@kernel.org>,
 <mark.rutland@arm.com>, <arnaud.pouliquen@st.com>
Date: Fri, 11 Sep 2020 11:19:51 +0200
Message-ID: <20200911091952.14696-2-olivier.moysan@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200911091952.14696-1-olivier.moysan@st.com>
References: <20200911091952.14696-1-olivier.moysan@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To GPXDAG6NODE5.st.com
 (10.75.127.81)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-11_03:2020-09-10,
 2020-09-11 signatures=0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/2] ASoC: dt-bindings: add mclk provider
	support to stm32 i2s
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

Add master clock provider support to STM32 I2S.

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
 Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml b/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
index f32410890589..6feb5a09c184 100644
--- a/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
@@ -54,6 +54,10 @@ properties:
   resets:
     maxItems: 1
 
+  "#clock-cells":
+    description: Configure the I2S device as MCLK clock provider.
+    const: 0
+
 required:
   - compatible
   - "#sound-dai-cells"
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
