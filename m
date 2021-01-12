Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 922362F330A
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Jan 2021 15:37:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4CFE5C424C0;
	Tue, 12 Jan 2021 14:37:51 +0000 (UTC)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62AA5C32EA7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Jan 2021 08:53:19 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id c132so1007457pga.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Jan 2021 00:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=iCD56C5pg1d1NTNumNDFp4t2vfpUV33Zv3uz34vtHcM=;
 b=cgvc90vIzF3OIyMlOfnqqxO/AsGLIEc5lSv8L3t2RrsXjaJSpeCOzyADwRMLDX80mh
 XpILvChB1UGanSwSh6JXbZ8EScoCziyl+K42gASbMI+uL3K0M5xenZza2PmsE8rxiewr
 RmrdDkT78NsO6+6ElPSNuO05ompOuvhNXk0PiqqbSUs27UsWrZIvvWL1WFTD5Es//tkj
 /REpahA1UzM1SenWXb0wydnkdyTr1V3jNmT/sK4JbxNp5RolCN6t4fWA8PWmch0bwevM
 5Pm0JULrnTj4LU7tpifvD5+Yq4FbhTHKF9P8iL02bH7IJIP8r55DIomBY10uwBILvvXi
 YBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=iCD56C5pg1d1NTNumNDFp4t2vfpUV33Zv3uz34vtHcM=;
 b=Tpc7wfQUiJP7WQuZy8LhvDi7xTa3fKALaUc957VEITeAspBY2geiR/0zwML/oXcwmt
 WO4fEVvDwwbqn3saAcLOxWpAla2Q3+UtOTzTGDl/HgGK9qo1SetlY3q8qEZ5gRpbSXs2
 sYD/V8Zz7wrnG7FA/fsPaifRwPQdj9fRRR8kO1+HYo7sKYCCgHogF1Q0hS6u1iD5JcIK
 LtrGYpIU4p9X3+fH/kHnZG2qsVQoBaLBW5mgD1hg/ElLQDpzM1IIXzJeWxiJb8uxEz4u
 3e+PmgHA80dIDJ+ev3aX4QiZErKZnDRY568ZtpPwZa+mKf7YtNQ/WpaqVkZIxd2CPezE
 ns2A==
X-Gm-Message-State: AOAM532iO2Q52lEldH4Uphdyu5ztR9OLolzLH6pnki8qs7ZpP/nkNVLd
 0htj1QP3T5bCRGGZC3vWuZg=
X-Google-Smtp-Source: ABdhPJwWcJw4BGKctgBn3fXpdsTZXyGdlSBNAKK3KdVpgrKCr7T/XRv51DVD9EnvtC9WsP84zj53Ww==
X-Received: by 2002:a63:d246:: with SMTP id t6mr3727099pgi.283.1610441598288; 
 Tue, 12 Jan 2021 00:53:18 -0800 (PST)
Received: from localhost.localdomain ([178.236.46.205])
 by smtp.gmail.com with ESMTPSA id 198sm2392803pfw.29.2021.01.12.00.53.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 00:53:17 -0800 (PST)
From: menglong8.dong@gmail.com
X-Google-Original-From: dong.menglong@zte.com.cn
To: pierre-yves.mordret@st.com
Date: Tue, 12 Jan 2021 00:53:11 -0800
Message-Id: <20210112085311.7308-1-dong.menglong@zte.com.cn>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Tue, 12 Jan 2021 14:37:49 +0000
Cc: Menglong Dong <dong.menglong@zte.com.cn>, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] i2c: remove redundant error print in
	stm32f7_i2c_probe
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

From: Menglong Dong <dong.menglong@zte.com.cn>

Coccinelle reports a redundant error print in stm32f7_i2c_probe.
As 'platform_get_irq' already prints the error message, error
print here is redundant and can be removed.

Signed-off-by: Menglong Dong <dong.menglong@zte.com.cn>
---
 drivers/i2c/busses/i2c-stm32f7.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 9aa8e65b511e..adba496e1e31 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -2026,12 +2026,8 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 	}
 
 	irq_error = platform_get_irq(pdev, 1);
-	if (irq_error <= 0) {
-		if (irq_error != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Failed to get IRQ error: %d\n",
-				irq_error);
+	if (irq_error <= 0)
 		return irq_error ? : -ENOENT;
-	}
 
 	i2c_dev->wakeup_src = of_property_read_bool(pdev->dev.of_node,
 						    "wakeup-source");
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
