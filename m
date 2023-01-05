Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BADE65F061
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Jan 2023 16:45:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1796C69069;
	Thu,  5 Jan 2023 15:45:43 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1906AC64109
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Jan 2023 00:38:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 361FD618C8;
 Thu,  5 Jan 2023 00:38:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DE29C433AE;
 Thu,  5 Jan 2023 00:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672879095;
 bh=F6aQ6vvbp0e6OcVSUyTnleHkOEpf+ZhLzaidGHNo6qg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LRc1BevFOo0jEMuP3psUfI8LN5nfq+xryqEO+ola5YGJyy7JmBqkDxjpE/1bpzyQj
 z3nSL9AKI6u/H69Bbsi3gQcOdx8T7p1wovRH18XFg4Sno1H3wgegFqi3D9FDkknX6x
 QZbVKOSalV0H9d9v7wlTnGjizbf8HoaFSsz+gGJXNNQf9eCHhd5AJBQL2cSEMNxcBy
 BqvNTNjTv9d4IMjw8xXLTRo4BYCl+W6lZVdCwNn37bH0pVLkH3qLtoygxCrn+qZ/CD
 00loVj9LJNoL9C5s6cLimc+bLiPZK8rDPGJITohY3LD5T4HKhvWxl1bzwjPpt4T6Ex
 2r3BVymwwEB6w==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id CD2585C1C89; Wed,  4 Jan 2023 16:38:14 -0800 (PST)
From: "Paul E. McKenney" <paulmck@kernel.org>
To: rcu@vger.kernel.org
Date: Wed,  4 Jan 2023 16:37:59 -0800
Message-Id: <20230105003813.1770367-13-paulmck@kernel.org>
X-Mailer: git-send-email 2.31.1.189.g2e36527f23
In-Reply-To: <20230105003759.GA1769545@paulmck-ThinkPad-P17-Gen-1>
References: <20230105003759.GA1769545@paulmck-ThinkPad-P17-Gen-1>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 05 Jan 2023 15:45:43 +0000
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, kernel-team@meta.com,
 linux-kernel@vger.kernel.org, rostedt@goodmis.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH rcu 13/27] drivers/hwtracing/stm: Remove
	"select SRCU"
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

Now that the SRCU Kconfig option is unconditionally selected, there is
no longer any point in selecting it.  Therefore, remove the "select SRCU"
Kconfig statements.

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: <linux-stm32@st-md-mailman.stormreply.com>
Cc: <linux-arm-kernel@lists.infradead.org>
---
 drivers/hwtracing/stm/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwtracing/stm/Kconfig b/drivers/hwtracing/stm/Kconfig
index aad594fe79cc5..eda6b11d40a1f 100644
--- a/drivers/hwtracing/stm/Kconfig
+++ b/drivers/hwtracing/stm/Kconfig
@@ -2,7 +2,6 @@
 config STM
 	tristate "System Trace Module devices"
 	select CONFIGFS_FS
-	select SRCU
 	help
 	  A System Trace Module (STM) is a device exporting data in System
 	  Trace Protocol (STP) format as defined by MIPI STP standards.
-- 
2.31.1.189.g2e36527f23

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
