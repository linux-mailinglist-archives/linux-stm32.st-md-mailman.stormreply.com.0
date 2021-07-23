Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 086E93D3B10
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jul 2021 15:28:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D289C5A4D5;
	Fri, 23 Jul 2021 13:28:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0CBCFC57189
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jul 2021 13:28:35 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16NDDRWV020340; Fri, 23 Jul 2021 15:28:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=awDnnbvaQDlhaGIqUJdPGXponCoQuQxoZArIjRJUl0I=;
 b=hGQHlMGZT1gIKZHMQco8fOtAbac8CyBAKc4mwyfh8SjeBFvvxwgR9I1/eZnxpqQr25Xn
 aHyrjM2XsZjjVE44mtnbYmSjPp86XAxlBQqS05LdudYqVWltyGDucHyLQhp4scZvTCkh
 iIx0Wm5aSDntTjPsbvW0MvvyTAGvG+FDjD6KcEdPd4k+pNiuhsWQfIXM83K3VURvFBhe
 rxr5EZgrnqfdh0eozxc0cDVI0cn6a/A3qj0v2t7TTVymaZ1cR1v1XkBrwDNqMUlxRVXN
 rPET0G1viydNEOkxkboWoNnnFv5i9JmKXr4XXFf8W0bD1L/72APrP9A9h6zxo4O2pT3k 3Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39yt689gnt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Jul 2021 15:28:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 77204100034;
 Fri, 23 Jul 2021 15:28:13 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5CF1A221784;
 Fri, 23 Jul 2021 15:28:13 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 23 Jul 2021 15:28:12
 +0200
From: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, <arnd@arndb.de>, Olof Johansson
 <olof@lixom.net>, <robh+dt@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Jonathan Corbet <corbet@lwn.net>
Date: Fri, 23 Jul 2021 15:28:04 +0200
Message-ID: <20210723132810.25728-2-alexandre.torgue@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210723132810.25728-1-alexandre.torgue@foss.st.com>
References: <20210723132810.25728-1-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-23_05:2021-07-23,
 2021-07-23 signatures=0
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-gpio@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/7] dt-bindings: pinctrl: stm32: add new
	compatible for STM32MP135 SoC
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

New compatible to manage ball out and pin muxing of STM32MP135 SoC.

Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
index 72877544ca78..dfee6d38a701 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
@@ -24,6 +24,7 @@ properties:
       - st,stm32f746-pinctrl
       - st,stm32f769-pinctrl
       - st,stm32h743-pinctrl
+      - st,stm32mp135-pinctrl
       - st,stm32mp157-pinctrl
       - st,stm32mp157-z-pinctrl
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
