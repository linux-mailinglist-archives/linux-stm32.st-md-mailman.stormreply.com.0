Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 504EEAC3FA6
	for <lists+linux-stm32@lfdr.de>; Mon, 26 May 2025 14:54:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F10B0C36B10;
	Mon, 26 May 2025 12:54:07 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30986C78013
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 May 2025 22:19:46 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-739ab4447c7so64242b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 May 2025 15:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sima.ai; s=google; t=1748038785; x=1748643585;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/JnkXPK73+jyylcV6ryL6CGzS49ASbFWgmp+uGzB8Mk=;
 b=Em/TEu8oc/QHcDgTPqm1X0vdlKeBSJs0YO5ZUKkYCaHoRH6VPOlDn1RkWizTcqepD/
 Wj6ebija6gHRIOUhJh0X2TXyrKR3m/fx/at5TwFXeGFtXfnIIGGBdMvOAfJxOiR6n3hq
 JMYgjDOpUG41NLwVU5ijI7TEWoDizej3n4GPp4Z7z9+rd0vAMxlTU+f+o0pREKi2JngZ
 Ia50gO/wclfXER5YbYqEaBi6u2LnYSCZ3gnyGCi3lttdrdpnJE9pAg2L5L2eAc8WxlVf
 ghgxzE99EZlajrI6d7lMfjtcykOhpPkTtI2Q6tc0gVOcFYwHz574K86nltEUOZzLtHEc
 YTDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748038785; x=1748643585;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/JnkXPK73+jyylcV6ryL6CGzS49ASbFWgmp+uGzB8Mk=;
 b=BqVTlyaKnT7h7UUdf9aTuTYsH/ocwPXBJHPacpN9UzfybUha8kWZiYgYAd/piv7Jor
 qJA3sujWXAFtr3iTAKU7gURDjGy+JDxRRi42U0kPiLxTCbGvns5QLT4hKeHtE2SimVNJ
 X0u+h19dNw+GV+5/Ps/Zjnz24t001wtg635bGFr3vg1Z0eMAh+eJVIfk/4VFOFxh6ocq
 H6PDkwQyL6fMwClDoUMHaI2QdqxYs+P87w0DXXH6v5MZWCCiIRK4R98mnm9W4BYSn+x2
 z5f4WOFFWcSXk+dyjwPq4f5K/WaByV5wrYnHJ0jknztIxrf6TzSIPLNHdAlnOqfBnxi9
 aJyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkv35SzW5ZiwYEAf87HYW/vEMbniDY/2uHmPDfYz5b50SWiYPCHwj0N2O8I1K2/RTLXeFd+xBbNIVkfQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YysLVFW1tsDX+xoGeGSqJ5DBtf5LWRWdwiDpjadIc/YALeCK1Fk
 RVNaR8SJTnIi758hCyXKWyZXvJGHVtoxFr4Tif3yfPrO/6b6Z9Vqjcsx+Pk4nV8xqO4=
X-Gm-Gg: ASbGncvmH+3rbLxxrnqOp8DmhZXK6YhfYvEkpmKJFu1BxB3tgYbXrAOVvmrg736fJK6
 3yoFrCq9RQEFKEQu6Fj4QZ0LpeBmu5X0bj+jgjrNG9WR/a5Owq7zhKcP6/EShtkfve9Ys14uPNU
 86RKu/+iBYmUZjWa+p1WBQtMyfetTbN6HFhitZ97XgDZfYC5HoKJWjnu1XC55138+6t8xRtzxr1
 l8k470o0Da/PnOIY0EfyRGZUVvR+390sz+aqruDd+pmnYKvOLOqq5WP04eX9IRaFWO5qHRnarw/
 LblI5Vw1l6GKP84iLdvkxdscVk4ObsX95c5JS0J51T6a65fuH+6uUPNnW2/Kre+9/jFT1Q==
X-Google-Smtp-Source: AGHT+IH4iorXbLRI5th5BQNEszM355fKXRMdiHktjuRWLWFcJzliHo+SpZz99EM6pMvifOreU1FWMQ==
X-Received: by 2002:a05:6a00:8083:b0:730:915c:b77 with SMTP id
 d2e1a72fcca58-745fde77910mr655216b3a.1.1748038784743; 
 Fri, 23 May 2025 15:19:44 -0700 (PDT)
Received: from nikunj-kela-u22.eng.sima.ai ([205.234.21.7])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-742a96dfa2fsm13309759b3a.2.2025.05.23.15.19.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 May 2025 15:19:44 -0700 (PDT)
From: Nikunj Kela <nikunj.kela@sima.ai>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com
Date: Fri, 23 May 2025 15:19:38 -0700
Message-Id: <20250523221938.2980773-1-nikunj.kela@sima.ai>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 26 May 2025 12:54:05 +0000
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 0x1207@gmail.com,
 rmk+kernel@armlinux.org.uk, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Nikunj Kela <nikunj.kela@sima.ai>
Subject: [Linux-stm32] [PATCH] net: stmmac: set multicast filter to zero if
	feature is unsupported
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

Hash based multicast filtering is an optional feature. Currently,
driver overrides the value of multicast_filter_bins based on the hash
table size. If the feature is not supported, hash table size reads 0
however the value of multicast_filter_bins remains set to default
HASH_TABLE_SIZE which is incorrect. Let's override it to 0 if the
feature is unsupported.

Signed-off-by: Nikunj Kela <nikunj.kela@sima.ai>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 085c09039af4..ccea9f811a05 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7241,6 +7241,9 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
 					(BIT(priv->dma_cap.hash_tb_sz) << 5);
 			priv->hw->mcast_bits_log2 =
 					ilog2(priv->hw->multicast_filter_bins);
+		} else {
+			priv->hw->multicast_filter_bins = 0;
+			priv->hw->mcast_bits_log2 = 0;
 		}
 
 		/* TXCOE doesn't work in thresh DMA mode */
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
