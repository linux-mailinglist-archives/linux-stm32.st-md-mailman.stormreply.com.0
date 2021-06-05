Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F3439D5D2
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Jun 2021 09:19:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A602CC5978F;
	Mon,  7 Jun 2021 07:19:31 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 090AFC32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  5 Jun 2021 17:41:49 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id u7so7076182wrs.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 05 Jun 2021 10:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Oah1BBk6Y8qhU47gnr9UeRS4FR5T5+vhU26zOHbYDd0=;
 b=eToU5pYflVrmUfM2RBvTfIowg9LsyFExJJ+ylXomzW+TNyNT/0z6vsHtO9bd2rioVG
 ysSQfyES5tqUtpOM+KgzhxdxkLFmPL5cWwcbGbR2SmLtDQ7HZKm8j+mJACSP/Wp06w30
 H4wDEfqAaT4n4lxcwR71wgRpyD7XLSTGnRikmhg7CAAqVdvraGiD60b72/CaL0n1/Rlf
 sMU8hlOd3Uf/uQcGdOJBrGGHq75+fZ41Lh1osZI5GcNiXoTaYhycCZD5R+vMMNYYnEoD
 oM4Fsn5Jo1mZ3Y79IkYg7oxTFv9qUxwDPeu7iuvVw037cC86qgN/6Gapr6nMwHsqj+Rx
 3FOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Oah1BBk6Y8qhU47gnr9UeRS4FR5T5+vhU26zOHbYDd0=;
 b=EIGGD+MATkwfpH2bo3dkLoiy24uOig1sj9lzv+C9/cuEZhKT6zIwm4ZIo0IPZwJwlW
 MyqieGVWMOKI+wHAE3aRr5060oUgp/yGS2gfFfEWkvEU6a/IS6B6JtYkE9YsWyNUOu7A
 k6uCQ9MeBMyAWo/yN6PRAZX7PzwISW3xTOMGZORX4ZrWceGpN5pPLmChoI6P865kA2zg
 ijnVyxacN9yXvxUC7I9kGNBtVY0XO4Iy2Cca6CpVm5D+LEFD1pAbWlr7cBLPP/CV930J
 ojAKHs8QzesLFaAOCmBA2ufETQvX6qTD4sHHVJN/TcSdrecH8hQyXQCGtabAAGGt83CV
 ruDw==
X-Gm-Message-State: AOAM531Dr3xzAa6jTz59Vvl73HSY5Jqs/kLMEPJFKfflwfqA76hl3mqm
 Lbh7d8G+t+8ZtL0UGts9SHI=
X-Google-Smtp-Source: ABdhPJwy4zHJqMZh4Mp1oF8UFr9fwyBd/rGqy5PapalODJQm8mXA7vcwbke+4HN4Nm9JX+K3IFKP2Q==
X-Received: by 2002:a5d:6dae:: with SMTP id u14mr9648108wrs.148.1622914908684; 
 Sat, 05 Jun 2021 10:41:48 -0700 (PDT)
Received: from cluster5 ([80.76.206.81])
 by smtp.gmail.com with ESMTPSA id 89sm10987879wrq.14.2021.06.05.10.41.48
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Sat, 05 Jun 2021 10:41:48 -0700 (PDT)
From: Matthew Hagan <mnhagan88@gmail.com>
To: 
Date: Sat,  5 Jun 2021 18:35:38 +0100
Message-Id: <20210605173546.4102455-2-mnhagan88@gmail.com>
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
Subject: [Linux-stm32] [PATCH 2/3] ARM: dts: qcom: add ahb reset to
	ipq806x-gmac
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

Add GMAC_AHB_RESET to the resets property of each gmac node.

Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
---
 arch/arm/boot/dts/qcom-ipq8064.dtsi | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
index 98995ead4413..1dbceaf3454b 100644
--- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
@@ -643,8 +643,9 @@ gmac0: ethernet@37000000 {
 			clocks = <&gcc GMAC_CORE1_CLK>;
 			clock-names = "stmmaceth";
 
-			resets = <&gcc GMAC_CORE1_RESET>;
-			reset-names = "stmmaceth";
+			resets = <&gcc GMAC_CORE1_RESET>,
+				 <&gcc GMAC_AHB_RESET>;
+			reset-names = "stmmaceth", "ahb";
 
 			status = "disabled";
 		};
@@ -666,8 +667,9 @@ gmac1: ethernet@37200000 {
 			clocks = <&gcc GMAC_CORE2_CLK>;
 			clock-names = "stmmaceth";
 
-			resets = <&gcc GMAC_CORE2_RESET>;
-			reset-names = "stmmaceth";
+			resets = <&gcc GMAC_CORE2_RESET>,
+				 <&gcc GMAC_AHB_RESET>;
+			reset-names = "stmmaceth", "ahb";
 
 			status = "disabled";
 		};
@@ -689,8 +691,9 @@ gmac2: ethernet@37400000 {
 			clocks = <&gcc GMAC_CORE3_CLK>;
 			clock-names = "stmmaceth";
 
-			resets = <&gcc GMAC_CORE3_RESET>;
-			reset-names = "stmmaceth";
+			resets = <&gcc GMAC_CORE3_RESET>,
+				 <&gcc GMAC_AHB_RESET>;
+			reset-names = "stmmaceth", "ahb";
 
 			status = "disabled";
 		};
@@ -712,8 +715,9 @@ gmac3: ethernet@37600000 {
 			clocks = <&gcc GMAC_CORE4_CLK>;
 			clock-names = "stmmaceth";
 
-			resets = <&gcc GMAC_CORE4_RESET>;
-			reset-names = "stmmaceth";
+			resets = <&gcc GMAC_CORE4_RESET>,
+				 <&gcc GMAC_AHB_RESET>;
+			reset-names = "stmmaceth", "ahb";
 
 			status = "disabled";
 		};
-- 
2.26.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
