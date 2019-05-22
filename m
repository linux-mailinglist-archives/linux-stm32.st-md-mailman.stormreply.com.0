Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4B2266DE
	for <lists+linux-stm32@lfdr.de>; Wed, 22 May 2019 17:29:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D875CBC14D
	for <lists+linux-stm32@lfdr.de>; Wed, 22 May 2019 15:29:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E57ACCBC148
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 May 2019 15:29:40 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4MFSLdn021231; Wed, 22 May 2019 17:29:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=B6DKjDnb7O5BR/R4BaH3RkAeSYESY1eQiVlZXH9oE8A=;
 b=Nsbzx5vOjEJkV6yl0J71Fvx548IwqVYr5OK+tf/R+yDwNL/jXPYF5cCRqDr/O99pgeYH
 0ozfyPcQkt6fT8zAvU1kfbBuNu90pOOEkOzQjh/KFw/OAAuwwg/Bry9j3ZzkAxvjmzTB
 S9cYHgLoffD6ew/N+GxezB5ZBZasKT/JVJpusP2/sWvqP93/T7zHcOgu4y6mYBlTeHEq
 0hr71YovpDRlVqBWpd6wZSqmxK/hmmIgDcx6Z4YXDXZXONzyegRzNWS2r8q8e4L5TR7T
 2Dpj+FLeOrndDydEazYRjwezPqxckX1Hssp03CO49DxgnkEfH4BkR1wPXqG9aX+Gnswu Kw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2sj7h11b1j-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 22 May 2019 17:29:32 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3A46941;
 Wed, 22 May 2019 15:29:31 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EAEE42CD8;
 Wed, 22 May 2019 15:29:30 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 22 May
 2019 17:29:30 +0200
Received: from localhost (10.201.20.122) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 22 May 2019 17:29:30
 +0200
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <linus.walleij@linaro.org>, <alexandre.torgue@st.com>,
 <amelie.delaunay@st.com>
Date: Wed, 22 May 2019 17:29:25 +0200
Message-ID: <20190522152925.12419-3-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20190522152925.12419-1-benjamin.gaignard@st.com>
References: <20190522152925.12419-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.20.122]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-22_08:, , signatures=0
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 benjamin.gaignard@linaro.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/2] pinctrl: stmfx: enable links creations
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

Set create_link to inform pinctrl core that stmfx wants to create
link with its consumers.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 drivers/pinctrl/pinctrl-stmfx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
index eba872ce4a7c..55a9f145b4d9 100644
--- a/drivers/pinctrl/pinctrl-stmfx.c
+++ b/drivers/pinctrl/pinctrl-stmfx.c
@@ -622,6 +622,7 @@ static int stmfx_pinctrl_probe(struct platform_device *pdev)
 	pctl->pctl_desc.pins = stmfx_pins;
 	pctl->pctl_desc.npins = ARRAY_SIZE(stmfx_pins);
 	pctl->pctl_desc.owner = THIS_MODULE;
+	pctl->pctl_desc.create_link = true;
 
 	ret = devm_pinctrl_register_and_init(pctl->dev, &pctl->pctl_desc,
 					     pctl, &pctl->pctl_dev);
-- 
2.15.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
