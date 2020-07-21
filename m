Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B9122888E
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Jul 2020 20:53:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A504C36B2A
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Jul 2020 18:53:46 +0000 (UTC)
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C235C36B27
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jul 2020 18:53:45 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id ga4so22659724ejb.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jul 2020 11:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q9aNpNKaa3hKIU8fbCISqJpdam9Hz159Xkk+hYct4wA=;
 b=DEAQo5shwBlvBDRE4dq0fqNYhqsjuBfmp4YDc8urvZqI7UMHffWCHF973BrWjh6I2c
 bBf3A0VyCMOcf0jc43LARef9Y+1omwycwLNv412cwFJKSccPWfxBSnlzwsuvMZCjF8Ui
 grcWepGGTFfaJ8OroAzf1RbFtkz03FBMp1QBQbwVNB5Gev6vdT+E/jZO9uekvf9CjKFM
 Zj3tkumqKiB6cidZvhh3gSNZhSaR8P0IS5zUL+8KWUeiM3+jqHi9HiroiCQJ75Ts8jRa
 3I26u9vQRsqVX+KJJ4dSTbhUZI/RovjTvOxhWsF7PHQUBzzWA2PYngOSQSe6FoeC8FWy
 gO1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q9aNpNKaa3hKIU8fbCISqJpdam9Hz159Xkk+hYct4wA=;
 b=CytLjufWNjD0S+ARxH76twfLllf2/clMCfJuH0amjLd43/+Q2IsGL+KJXwhHTawq+G
 2CHjUBmKyRKnlwYLm9o36DUpdn3NEpbL2XJ36VI2IOtuu4om7hG2v6Pc3r3jbxTm+BKp
 2luCV59aNYh+c1ouoZ/3F0tgSvTAnar9QwoGn02chsLSXQiBNw1R+9oHIk+H/AxR4yVX
 v9Wb3hbWd0Coaa/5r7jaPiMHwpaCFWT/26+lujYN4enRcAJMN8ZUy4VGe4mhopm4e8tF
 RylfiJJb1OEOSepexXwfPqHRdRWZrqxuNDxUxeOEXq5r5Etb9rlw+iWjzBXLqKvg8h9u
 HYuA==
X-Gm-Message-State: AOAM530mWwIdSkoMBQStQBEkaRZNwBnKsEyiUtKU64oSNr7U+lUx9Y1o
 mD0m/VYIdsV8KUkIEbAi8Q8=
X-Google-Smtp-Source: ABdhPJx2PEmZzBGyKk4N7s3Eq4qDceCGTBVNcZ+IU16CpoHMs71/47vgt34rCkU5sCNoiMFM0uFsvQ==
X-Received: by 2002:a17:906:4a87:: with SMTP id
 x7mr25245724eju.44.1595357624699; 
 Tue, 21 Jul 2020 11:53:44 -0700 (PDT)
Received: from blackhead.home ([2a01:112f:a1c:7900:7316:ce1e:7b0b:6bd7])
 by smtp.gmail.com with ESMTPSA id f10sm17585506edr.69.2020.07.21.11.53.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 11:53:44 -0700 (PDT)
From: Marcin Sloniewski <marcin.sloniewski@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Date: Tue, 21 Jul 2020 20:53:13 +0200
Message-Id: <20200721185317.208722-2-marcin.sloniewski@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200721185317.208722-1-marcin.sloniewski@gmail.com>
References: <20200721185317.208722-1-marcin.sloniewski@gmail.com>
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
Subject: [Linux-stm32] [PATCH v3 2/3] dt-bindings: arm: stm32: document
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
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index 790e6dd48e34..22b9aaa75eee 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -39,6 +39,8 @@ properties:
           - enum:
               - arrow,stm32mp157a-avenger96 # Avenger96
               - lxa,stm32mp157c-mc1
+              - seeed,stm32mp157c-odyssey
+              - seeed,stm32mp157c-odyssey-som
               - shiratech,stm32mp157a-iot-box # IoT Box
               - shiratech,stm32mp157a-stinger96 # Stinger96
               - st,stm32mp157c-ed1
-- 
2.27.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
