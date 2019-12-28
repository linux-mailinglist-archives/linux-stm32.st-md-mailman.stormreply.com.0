Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 882E212BE4D
	for <lists+linux-stm32@lfdr.de>; Sat, 28 Dec 2019 19:35:54 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51DB5C36B0D;
	Sat, 28 Dec 2019 18:35:54 +0000 (UTC)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33845C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Dec 2019 18:35:53 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id p27so13028274pli.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Dec 2019 10:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=EpYT0fAEZoJoOZIDpiQY1oBPoWcKuknBnZk8A3TEsPc=;
 b=vKiwJbQktB/yDQ3otya9rtDE8p6fqKEysJmAKuEUbVtc7Hp/GlMTlnbHpdHzz+23LA
 K3I/kFAxXFft8S+LDEmic49DQCSn6DnsZQYob/yY+GL3Bi4ZeuqFc0DQb+w1ckRgZ3zb
 pgsvvlp+r2z8BkO4qGkrViUoLKOVflsuwF8egIx0MaPHzoF19frOrVJReh7w373MN34N
 dYuV7tmJaDrie72lcADl96GobSb1c5DNNkIDdw/hCM821qi8JusXrbrd6KseHkIVHIje
 o+PxDKh9YIumZWtaz1bSNUHPoSdfT4o6PQ5zsCEF/oM+PxjaxYThcvTuD1Mgf1lg4MR8
 LG6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=EpYT0fAEZoJoOZIDpiQY1oBPoWcKuknBnZk8A3TEsPc=;
 b=Jglwsw9hyiie0yiek8UXENmHQhk8QGbn+dvoKjIjtq6KzB1gin7PbLwonnLGFHu4OR
 WMizND+YxjUh9w0z9CblX1oHg6yvdrOFuqHzLCJbFypgyMxA27VfpepUMDd9OB/S4i2A
 CeJdOeGIAmx+JXhopWkNgAO5fVyxZ9XL0xRF6ncK54dFKbX9KpwKhxgFaEoeTqN8eVBF
 0ONyQS6fwXd1YoxwbySgTRn2pzLSvM8uW/cWmkyuZgxLmLTJSGwZHnMiuvH+YnVuSFvg
 o0Ylmjt9qs3yaBBLlXKHEyg21S8B14fOZzRwM3D25ykLGoqRV5ciFZWmlPQiv0Gyl3f4
 jt1w==
X-Gm-Message-State: APjAAAVwxMLaZvmYP8qh26YXO05JwlwlKeS97e7onZaXCsmSagX5NsFH
 td9vhNwS115gDN5EBu2vQZw=
X-Google-Smtp-Source: APXvYqxaL1bhfI+SzfCWF5xfdSHs4X/qPlTpf9l3TG5tgOk3eb7YlJe0jzmEPnG066uA83lfsS3rzQ==
X-Received: by 2002:a17:902:bd46:: with SMTP id
 b6mr58947367plx.239.1577558151829; 
 Sat, 28 Dec 2019 10:35:51 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id w5sm40623989pgb.78.2019.12.28.10.35.51
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 28 Dec 2019 10:35:51 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: jassisinghbrar@gmail.com, nsaenzjulienne@suse.de, f.fainelli@gmail.com,
 rjui@broadcom.com, sbranden@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, lftan@altera.com,
 matthias.bgg@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 thierry.reding@gmail.com, jonathanh@nvidia.com,
 linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, nios2-dev@lists.rocketboards.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org
Date: Sat, 28 Dec 2019 18:35:33 +0000
Message-Id: <20191228183538.26189-8-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191228183538.26189-1-tiny.windzz@gmail.com>
References: <20191228183538.26189-1-tiny.windzz@gmail.com>
Cc: Yangtao Li <tiny.windzz@gmail.com>
Subject: [Linux-stm32] [PATCH 08/13] mailbox: stm32-ipcc: convert to
	devm_platform_ioremap_resource
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

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/mailbox/stm32-ipcc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mailbox/stm32-ipcc.c b/drivers/mailbox/stm32-ipcc.c
index ef966887aa15..0a7e9ce0fb31 100644
--- a/drivers/mailbox/stm32-ipcc.c
+++ b/drivers/mailbox/stm32-ipcc.c
@@ -205,7 +205,6 @@ static int stm32_ipcc_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	struct stm32_ipcc *ipcc;
-	struct resource *res;
 	unsigned int i;
 	int ret;
 	u32 ip_ver;
@@ -235,8 +234,7 @@ static int stm32_ipcc_probe(struct platform_device *pdev)
 	}
 
 	/* regs */
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	ipcc->reg_base = devm_ioremap_resource(dev, res);
+	ipcc->reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(ipcc->reg_base))
 		return PTR_ERR(ipcc->reg_base);
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
