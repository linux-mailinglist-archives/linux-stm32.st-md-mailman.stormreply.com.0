Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 690C854ED28
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Jun 2022 00:16:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01F41C56630;
	Thu, 16 Jun 2022 22:16:28 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE6C0C03FC8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jun 2022 22:16:26 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id kq6so5269717ejb.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jun 2022 15:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DVRo4CvEL41HYQa+CoQccyZMSsu+VyU+c+CNeOdKaAY=;
 b=hSRY3xSKb+x0uxV1uqJd1PPuvsy44iHgFHSbyyMzsPCKdgXOM18U7eh3uCpbyPaHIh
 qPqfWbwppxrw7rLBlkVYMjaPg5kash4tvtUuY648vyCmsworvOcsJujcPDx2EZw2Aj74
 SnFpJUTah/V/Gpt7hveDUVbKj+GFPSE3Rs+y65r8lM0Egns0HjmNDd0C8M+y+EqO3aJf
 bdRyONKYLVolgL1xN18ijUKYAPBbtakwkirPXhmPOfsnJtb5gzaCFIc/y2ZLgfQc+3Od
 V52ztJYcwQLGTnxiQGbpMv1fTcpY+lfO6pmjf7JghoXMPBbzUiHdRorTHZ0l01U1sEAb
 VyMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DVRo4CvEL41HYQa+CoQccyZMSsu+VyU+c+CNeOdKaAY=;
 b=V/WOWFlfNAAzjgcJ26rR+2s+9gdp0MZfUq64rGDIYt0VEBd0oiEvRVri8wvpbGw0/b
 /Yqt/wCLsCNMV9++Nk5kiSrUCMtssYYygr3GwmOYYPPR+1hIOV80+O6VMmxr4fL9yN7Z
 hBhy8srwmcOBAxeZR0pNpYsTCKEMNRNW0thYsXkQeydxyG9lZijHNwN3gyD3G4Ms/mZX
 +a5Aauu4X7AiEqgBFio9rJV8XoBaEKVoQtd3nLm0jdsRGlfOt1mzRQhnQfMReedczOlt
 LLrEaQiFH4BmgD6zxwEEHgiMSG+ai0edCp4c9FFPLRjOQWmbu7Wljb9+YP49wLhSvhjY
 /oPQ==
X-Gm-Message-State: AJIora89mIleT0eLSS2eMik7+qw5TZgRsHoBcbhv12WwaMEh/PqLzcBL
 4W/a5En9ZpRq3Vaj0lqEq3U=
X-Google-Smtp-Source: AGRyM1tM9sbDP5+nf78h0PyaUU0M5ak6/lgXRf4DpIfVxQ1sVPb0Gujh4AdJFUO/wy9JsWqFQGORBg==
X-Received: by 2002:a17:906:5350:b0:711:f866:ed8 with SMTP id
 j16-20020a170906535000b00711f8660ed8mr6205922ejo.441.1655417786075; 
 Thu, 16 Jun 2022 15:16:26 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it.
 [93.42.70.190]) by smtp.googlemail.com with ESMTPSA id
 u9-20020a1709061da900b006fef557bb7asm1276340ejh.80.2022.06.16.15.16.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 15:16:25 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "Christian 'Ansuel' Marangi" <ansuelsmth@gmail.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 17 Jun 2022 00:15:54 +0200
Message-Id: <20220616221554.22040-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Cc: kernel test robot <lkp@intel.com>
Subject: [Linux-stm32] [net-next PATCH] net: ethernet: stmmac: remove select
	QCOM_SOCINFO and make it optional
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

QCOM_SOCINFO depends on QCOM_SMEM but is not selected, this cause some
problems with QCOM_SOCINFO getting selected with the dependency of
QCOM_SMEM not met.
To fix this remove the select in Kconfig and add additional info in the
DWMAC_IPQ806X config description.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: 9ec092d2feb6 ("net: ethernet: stmmac: add missing sgmii configure for ipq806x")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index c4bca16dae57..31ff35174034 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -83,7 +83,6 @@ config DWMAC_IPQ806X
 	default ARCH_QCOM
 	depends on OF && (ARCH_QCOM || COMPILE_TEST)
 	select MFD_SYSCON
-	select QCOM_SOCINFO
 	help
 	  Support for QCA IPQ806X DWMAC Ethernet.
 
@@ -92,6 +91,9 @@ config DWMAC_IPQ806X
 	  acceleration features available on this SoC. Network devices
 	  will behave like standard non-accelerated ethernet interfaces.
 
+	  Select the QCOM_SOCINFO config flag to enable specific dwmac
+	  fixup based on the ipq806x SoC revision.
+
 config DWMAC_LPC18XX
 	tristate "NXP LPC18xx/43xx DWMAC support"
 	default ARCH_LPC18XX
-- 
2.36.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
