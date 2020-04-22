Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7501B3ACB
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Apr 2020 11:08:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5888C36B0E;
	Wed, 22 Apr 2020 09:08:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E1ABC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Apr 2020 09:08:45 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03M8wJs1014614; Wed, 22 Apr 2020 11:08:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=M547siygZ9veHPe6aGPiIF4IEe0ayf38LthHUDDwPNA=;
 b=i9ZSTFkONvNHG/jwWwOZZfFfoLeQWIojKESL3yKuCHnf/3boolhqV6rhhzbqzv/r1TS7
 sXCB432W4OPreWjQDnlNICttII5ElmXTdZRphfiExzE48hALFpNEMlprNVq/ydfW8Mbh
 PtRym3HzpTJtlu7tr7l8F9BiDMbr/tZUYy2hk7c9phHWZ5vira8KkxkLGCh2JOan1Ifu
 99g0aUYfWcwh8rnZQeeR3pye5xMmA2+MpB/XEBPHjpAE117mgFlX3FIwFdvfb6OveR/t
 mTxRh0JREj+V+5lTf41x7egl0+P7/tqeyRY+Z97qWw+ojAmzCs+E3//WvV7vrzS6tsxM Vg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fpp8wp1v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Apr 2020 11:08:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 79AE010002A;
 Wed, 22 Apr 2020 11:08:39 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6CBA72A4D94;
 Wed, 22 Apr 2020 11:08:39 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 22 Apr 2020 11:08:39
 +0200
From: Amelie Delaunay <amelie.delaunay@st.com>
To: Lee Jones <lee.jones@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>
Date: Wed, 22 Apr 2020 11:08:31 +0200
Message-ID: <20200422090833.9743-2-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200422090833.9743-1-amelie.delaunay@st.com>
References: <20200422090833.9743-1-amelie.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-22_03:2020-04-21,
 2020-04-22 signatures=0
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 1/3] mfd: stmfx: reset chip on resume as
	supply was disabled
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

STMFX supply is disabled during suspend. To avoid a too early access to
the STMFX firmware on resume, reset the chip and wait for its firmware to
be loaded.

Fixes: 06252ade9156 ("mfd: Add ST Multi-Function eXpander (STMFX) core driver")
Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 drivers/mfd/stmfx.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mfd/stmfx.c b/drivers/mfd/stmfx.c
index 857991cb3cbb..fde6541e347c 100644
--- a/drivers/mfd/stmfx.c
+++ b/drivers/mfd/stmfx.c
@@ -501,6 +501,13 @@ static int stmfx_resume(struct device *dev)
 		}
 	}
 
+	/* Reset STMFX - supply has been stopped during suspend */
+	ret = stmfx_chip_reset(stmfx);
+	if (ret) {
+		dev_err(stmfx->dev, "Failed to reset chip: %d\n", ret);
+		return ret;
+	}
+
 	ret = regmap_raw_write(stmfx->map, STMFX_REG_SYS_CTRL,
 			       &stmfx->bkp_sysctrl, sizeof(stmfx->bkp_sysctrl));
 	if (ret)
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
