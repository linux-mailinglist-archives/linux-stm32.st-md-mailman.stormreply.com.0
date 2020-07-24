Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4926822C86C
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Jul 2020 16:51:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E725C36B27
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Jul 2020 14:51:31 +0000 (UTC)
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9694DC36B27
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jul 2020 14:51:29 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id v18so1923345ejb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jul 2020 07:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SoBgP3OEfZo1S+W2OL+antn28vvn8c/8vKe/rfz3jjQ=;
 b=AC2jBv5CJFC7Q9ATElbSLWXwqiYW3iBMiPBzoTepUfXEzYYG/GVIvKCNoZ5oUk3WyZ
 pxx3miWVrxAt3L95Dqksz8kXt27nvNNn3ISV6pv3KlEK3wM7c//ms3PSaMsjMB0OoGQZ
 R/4YZM+lCjWuS+oy3zhgBLGkDtV3H8Ao92ObOqDWqzn+tUBDwGMGVaMqqyIEjvIAjDrr
 YaMT7IV+tCkDSYb1DgsD8dmcZ5LZy5hCNAz6KMtbh6/eNvdz8nybnqUTqLyDGG7uTvHp
 cQ+k156Dpm98KybgSbg6muYW+1PqDpw0KNPTZSxq2bQ0VRdmVRxdlDhzNuBQfzLUg0jn
 VAzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SoBgP3OEfZo1S+W2OL+antn28vvn8c/8vKe/rfz3jjQ=;
 b=F4klEzDli8XmYcFuOClwQepE6tjWPZrtViW8Q5eZ55GDE6Yf/OMnkF2qicdbWowVbO
 kyd1z4LyYXM6ePlwSI+uWhV7SYDs1JUl86I78MIcZP1HXp7HUigaZOQENvRX42mXc6oy
 cexUsii1r9mxD+zoRzlJE65kpuUrgMDCWZIy+2PQyDm6yLy7x7TzeuRKTqqMNDM4hUGb
 4AAQlKsIrmsQ3U6jMmAQ7JQBbJY/Pt14QwnfuRB0wTeOna1W6xh8w8ztfuDB+mm8QQza
 rZKXYwv8kGiWavAyfd7Kbea9bIsQ04leK472PXFi2XZanTyBevx5LD4TzAsuZsn+n2D9
 tazA==
X-Gm-Message-State: AOAM530+Jqsx5NMfnR7Q5mn7CED7tWw27XyYyohNeCQL3cvMl53jQ4tS
 jxs8dg2tKK0tXHPPzL6t/uU=
X-Google-Smtp-Source: ABdhPJwigOug5YS2zDWbTF33JR8oprff0trdhlk1ZkvsxHcvm7s/3uhfS83C7ZSn09NpOyyeSA43mA==
X-Received: by 2002:a17:906:cc4a:: with SMTP id
 mm10mr7602288ejb.451.1595602289234; 
 Fri, 24 Jul 2020 07:51:29 -0700 (PDT)
Received: from blackhead.home ([2a01:112f:a1c:7900:7316:ce1e:7b0b:6bd7])
 by smtp.gmail.com with ESMTPSA id m6sm788309ejq.85.2020.07.24.07.51.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2020 07:51:28 -0700 (PDT)
From: Marcin Sloniewski <marcin.sloniewski@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Date: Fri, 24 Jul 2020 16:51:06 +0200
Message-Id: <20200724145107.35772-2-marcin.sloniewski@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200724145107.35772-1-marcin.sloniewski@gmail.com>
References: <20200724145107.35772-1-marcin.sloniewski@gmail.com>
MIME-Version: 1.0
Cc: robh@kernel.org, stephan@gerhold.net, mani@kernel.org,
 heiko.stuebner@theobroma-systems.com, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, lkundrak@v3.sk, marcin.sloniewski@gmail.com,
 robh+dt@kernel.org, broonie@kernel.org, mcoquelin.stm32@gmail.com,
 allen.chen@ite.com.tw, sam@ravnborg.org,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org
Subject: [Linux-stm32] [PATCH v5 2/3] dt-bindings: arm: stm32: document
	Odyssey compatible
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

Document device tree bindings of Seeed SoM and carrier board.

Signed-off-by: Marcin Sloniewski <marcin.sloniewski@gmail.com>
---
 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index 790e6dd48e34..3b318fe15194 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -50,4 +50,10 @@ properties:
           - const: st,stm32mp157c-ev1
           - const: st,stm32mp157c-ed1
           - const: st,stm32mp157
+      - description: Odyssey STM32MP1 SoM based Boards
+        items:
+              - enum:
+                  - seeed,stm32mp157c-odyssey
+              - const: seeed,stm32mp157c-odyssey-som
+              - const: st,stm32mp157
 ...
-- 
2.27.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
