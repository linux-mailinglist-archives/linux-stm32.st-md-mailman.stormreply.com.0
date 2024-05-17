Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 118898C82AD
	for <lists+linux-stm32@lfdr.de>; Fri, 17 May 2024 10:46:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9E36C6DD6D;
	Fri, 17 May 2024 08:46:04 +0000 (UTC)
Received: from out30-100.freemail.mail.aliyun.com
 (out30-100.freemail.mail.aliyun.com [115.124.30.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E74EC640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 May 2024 08:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1715935555; h=From:To:Subject:Date:Message-Id:MIME-Version;
 bh=3P9anBumC+Rvm6ijATiJZ/4Mu9BiCfZljkgjcA/DfVk=;
 b=Yl9cjNyWbR3VFDf2Q9C80xAKbX7rp49i7n9/LC9QZtsWM2gS4u6b/T/cf2p/z/EIL9Njkn8EIUEclcCR1kMb0aAnesgc4G/DbixCKpgHV+xe43vFAwjMS8hHIjFevcBcKK/iKDQ0tFizy0ja+iCbmhTYE7SAN46zpwPWS+3BvoM=
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=maildocker-contentspam033045046011;
 MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0W6eAhXf_1715935553; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0W6eAhXf_1715935553) by smtp.aliyun-inc.com;
 Fri, 17 May 2024 16:45:54 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: alexander.shishkin@linux.intel.com, alexandre.torgue@foss.st.com,
 mcoquelin.stm32@gmail.com
Date: Fri, 17 May 2024 16:45:52 +0800
Message-Id: <20240517084552.113403-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Cc: Yang Li <yang.lee@linux.alibaba.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH -next] tracing: Update stm_ftrace_write doc to
	kernel-doc format
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

This patch updates the function documentation comment for
stm_ftrace_write to conform to the kernel-doc specification.

Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/hwtracing/stm/ftrace.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwtracing/stm/ftrace.c b/drivers/hwtracing/stm/ftrace.c
index a7cea7ea0163..0896379a011f 100644
--- a/drivers/hwtracing/stm/ftrace.c
+++ b/drivers/hwtracing/stm/ftrace.c
@@ -31,6 +31,7 @@ static struct stm_ftrace {
 
 /**
  * stm_ftrace_write() - write data to STM via 'stm_ftrace' source
+ * @export:	Pointer to trace export descriptor
  * @buf:	buffer containing the data packet
  * @len:	length of the data packet
  */
-- 
2.20.1.7.g153144c

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
