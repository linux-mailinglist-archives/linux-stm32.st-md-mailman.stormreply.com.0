Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C3412BE52
	for <lists+linux-stm32@lfdr.de>; Sat, 28 Dec 2019 19:35:56 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E79EC36B0B;
	Sat, 28 Dec 2019 18:35:56 +0000 (UTC)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A72AC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Dec 2019 18:35:55 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id b137so16046980pga.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Dec 2019 10:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=P8HOUTr3eF/0dZg+if1YFcXmVFAjMiDjsMoChiGwrOo=;
 b=qBDWwT735xPG/Q9VTH7Jk7ltHqJGzS3SIxRJyL/UGKLhT7cIiteBnbPNein0+zuYE8
 G5i8IlFW2hE7Oa2TgAYWyq/BO/6LSnQx3UVC/uxt/9u4n8IPFi3wj3qTM60uObs3vPDd
 jQv4IxlP2VO+QrcbqwkFMJqyHITKONYz4jXKqOm+U11JeG/N35CiFkMurclNO0EXtPQE
 Bw21iyPcB3S8P0FC3LPvm13lLMp4aiRHWpIiGIOVR/X04PmcBJrbgvC7yrtjFe+I217L
 5zkbf8OI+YCmGViTfmzsoEIVblJ47JqV2dp9CGtOzypeTVpEdtYAEcY1CAwd2SUPF0yj
 gAmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=P8HOUTr3eF/0dZg+if1YFcXmVFAjMiDjsMoChiGwrOo=;
 b=cryxru+UNS4452EDkffLQAl6Vh+rBnO9qO5nmfKGZzM8ikpPIBJarYfSBOdEqNtdPg
 hb0spYAiFFbpfBT4fnE0s7tvcDXDpa5u4rmIs0XPS0E9u8DOtaJJtUWHmR2CmiIKLnn1
 Eb1wSsfsxP/uB71O+CpYRBh0DFBzpjNZEaK/INTh2rk9oTCnG/jl5PG6+K5a1XbHR53q
 iA0OkCKh09YRcX6pZZ1vMWFush0s2C+iMVKqbqqZ1DDcF/xfKTmmpdq6F7Rc6t/66sfh
 U0jGqRVrfBwOU/2LPueNi+fPd+Z56jn1e2eLPJ+AKTnl/4DU0BnCxMKcE+zzObifN91+
 6dZQ==
X-Gm-Message-State: APjAAAXRzy0A2V9OYS2zfrHJRLjfZhv52YYJbAocEVcCZKzXHY/RyqhB
 u5p0WYFwNdbS/2JVMa/HX/I=
X-Google-Smtp-Source: APXvYqxea8vWEh1FOmzdiLRfJsv6AzNkX2LzmseSeWMmZhHvq8Jq9qBoRVY01nxVBzYg5sRmju+cRw==
X-Received: by 2002:a63:c40c:: with SMTP id h12mr43297443pgd.77.1577558153578; 
 Sat, 28 Dec 2019 10:35:53 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id n1sm45063313pfd.47.2019.12.28.10.35.53
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 28 Dec 2019 10:35:53 -0800 (PST)
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
Date: Sat, 28 Dec 2019 18:35:34 +0000
Message-Id: <20191228183538.26189-9-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191228183538.26189-1-tiny.windzz@gmail.com>
References: <20191228183538.26189-1-tiny.windzz@gmail.com>
Cc: Yangtao Li <tiny.windzz@gmail.com>
Subject: [Linux-stm32] [PATCH 09/13] mailbox: sti: do some cleanup
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
'irq' and 'ret' are variables of the same type and there is no
need to use two lines.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/mailbox/mailbox-sti.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mailbox/mailbox-sti.c b/drivers/mailbox/mailbox-sti.c
index 2baf69a0b81c..2a2316dfdca0 100644
--- a/drivers/mailbox/mailbox-sti.c
+++ b/drivers/mailbox/mailbox-sti.c
@@ -408,9 +408,7 @@ static int sti_mbox_probe(struct platform_device *pdev)
 	struct sti_mbox_device *mdev;
 	struct device_node *np = pdev->dev.of_node;
 	struct mbox_chan *chans;
-	struct resource *res;
-	int irq;
-	int ret;
+	int irq, ret;
 
 	match = of_match_device(sti_mailbox_match, &pdev->dev);
 	if (!match) {
@@ -425,8 +423,7 @@ static int sti_mbox_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, mdev);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	mdev->base = devm_ioremap_resource(&pdev->dev, res);
+	mdev->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mdev->base))
 		return PTR_ERR(mdev->base);
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
