Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BAC668822
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Jan 2023 01:11:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A426AC65E45;
	Fri, 13 Jan 2023 00:11:39 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6EA0C6334A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Jan 2023 00:11:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7B18F621F4;
 Fri, 13 Jan 2023 00:11:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA8ADC43396;
 Fri, 13 Jan 2023 00:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673568695;
 bh=ul1/WKLKiUmVybIxqWnYnRpo2gSfd31L08sVwl6r/bg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sUorwqkTXTL57R+WQaylGCKaAGTRLrwjN6Pin3ea3ZWmx2Rnli50rF75h/vvQTgNV
 d3rWCunXEFBx4tvmrOQOLL7KCAM/0dTy1c4fwn8Kr06gS6rVnFc4hQdRDQbb6dkeSs
 ENgjp1GfNPG5grwP2Qp4xzK2ezsdJiUeN/7S/rwalieTEBIgzJqkkJ88WYxL1tTy4V
 VL44evRX1laMfys93cdGTHrEKOsYS1oFCm/3m7nU9/MtuDZy1WEvpbLln2BugEuaxF
 9jIQUcOI8zXGUEGcjcAM3t15tTpTbC4is/hzA+56NrQ7P9Y2BJ2ZzhQNPtpCrtIi+w
 U+W2icDqfFHoQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id 9EECF5C1109; Thu, 12 Jan 2023 16:11:34 -0800 (PST)
From: "Paul E. McKenney" <paulmck@kernel.org>
To: rcu@vger.kernel.org
Date: Thu, 12 Jan 2023 16:11:17 -0800
Message-Id: <20230113001132.3375334-5-paulmck@kernel.org>
X-Mailer: git-send-email 2.31.1.189.g2e36527f23
In-Reply-To: <20230113001103.GA3374173@paulmck-ThinkPad-P17-Gen-1>
References: <20230113001103.GA3374173@paulmck-ThinkPad-P17-Gen-1>
MIME-Version: 1.0
Cc: John Ogness <john.ogness@linutronix.de>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, kernel-team@meta.com,
 linux-kernel@vger.kernel.org, rostedt@goodmis.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH rcu v2 05/20] drivers/hwtracing/stm: Remove
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
Reviewed-by: John Ogness <john.ogness@linutronix.de>
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
