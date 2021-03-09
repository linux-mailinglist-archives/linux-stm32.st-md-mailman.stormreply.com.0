Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E0B33267A
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Mar 2021 14:20:45 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C7EBC57B78;
	Tue,  9 Mar 2021 13:20:45 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2D3EC57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Mar 2021 13:20:43 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id 30so1989042ple.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Mar 2021 05:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jNbuVcZgloeyR2LVzHohVrUsgceqLUUAvFiu7EZYLL4=;
 b=OiDLg/jNmamc1mtL3gaPFwjt7jTKbMZ+aqomYModCj29Z1bpZ82+RHODdUZKFDVcfR
 z9p7UcTX5W5PpVCGnqmRT/MQB+mR1h31g0syjgDDZRIVLGMBI/1OJmfQOTwsKF0GQ8jx
 2bYh9ALrtmpTRmnyABFOEuVjb2fDvLPI418tYkQmF0qzu7vR5vNvHnWp4FD8scgEkixV
 8slgACiMoWoTxY4dm9l1tNn9lFZh8a7vjL/FfW/XcbnPzLoxEF7cgFphI1RKH6tSNTPi
 KpovAM357vJ5wm8k+24tqNJw6aZqevtzJF4hVMK4EcErGsX9t/GFhttmAtlZpVG+sahZ
 gMBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jNbuVcZgloeyR2LVzHohVrUsgceqLUUAvFiu7EZYLL4=;
 b=PpbdqAn312lTeBPK2iuADs8oiyKfaEMYLIilwEgRxzOI4PdRtPuWTqdjA1Ps6ZwIhq
 2v9jQfkmtIvQVpornoatumRmuXEEi4NLJcjA/zNWneQ86wp8w1nhI/XF4MUBNzz2pHAP
 ss/lGn6ccrQod/6IoPsr6J3BOgLwm7r754BCtzZOJoPHlFUOjVIzKj4460Z8sCFY4Nfd
 oVrQdUuzpc/6/2cTeuWpkHiMfBO1onZemn6PAXk8BzoAQJ5P/MsHLkAtMoI6dwcCIiTf
 5uCr/etaGABd3tJmzuz5DwLrOYoTZ/k8gvJT+j/dqzklD8ebgxAOA8YbNI4Vk/6d9sYV
 yyHQ==
X-Gm-Message-State: AOAM530l0d4ZZ6I+4RehcADOanqSsRiwyUsbSUDZaMShTXMXzTpPiSI0
 2rcwOmvVr0q+mCURPmNEzHc=
X-Google-Smtp-Source: ABdhPJwEpv8MPkJndDfnJHfd27hFk1fPpQhJPLsyGIytQ7HNvZsyMi2HU3uDDtSNepF1K82XCBwm8g==
X-Received: by 2002:a17:90a:a63:: with SMTP id
 o90mr4795577pjo.90.1615296042338; 
 Tue, 09 Mar 2021 05:20:42 -0800 (PST)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id y9sm7647421pfl.201.2021.03.09.05.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 05:20:41 -0800 (PST)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Tue,  9 Mar 2021 22:19:19 +0900
Message-Id: <67c6b42f44015b24eeb8136b2efda28aa41cd055.1615293276.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <cover.1615293276.git.vilhelm.gray@gmail.com>
References: <cover.1615293276.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v9 06/33] counter: 104-quad-8: Add const
	qualifiers for quad8_preset_register_set
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

Add some safety by qualifying the quad8_preset_register_set() function
parameters as const.

Cc: Syed Nayyar Waris <syednwaris@gmail.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/counter/104-quad-8.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/counter/104-quad-8.c b/drivers/counter/104-quad-8.c
index 0fd61cc82d30..51fba8cf9c2a 100644
--- a/drivers/counter/104-quad-8.c
+++ b/drivers/counter/104-quad-8.c
@@ -632,8 +632,8 @@ static ssize_t quad8_count_preset_read(struct counter_device *counter,
 	return sprintf(buf, "%u\n", priv->preset[count->id]);
 }
 
-static void quad8_preset_register_set(struct quad8 *priv, int id,
-				      unsigned int preset)
+static void quad8_preset_register_set(struct quad8 *const priv, const int id,
+				      const unsigned int preset)
 {
 	const unsigned int base_offset = priv->base + 2 * id;
 	int i;
-- 
2.30.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
