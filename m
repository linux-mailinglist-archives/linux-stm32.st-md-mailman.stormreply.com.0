Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7359BB450D1
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Sep 2025 10:04:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F6D6C36B3C;
	Fri,  5 Sep 2025 08:04:26 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A554C36B0E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Sep 2025 08:04:25 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-45b627ea685so14812515e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 05 Sep 2025 01:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757059465; x=1757664265;
 darn=st-md-mailman.stormreply.com; 
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mEyqxPQTlvHE7Rb9nf0Ka5S6ku97HAqdoQLaDQei9o8=;
 b=u1e+5Px5qm88QRpQL2eUofpDHT+Y5SZwMKhSkz6rfJ0o1yy7fZICt5UDsldTpIuwVE
 4sjuSyYAIeipTzvWfAJ+CIYGXJiSvS1EVXi5HYwpFlvvpmBBwzIFom0SLnPeaFP8h5Cc
 ZsKVaOEqhRkHPh3OGBPROGUWZ62RScUrJ1X3Q7nFI+KtG4TSP9vMvF517t5My5X0v6jG
 wM6eckeL4xHfsCbxlZ+oeNc5CjHWMhxCcoZ5F6byXz5GDbmLsj7jJEZoIWg3JphnPmMj
 wJbwoX+E292kLMw0bw03ZdDKXh1r176FKacrOQ00eyQMeTLIwvyf6NxuwdK/yd2RxQ1m
 bt1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757059465; x=1757664265;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mEyqxPQTlvHE7Rb9nf0Ka5S6ku97HAqdoQLaDQei9o8=;
 b=B8sbuwzfV9S0fxBQvYtTaCZKT6dZIBIz/o2vc9KySW9TSXghuBYbZxZrHKQX/M6NrC
 f8D+dnugBICUrAr2uWGcw+f0hnXpDnvPyaqUA6ggp6iRR6dMYv8is/vlvZm5R8D0WH6a
 Uu/sFuuD3p9vV4h7SqCOdqDd2Z4jr3OhHP0gcPcj+/zBNmI3msg+n+/ug79q2Zw/QUc6
 m5N2COFGxVA3kuYd+jzawRUetZ+QpMjFZecxrF5sMALtb1v67p1UEKXftAu3c4D7+68b
 9Edh3T8BhC90kuYBhm88u3geSbXADU9BRJ4btS9AE+mRTvqM8KwPN0dHXFGvMjeGIPyY
 dIvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzHAkcijvjKcFag4jEYTgQ5FysgKmb4CIYDzl/6iTi4srdcSClsaPSuU7XOBqLcecqHF3HzR7VtvfXyQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzSBa6832+aAcM5ANHpi4T5sXrRzw+ck9qiNaeBLBuhHZKEEIgo
 gyK9XkivMMhcCNZ/flQyDMdhyZTlm/RiBIjR6T3H06CvT/wnxd4RFCqhqIUZCPWBxGo=
X-Gm-Gg: ASbGncvP8zLtN7WaQ2LOSVt6AiJFY7BuFm7NRAYDRzTZk+yokEqqILbXR9367a4Y3pF
 fa5hISxU8qWjWEUlIOWcXApMxb7CZt96CnFg+Gh0mi4M7aPxodiyEiLSA5EBhtBrQH/soiL+01V
 yrfa7e726bMirbvtzax7rPs5UWt9aQpNuFmEwI45DnF2ko/BDiQUWyVcPZK2YDY6ongA6+a21eU
 PwdqM9rooXJvTpVflHGDdidBfEIRB+8KMuxb+3kVOQx4TUz3M+VFJgYJbL2lvol8i4+nbKbt7gL
 wEod9UlpJBuFsBywSkcQx8nsJ21eaZTVpn59nwdu/Pn+dxGJRW7TiDLAQo8curTk4gu/v8rZFdi
 jWMHx8tMHMQf5kO211AQw5BwtEiERMVhDT0Ny/POAYMoV4PPJ
X-Google-Smtp-Source: AGHT+IFg31bO3+yEGrU5RDt0pIsHa2/S7Tm9NAlDysnLBMH3Sorox3ujEfiAyqMx4B2CxZfrtHTl2w==
X-Received: by 2002:a05:600c:35c5:b0:45d:cf5f:cff8 with SMTP id
 5b1f17b1804b1-45dcf67429bmr53251585e9.11.1757059464523; 
 Fri, 05 Sep 2025 01:04:24 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3cf276d204asm30777648f8f.24.2025.09.05.01.04.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Sep 2025 01:04:24 -0700 (PDT)
Date: Fri, 5 Sep 2025 11:04:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Message-ID: <aLqZhL-DV4LOnHlD@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Cc: Rob Herring <robh@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Subject: [Linux-stm32] [PATCH] PCI: stm32: clean up some error handling in
	probe()
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

Smatch complains that the other error paths use gotos to clean up and
these two don't.  Generally, the implication with that warning is that
the error handly has been ommitted.  In this case, the error handling is
fine, but we can avoid a bit of code duplication by using gotos to clean
up.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pci/controller/dwc/pcie-stm32.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-stm32.c b/drivers/pci/controller/dwc/pcie-stm32.c
index 964fa6f674c8..96a5fb893af4 100644
--- a/drivers/pci/controller/dwc/pcie-stm32.c
+++ b/drivers/pci/controller/dwc/pcie-stm32.c
@@ -287,18 +287,16 @@ static int stm32_pcie_probe(struct platform_device *pdev)
 
 	ret = pm_runtime_set_active(dev);
 	if (ret < 0) {
-		clk_disable_unprepare(stm32_pcie->clk);
-		stm32_remove_pcie_port(stm32_pcie);
-		return dev_err_probe(dev, ret, "Failed to activate runtime PM\n");
+		dev_err_probe(dev, ret, "Failed to activate runtime PM\n");
+		goto err_disable_clk;
 	}
 
 	pm_runtime_no_callbacks(dev);
 
 	ret = devm_pm_runtime_enable(dev);
 	if (ret < 0) {
-		clk_disable_unprepare(stm32_pcie->clk);
-		stm32_remove_pcie_port(stm32_pcie);
-		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
+		dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
+		goto err_disable_clk;
 	}
 
 	ret = dw_pcie_host_init(&stm32_pcie->pci.pp);
-- 
2.47.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
