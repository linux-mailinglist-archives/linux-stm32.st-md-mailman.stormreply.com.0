Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B75A373C25
	for <lists+linux-stm32@lfdr.de>; Wed,  5 May 2021 15:17:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0CB6FC58D7F;
	Wed,  5 May 2021 13:17:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9B38C5718D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 May 2021 13:17:34 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 145DGTfT026255; Wed, 5 May 2021 15:17:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=jXXG4PKheaqB/snWZiHmMxnRwKUHDSia16UN8hscUVc=;
 b=kiMskIPDM3IS6cwdsqbkz+hC+CB+G+GXlGbn/0GUXTbwfz0twueWHrbsn6nC0OMMDkr0
 0gXtNNf58JBrQ7LNdydqM3mvlV1IALEmPJLQrehD8knQTyLXeBdtxrUfVTCthCVFXN33
 9m8IU6MMGXRTpK3b5hq/K7ztKPtwENeKptOtIIN8MpOuIVJagaXGALa17eAIg59heUjl
 uvWTMuhTGldqXPy0J3jdTDMRJKlfOVc+LfvyW23alX2eY1TIcTAQpz8pjjIqnNrwZ+FJ
 pCLggPANkmB7SuU0dtYGUl6dOuxkh3C/K83aFbuQqEQ9G9kOTukQ7nNDvcqv8FnO6azE lQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38be9amddn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 May 2021 15:17:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 28866100034;
 Wed,  5 May 2021 15:17:22 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 13B8D2C4206;
 Wed,  5 May 2021 15:17:22 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 5 May 2021 15:17:21
 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: <wsa@kernel.org>, <robh+dt@kernel.org>
Date: Wed, 5 May 2021 15:14:38 +0200
Message-ID: <1620220479-2647-2-git-send-email-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1620220479-2647-1-git-send-email-alain.volmat@foss.st.com>
References: <1620220479-2647-1-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-05_07:2021-05-05,
 2021-05-05 signatures=0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com, alain.volmat@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 1/2] i2c: add binding to mark a bus as
	supporting SMBus-Alert
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

Since SMBus-Alert is an optional feature of SMBUS which
requires an additional pin, the smbus binding cannot be
used to indicate its support.

Add an additional smbus-alert binding specific for it and
update the description text of smbus to avoid mentioning
SMBus-Alert

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 Documentation/devicetree/bindings/i2c/i2c.txt | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Documentation/devicetree/bindings/i2c/i2c.txt
index df41f72afc87..b864916e087f 100644
--- a/Documentation/devicetree/bindings/i2c/i2c.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c.txt
@@ -89,8 +89,11 @@ wants to support one of the below features, it should adapt these bindings.
 
 - smbus
 	states that additional SMBus restrictions and features apply to this bus.
-	Examples of features are SMBusHostNotify and SMBusAlert. Examples of
-	restrictions are more reserved addresses and timeout definitions.
+	An example of feature is SMBusHostNotify. Examples of restrictions are
+	more reserved addresses and timeout definitions.
+
+- smbus-alert
+	states that the optional SMBus-Alert feature apply to this bus.
 
 Required properties (per child device)
 --------------------------------------
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
