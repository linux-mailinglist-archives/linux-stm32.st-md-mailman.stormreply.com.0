Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3F85EC1FF
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Sep 2022 14:00:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D70EC63326;
	Tue, 27 Sep 2022 12:00:36 +0000 (UTC)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6314C03FC4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Sep 2022 11:51:43 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id jm5so8818170plb.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Sep 2022 04:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=U3lfCgccZacgh+TSQp+9xE8hshjr/70Enldq2FxBY+w=;
 b=Q7AJCtV730cNB/lIe5AnV8hTEOSgJhMMEcD+T1teyqBhN6omTkVLiZS6+pjD9OxRMV
 ONdWXf6sQMLHAqT0BSYCb8Iigr+IsrTlCJUMe+mEU124ZqG72/HzSd+T+mfILlCDrJUF
 12PycQ/5M1ohE9z7S2Nwb0GPCPtkrU1ZdhKW9WrjQYhwVO9WddzbyFLX3FZQ0isDO0DW
 JmKWGM6xsUr7qDwJ9tiPHYx4LOX3qlNNIcD7kNvq4Jyd6a82/jXe7NRHw/UKTdPKyK1U
 vVXVywFdjqYzRbpBODF36q/f1SwgGC32nFvDIxhH0etw5bI6sj6nvYGYIesEk/+ehFyo
 pDJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=U3lfCgccZacgh+TSQp+9xE8hshjr/70Enldq2FxBY+w=;
 b=lXBXGFxZLGfEvviFODKRBgvJe/oonzHim07LU1o+OWQHcO3bOfkoT/GrmgSHEkqIwG
 WuEpMH/qSHn/A33wMXjBdAMBqGOfBxK04v1in4J/8j5FrSWqEZ/ENKnGTnbW/WkuA4iG
 nbed7kzKUkvjeM1LVWqUaJPXKcVshpIlcbLGzPvjSvImQBXRfKOan9ZuY/Yg0GrTgERP
 HBtZ+8oECzov4aenOGBPcdFHC9sEldU5eMqlu5TlmVmOb+b4CUD8ayrRyvF6v3GggnS2
 BpZV0dYpigdE/VMBmJyffkkxVdes3IXjuyEdFzVlJKrRBkxtjM1mu0mSsOHPJYgDJDbb
 TlnA==
X-Gm-Message-State: ACrzQf3Iu8pG2VJcdA//CpMP72r9Gzwc8JnaCS0RwuJfV4ezNnlRbLw3
 nqwP0ZTwD6SmEqfv1CTxgns=
X-Google-Smtp-Source: AMsMyM5GDaN4YQyjR2a5Pfl9SmuWMx4BnJch/7YRntadhPPMcchhZkKvZl6ewsgyBCxKmQUuhQiWQw==
X-Received: by 2002:a17:902:864a:b0:179:f56e:ee7b with SMTP id
 y10-20020a170902864a00b00179f56eee7bmr1094045plt.45.1664279502395; 
 Tue, 27 Sep 2022 04:51:42 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 fu1-20020a17090ad18100b001fd6066284dsm1247893pjb.6.2022.09.27.04.51.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 04:51:42 -0700 (PDT)
From: zhangsongyi.cgel@gmail.com
X-Google-Original-From: zhang.songyi@zte.com.cn
To: mathieu.poirier@linaro.org
Date: Tue, 27 Sep 2022 11:51:36 +0000
Message-Id: <20220927115136.259926-1-zhang.songyi@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 27 Sep 2022 12:00:36 +0000
Cc: suzuki.poulose@arm.com, alexander.shishkin@linux.intel.com,
 coresight@lists.linaro.org, Zeal Robot <zealci@zte.com.cn>,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com, leo.yan@linaro.org,
 zhang songyi <zhang.songyi@zte.com.cn>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 mike.leach@linaro.org
Subject: [Linux-stm32] [PATCH linux-next] coresight: use sysfs_emit() to
	instead of scnprintf()
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

From: zhang songyi <zhang.songyi@zte.com.cn>

Follow the advice of the Documentation/filesystems/sysfs.rst and show()
should only use sysfs_emit() or sysfs_emit_at() when formatting the value
to be returned to user space.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: zhang songyi <zhang.songyi@zte.com.cn>
---
 drivers/hwtracing/coresight/coresight-stm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index 463f449cfb79..3a1b07217932 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -466,7 +466,7 @@ static ssize_t hwevent_enable_show(struct device *dev,
 	struct stm_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	unsigned long val = drvdata->stmheer;
 
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t hwevent_enable_store(struct device *dev,
@@ -495,7 +495,7 @@ static ssize_t hwevent_select_show(struct device *dev,
 	struct stm_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	unsigned long val = drvdata->stmhebsr;
 
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t hwevent_select_store(struct device *dev,
@@ -530,7 +530,7 @@ static ssize_t port_select_show(struct device *dev,
 		spin_unlock(&drvdata->spinlock);
 	}
 
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t port_select_store(struct device *dev,
@@ -577,7 +577,7 @@ static ssize_t port_enable_show(struct device *dev,
 		spin_unlock(&drvdata->spinlock);
 	}
 
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t port_enable_store(struct device *dev,
-- 
2.25.1


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
