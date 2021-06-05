Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B74F39D5D3
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Jun 2021 09:19:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8744C59792;
	Mon,  7 Jun 2021 07:19:31 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2A33C57B69
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  5 Jun 2021 17:41:56 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id c9so3837265wrt.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 05 Jun 2021 10:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zDrH59vPVGwHTPRMUG66pWvn8DwNgjhaTZ8+7bVvWks=;
 b=hvBFg06ltlfMtFlCvnLQq1j7N9UIN3KeE7n8H53Qw+eQ4bR4Rsl7HVWxa5tn2hy5/H
 nrFs87Ymz7vSIjN+IghhgpGNbKzkVzdb1KznXrQmiVeDyShc25SMLdgEo4qBaVsW/8IT
 jTiRTL2zjzHQp6fEXT3wmZ1xeKvdG86xBPzPQ9n0PbxCWfxmh5VKXha5vUXzukrqwpZU
 15wtQ1wpcc3EO7MHAmJA7TaXLdDKEvRqdy/a9njJSAti+tj3ncVCQrv+w1gmh06WhnEI
 em7TI/c863zZiU5bXf5Yjg9L0LbqU/ksjsO0LtIo4jfECxYxJX/k4PIlZnAGuxmFz+xT
 +ckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zDrH59vPVGwHTPRMUG66pWvn8DwNgjhaTZ8+7bVvWks=;
 b=UXqd3fCsfkkZ+qZP8lPsEMF0DZgPCAf3Mpoggin9Ds/qEZAvZrWDoXh+2xKUfsywzV
 6xh+SmqDXmhrmJMbXN58zseQ9shBVi2nXtxc3nfqBj/KWyOVMbSlqNkvM0lszvhBBD4a
 68Q1iQRqv18SpcUW1PTThmK38ys5w4NJy8iNTKE+BzURGmSx+USl4RMNmzgsrl4U3WM8
 qJHttkwQSE2t89TJBLH20F27pT0bUF7C2PXvyFHBsNDUm3cgp8/hLcmUBxVJu1j92nHc
 58PJ6rVu70mI9TfiJ8tEDEKRQFFpu8CPBOD0R1lbr160hoxezEtTREXsmljMmCTKWxHd
 rlrg==
X-Gm-Message-State: AOAM532/fYpUI6EtQX3QUAp4efy6I8C2tTE7azV7Dzk0IttYP/9xanf8
 EoybRjzF+jB1BbWonrL4l9A=
X-Google-Smtp-Source: ABdhPJx3BUcRirbykVkDF5f4joc8UrtKp3p0OEUvd2smzOzw0Qw6oI6yfoY4Mg2YdD8+Vsjqe9+fYQ==
X-Received: by 2002:a5d:538c:: with SMTP id d12mr9251525wrv.116.1622914916430; 
 Sat, 05 Jun 2021 10:41:56 -0700 (PDT)
Received: from cluster5 ([80.76.206.81])
 by smtp.gmail.com with ESMTPSA id t4sm10352505wru.53.2021.06.05.10.41.55
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Sat, 05 Jun 2021 10:41:56 -0700 (PDT)
From: Matthew Hagan <mnhagan88@gmail.com>
To: 
Date: Sat,  5 Jun 2021 18:35:39 +0100
Message-Id: <20210605173546.4102455-3-mnhagan88@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210605173546.4102455-1-mnhagan88@gmail.com>
References: <20210605173546.4102455-1-mnhagan88@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 07 Jun 2021 07:19:27 +0000
Cc: Voon Weifeng <weifeng.voon@intel.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Wong Vee Khee <vee.khee.wong@linux.intel.com>, "Wong,
 Vee Khee" <vee.khee.wong@intel.com>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, devicetree@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Tan Tee Min <tee.min.tan@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, Matthew Hagan <mnhagan88@gmail.com>,
 netdev@vger.kernel.org, Andy Gross <agross@kernel.org>,
 linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH 3/3] dt-bindings: net: stmmac: add ahb reset
	to example
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

Add ahb reset to the reset properties within the example gmac node.

Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
---
 Documentation/devicetree/bindings/net/ipq806x-dwmac.txt | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/ipq806x-dwmac.txt b/Documentation/devicetree/bindings/net/ipq806x-dwmac.txt
index 6d7ab4e524d4..ef5fd9f0b156 100644
--- a/Documentation/devicetree/bindings/net/ipq806x-dwmac.txt
+++ b/Documentation/devicetree/bindings/net/ipq806x-dwmac.txt
@@ -30,6 +30,7 @@ Example:
 		clocks = <&gcc GMAC_CORE1_CLK>;
 		clock-names = "stmmaceth";
 
-		resets = <&gcc GMAC_CORE1_RESET>;
-		reset-names = "stmmaceth";
+		resets = <&gcc GMAC_CORE1_RESET>,
+			 <&gcc GMAC_AHB_RESET>;
+		reset-names = "stmmaceth", "ahb";
 	};
-- 
2.26.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
