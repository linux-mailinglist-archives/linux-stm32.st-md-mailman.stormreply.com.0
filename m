Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1D433AF02
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Mar 2021 10:44:43 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96106C57B55;
	Mon, 15 Mar 2021 09:44:43 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1186BC57A41
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Mar 2021 09:44:43 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id 205so3149215pgh.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Mar 2021 02:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=CbjmHJRm4TcYXO0oRyf1xlZJ9yoJ0JVgkkpMngQhXU8=;
 b=H1j2kzhdT64KMrf5si5Kmdxe1wS+9hvbtJuq9Zg4C8dCWO+Q50kTlSwSOFLJtzn+zw
 d4Vayin9bFMW7muKDiWX4+nyKoIeZeVEvtyM8WPaqX8HRLBFsSXLKqyFYjjvLMFuCsBi
 w0H4Z6fr1rYY1KVZnm+eCqhgfCM1IB8nMIboxD/wryfzp6OCM9Fn3S/mguNvVHeZyXNe
 E7bzQPZt0NmjW+h8Uuz6FPMIzhs/H789Nxfdxju/yrwm8EL2+wUB3RNYNhMXRYN8r5NB
 W8a4AESNNlNLj4evdtNDXN398E6MhVuDYjB7w5uFO6JPmfcjM54kAzA5a2JDF5ceZqZE
 xqlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=CbjmHJRm4TcYXO0oRyf1xlZJ9yoJ0JVgkkpMngQhXU8=;
 b=eI5ANX3lLbBOWnieo8wsR5jBXAY/I/GPW5gM7+ZkAlz7NW5sGV8UgPzxnjuxkU9WkS
 mVCaPY7QOv6mzCgSlQqLZR4R3L8oEFgcBHwW7DncDZYDxytxiFY+1ONNovM9gl9WNfm7
 QPFDg7cXKx4qBsfs1nAfAZkj6MrivtFlsK4XpUCgLvZuftFvJfB0fcunGhjcAnf7nMUc
 TqW1HmNqh57sifihJwdCNwc28G9IatzZV683cLP417AtptVKzepbCgbB6yOf00ribcva
 9QEiVbTXwNdiAq2iiJDbPKUMIzzd8S8wCh7uVkvs4g9jknfbODQKAJhWEUncQp5015F5
 bttQ==
X-Gm-Message-State: AOAM531yyFoWnNQgvycVHhsIxNbn9dyr/f5VKms746gIOSJ6avym+dSv
 Kr60xkgM8rl92wKY0lnLlLw=
X-Google-Smtp-Source: ABdhPJztu409uQ2Dy417gMeHfVcQEiZV38uPkhABQvq+zLb4CMKg9RaCsrvGtU4YhefVXak2zSRu5g==
X-Received: by 2002:a63:8c0b:: with SMTP id m11mr22268013pgd.306.1615801481736; 
 Mon, 15 Mar 2021 02:44:41 -0700 (PDT)
Received: from localhost.localdomain ([120.245.122.54])
 by smtp.gmail.com with ESMTPSA id 14sm12780811pfy.55.2021.03.15.02.44.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Mar 2021 02:44:41 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, alexandre.torgue@foss.st.com, a.fatoum@pengutronix.de,
 mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, vladimir.murzin@arm.com, afzal.mohd.ma@gmail.com,
 gregkh@linuxfoundation.org, erwan.leray@st.com, erwan.leray@foss.st.com,
 linux-serial@vger.kernel.org
Date: Mon, 15 Mar 2021 17:43:49 +0800
Message-Id: <1615801436-3016-3-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1615801436-3016-1-git-send-email-dillon.minfei@gmail.com>
References: <1615801436-3016-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Linux-stm32] [PATCH v3 2/9] dt-bindings: arm: stm32: Add
	compatible strings for ART-PI board
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: dillon min <dillon.minfei@gmail.com>

Art-pi based on stm32h750xbh6, with following resources:

-8MiB QSPI flash
-16MiB SPI flash
-32MiB SDRAM
-AP6212 wifi, bt, fm

detail information can be found at:
https://art-pi.gitee.io/website/

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index e7525a3395e5..306e7551ad39 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -53,6 +53,10 @@ properties:
           - const: st,stm32h743
       - items:
           - enum:
+              - st,stm32h750i-art-pi
+          - const: st,stm32h750
+      - items:
+          - enum:
               - shiratech,stm32mp157a-iot-box # IoT Box
               - shiratech,stm32mp157a-stinger96 # Stinger96
               - st,stm32mp157c-ed1
-- 
1.9.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
