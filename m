Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 722BE98FFEE
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Oct 2024 11:41:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1EF8FC78023;
	Fri,  4 Oct 2024 09:41:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11480C78023
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Oct 2024 09:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728034890; x=1759570890;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vBw/GQefa64DRp8NDioQypMCDfwKLCufkrK3JfG6lus=;
 b=jj6CFWhhl+5aQQmox5MdpX7QAgcFmqPevLMHC9DeGD8KDGR/83qp7iVH
 UYkE7RyVgtehfhc3Hw6I5Vs+iAYvQJJlzK6tLMZQrBaqJhpMPt9/wJgmq
 A78jfiPDRoj+rXYt8uMZmNJg3+wSRKnim66CNdy2ZC7A5WaLMpwHs+Uz+
 zqNDvRRuXgIbbJ9jeorFvmVccptu+Ou819XY5MYu3lZVAwIkCnT12ZHmC
 6xURISqKB6/p1J9TKjDEurLFwcC3y2odYoDi23Gwtt69UbYg24pAgsAOc
 bzPrRCNejl1l8J00gF6F7sA/CZUFBMs15bUj+Dup/ZOB/vEWRz2mO654t A==;
X-CSE-ConnectionGUID: 9LJYF96cSsq5pI1tY8HoIw==
X-CSE-MsgGUID: 2qSNeJJ6S+GUe8OtGWV65g==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="37856245"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="37856245"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 02:41:27 -0700
X-CSE-ConnectionGUID: b2wFGtwkQAaI954hcfHTVA==
X-CSE-MsgGUID: +ueu421NRTWNaE2iatHzTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="74331936"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com)
 ([10.237.72.44])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 02:41:24 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
 by kekkonen.fi.intel.com (Postfix) with ESMTP id B1FFA1203FA;
 Fri,  4 Oct 2024 12:41:22 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
 (envelope-from <sakari.ailus@linux.intel.com>) id 1sweoM-000TYa-2J;
 Fri, 04 Oct 2024 12:41:22 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Fri,  4 Oct 2024 12:41:22 +0300
Message-Id: <20241004094122.113606-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 15/51] stm class: Switch to
	__pm_runtime_put_autosuspend()
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

pm_runtime_put_autosuspend() will soon be changed to include a call to
pm_runtime_mark_last_busy(). This patch switches the current users to
__pm_runtime_put_autosuspend() which will continue to have the
functionality of old pm_runtime_put_autosuspend().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/hwtracing/stm/core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwtracing/stm/core.c b/drivers/hwtracing/stm/core.c
index cdba4e875b28..229546270bf4 100644
--- a/drivers/hwtracing/stm/core.c
+++ b/drivers/hwtracing/stm/core.c
@@ -660,7 +660,7 @@ static ssize_t stm_char_write(struct file *file, const char __user *buf,
 	count = stm_write(stm, &stmf->output, 0, kbuf, count, NULL);
 
 	pm_runtime_mark_last_busy(&stm->dev);
-	pm_runtime_put_autosuspend(&stm->dev);
+	__pm_runtime_put_autosuspend(&stm->dev);
 	kfree(kbuf);
 
 	return count;
@@ -680,7 +680,7 @@ static void stm_mmap_close(struct vm_area_struct *vma)
 	struct stm_device *stm = stmf->stm;
 
 	pm_runtime_mark_last_busy(&stm->dev);
-	pm_runtime_put_autosuspend(&stm->dev);
+	__pm_runtime_put_autosuspend(&stm->dev);
 }
 
 static const struct vm_operations_struct stm_mmap_vmops = {
@@ -1083,7 +1083,7 @@ static int __stm_source_link_drop(struct stm_source_device *src,
 	stm_output_free(link, &src->output);
 	list_del_init(&src->link_entry);
 	pm_runtime_mark_last_busy(&link->dev);
-	pm_runtime_put_autosuspend(&link->dev);
+	__pm_runtime_put_autosuspend(&link->dev);
 	/* matches stm_find_device() from stm_source_link_store() */
 	stm_put_device(link);
 	rcu_assign_pointer(src->link, NULL);
@@ -1181,7 +1181,7 @@ static ssize_t stm_source_link_store(struct device *dev,
 
 	err = stm_source_link_add(src, link);
 	if (err) {
-		pm_runtime_put_autosuspend(&link->dev);
+		__pm_runtime_put_autosuspend(&link->dev);
 		/* matches the stm_find_device() above */
 		stm_put_device(link);
 	}
-- 
2.39.5

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
