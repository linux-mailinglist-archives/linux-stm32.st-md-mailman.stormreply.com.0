Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AA4D9088
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Oct 2019 14:14:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09EADC36B11;
	Wed, 16 Oct 2019 12:14:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AFCCAC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Oct 2019 12:14:12 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9GC6ftG026522; Wed, 16 Oct 2019 14:14:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=pnor4yyg9faPFc0SOMUAqiQzsJEo1AMmtpZ8aOYAexk=;
 b=PLXp6KeEnEEZpeubqTAjybZLixix3NcwVlAWk+1Va8wxBnW6oa26xxl4qaIZhe32SNjC
 nOOd4ItPFPNCzwKP0tPaER+GRIl2J/c4M1PqURREqWkiIZudCCysdsyKf9DtYdO/PCqb
 EJYVJ8QdCzbrBtVk7rcs0DRR1YnDn5XZhFP+iZX0zEr5b5GmTiKUCqZEfurqwfPJCWJK
 xdlHxPKXiK4IWaB5al4rlTysIeHBx//9VWjGF4ai/+KvEU61rp4WLac3NqouXCxfHOZk
 OshuPdPsBGc0gzRWxvvu1LttCPkPqEQeB8c0rnNBcEzRuNglX5hNeGN4jQTvoGfOmzRB VQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vk4kx60er-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Oct 2019 14:13:59 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 680D710002A;
 Wed, 16 Oct 2019 14:13:59 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5526420A92D;
 Wed, 16 Oct 2019 14:13:59 +0200 (CEST)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 16 Oct
 2019 14:13:59 +0200
Received: from localhost (10.201.23.25) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 16 Oct 2019 14:13:58
 +0200
From: Fabien Dessenne <fabien.dessenne@st.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 <linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
Date: Wed, 16 Oct 2019 14:13:48 +0200
Message-ID: <1571228029-31652-2-git-send-email-fabien.dessenne@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571228029-31652-1-git-send-email-fabien.dessenne@st.com>
References: <1571228029-31652-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.25]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-16_04:2019-10-16,2019-10-16 signatures=0
Cc: Fabien Dessenne <fabien.dessenne@st.com>
Subject: [Linux-stm32] [PATCH 1/2] dt-bindings: mailbox: stm32-ipcc: Updates
	for wakeup management
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

The wakeup specific IRQ management is no more needed to wake up the stm32
plaform.

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
---
 Documentation/devicetree/bindings/mailbox/stm32-ipcc.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/stm32-ipcc.txt b/Documentation/devicetree/bindings/mailbox/stm32-ipcc.txt
index 1d2b7fe..139c06a 100644
--- a/Documentation/devicetree/bindings/mailbox/stm32-ipcc.txt
+++ b/Documentation/devicetree/bindings/mailbox/stm32-ipcc.txt
@@ -14,9 +14,9 @@ Required properties:
                    property. Must contain the following entries:
                    - "rx"
                    - "tx"
-                   - "wakeup"
 - interrupts:   Interrupt specifiers for "rx channel occupied", "tx channel
-                free" and "system wakeup".
+                free". If "wakeup-source" is set the rx interrupt is the
+                one used to wake up the system.
 - #mbox-cells:  Number of cells required for the mailbox specifier. Must be 1.
                 The data contained in the mbox specifier of the "mboxes"
                 property in the client node is the mailbox channel index.
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
