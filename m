Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 432501A745B
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Apr 2020 09:10:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB912C36B15;
	Tue, 14 Apr 2020 07:10:15 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D142C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Apr 2020 04:30:18 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id y24so8810029wma.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Apr 2020 21:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EbnZSiEMnHgTN/mDIIGBsmHUVd2FaPr3+pRi3ydpxdc=;
 b=Cn5OcRmnV/FsOvZHrEClH/vFv+XEOER2nAVKrUXl5glM2qw6RE+Qimvigbr0HpL5PE
 qW2u8NBJP2sTfEG0OOEVGdHU1bNJ5XdZ+ebOd2rMYFi+W3O2CpygbEoGuPTx7cVa6pjj
 5TgG1I09ERhcmzIfUj7B4P0aQJK5DJTQmrO2ZHHcbD1mTOFZC9qHG44Kgxbfnh99qeGQ
 A2R7xn7yy1gYCwHwHBpY25uKCIfYUv2deoLcjQkUMmq9s1uI+oysogt0rSqkip72k8Z5
 0XEj2P1EOccs5zvL+u4A7eY/kJ/1flUR3w82q6XDEfriPdBEXPUYBHAglyZT4eyki1MG
 R3Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EbnZSiEMnHgTN/mDIIGBsmHUVd2FaPr3+pRi3ydpxdc=;
 b=Et8PbnXZkSIky/WlDa2f3Hs26OsmDPNX13Us8Jr5+tY7u7+0oJR7q/ATpu0/SvHdun
 LuvqT0y8nCJpHS+o4XFJzWqVfQIhVOaNluuqW24b4BzbI3Z7ZQBO0uNGTqtHiqs/q2d9
 oFPXoNaYzsPfuvoj6jClbK4MTA3bDKcuildEFSgKEgOZkyUUKtpijWpCkPt4+j2xDXYS
 zwqzNfNt12ZtcFvETHmMRZpbAf6WQPxB2o8+R4ngiZFpQfagPbT3WuEOnogJSofGqYS4
 A6hksOhs9ljwuBznGgWQoC5Pd3Yv/ZvrD0PTAmjJrtGx+AbUryEHksI7RgNN0US7MfHy
 ISWQ==
X-Gm-Message-State: AGi0PuZH59HeR8ExRk6ucV7DPUiaJ2GRnwNQtKMNgj5WfbpPY0tPL/mV
 thvpfaghUrvGbGkCsWX1+P0=
X-Google-Smtp-Source: APiQypJqzsG5xE7UIV/7jHME578hAykas9gVz9OtdHMsoHKH3Nw7qn3xHFVFEoe++RD96wFYJR3fag==
X-Received: by 2002:a1c:7308:: with SMTP id d8mr17695093wmb.31.1586752217830; 
 Sun, 12 Apr 2020 21:30:17 -0700 (PDT)
Received: from basti.fritz.box
 (p200300D1FF00AD00593005B1452DFD52.dip0.t-ipconnect.de.
 [2003:d1:ff00:ad00:5930:5b1:452d:fd52])
 by smtp.gmail.com with ESMTPSA id b82sm13668229wmh.1.2020.04.12.21.30.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 21:30:17 -0700 (PDT)
From: Sebastian Fricke <sebastian.fricke.linux@gmail.com>
To: olivier.moysan@st.com
Date: Mon, 13 Apr 2020 06:29:52 +0200
Message-Id: <20200413042952.7675-1-sebastian.fricke.linux@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 14 Apr 2020 07:10:13 +0000
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 sebastian.fricke.linux@gmail.com, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] soc/stm/stm32_sub_sai: Add missing '\n' in
	log messages
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

Message logged by 'dev_xxx()' or 'pr_xxx()' should end with a '\n'.

Fixes: 3e086ed("ASoC: stm32: add SAI drivers")

Signed-off-by: Sebastian Fricke <sebastian.fricke.linux@gmail.com>
---
 sound/soc/stm/stm32_sai_sub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index 0d0c9afd8791..34a7c3d6fb91 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -837,7 +837,7 @@ static int stm32_sai_set_config(struct snd_soc_dai *cpu_dai,
 		cr1 = SAI_XCR1_DS_SET(SAI_DATASIZE_32);
 		break;
 	default:
-		dev_err(cpu_dai->dev, "Data format not supported");
+		dev_err(cpu_dai->dev, "Data format not supported\n");
 		return -EINVAL;
 	}
 
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
