Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27610B1486E
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Jul 2025 08:48:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1CBDC35E3C;
	Tue, 29 Jul 2025 06:48:54 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 040D7C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Jul 2025 17:17:51 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-7d21cecc11fso18381885a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 09 Jul 2025 10:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752081471; x=1752686271;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aHdX3CSfue/m3/kt/dPbNz+FIQl6EVMspXvXyxqMLdA=;
 b=gbTI74lRFeGDXAcf3s162F6k1ixi0N8LirHuRirbLSa+UZ9TPdeFybUVOiNVVlDhJX
 n1pUVJXbyMqJH6Go4q6LsI/gs1b9VQpRiwonEwxaUyKZ7TEftGMlTeVy+kAiBMWepGu8
 EjurpZgox61obnRZAG8mPs1r0UkkYOPiTOXtKh8bZkbfY9z4jN5pNRf+/fWMD9arzCA0
 ZHRPwy422pbpkRE0noiyIyc9A34JO4vRQY2mSZg+1LRCGKQxpUhiLneigGOv2z7WkdRz
 qcOqpXzeph+e2Q35sh04kl/fq1gOtbbNsRrLc6ILgMMsESu3dNYzJsTJrPufoVjK9NKz
 IKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752081471; x=1752686271;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aHdX3CSfue/m3/kt/dPbNz+FIQl6EVMspXvXyxqMLdA=;
 b=nah/wXY/kmZCW2nFGjnQfsVLrbOVHGkSpBlsmhHcbsn4B5VBKiIgYuW0JcqcowPo8B
 /2eKnn6mfEHDMuqq++s9ieP6oAvF+XM7PxGizHJagTgaOx+M/QlydwCvxeE4ETGyLwDa
 uThqlfeg1ssyfhD5GVu18rayGa/rLgINMdkTPKa77pKkqepYeecm+UKpjM7E9VBCXDLX
 d8o36Gc/5hpVD7hHxf+PeR6HDzLgG1ahgYHQ9TIV8FhBJGnAWnJs8fBy4vPc8+L3rc43
 M0LsyEYxYmR+SfidtoHtNLISe+HFZl+eDWtMZH+mdV2Ux2o4hxY7fM1stPZ9OrxRNy1A
 dBmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHVhx3wH6FFN3xIXxULOnFEp7+aAesZ/O6WW1TOGVUA1MD7pCyyjmMT4snuuYVgc01nAiN4RILJzE9ng==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxPYY3IpjSrLwnjltEHIqeTKGT2U/BkUUeyKkFzHRj75ORB1O0M
 DjMJBqGVn9gY4WldTDvX0FtYIDBI4PUP7NmjOKWkOwKLrpxcdUxYDEXG
X-Gm-Gg: ASbGnctRk9vgMp8PeQqQtHWx/OdsPSMnnKlAsM506o6nZao4kCQBlK5CqU5ayguMcgz
 GaY8ue6a9hF7/YeOEfurfuEHDZtHbKacXs6kS5VW3ExkStLT2uwyHUHAhkjDbaysd0uFXteXKwd
 ETFyHyozvPM2GHsSW6SwQkmui1wDywK2KvCJIMN8z2DCmklFZUMWDR4Znlc5m8qrjJO/ZjEOnjG
 AgLiTLVXVLtdmk62mozQCtj5K09Le0W5u7ZeF4H32fuuE+ATyPRFnrhRSQWd874oGLXc/SctNuu
 MIhFFnTdxEIj8gUF7Y3lO9PbTzmjcG77BrVcRidvzl76nZIRzMUZ3kpwJPJjVmovWsqYNAS7kuv
 l1EbF6Bxu7GD0+niRmviYcwBD6A==
X-Google-Smtp-Source: AGHT+IFyo9Srr/PXWJqOwCu+w7JjiunHszi5Ked3rjKmNIKWjnrm7o66h8G3fWaB8PXaJR9/0zFBhQ==
X-Received: by 2002:a05:620a:318f:b0:7d4:5361:bb7e with SMTP id
 af79cd13be357-7dc999b2d07mr45969085a.8.1752081470416; 
 Wed, 09 Jul 2025 10:17:50 -0700 (PDT)
Received: from fyre-x-redhat96-nsd-1.fyre.ibm.com ([129.41.87.0])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7d5dbdb0aebsm971824085a.33.2025.07.09.10.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jul 2025 10:17:49 -0700 (PDT)
From: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
To: suzuki.poulose@arm.com, alexander.shishkin@linux.intel.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Date: Wed,  9 Jul 2025 10:17:30 -0700
Message-ID: <20250709171730.14786-1-chelsyratnawat2001@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 29 Jul 2025 06:48:52 +0000
Cc: james.clark@linaro.org, linux-kernel@vger.kernel.org,
 Chelsy Ratnawat <chelsyratnawat2001@gmail.com>, coresight@lists.linaro.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 mike.leach@linaro.org
Subject: [Linux-stm32] [PATCH v3] coresight: Replace scnprintf() with
	sysfs_emit() in sysfs show functions
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

Documentation/filesystems/sysfs.rst mentions that show() should only
use sysfs_emit() or sysfs_emit_at() when formating the value to be
returned to user space. So replace scnprintf() with sysfs_emit().

Signed-off-by: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
Reviewed-by: James Clark <james.clark@linaro.org>
---
Changes in v3:
 - fixed warnings from checkpatch.pl

 .../hwtracing/coresight/coresight-etm-perf.c  |   4 +-
 .../coresight/coresight-etm3x-sysfs.c         |   2 +-
 .../coresight/coresight-etm4x-sysfs.c         | 118 +++++++++---------
 drivers/hwtracing/coresight/coresight-stm.c   |   8 +-
 drivers/hwtracing/coresight/coresight-sysfs.c |   4 +-
 5 files changed, 68 insertions(+), 68 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index f1551c08ecb2..8cfdcbc2f8f6 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -851,7 +851,7 @@ static ssize_t etm_perf_sink_name_show(struct device *dev,
 	struct dev_ext_attribute *ea;
 
 	ea = container_of(dattr, struct dev_ext_attribute, attr);
-	return scnprintf(buf, PAGE_SIZE, "0x%lx\n", (unsigned long)(ea->var));
+	return sysfs_emit(buf, "0x%lx\n", (unsigned long)(ea->var));
 }
 
 static struct dev_ext_attribute *
@@ -943,7 +943,7 @@ static ssize_t etm_perf_cscfg_event_show(struct device *dev,
 	struct dev_ext_attribute *ea;
 
 	ea = container_of(dattr, struct dev_ext_attribute, attr);
-	return scnprintf(buf, PAGE_SIZE, "configid=0x%lx\n", (unsigned long)(ea->var));
+	return sysfs_emit(buf, "configid=0x%lx\n", (unsigned long)(ea->var));
 }
 
 int etm_perf_add_symlink_cscfg(struct device *dev, struct cscfg_config_desc *config_desc)
diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
index 762109307b86..4868eb05a312 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
@@ -1182,7 +1182,7 @@ static ssize_t cpu_show(struct device *dev,
 	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
 
 	val = drvdata->cpu;
-	return scnprintf(buf, PAGE_SIZE, "%d\n", val);
+	return sysfs_emit(buf, "%d\n", val);
 
 }
 static DEVICE_ATTR_RO(cpu);
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
index ab251865b893..4ddc0d344b61 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
@@ -63,7 +63,7 @@ static ssize_t nr_pe_cmp_show(struct device *dev,
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
 
 	val = drvdata->nr_pe_cmp;
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 static DEVICE_ATTR_RO(nr_pe_cmp);
 
@@ -75,7 +75,7 @@ static ssize_t nr_addr_cmp_show(struct device *dev,
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
 
 	val = drvdata->nr_addr_cmp;
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 static DEVICE_ATTR_RO(nr_addr_cmp);
 
@@ -87,7 +87,7 @@ static ssize_t nr_cntr_show(struct device *dev,
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
 
 	val = drvdata->nr_cntr;
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 static DEVICE_ATTR_RO(nr_cntr);
 
@@ -99,7 +99,7 @@ static ssize_t nr_ext_inp_show(struct device *dev,
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
 
 	val = drvdata->nr_ext_inp;
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 static DEVICE_ATTR_RO(nr_ext_inp);
 
@@ -111,7 +111,7 @@ static ssize_t numcidc_show(struct device *dev,
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
 
 	val = drvdata->numcidc;
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 static DEVICE_ATTR_RO(numcidc);
 
@@ -123,7 +123,7 @@ static ssize_t numvmidc_show(struct device *dev,
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
 
 	val = drvdata->numvmidc;
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 static DEVICE_ATTR_RO(numvmidc);
 
@@ -135,7 +135,7 @@ static ssize_t nrseqstate_show(struct device *dev,
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
 
 	val = drvdata->nrseqstate;
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 static DEVICE_ATTR_RO(nrseqstate);
 
@@ -147,7 +147,7 @@ static ssize_t nr_resource_show(struct device *dev,
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
 
 	val = drvdata->nr_resource;
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 static DEVICE_ATTR_RO(nr_resource);
 
@@ -159,7 +159,7 @@ static ssize_t nr_ss_cmp_show(struct device *dev,
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
 
 	val = drvdata->nr_ss_cmp;
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 static DEVICE_ATTR_RO(nr_ss_cmp);
 
@@ -287,7 +287,7 @@ static ssize_t mode_show(struct device *dev,
 	struct etmv4_config *config = &drvdata->config;
 
 	val = config->mode;
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t mode_store(struct device *dev,
@@ -453,7 +453,7 @@ static ssize_t pe_show(struct device *dev,
 	struct etmv4_config *config = &drvdata->config;
 
 	val = config->pe_sel;
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t pe_store(struct device *dev,
@@ -488,7 +488,7 @@ static ssize_t event_show(struct device *dev,
 	struct etmv4_config *config = &drvdata->config;
 
 	val = config->eventctrl0;
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t event_store(struct device *dev,
@@ -537,7 +537,7 @@ static ssize_t event_instren_show(struct device *dev,
 	struct etmv4_config *config = &drvdata->config;
 
 	val = FIELD_GET(TRCEVENTCTL1R_INSTEN_MASK, config->eventctrl1);
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t event_instren_store(struct device *dev,
@@ -593,7 +593,7 @@ static ssize_t event_ts_show(struct device *dev,
 	struct etmv4_config *config = &drvdata->config;
 
 	val = config->ts_ctrl;
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t event_ts_store(struct device *dev,
@@ -623,7 +623,7 @@ static ssize_t syncfreq_show(struct device *dev,
 	struct etmv4_config *config = &drvdata->config;
 
 	val = config->syncfreq;
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t syncfreq_store(struct device *dev,
@@ -653,7 +653,7 @@ static ssize_t cyc_threshold_show(struct device *dev,
 	struct etmv4_config *config = &drvdata->config;
 
 	val = config->ccctlr;
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t cyc_threshold_store(struct device *dev,
@@ -686,7 +686,7 @@ static ssize_t bb_ctrl_show(struct device *dev,
 	struct etmv4_config *config = &drvdata->config;
 
 	val = config->bb_ctrl;
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t bb_ctrl_store(struct device *dev,
@@ -726,7 +726,7 @@ static ssize_t event_vinst_show(struct device *dev,
 	struct etmv4_config *config = &drvdata->config;
 
 	val = FIELD_GET(TRCVICTLR_EVENT_MASK, config->vinst_ctrl);
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t event_vinst_store(struct device *dev,
@@ -758,7 +758,7 @@ static ssize_t s_exlevel_vinst_show(struct device *dev,
 	struct etmv4_config *config = &drvdata->config;
 
 	val = FIELD_GET(TRCVICTLR_EXLEVEL_S_MASK, config->vinst_ctrl);
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t s_exlevel_vinst_store(struct device *dev,
@@ -793,7 +793,7 @@ static ssize_t ns_exlevel_vinst_show(struct device *dev,
 
 	/* EXLEVEL_NS, bits[23:20] */
 	val = FIELD_GET(TRCVICTLR_EXLEVEL_NS_MASK, config->vinst_ctrl);
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t ns_exlevel_vinst_store(struct device *dev,
@@ -827,7 +827,7 @@ static ssize_t addr_idx_show(struct device *dev,
 	struct etmv4_config *config = &drvdata->config;
 
 	val = config->addr_idx;
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t addr_idx_store(struct device *dev,
@@ -866,11 +866,11 @@ static ssize_t addr_instdatatype_show(struct device *dev,
 	raw_spin_lock(&drvdata->spinlock);
 	idx = config->addr_idx;
 	val = FIELD_GET(TRCACATRn_TYPE_MASK, config->addr_acc[idx]);
-	len = scnprintf(buf, PAGE_SIZE, "%s\n",
-			val == TRCACATRn_TYPE_ADDR ? "instr" :
-			(val == TRCACATRn_TYPE_DATA_LOAD_ADDR ? "data_load" :
-			(val == TRCACATRn_TYPE_DATA_STORE_ADDR ? "data_store" :
-			"data_load_store")));
+	len = sysfs_emit(buf, "%s\n",
+			 val == TRCACATRn_TYPE_ADDR ? "instr" :
+			 (val == TRCACATRn_TYPE_DATA_LOAD_ADDR ? "data_load" :
+			 (val == TRCACATRn_TYPE_DATA_STORE_ADDR ? "data_store" :
+			 "data_load_store")));
 	raw_spin_unlock(&drvdata->spinlock);
 	return len;
 }
@@ -918,7 +918,7 @@ static ssize_t addr_single_show(struct device *dev,
 	}
 	val = (unsigned long)config->addr_val[idx];
 	raw_spin_unlock(&drvdata->spinlock);
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t addr_single_store(struct device *dev,
@@ -974,7 +974,7 @@ static ssize_t addr_range_show(struct device *dev,
 	val1 = (unsigned long)config->addr_val[idx];
 	val2 = (unsigned long)config->addr_val[idx + 1];
 	raw_spin_unlock(&drvdata->spinlock);
-	return scnprintf(buf, PAGE_SIZE, "%#lx %#lx\n", val1, val2);
+	return sysfs_emit(buf, "%#lx %#lx\n", val1, val2);
 }
 
 static ssize_t addr_range_store(struct device *dev,
@@ -1049,7 +1049,7 @@ static ssize_t addr_start_show(struct device *dev,
 
 	val = (unsigned long)config->addr_val[idx];
 	raw_spin_unlock(&drvdata->spinlock);
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t addr_start_store(struct device *dev,
@@ -1104,7 +1104,7 @@ static ssize_t addr_stop_show(struct device *dev,
 
 	val = (unsigned long)config->addr_val[idx];
 	raw_spin_unlock(&drvdata->spinlock);
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t addr_stop_store(struct device *dev,
@@ -1152,7 +1152,7 @@ static ssize_t addr_ctxtype_show(struct device *dev,
 	idx = config->addr_idx;
 	/* CONTEXTTYPE, bits[3:2] */
 	val = FIELD_GET(TRCACATRn_CONTEXTTYPE_MASK, config->addr_acc[idx]);
-	len = scnprintf(buf, PAGE_SIZE, "%s\n", val == ETM_CTX_NONE ? "none" :
+	len = sysfs_emit(buf, "%s\n", val == ETM_CTX_NONE ? "none" :
 			(val == ETM_CTX_CTXID ? "ctxid" :
 			(val == ETM_CTX_VMID ? "vmid" : "all")));
 	raw_spin_unlock(&drvdata->spinlock);
@@ -1219,7 +1219,7 @@ static ssize_t addr_context_show(struct device *dev,
 	/* context ID comparator bits[6:4] */
 	val = FIELD_GET(TRCACATRn_CONTEXT_MASK, config->addr_acc[idx]);
 	raw_spin_unlock(&drvdata->spinlock);
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t addr_context_store(struct device *dev,
@@ -1262,7 +1262,7 @@ static ssize_t addr_exlevel_s_ns_show(struct device *dev,
 	idx = config->addr_idx;
 	val = FIELD_GET(TRCACATRn_EXLEVEL_MASK, config->addr_acc[idx]);
 	raw_spin_unlock(&drvdata->spinlock);
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t addr_exlevel_s_ns_store(struct device *dev,
@@ -1325,8 +1325,8 @@ static ssize_t addr_cmp_view_show(struct device *dev,
 	}
 	raw_spin_unlock(&drvdata->spinlock);
 	if (addr_type) {
-		size = scnprintf(buf, PAGE_SIZE, "addr_cmp[%i] %s %#lx", idx,
-				 addr_type_names[addr_type], addr_v);
+		size = sysfs_emit(buf, "addr_cmp[%i] %s %#lx", idx,
+				  addr_type_names[addr_type], addr_v);
 		if (addr_type == ETM_ADDR_TYPE_RANGE) {
 			size += scnprintf(buf + size, PAGE_SIZE - size,
 					  " %#lx %s", addr_v2,
@@ -1335,7 +1335,7 @@ static ssize_t addr_cmp_view_show(struct device *dev,
 		size += scnprintf(buf + size, PAGE_SIZE - size,
 				  " ctrl(%#lx)\n", addr_ctrl);
 	} else {
-		size = scnprintf(buf, PAGE_SIZE, "addr_cmp[%i] unused\n", idx);
+		size = sysfs_emit(buf, "addr_cmp[%i] unused\n", idx);
 	}
 	return size;
 }
@@ -1352,7 +1352,7 @@ static ssize_t vinst_pe_cmp_start_stop_show(struct device *dev,
 	if (!drvdata->nr_pe_cmp)
 		return -EINVAL;
 	val = config->vipcssctlr;
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 static ssize_t vinst_pe_cmp_start_stop_store(struct device *dev,
 					     struct device_attribute *attr,
@@ -1383,7 +1383,7 @@ static ssize_t seq_idx_show(struct device *dev,
 	struct etmv4_config *config = &drvdata->config;
 
 	val = config->seq_idx;
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t seq_idx_store(struct device *dev,
@@ -1419,7 +1419,7 @@ static ssize_t seq_state_show(struct device *dev,
 	struct etmv4_config *config = &drvdata->config;
 
 	val = config->seq_state;
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t seq_state_store(struct device *dev,
@@ -1453,7 +1453,7 @@ static ssize_t seq_event_show(struct device *dev,
 	idx = config->seq_idx;
 	val = config->seq_ctrl[idx];
 	raw_spin_unlock(&drvdata->spinlock);
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t seq_event_store(struct device *dev,
@@ -1486,7 +1486,7 @@ static ssize_t seq_reset_event_show(struct device *dev,
 	struct etmv4_config *config = &drvdata->config;
 
 	val = config->seq_rst;
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t seq_reset_event_store(struct device *dev,
@@ -1516,7 +1516,7 @@ static ssize_t cntr_idx_show(struct device *dev,
 	struct etmv4_config *config = &drvdata->config;
 
 	val = config->cntr_idx;
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t cntr_idx_store(struct device *dev,
@@ -1556,7 +1556,7 @@ static ssize_t cntrldvr_show(struct device *dev,
 	idx = config->cntr_idx;
 	val = config->cntrldvr[idx];
 	raw_spin_unlock(&drvdata->spinlock);
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t cntrldvr_store(struct device *dev,
@@ -1594,7 +1594,7 @@ static ssize_t cntr_val_show(struct device *dev,
 	idx = config->cntr_idx;
 	val = config->cntr_val[idx];
 	raw_spin_unlock(&drvdata->spinlock);
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t cntr_val_store(struct device *dev,
@@ -1632,7 +1632,7 @@ static ssize_t cntr_ctrl_show(struct device *dev,
 	idx = config->cntr_idx;
 	val = config->cntr_ctrl[idx];
 	raw_spin_unlock(&drvdata->spinlock);
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t cntr_ctrl_store(struct device *dev,
@@ -1664,7 +1664,7 @@ static ssize_t res_idx_show(struct device *dev,
 	struct etmv4_config *config = &drvdata->config;
 
 	val = config->res_idx;
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t res_idx_store(struct device *dev,
@@ -1708,7 +1708,7 @@ static ssize_t res_ctrl_show(struct device *dev,
 	idx = config->res_idx;
 	val = config->res_ctrl[idx];
 	raw_spin_unlock(&drvdata->spinlock);
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t res_ctrl_store(struct device *dev,
@@ -1746,7 +1746,7 @@ static ssize_t sshot_idx_show(struct device *dev,
 	struct etmv4_config *config = &drvdata->config;
 
 	val = config->ss_idx;
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t sshot_idx_store(struct device *dev,
@@ -1780,7 +1780,7 @@ static ssize_t sshot_ctrl_show(struct device *dev,
 	raw_spin_lock(&drvdata->spinlock);
 	val = config->ss_ctrl[config->ss_idx];
 	raw_spin_unlock(&drvdata->spinlock);
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t sshot_ctrl_store(struct device *dev,
@@ -1815,7 +1815,7 @@ static ssize_t sshot_status_show(struct device *dev,
 	raw_spin_lock(&drvdata->spinlock);
 	val = config->ss_status[config->ss_idx];
 	raw_spin_unlock(&drvdata->spinlock);
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 static DEVICE_ATTR_RO(sshot_status);
 
@@ -1830,7 +1830,7 @@ static ssize_t sshot_pe_ctrl_show(struct device *dev,
 	raw_spin_lock(&drvdata->spinlock);
 	val = config->ss_pe_cmp[config->ss_idx];
 	raw_spin_unlock(&drvdata->spinlock);
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t sshot_pe_ctrl_store(struct device *dev,
@@ -1864,7 +1864,7 @@ static ssize_t ctxid_idx_show(struct device *dev,
 	struct etmv4_config *config = &drvdata->config;
 
 	val = config->ctxid_idx;
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t ctxid_idx_store(struct device *dev,
@@ -1911,7 +1911,7 @@ static ssize_t ctxid_pid_show(struct device *dev,
 	idx = config->ctxid_idx;
 	val = (unsigned long)config->ctxid_pid[idx];
 	raw_spin_unlock(&drvdata->spinlock);
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t ctxid_pid_store(struct device *dev,
@@ -1972,7 +1972,7 @@ static ssize_t ctxid_masks_show(struct device *dev,
 	val1 = config->ctxid_mask0;
 	val2 = config->ctxid_mask1;
 	raw_spin_unlock(&drvdata->spinlock);
-	return scnprintf(buf, PAGE_SIZE, "%#lx %#lx\n", val1, val2);
+	return sysfs_emit(buf, "%#lx %#lx\n", val1, val2);
 }
 
 static ssize_t ctxid_masks_store(struct device *dev,
@@ -2090,7 +2090,7 @@ static ssize_t vmid_idx_show(struct device *dev,
 	struct etmv4_config *config = &drvdata->config;
 
 	val = config->vmid_idx;
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t vmid_idx_store(struct device *dev,
@@ -2135,7 +2135,7 @@ static ssize_t vmid_val_show(struct device *dev,
 	raw_spin_lock(&drvdata->spinlock);
 	val = (unsigned long)config->vmid_val[config->vmid_idx];
 	raw_spin_unlock(&drvdata->spinlock);
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t vmid_val_store(struct device *dev,
@@ -2187,7 +2187,7 @@ static ssize_t vmid_masks_show(struct device *dev,
 	val1 = config->vmid_mask0;
 	val2 = config->vmid_mask1;
 	raw_spin_unlock(&drvdata->spinlock);
-	return scnprintf(buf, PAGE_SIZE, "%#lx %#lx\n", val1, val2);
+	return sysfs_emit(buf, "%#lx %#lx\n", val1, val2);
 }
 
 static ssize_t vmid_masks_store(struct device *dev,
@@ -2303,7 +2303,7 @@ static ssize_t cpu_show(struct device *dev,
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
 
 	val = drvdata->cpu;
-	return scnprintf(buf, PAGE_SIZE, "%d\n", val);
+	return sysfs_emit(buf, "%d\n", val);
 
 }
 static DEVICE_ATTR_RO(cpu);
@@ -2461,7 +2461,7 @@ static ssize_t coresight_etm4x_reg_show(struct device *dev,
 	val = etmv4_cross_read(drvdata, offset);
 	pm_runtime_put_sync(dev->parent);
 
-	return scnprintf(buf, PAGE_SIZE, "0x%x\n", val);
+	return sysfs_emit(buf, "0x%x\n", val);
 }
 
 static bool
diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index e45c6c7204b4..fa09a43889d7 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -470,7 +470,7 @@ static ssize_t hwevent_enable_show(struct device *dev,
 	struct stm_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	unsigned long val = drvdata->stmheer;
 
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t hwevent_enable_store(struct device *dev,
@@ -499,7 +499,7 @@ static ssize_t hwevent_select_show(struct device *dev,
 	struct stm_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	unsigned long val = drvdata->stmhebsr;
 
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t hwevent_select_store(struct device *dev,
@@ -534,7 +534,7 @@ static ssize_t port_select_show(struct device *dev,
 		spin_unlock(&drvdata->spinlock);
 	}
 
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t port_select_store(struct device *dev,
@@ -581,7 +581,7 @@ static ssize_t port_enable_show(struct device *dev,
 		spin_unlock(&drvdata->spinlock);
 	}
 
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t port_enable_store(struct device *dev,
diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index feadaf065b53..547f4970e1e5 100644
--- a/drivers/hwtracing/coresight/coresight-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-sysfs.c
@@ -315,7 +315,7 @@ static ssize_t enable_sink_show(struct device *dev,
 {
 	struct coresight_device *csdev = to_coresight_device(dev);
 
-	return scnprintf(buf, PAGE_SIZE, "%u\n", csdev->sysfs_sink_activated);
+	return sysfs_emit(buf, "%u\n", csdev->sysfs_sink_activated);
 }
 
 static ssize_t enable_sink_store(struct device *dev,
@@ -343,7 +343,7 @@ static ssize_t enable_source_show(struct device *dev,
 	struct coresight_device *csdev = to_coresight_device(dev);
 
 	guard(mutex)(&coresight_mutex);
-	return scnprintf(buf, PAGE_SIZE, "%u\n",
+	return sysfs_emit(buf, "%u\n",
 			 coresight_get_mode(csdev) == CS_MODE_SYSFS);
 }
 
-- 
2.47.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
