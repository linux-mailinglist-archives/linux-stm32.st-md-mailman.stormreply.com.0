Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2785922888D
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Jul 2020 20:53:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2D14C36B2A
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Jul 2020 18:53:40 +0000 (UTC)
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D7E9C36B27
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jul 2020 18:53:39 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id br7so22682993ejb.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jul 2020 11:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TnSVvBPLgxOr7Okxa4+yFdbMwIKkVndKbRuepRfY/Zs=;
 b=eek7cfh8H0FIKKTKyBOBHTZXYqIWxEk2P6Dapr54GUi+cu4HMdvEVwngy6fLz1aDzg
 U0nFCc4ud2FYMXTUQrRiT3tbHejhwGgihOl42ahAgrjrWuM+I6d+6HakuuuzNG5ftqYA
 xuCEbud/W7cgGEpDBQ5xy/W+JlSt3RtlznZhLpdcwEYoAyVWbDcCOYYwBrNxKEgeoOMC
 6FDXsMt+noVatUZPGb7f1gVvQIHr5TUNngAYmHT2s7tnARRznT1CYQ4c0RqU9o93V5wz
 509Oa0X8gkl6SAoeDJ4Kup24jKoQqX8R2+/nUcXa20nn62TkcC4RLCZ7amX1hKN/LYhJ
 nd8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TnSVvBPLgxOr7Okxa4+yFdbMwIKkVndKbRuepRfY/Zs=;
 b=FtsYAdA6nVdNFEFi4Ow7hqCtZRzCFfASrZ3gkuNUL7PbV5bbgzXC+RyWaYQe7OaoWg
 HDaj1EpBQljGi9ncaX915LP3tErOJG4GylTHPvx71tHC6NBeOi1ZKHI/ddSPepsExMJ6
 9ZjNcLWGmDfXjuQBj4B2+E+Unb9yt1rRKf7NRo86wOv6YqgJXZeX0pMnk3LL3723OsWg
 qBpzZ4FbqMkbrnfgPtoRPnufFXbkCfSGvNPvijHFsjLmVuwyXkH/zrqx2d519qbTPRnn
 8YLxKg/+XAwpM6zNhSdEXMz5IeTnYZDSPEQAADlMQrd7lVhc7Tu1XJhdN73IwaUkCcOv
 obEA==
X-Gm-Message-State: AOAM5323gRr/PgNHARrlbevEdUcPjsg/H5BvMWB/ND9ZDDUJ1zXfpYDc
 7tmjgaeZ1FBBXMYWcM+BMlE=
X-Google-Smtp-Source: ABdhPJziAjyw97m/l3cd7CXgr1VWPs/5ficOCx+UJ5aQJNaPKvKkhN4gy0cXRhfSU6uY54k9dE/I3Q==
X-Received: by 2002:a17:906:7c8:: with SMTP id
 m8mr26420200ejc.527.1595357618581; 
 Tue, 21 Jul 2020 11:53:38 -0700 (PDT)
Received: from blackhead.home ([2a01:112f:a1c:7900:7316:ce1e:7b0b:6bd7])
 by smtp.gmail.com with ESMTPSA id f10sm17585506edr.69.2020.07.21.11.53.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 11:53:38 -0700 (PDT)
From: Marcin Sloniewski <marcin.sloniewski@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Date: Tue, 21 Jul 2020 20:53:12 +0200
Message-Id: <20200721185317.208722-1-marcin.sloniewski@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 Lubomir Rintel <lkundrak@v3.sk>,
 Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 Mark Brown <broonie@kernel.org>, allen <allen.chen@ite.com.tw>,
 Sam Ravnborg <sam@ravnborg.org>, linux-stm32@st-md-mailman.stormreply.com,
 devicetree@vger.kernel.org
Subject: [Linux-stm32] [PATCH v3 1/3] dt-bindings: vendor-prefixes: add
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
