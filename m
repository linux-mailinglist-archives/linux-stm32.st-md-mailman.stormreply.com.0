Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B1E1481B
	for <lists+linux-stm32@lfdr.de>; Mon,  6 May 2019 12:05:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA41ACA8E5F
	for <lists+linux-stm32@lfdr.de>; Mon,  6 May 2019 10:05:53 +0000 (UTC)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E519CCA8E5E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 May 2019 10:05:52 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id x15so6118370pln.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 May 2019 03:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=J11CAk6hX0rsSVl1UifJnPX7sfZSPwS6EsqX4Zx/yUk=;
 b=kaM5lSuLI0FV3PRZ8stKKlOCGIigBQ3ofdGJObwDHHSCL5UEwGsdcoi3yhbvo6H/5K
 ZIBp/fx/ZM9jarokbi4rfhTl4Skw9U5+/R9qFky+M3PdsEOYnGSaJXlrOZefGTweIRIS
 IK/Nm56I3yTXFWjf3St7nh87hpkbs/X2CHfqmE0kDWIhIkuY6gTQdVZWLTgbiM07MXJR
 Qt8Lq93vAC86lCeyQjRjUu9vs4reNp0Kcrw1V70NYG4IkpRGqX27lvJCN4b5dAOCQDds
 jyxaFs3H8ep+9+Kp4cjj5sxxQm0pcB/T977glnoYh22pxFsCyq61z3UEAgvPS9Xg129Y
 bvmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=J11CAk6hX0rsSVl1UifJnPX7sfZSPwS6EsqX4Zx/yUk=;
 b=d/gI7wQ3ppF7xkJnXE31G2fOUimISdKYi6Jzj02IAuR1YfwHlzZ71DY9Ac+aMiRECg
 gw1wZa6jH8C6WyqK+/BJncCbsn9gQbQW0LeOv8LJeiTgJQeInPsKZGDVN4lX5liVWUlz
 /RscirdzbK/MSGiC8FX6FXsRKSLs3s62aA8eRRZL9uVmqyaQ5Su+vbk+mullBfFsnkJF
 utmPYq7i+G0OMtpnY6AzXDadIZUK5RPQpaTbSgvs214jwi6rHEN1Yr3dW9MHDtOtfAUH
 ArQHiQG1YRHwAofNCXsVnVXTesnD0C1kTG2cKmpp0NBKXjmkfb6M0MAoc+i2G+P8iLCR
 jwGA==
X-Gm-Message-State: APjAAAWvWioiipwgsfMjhGK6O47CZeqXZrvCq1JWc7WdTkNNmXcItAt/
 LjhgBt+A5SDxtwZxPg/NnQTF
X-Google-Smtp-Source: APXvYqz3YRJ9CGw5YQkYfcQtat0QM4RY2d72UCJBxq6uSXcYbbBu1tSi1wsMToVYUR4UT9LkO41+QQ==
X-Received: by 2002:a17:902:be09:: with SMTP id
 r9mr31239391pls.215.1557137151415; 
 Mon, 06 May 2019 03:05:51 -0700 (PDT)
Received: from localhost.localdomain
 ([2409:4072:611b:55a4:e119:3b84:2d86:5b07])
 by smtp.gmail.com with ESMTPSA id c137sm16229653pfb.154.2019.05.06.03.05.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 May 2019 03:05:50 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mcoquelin.stm32@gmail.com,
	alexandre.torgue@st.com,
	robh+dt@kernel.org
Date: Mon,  6 May 2019 15:35:32 +0530
Message-Id: <20190506100534.24145-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190506100534.24145-1-manivannan.sadhasivam@linaro.org>
References: <20190506100534.24145-1-manivannan.sadhasivam@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 1/3] dt-bindings: arm: stm32: Document
	Avenger96 devicetree binding
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Document devicetree binding for Avenger96 board.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 Documentation/devicetree/bindings/arm/stm32/stm32.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.txt b/Documentation/devicetree/bindings/arm/stm32/stm32.txt
index 6808ed9ddfd5..eba363a4b514 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.txt
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.txt
@@ -8,3 +8,9 @@ using one of the following compatible strings:
   st,stm32f746
   st,stm32h743
   st,stm32mp157
+
+Boards:
+
+Root node property compatible must contain one of below depending on board:
+
+ - Avenger96: "arrow,stm32mp157a-avenger96"
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
