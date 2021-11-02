Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 966204433B9
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Nov 2021 17:48:53 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61037C5E2C6;
	Tue,  2 Nov 2021 16:48:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13020C5E2AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Nov 2021 16:48:52 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A2FooD8025646;
 Tue, 2 Nov 2021 17:48:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=W02KUHFI/tZXI6h9v7LxP3Q519z7uOdSs4XeAre+Dsk=;
 b=lttA3Ozf3v4JY1HzpvuLpX3MPxZ/uzLsXrnFkmy7bRCxLJaprK3FkSIGIIcZDaTrRXi4
 WvrxkEdlA+yPx2waSaq4mdHtgJq2Qi1enQy1CtyUolO8j1K6PuTNuEEXE9QpkKbAYd7v
 cuez26kqEJn07wNKnQTDfvOgld+zlcrczfAFIZTu1dQTC7zB9liDY0JDIDzyVlMkxr40
 NM/cTjMEn4OPmwuVaEfEymOR4CZeXiJkO4Z2l3/pZjxvjH/Dv+FDGXx+E3FiKMqO+uDh
 La75k6f163SKcf6NT8myBnhJm3xibCJqeUCwcR7tyTPqBGjoRurKZ+I2ZRK5QjP4CWc9 1A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3c30vnbqja-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Nov 2021 17:48:41 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F31A710002A;
 Tue,  2 Nov 2021 17:48:40 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EC5BB23C351;
 Tue,  2 Nov 2021 17:48:40 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 2 Nov 2021 17:48:40
 +0100
From: Nicolas Toromanoff <nicolas.toromanoff@foss.st.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
 <davem@davemloft.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Tue, 2 Nov 2021 17:47:27 +0100
Message-ID: <20211102164729.9957-7-nicolas.toromanoff@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211102164729.9957-1-nicolas.toromanoff@foss.st.com>
References: <20211102164729.9957-1-nicolas.toromanoff@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-02_08,2021-11-02_01,2020-04-07_01
Cc: Marek Vasut <marex@denx.de>, linux-kernel@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>, linux-crypto@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 6/8] crypto: stm32/cryp - fix double pm
	exit.
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

Delete extraneous lines in probe error handling code: pm was
disabled twice.

Fixes: 65f9aa36ee47 ("crypto: stm32/cryp - Add power management support")

Reported-by: Marek Vasut <marex@denx.de>
Signed-off-by: Nicolas Toromanoff <nicolas.toromanoff@foss.st.com>
---
 drivers/crypto/stm32/stm32-cryp.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/crypto/stm32/stm32-cryp.c b/drivers/crypto/stm32/stm32-cryp.c
index 8cea7d3abf87..d61608dc416a 100644
--- a/drivers/crypto/stm32/stm32-cryp.c
+++ b/drivers/crypto/stm32/stm32-cryp.c
@@ -2143,8 +2143,6 @@ static int stm32_cryp_probe(struct platform_device *pdev)
 err_rst:
 	pm_runtime_disable(dev);
 	pm_runtime_put_noidle(dev);
-	pm_runtime_disable(dev);
-	pm_runtime_put_noidle(dev);
 
 	clk_disable_unprepare(cryp->clk);
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
