Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80ABF9504FC
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Aug 2024 14:32:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2CCA7C6DD9A;
	Tue, 13 Aug 2024 12:32:13 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 59956C6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Aug 2024 09:48:58 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2ef248ab2aeso82279371fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Aug 2024 02:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google; t=1723542537; x=1724147337;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=h878N1ltMbwyps1BBLvUzwBZh69S/6revIrfQoK+5EQ=;
 b=HzwMDmRVphb+4M8z5FSRJ86/fE4e4eedPKwvpNouleVddhCCx1SY0lTiyzscEo9WgZ
 KRLVSbFhwlitBAp5rZxJIaB4FIq5zRiNn7hUTPMOHR/1wA5gq4EsxEvfs3eDo698MdAL
 rUtYg56uOPnIyQ3f/lNr7uqOodCR4lqJ6gRYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723542537; x=1724147337;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h878N1ltMbwyps1BBLvUzwBZh69S/6revIrfQoK+5EQ=;
 b=bDzX5wa3g3+/uSFTPrVAvcio4KykT6eCKgjMKtOHrMlI/6QIFah+rNux9m3jAMcb9q
 8AoMu3QteyTaMiVDyp8sGA93f8/vsbMQcWLN6/0UpAGpDJAvpVIwwLD96rBpJJVeHdo3
 zybRXurPLFyx5w8S0b3IxD+dRLMLRP5u6ov3QkptBw8E/1wr8PBGIubRPWeGuqEe6Gtj
 pW5++o5LhYGj7x2SzvvBKH7szpTbAyK7NYbOJ8pP/zSoIcwuTLObHpJ+yH8SZP5cP7Af
 IWIZfnfq7PmaPudYvZfQJvsgx4QdDJfA2XIIvjyXvKJxuAB4Rk4zvrtG7nk55J7jBjiA
 Dykw==
X-Gm-Message-State: AOJu0YxA96sWTG94OP8dAu//X1UgvbhPVuaGiWIKDAYHcU2javesU5yx
 v4rONMTHKkKWLTd9fKhqHu8iWwqV2tY9MnNDgDBXtkJAAcY38nNsKVqmYjIa47w=
X-Google-Smtp-Source: AGHT+IFyaivarUL51wlthGyrH39YfO53KObdJGwmf6kji3tTiJEkFRg2CDGM0zOg8uYNy2SdNWXqww==
X-Received: by 2002:a2e:9591:0:b0:2ef:2dfd:15db with SMTP id
 38308e7fff4ca-2f2b715542amr25402491fa.19.1723542537241; 
 Tue, 13 Aug 2024 02:48:57 -0700 (PDT)
Received: from localhost ([81.216.59.226]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f29af3abe3sm8919721fa.58.2024.08.13.02.48.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2024 02:48:56 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Marek Vasut <marex@denx.de>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Tue, 13 Aug 2024 11:48:56 +0200
Message-ID: <20240813094856.2002113-1-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 13 Aug 2024 12:32:12 +0000
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: include st,
	stm32mp13-regulator.h in stm32mp131.dtsi
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

From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>

The file stm32mp131.dtsi uses symbolic constants such as
VOLTD_SCMI_REG11, VOLTD_SCMI_REG18 etc., but does not include the
header where they are defined. So when adding a new .dts file that
includes stm32mp131.dtsi, the build breaks unless the .dts itself
includes st,stm32mp13-regulator.h.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---

OTOH, it seems that (if this is applied) stm32mp135f-dhcor-dhsbc.dts and
stm32mp13xx-dhcor-som.dtsi could drop their #includes as they do not
use any of the VOLTD_SCMI_* constants except through stm32mp131.dtsi.

 arch/arm/boot/dts/st/stm32mp131.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
index e1a764d269d2..490d38dc8d54 100644
--- a/arch/arm/boot/dts/st/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
@@ -5,6 +5,7 @@
  */
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/stm32mp13-clks.h>
+#include <dt-bindings/regulator/st,stm32mp13-regulator.h>
 #include <dt-bindings/reset/stm32mp13-resets.h>
 
 / {
-- 
2.46.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
