Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EF4141EF
	for <lists+linux-stm32@lfdr.de>; Sun,  5 May 2019 20:41:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6FEACC5F1E5
	for <lists+linux-stm32@lfdr.de>; Sun,  5 May 2019 18:41:29 +0000 (UTC)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78C1EC0D239
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 May 2019 05:31:44 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id z8so2165636pln.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 May 2019 22:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=J11CAk6hX0rsSVl1UifJnPX7sfZSPwS6EsqX4Zx/yUk=;
 b=NfAt7TlYBcZ8Q5tKMBk2voI//3YAMOFFa7XGfmx+BhWuhARWaZjbkWNGgkq9G8p6UQ
 u0kiZStj8L0+SyBOGy3uMShfifPODyzMtk+t0I0LcDIiIW4UXtcLPVwXqiCOBfbUBDN1
 DuJoN7p2DjMbLUQ+g4HA58dJMuV8nO8WA34spCrn5Jcn+GqoVLgeo9+puGtORnzSkcJa
 GcRLRyHdBo6S3wWoYkjQD8Rd492P8MiWkAks7X9+zQ9oIYpCJw/NU15eDjVMv3Sv7faQ
 caiD+zPX7x+gleUDKJDKnsowuokZ5sLwLv9U0HGkcAZSf2ZI0yLO/so4RPHklq3EbkKc
 OXiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=J11CAk6hX0rsSVl1UifJnPX7sfZSPwS6EsqX4Zx/yUk=;
 b=o/wrCS90HwIZ11ngfKIJcEss0z5PprQdKu8Pr+WmDR0aobhuorXC+iZ6dZJk8U9p46
 IrHmvZMSHT+HQF7dgQU6q7qvR/ligvcSk6FPpg2d4R6+N4w7G6aH06M/1e6qdpwF6A3b
 YMVA/3JQ2wk8QIyB2V126WSJYhbHupShN1qj75nqWvt60qBvQpHLPGB+UC4SEPZjYl3w
 ZylfDlyLTuq3Kg+4eAB9lhDdCm56sJODBcQezo6vdlsCfibMJ4drRhvd/WogKvyn7+Ed
 0yz05Qk+6dVXYl+YfNfVwadD/F4CnIsCKiv4K/VROm/y3uJW29bFmyUV/VgsJ8k+C/SY
 RIOw==
X-Gm-Message-State: APjAAAVqYN2Q+uW+0S7MjpjbwFZRUCGktvJDzuGHEn/9TaaKZYWXd45t
 hSegCAawNqvtGpp+k8ASX1h+
X-Google-Smtp-Source: APXvYqx/FVvHZEajj3S63ojtZ+4apc82r5QUp3f7agjtxwzWnPlXgrRA0LNj6Lde8RF6sZUQ+Nn1Uw==
X-Received: by 2002:a17:902:e283:: with SMTP id
 cf3mr8159182plb.160.1556861502960; 
 Thu, 02 May 2019 22:31:42 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:72c7:3835:31df:f367:f70b:ed86])
 by smtp.gmail.com with ESMTPSA id l15sm1152226pgb.71.2019.05.02.22.31.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 May 2019 22:31:42 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mcoquelin.stm32@gmail.com,
	alexandre.torgue@st.com,
	robh+dt@kernel.org
Date: Fri,  3 May 2019 11:01:21 +0530
Message-Id: <20190503053123.6828-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190503053123.6828-1-manivannan.sadhasivam@linaro.org>
References: <20190503053123.6828-1-manivannan.sadhasivam@linaro.org>
X-Mailman-Approved-At: Sun, 05 May 2019 18:41:28 +0000
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/3] dt-bindings: arm: stm32: Document
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
