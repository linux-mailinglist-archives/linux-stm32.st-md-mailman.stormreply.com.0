Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5366A22C869
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Jul 2020 16:51:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F3A52C36B27
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Jul 2020 14:51:27 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DB68CC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jul 2020 14:51:26 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id c2so1380303edx.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jul 2020 07:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TnSVvBPLgxOr7Okxa4+yFdbMwIKkVndKbRuepRfY/Zs=;
 b=EKfhrwLSBlpUDSfbwmy+TKVdItuEwUFE+rwpl/BBpHVTunh1HcunYRzV/UAkFOmt4A
 +ZpYGfCaAYqngbG0R7SiTq9t/pLcYQQ7ySNDaiOGnU8SfNGkuUSVdw2yfjIlpxwg2IBI
 K62lCA7typmCS7SuWiAcWyH5Vh6Nw6RqBfhW16lMVG53+Bk1hup9RKNNC/y8DBgAOjuZ
 p4JaoGNkcRqUBKV5iLKpWbHmM8gkgfr0vTVsX9hA1ZyGNmOejtiVzNnhyMX4Gn2QKGyE
 p/pWRyK9w/GwjpKz2v+oeJOlrCbS/i3Ry4F+lZS+6ibl2wcGkQlh9VSXcvhVA6c2vj5y
 K9pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TnSVvBPLgxOr7Okxa4+yFdbMwIKkVndKbRuepRfY/Zs=;
 b=rHGcd0ZA825ZaFK6e5yFAGG0cBFN5VvkpZSx4Tk0yAFpfBx/H+fgA+T8TJ89ZpFsGM
 XKnS5gZ88+KYNZnaAbfyyxIx1Axvec3++OVShWES/6GM3dnYdszkBPQ7NDfB3NQbaErn
 R4HL9OaLyBmWhJ5BQ4AXaZO1nkSLCRxF+xviSk+gISeLOXxfupt3UEHFVBJYUobYdY6K
 a0xg3T91YS6LyxEtxMdwc7hpj2uVPTHnnsPhCbA2Oj5MZbvcbx6gEkG6w3du4lTTxeih
 3o1cxk1QDklJ94cEnZI9cGgPpldddeTsXXlK5sbPZPy9o1EoERq8BbMyafyaE6//H/uC
 fZ8A==
X-Gm-Message-State: AOAM533d9bZoYxgBtvJkil/zdRIkoJTi1FyLSO1CdVFIEPEBsfgxEZcE
 7JIFxn0AjvWzKWd60GE4Vpk=
X-Google-Smtp-Source: ABdhPJwvLYHGjgAuJ7dGovxJ5+5LP8JUWjKsoUMQ6Gld/w48Bq1GyMyLuJ0WRDDnmf7FBWJO/1wKaQ==
X-Received: by 2002:a05:6402:1d97:: with SMTP id
 dk23mr9525309edb.1.1595602286010; 
 Fri, 24 Jul 2020 07:51:26 -0700 (PDT)
Received: from blackhead.home ([2a01:112f:a1c:7900:7316:ce1e:7b0b:6bd7])
 by smtp.gmail.com with ESMTPSA id m6sm788309ejq.85.2020.07.24.07.51.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2020 07:51:25 -0700 (PDT)
From: Marcin Sloniewski <marcin.sloniewski@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Date: Fri, 24 Jul 2020 16:51:05 +0200
Message-Id: <20200724145107.35772-1-marcin.sloniewski@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: robh@kernel.org, stephan@gerhold.net, mani@kernel.org,
 heiko.stuebner@theobroma-systems.com, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, lkundrak@v3.sk, marcin.sloniewski@gmail.com,
 robh+dt@kernel.org, broonie@kernel.org, mcoquelin.stm32@gmail.com,
 allen.chen@ite.com.tw, sam@ravnborg.org,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org
Subject: [Linux-stm32] [PATCH v5 1/3] dt-bindings: vendor-prefixes: add
	Seeed Studio
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

Add the "seeed" vendor prefix for Seeed Technology Co., Ltd
Website: https://www.seeedstudio.com/

Signed-off-by: Marcin Sloniewski <marcin.sloniewski@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 9aeab66be85f..7dd03b3e9d3c 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -902,6 +902,8 @@ patternProperties:
     description: Schindler
   "^seagate,.*":
     description: Seagate Technology PLC
+  "^seeed,.*":
+    description: Seeed Technology Co., Ltd
   "^seirobotics,.*":
     description: Shenzhen SEI Robotics Co., Ltd
   "^semtech,.*":
-- 
2.27.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
