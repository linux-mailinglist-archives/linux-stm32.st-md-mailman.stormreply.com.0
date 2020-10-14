Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 200E128E0C4
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Oct 2020 14:55:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C79FFC424B3;
	Wed, 14 Oct 2020 12:55:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8CFFC32E91
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Oct 2020 12:55:21 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09ECqGFX019487; Wed, 14 Oct 2020 14:55:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=wsGIXxxHRanfrzSuhl2i4VZtSbpz2LNavXq5QOc27fo=;
 b=XMafx1fCh/LCI+G/GPKaGeSoW7q4ya49n0wz9AtINmtM65dXH1D0RsORKd+JTU/cII64
 pGtpkYi804pNG8fhPyJp9fF+XgDt/wSqTBSJLjsVqYMqByulcODjdnXiq7FT6eIvzJqv
 p3CwPYzaLtk9HSARMy22OGfettC+Wf4lBDMreHEsUUTeIAMWEPNGdd7N8XPboJzYLF8r
 g9DA6rlQee5dY1R8PRZBurV6tdObOdjZ/QmUaatmtdQ0qRjwJU6/zAZ1Jwd+I42hvy22
 ks9PvUCTnexJitqgjFYFZXcGwoo0KZFSo2fhcCID8bvdeFRL68WAG88O8YScY+UG7AcM 6w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34353wef26-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Oct 2020 14:55:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C858510002A;
 Wed, 14 Oct 2020 14:55:10 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B90172DA52A;
 Wed, 14 Oct 2020 14:55:10 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 14 Oct 2020 14:55:10
 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
To: Rob Herring <robh@kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>
Date: Wed, 14 Oct 2020 14:54:38 +0200
Message-ID: <20201014125441.2457-2-arnaud.pouliquen@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201014125441.2457-1-arnaud.pouliquen@st.com>
References: <20201014125441.2457-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-14_07:2020-10-14,
 2020-10-14 signatures=0
Cc: Ohad Ben-Cohen <ohad@wizery.com>, devicetree@vger.kernel.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 1/4] dt-bindings: arm: stm32: Add
	compatible for syscon tamp node
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

Since commit ad440432d1f9 ("dt-bindings: mfd: Ensure 'syscon' has a
more specific compatible")
It is required to provide at least 2 compatibles string for syscon node.
This patch documents the new compatible for stm32 SoC to support
TAMP registers access.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
index 6f1cd0103c74..6634b3e0853e 100644
--- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
@@ -19,6 +19,7 @@ properties:
               - st,stm32mp151-pwr-mcu
               - st,stm32-syscfg
               - st,stm32-power-config
+              - st,stm32-tamp
           - const: syscon
 
   reg:
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
