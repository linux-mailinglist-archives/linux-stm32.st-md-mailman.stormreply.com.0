Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C04A14A0F
	for <lists+linux-stm32@lfdr.de>; Mon,  6 May 2019 14:44:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5FAD3CB40A6
	for <lists+linux-stm32@lfdr.de>; Mon,  6 May 2019 12:44:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31C32CB40A5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 May 2019 12:44:30 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x46Cadlw004670; Mon, 6 May 2019 14:44:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=Z+KdRdTJF77ynST0agYQYlNkSLncESUhMnx4yj6tFik=;
 b=pcm+HptYsC0zk99QmJuZJv6P+Y1l+8ldIsi4lHZfHoOHKUCLkBBKGTMkHKO5QoED4qMf
 ea+swM+sZ7q2QXeYAJFDH/3xplFhtjnYyqKv6A5fSJkU5ZCP/a4tnIRp5jdA8U87mLNi
 IC4KwfeakusEwzpURo3LNOQP/tJh5E+HHHe8BVAIekOp/Mgq4O55ICwpq4F7SgyH3MBn
 e3FjcSYdXlAWZm/jngP7Bff25RytC4YnMvWthhEpXVoIpAItMz4Bxah7ShqrF8yWzUTT
 M+IgYxV9IzYwXc2V841M2Xa5P8r69vz+rpsc84qPJlZpzPEDWmPzMjnvS9higW/runzJ VQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2s94c39ey3-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 06 May 2019 14:44:15 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 409AE31;
 Mon,  6 May 2019 12:44:13 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1C02D2583;
 Mon,  6 May 2019 12:44:13 +0000 (GMT)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 6 May 2019
 14:44:12 +0200
Received: from localhost (10.201.23.16) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 6 May 2019 14:44:12
 +0200
From: Olivier Moysan <olivier.moysan@st.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@st.com>, <alsa-devel@alsa-project.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-kernel@vger.kernel.org>, <olivier.moysan@st.com>,
 <arnaud.pouliquen@st.com>
Date: Mon, 6 May 2019 14:44:05 +0200
Message-ID: <1557146646-18150-3-git-send-email-olivier.moysan@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557146646-18150-1-git-send-email-olivier.moysan@st.com>
References: <1557146646-18150-1-git-send-email-olivier.moysan@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.16]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-06_08:, , signatures=0
Subject: [Linux-stm32] [PATCH 2/3] ASoC: stm32: spdifrx: change trace level
	on iec control
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

Change trace level to debug to avoid spurious messages.
Return quietly when accessing iec958 control, while no
S/PDIF signal is available.

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
 sound/soc/stm/stm32_spdifrx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.c
index aa83b50efabb..3d64200edbb5 100644
--- a/sound/soc/stm/stm32_spdifrx.c
+++ b/sound/soc/stm/stm32_spdifrx.c
@@ -496,7 +496,7 @@ static int stm32_spdifrx_get_ctrl_data(struct stm32_spdifrx_data *spdifrx)
 	if (wait_for_completion_interruptible_timeout(&spdifrx->cs_completion,
 						      msecs_to_jiffies(100))
 						      <= 0) {
-		dev_err(&spdifrx->pdev->dev, "Failed to get control data\n");
+		dev_dbg(&spdifrx->pdev->dev, "Failed to get control data\n");
 		ret = -EAGAIN;
 	}
 
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
