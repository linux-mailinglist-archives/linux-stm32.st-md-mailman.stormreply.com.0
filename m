Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 270C8136D79
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jan 2020 14:12:31 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A92B4C36B0B;
	Fri, 10 Jan 2020 13:12:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6461BC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jan 2020 13:12:28 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00AD86U6008915; Fri, 10 Jan 2020 14:11:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=haY87gSwex8rCh0FoiCdqRy2whnAZkCD7EIrYWg4L6k=;
 b=qOyO055nx9VMMiP9IRWmPO2wbA8r4CSqjeVvgO1nCDHWhpUOdIiIr5lyjShgcOg7d5CM
 XjlEQW9y8KOfw30+NLIQ8i60i+FVd69tstJoQWGgY+UhEjFHcLz2OlJtNQ3fP6Jq/slt
 ZRgL+aFD0hzX+tLeyoa4nKXHttqbdSDldPTBb8C4KHKWSOOQXNY+LYk6ZY6rn5UMZiqM
 LIiNKfkjzhFJlhh/fTV1zjNoMx2DxLppFSIYiAw3f3oBoJ3ZuOaaC1LWe8X6K6/9NPGp
 MfL7EI3Ri++yw69vbWT0VZB1vvfaWDQTTHnU/5rHL3wfh7e/otFK8yOfW2CLTDcoto8B kw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xakkb7rur-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Jan 2020 14:11:39 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7CE4A100034;
 Fri, 10 Jan 2020 14:11:33 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 913662B7742;
 Fri, 10 Jan 2020 14:11:33 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Fri, 10 Jan 2020 14:11:33 +0100
From: Olivier Moysan <olivier.moysan@st.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@st.com>, <alsa-devel@alsa-project.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-kernel@vger.kernel.org>, <olivier.moysan@st.com>
Date: Fri, 10 Jan 2020 14:11:31 +0100
Message-ID: <20200110131131.3191-1-olivier.moysan@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-10_01:2020-01-10,
 2020-01-09 signatures=0
Subject: [Linux-stm32] [PATCH] ASoC: stm32: dfsdm: fix 16 bits record
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

In stm32_afsdm_pcm_cb function, the transfer size is provided in bytes.
However, samples are copied as 16 bits words from iio buffer.
Divide by two the transfer size, to copy the right number of samples.

Fixes: 1e7f6e1c69f0 ("ASoC: stm32: dfsdm: add 16 bits audio record support")

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
 sound/soc/stm/stm32_adfsdm.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/stm/stm32_adfsdm.c b/sound/soc/stm/stm32_adfsdm.c
index 807fee1eac66..51407a21c440 100644
--- a/sound/soc/stm/stm32_adfsdm.c
+++ b/sound/soc/stm/stm32_adfsdm.c
@@ -153,13 +153,13 @@ static const struct snd_soc_component_driver stm32_adfsdm_dai_component = {
 	.name = "stm32_dfsdm_audio",
 };
 
-static void memcpy_32to16(void *dest, const void *src, size_t n)
+static void stm32_memcpy_32to16(void *dest, const void *src, size_t n)
 {
 	unsigned int i = 0;
 	u16 *d = (u16 *)dest, *s = (u16 *)src;
 
 	s++;
-	for (i = n; i > 0; i--) {
+	for (i = n >> 1; i > 0; i--) {
 		*d++ = *s++;
 		s++;
 	}
@@ -186,8 +186,8 @@ static int stm32_afsdm_pcm_cb(const void *data, size_t size, void *private)
 
 	if ((priv->pos + src_size) > buff_size) {
 		if (format == SNDRV_PCM_FORMAT_S16_LE)
-			memcpy_32to16(&pcm_buff[priv->pos], src_buff,
-				      buff_size - priv->pos);
+			stm32_memcpy_32to16(&pcm_buff[priv->pos], src_buff,
+					    buff_size - priv->pos);
 		else
 			memcpy(&pcm_buff[priv->pos], src_buff,
 			       buff_size - priv->pos);
@@ -196,8 +196,8 @@ static int stm32_afsdm_pcm_cb(const void *data, size_t size, void *private)
 	}
 
 	if (format == SNDRV_PCM_FORMAT_S16_LE)
-		memcpy_32to16(&pcm_buff[priv->pos],
-			      &src_buff[src_size - cur_size], cur_size);
+		stm32_memcpy_32to16(&pcm_buff[priv->pos],
+				    &src_buff[src_size - cur_size], cur_size);
 	else
 		memcpy(&pcm_buff[priv->pos], &src_buff[src_size - cur_size],
 		       cur_size);
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
