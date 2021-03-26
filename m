Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E0534C527
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Mar 2021 09:44:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D472C58D5E;
	Mon, 29 Mar 2021 07:44:38 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F4CBC32E90
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Mar 2021 22:00:11 +0000 (UTC)
IronPort-SDR: 5PMiWbQ630xCqePuNw8EWaVCwOUbFOk5Y9BfvpRu+8UNfzkRmBdrwVROZnRvGZgEkk89Tq1Y5Y
 ztREpiZxd83A==
X-IronPort-AV: E=McAfee;i="6000,8403,9935"; a="211396731"
X-IronPort-AV: E=Sophos;i="5.81,281,1610438400"; d="scan'208";a="211396731"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 15:00:09 -0700
IronPort-SDR: CzeTxe0xAsNYaajyRxXKP2vOoum6MEbKQdiHKYSUG2P2g6L9+x50WpB4rDhgJKJfOR1gxYDezG
 0sb/3cg5pXZw==
X-IronPort-AV: E=Sophos;i="5.81,281,1610438400"; d="scan'208";a="416706835"
Received: from zcmahone-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.255.231.203])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 15:00:07 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 26 Mar 2021 16:59:20 -0500
Message-Id: <20210326215927.936377-11-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210326215927.936377-1-pierre-louis.bossart@linux.intel.com>
References: <20210326215927.936377-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 29 Mar 2021 07:44:37 +0000
Cc: Alexandre Torgue <alexandre.torgue@st.com>,
 Liam Girdwood <lgirdwood@gmail.com>, tiwai@suse.de,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [Linux-stm32] [PATCH 10/17] ASoC: stm: stm32_adfsdm: fix snprintf
	format string
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

cppcheck warning:

sound/soc/stm/stm32_adfsdm.c:120:2: warning: %d in format
string (no. 1) requires 'int' but the argument type is 'unsigned
int'. [invalidPrintfArgType_sint]
 snprintf(str_freq, sizeof(str_freq), "%d\n", freq);
 ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/stm/stm32_adfsdm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/stm/stm32_adfsdm.c b/sound/soc/stm/stm32_adfsdm.c
index 47fae8dd20b4..e6078f50e508 100644
--- a/sound/soc/stm/stm32_adfsdm.c
+++ b/sound/soc/stm/stm32_adfsdm.c
@@ -117,7 +117,7 @@ static int stm32_adfsdm_set_sysclk(struct snd_soc_dai *dai, int clk_id,
 
 	/* Set IIO frequency if CODEC is master as clock comes from SPI_IN */
 
-	snprintf(str_freq, sizeof(str_freq), "%d\n", freq);
+	snprintf(str_freq, sizeof(str_freq), "%u\n", freq);
 	size = iio_write_channel_ext_info(priv->iio_ch, "spi_clk_freq",
 					  str_freq, sizeof(str_freq));
 	if (size != sizeof(str_freq)) {
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
