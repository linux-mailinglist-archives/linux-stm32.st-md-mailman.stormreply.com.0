Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 009A62347C6
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Jul 2020 16:31:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A55CBC36B35
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Jul 2020 14:31:10 +0000 (UTC)
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76FEBC36B32
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 14:31:08 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id c16so11244588ejx.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 07:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TnSVvBPLgxOr7Okxa4+yFdbMwIKkVndKbRuepRfY/Zs=;
 b=rooF5Y/LejVp6e+lkheBsBcOKwrWhHZzYXHf1m9XAOFNv87fHiPOh8t6nVxb4zVyuN
 QDpyFEFyiTwlk8xKArO+TX4KUIY++pi8GQ2aMGQeJFu49tn7aim8G/kueOGS8tfEIrpQ
 m8Eb/crBpL+aHjgty9b9jP36O8almuZhO0THmWfwhZOGRGmaQuoebyiVPkJPoZnWfb12
 IcMNREwMZeqv+FGO3XG63F7LBQcdiGEnQayFjSUl4e7jJzqbqQliGxVniSm03H8C3sTg
 +qszh99IXLCLTlEOsKO0vTmCHnKjuYFc0sYdgnG4a917/G1WL5EJUUsElxaTKZz5mVRc
 1i7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TnSVvBPLgxOr7Okxa4+yFdbMwIKkVndKbRuepRfY/Zs=;
 b=gEedtwa1z3ut6orVtFCLOI6gQSvvGQT7k60ESMnEjLBkN1O/9oXXxfYEWUyLbGA3Kx
 CsGunT27bNfFlfNEX7W36U45l7hpnmSWH88XeAsCXB79UKlblmVd4nfdeOc4HAWjUI06
 zPvDtZRbkInz4E35qkCA1c+IlM1Z4EO5nulNy9BcqBAx6EZnl60NINbhyNE+z3Mi27ER
 OnZbFMQSDWcDrviFDkI94wavtVNrdkAIW01Fzua/3QQjYIRqUHzoXdhup2B2EqbLQHJH
 VPaTPppM59cCNwg6lfB8d25OX30IsaMAOes0C69Lvsah8IzK6gTBTZ+f1hLxKlwSyFM6
 OyTw==
X-Gm-Message-State: AOAM531qdEBb8T347MmBr4msELelNm1sykgd09iU7BUj1UBIXRrHPgAq
 GwXAdcsNNZg70i8fem1l2Gc=
X-Google-Smtp-Source: ABdhPJybf/XZgZB/Q/5YD/PtnotUkX1ldsL6Uu0I4qModtm+zX/Ggq7KmPlZXxlfNH2FA8a1tV0ngA==
X-Received: by 2002:a17:906:269a:: with SMTP id
 t26mr4331783ejc.286.1596205867955; 
 Fri, 31 Jul 2020 07:31:07 -0700 (PDT)
Received: from blackhead.home ([2a01:112f:a1c:7900:7316:ce1e:7b0b:6bd7])
 by smtp.gmail.com with ESMTPSA id t19sm9749213edw.63.2020.07.31.07.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 07:31:06 -0700 (PDT)
From: Marcin Sloniewski <marcin.sloniewski@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Date: Fri, 31 Jul 2020 16:30:51 +0200
Message-Id: <20200731143053.44866-1-marcin.sloniewski@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: robh@kernel.org, stephan@gerhold.net, mani@kernel.org,
 heiko.stuebner@theobroma-systems.com, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, lkundrak@v3.sk, marcin.sloniewski@gmail.com,
 robh+dt@kernel.org, broonie@kernel.org, mcoquelin.stm32@gmail.com,
 allen.chen@ite.com.tw, sam@ravnborg.org,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org
Subject: [Linux-stm32] [PATCH v6 1/3] dt-bindings: vendor-prefixes: add
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
