Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F71C0D60B
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Oct 2025 13:03:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13C23C6047A;
	Mon, 27 Oct 2025 12:03:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A5DDC6046D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 12:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761566601; x=1793102601;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=69y5JxPNsQzf5MPEoD1ZYI9e/AfXfjV8qPp6QO8ll0w=;
 b=L6PsO+72KU2tHlIcgcL+E8O+B3eS82XclGjXHV0n28oncHtzl6zHamb1
 ck40bd4FgoHXkFS5SHKfP8NVHtSyrBxtw+Qla1qT+ViTugjxQs1gcmcf0
 Vkmr+iHOD8OmySLlBB0xfddHpc1E53Gv+HFTe/OWIQ9FZuKNwi4qPI25t
 4DPxgwSg2sCGlpX093EFEXM8MX8MWzU1Rc/sz+mSPstHy2bd/OIn+hQkz
 ZoSBV8Iy3c7VBxpjr+pcaXFiX09iGc6vwr9VrG8ExNADMT5XuwAcoO6Rk
 HlNr26ALonwmBX5ukhtz0/0/HEcJsCOLWDLpKr88/dhstykRhkuAcLcen Q==;
X-CSE-ConnectionGUID: qRUyArDNQ0Gh/Kdj8Cim6A==
X-CSE-MsgGUID: 5A3wmCXrR3C7r19IQv+UhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74759971"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="74759971"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 05:03:19 -0700
X-CSE-ConnectionGUID: AL7lAoY0QyG3O64gvxCm1g==
X-CSE-MsgGUID: pqpeOZW/Sh2F9W1BXgeqGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="184252514"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com)
 ([10.245.244.31])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 05:03:17 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
 by kekkonen.fi.intel.com (Postfix) with ESMTP id E6330121E63;
 Mon, 27 Oct 2025 14:03:14 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
 (envelope-from <sakari.ailus@linux.intel.com>)
 id 1vDLwQ-00000001dl2-3Uo2; Mon, 27 Oct 2025 14:03:14 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-arm-kernel@lists.infradead.org
Date: Mon, 27 Oct 2025 14:03:14 +0200
Message-ID: <20251027120314.391148-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 1/1] stm class: Remove redundant
	pm_runtime_mark_last_busy() calls
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

pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
pm_runtime_mark_last_busy().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/hwtracing/stm/core.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/hwtracing/stm/core.c b/drivers/hwtracing/stm/core.c
index cdba4e875b28..f75d06e3787a 100644
--- a/drivers/hwtracing/stm/core.c
+++ b/drivers/hwtracing/stm/core.c
@@ -659,7 +659,6 @@ static ssize_t stm_char_write(struct file *file, const char __user *buf,
 
 	count = stm_write(stm, &stmf->output, 0, kbuf, count, NULL);
 
-	pm_runtime_mark_last_busy(&stm->dev);
 	pm_runtime_put_autosuspend(&stm->dev);
 	kfree(kbuf);
 
@@ -679,7 +678,6 @@ static void stm_mmap_close(struct vm_area_struct *vma)
 	struct stm_file *stmf = vma->vm_file->private_data;
 	struct stm_device *stm = stmf->stm;
 
-	pm_runtime_mark_last_busy(&stm->dev);
 	pm_runtime_put_autosuspend(&stm->dev);
 }
 
@@ -1082,7 +1080,6 @@ static int __stm_source_link_drop(struct stm_source_device *src,
 
 	stm_output_free(link, &src->output);
 	list_del_init(&src->link_entry);
-	pm_runtime_mark_last_busy(&link->dev);
 	pm_runtime_put_autosuspend(&link->dev);
 	/* matches stm_find_device() from stm_source_link_store() */
 	stm_put_device(link);
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
