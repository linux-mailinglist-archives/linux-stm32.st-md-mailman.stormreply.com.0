Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E60C12BE44
	for <lists+linux-stm32@lfdr.de>; Sat, 28 Dec 2019 19:35:48 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC28CC36B0B;
	Sat, 28 Dec 2019 18:35:47 +0000 (UTC)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24A0BC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Dec 2019 18:35:44 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id f20so13037850plj.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Dec 2019 10:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=fo5K0TPliEV99faGCrDAtoXjqd/u/f/pgI4tXILZggE=;
 b=bwDm/LYmefFJ+yrVjqwVqleBC+dVr4zFymT/XmDlSRZmDs39PHAJyYv6Rv/syLbg3+
 k70t6WZ4z+KBbkrD/38bHo0vozwx9mUI3ZZIU1WjRz++gkUPTiBVpANkWy8hRJUtQooc
 5AsLJzpS+cDTcgox6s63deyucKFJQl20XFFo2aWRMMKTn3Ey4qiZ73EQ8X4HF+u/Szoq
 AxTNjN4C0e7WRtsEJTwEXB59yZ3b/EFo+PVSwD2JJNujM3Jo65fFFlkCFCkkCWxz+MKe
 vTUL7DOlgV/vSe9n4Z8/QrDaA/8AGjRG/35ydwEpQOWUjA6MPMm6rLT40g4dCeGdRt78
 l5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=fo5K0TPliEV99faGCrDAtoXjqd/u/f/pgI4tXILZggE=;
 b=M1s+uVwN+BSBTGJeApfJrj6uz7EAyIfKbOFuIKMRVjjQZbbDUab1DJiNy5+J+Dvt2V
 1AZsqD5UcgQlCBJxKbgEkNAwGG8WVh1L5XMYf1FqcpAvqMce9LbTe16N4vnXlHGIsXUr
 e95wOJ759PuYSqaRJvkqDsm41r+3cThk5/3t5HSF2dGxOjYtoZ/iCmAGbvg70nPLkCb0
 FBblHqP5IsBAO8Averz3aHxAWGqcXGhNPf+nLgqsRj0fTBqfq5Cy32nr+ekFcZ0+V204
 XjG7hzcLFVyfoi36PQCDsL8ZBiPd+jPcDb6J9E2h6KSbLkMOmvzdeiGGph6WxFQ24VaR
 3uTQ==
X-Gm-Message-State: APjAAAUkT7eXmfXDUt0riFgus8xxN6zxIw+koBY02Z8mqd/1kYYFW51X
 Zzu7bi0oQgJKUGiG0CnzKdw=
X-Google-Smtp-Source: APXvYqwUmRdS/j5Ko1syf2WgkT7LxHN76wS8zqcKdPBh656bSiwfHZJ5FFjisEcSZu9ospl02un4HA==
X-Received: by 2002:a17:90a:a881:: with SMTP id
 h1mr34064320pjq.50.1577558142809; 
 Sat, 28 Dec 2019 10:35:42 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id u18sm42980854pgn.9.2019.12.28.10.35.42
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 28 Dec 2019 10:35:42 -0800 (PST)
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
Date: Sat, 28 Dec 2019 18:35:28 +0000
Message-Id: <20191228183538.26189-3-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191228183538.26189-1-tiny.windzz@gmail.com>
References: <20191228183538.26189-1-tiny.windzz@gmail.com>
Cc: Yangtao Li <tiny.windzz@gmail.com>
Subject: [Linux-stm32] [PATCH 03/13] mailbox: qcom-apcs: convert to
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
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index eeebafd546e5..0faf69137780 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -49,7 +49,6 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
 {
 	struct qcom_apcs_ipc *apcs;
 	struct regmap *regmap;
-	struct resource *res;
 	unsigned long offset;
 	void __iomem *base;
 	unsigned long i;
@@ -64,8 +63,7 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
 	if (!apcs)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(&pdev->dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
