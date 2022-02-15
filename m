Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 457BE4B6112
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Feb 2022 03:34:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EAC8AC5F1F2;
	Tue, 15 Feb 2022 02:34:08 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B35BAC5EC76
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Feb 2022 02:34:07 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id x3so10729566qvd.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Feb 2022 18:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=06Kfv1DXtnVDrheRxya2snTjYCwD2TQR57hbpR3zm0s=;
 b=OJUTaC8m4FlgAFC/uh7uJBfFqqP/RkqnhJTE59PCuIH76NWYuimLf/S2LQejeyi662
 bFda6a/SPjSJoKXe3yWCje0n+Q7l+ikqo8j32lVc2XsHc+bQOjG/sm1PqP9+sY1HOAjd
 0P3Z00beuW1C64qL8bVTHg7+XTkp2++lLg9XgBKZcs8PU/jOoFFZgEY9PfSk5k2QjTsd
 fZVQx0j0E/RbeOCEDPeRkOxyBIbyxVKnYOBJIVleOCox0eXHYItVAUeq/JL4Ahc2mUcb
 cmYPtxBdWHYwsGxkhaPXC0+vjH0cSXY0cMfLHzEWiLX09nsWGZH4VI0hPTDwT3BKJNvv
 B0kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=06Kfv1DXtnVDrheRxya2snTjYCwD2TQR57hbpR3zm0s=;
 b=EyOmKAan9ELW3OydoucM23qz5S11ZB/CPD/Gjfo37YhzR/gru+bN9T2iiBQbwJe0hX
 +JHQuXjq5uCMzNueG4K5yea5E1znDbQsZOc3RB/pAIKKr/g44MuhpA8mk6U3CpV2ZNyu
 eL+pc8NnCNywNuVHkE4gNFmofTdB2yGcgskXtaiD6NUhAfYs/+jUJr0N8ZVydaWpSFeK
 b4flQ3rz/DEsMmTUKh2CSv+fRrlUf8eMRUtxjWw6yUnXxtnOTGFJRmPUo/Q3WKdW65cD
 D2MSop2KxO69UjuJUAZ6+ITPLIIFwa8NoFdoPuUQdxH3RDiRzE6ZNK4HsjuHOQdyzhY2
 pgig==
X-Gm-Message-State: AOAM532mayVFxRuu/hCfZ2e6E0poK9+qQMD+TIanGD6ZZcihJ1IX7dIm
 Y7+JHD4zuOrcv848iM92iRA=
X-Google-Smtp-Source: ABdhPJysV3vOFxo9MY9xSnNFS0irUrGngNCaqUIS5vyTJGLJ3J7HfDrRw4++7et3pzr7mwdIB3xOgg==
X-Received: by 2002:a05:6214:1c07:: with SMTP id
 u7mr1073836qvc.129.1644892446726; 
 Mon, 14 Feb 2022 18:34:06 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id s1sm18976509qta.0.2022.02.14.18.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 18:34:06 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: deng.changcheng@zte.com.cn
To: nbd@nbd.name
Date: Tue, 15 Feb 2022 02:33:55 +0000
Message-Id: <20220215023355.1750720-1-deng.changcheng@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: ryder.lee@mediatek.com, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, arnd@arndb.de,
 netdev@vger.kernel.org, kvalo@kernel.org, sean.wang@mediatek.com,
 linux-wireless@vger.kernel.org, alexandre.torgue@foss.st.com,
 deng.changcheng@zte.com.cn, matthias.bgg@gmail.com, Bo.Jiao@mediatek.com,
 linux-mediatek@lists.infradead.org, mcoquelin.stm32@gmail.com,
 lorenzo.bianconi83@gmail.com, kuba@kernel.org, Zeal Robot <zealci@zte.com.cn>,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 shayne.chen@mediatek.com
Subject: [Linux-stm32] [PATCH] mt76: mt7915: use min_t() to make code cleaner
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

From: Changcheng Deng <deng.changcheng@zte.com.cn>

Use min_t() in order to make code cleaner.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
---
 drivers/net/wireless/mediatek/mt76/mt7915/testmode.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
index 83da21d15ddd..61f255166a7f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
@@ -228,12 +228,8 @@ mt7915_tm_set_ipg_params(struct mt7915_phy *phy, u32 ipg, u8 mode)
 
 		ipg -= aifsn * slot_time;
 
-		if (ipg > TM_DEFAULT_SIFS) {
-			if (ipg < TM_MAX_SIFS)
-				sifs = ipg;
-			else
-				sifs = TM_MAX_SIFS;
-		}
+		if (ipg > TM_DEFAULT_SIFS)
+			sifs = min_t(u32, ipg, TM_MAX_SIFS);
 	}
 done:
 	txv_time = mt76_get_field(dev, MT_TMAC_ATCR(ext_phy),
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
