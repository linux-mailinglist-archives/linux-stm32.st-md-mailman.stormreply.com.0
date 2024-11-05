Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EB69BCEBF
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Nov 2024 15:10:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3748C71287;
	Tue,  5 Nov 2024 14:10:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 618A1C71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Nov 2024 14:10:05 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5CGuu3004386;
 Tue, 5 Nov 2024 15:09:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=DBZ37o87693Es4cCNyLxHr
 d7NY4Ze7ssSN37sw3EsrI=; b=rFxDHAs2Zg4JtmHgavsKyIJBSzB8uluibICj1n
 bQc5gX40ZUVHlzrHdvSZS+0H8eTfOS4P6bPIvFBbzIP94RTJ33vQB1PfoOS9UTmC
 ZKS/qiL8NVPtL+TfZrxKwiPfX2TLspHlAlKnvi2CqV+SRoeGoquKi5n8Xj5I1HZF
 REju30cgTt3NNjAxuaqnc4AFwnLsYPZw/xcxcgXrnvSYPTzLXbphaXmQ7lwp8Knf
 bDjbuuP0A92IR6UDPVSfTy/qvGcjQltjha5haNsSkDVQKli/XZlFVlHAoZaY8+PR
 Cwd2owMt3V+EbV9pBpR9KiUtFBy7leScXIOFahvlL353nrsg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42nd00488c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Nov 2024 15:09:44 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2642D40049;
 Tue,  5 Nov 2024 15:08:35 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8DDA22676BC;
 Tue,  5 Nov 2024 15:07:49 +0100 (CET)
Received: from localhost (10.252.16.126) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 5 Nov
 2024 15:07:49 +0100
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: <amelie.delaunay@foss.st.com>, Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Liam Girdwood <lgirdwood@gmail.com>, "Mark
 Brown" <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>
Date: Tue, 5 Nov 2024 15:02:42 +0100
Message-ID: <20241105140242.527279-1-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.252.16.126]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 1/1] ASoC: stm32: spdifrx: fix dma channel
	release in stm32_spdifrx_remove
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

From: Amelie Delaunay <amelie.delaunay@foss.st.com>

In case of error when requesting ctrl_chan DMA channel, ctrl_chan is not
null. So the release of the dma channel leads to the following issue:
[    4.879000] st,stm32-spdifrx 500d0000.audio-controller:
dma_request_slave_channel error -19
[    4.888975] Unable to handle kernel NULL pointer dereference
at virtual address 000000000000003d
[...]
[    5.096577] Call trace:
[    5.099099]  dma_release_channel+0x24/0x100
[    5.103235]  stm32_spdifrx_remove+0x24/0x60 [snd_soc_stm32_spdifrx]
[    5.109494]  stm32_spdifrx_probe+0x320/0x4c4 [snd_soc_stm32_spdifrx]

To avoid this issue, release channel only if the pointer is valid.

Fixes: 794df9448edb ("ASoC: stm32: spdifrx: manage rebind issue")
Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 sound/soc/stm/stm32_spdifrx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.c
index d1b32ba1e1a2..9e30852de93c 100644
--- a/sound/soc/stm/stm32_spdifrx.c
+++ b/sound/soc/stm/stm32_spdifrx.c
@@ -939,7 +939,7 @@ static void stm32_spdifrx_remove(struct platform_device *pdev)
 {
 	struct stm32_spdifrx_data *spdifrx = platform_get_drvdata(pdev);
 
-	if (spdifrx->ctrl_chan)
+	if (!IS_ERR(spdifrx->ctrl_chan))
 		dma_release_channel(spdifrx->ctrl_chan);
 
 	if (spdifrx->dmab)
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
