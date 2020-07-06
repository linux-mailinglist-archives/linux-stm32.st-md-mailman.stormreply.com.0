Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E80072168EF
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jul 2020 11:23:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86F27C36B2D
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jul 2020 09:23:49 +0000 (UTC)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B73FAC36B27
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jul 2020 17:35:03 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id g20so35603045edm.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Jul 2020 10:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OL4BIoHfo4ESD2HkTeJ2OTpKVO9hzHwpMJmzstmiNVg=;
 b=pzNFeVTSQqmQBRBaCx9hwMgTaGftD6bb3g3apo+av6qMPYCMRghznZWG8/gqBb/MLP
 E7DNIVUH162bhujtG8TKhNRNmdSA3Frpxr5dubN8p7nqaF62jC3CI+iNQnKN6q7K5DzI
 g92n5Yq8m+WiV8oHcTyUDa/y9sjuvkjj4X4NV/wLLLbsMCEZGgSOR9mRZG1t67n4MSlS
 CSd7wZ5RnGK5DJ3EFzAsSwCHYCiXqIiQKzuFjuAZw0NIlfQsoruj6RQCfk92zOWkD/xn
 IWi+Z+iHWomW8Eop9QoV0vyuQZ61W2eSKuTd/wpUbOtERjXZ2830bf0GBCjRdinSRqt8
 4LYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OL4BIoHfo4ESD2HkTeJ2OTpKVO9hzHwpMJmzstmiNVg=;
 b=cM63FiZ/yX518qikb6yVM0YM1ndrbRA/6Z7xF5QSCWv3HrsmoLIzwLJH4Ep6Sh2UbJ
 soVs6MCBDFSpWVjUK3Eqm8GXPP46xiVHldRo/VpJ6NUCqQlpAXIG39QAqhthzpjZIoas
 CRZ8P1znaG1gGnWZQJZX7NCp5e5PkCs5SkhAYzISjZZnvrQh+l+/bvkUy+Q7fDJnyxNT
 9m3vNurZZP/pHvVcGiI/e9Ok5g2yMdIRz9b3DEV8xnqpGQ+C7A4hHXmHGst5e7illyRq
 TdyNWDsqtxEKAKXd6rzL4cFjV0mymmHigdPmBY8nk+O3XDX+qhSBolnFpQrYQMy8BnZq
 RtBQ==
X-Gm-Message-State: AOAM533SqeZPK6AQasH0HMuOIFVhASLE06wz4ivjeBmdOxbrb3UyIk1h
 6FOErJ692Avn3eGmf/RvoRg=
X-Google-Smtp-Source: ABdhPJwFsnEgy2TMnmCzBwlfhsHoeEroFsIMnCsgdDoNwl7SSxE4VISYVrxGPV72yRwsV0ZI9SZg4A==
X-Received: by 2002:a50:d7c1:: with SMTP id m1mr58043823edj.217.1594056903415; 
 Mon, 06 Jul 2020 10:35:03 -0700 (PDT)
Received: from localhost.localdomain (asp78.neoplus.adsl.tpnet.pl.
 [83.26.227.78])
 by smtp.gmail.com with ESMTPSA id y22sm16556258ejj.67.2020.07.06.10.35.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2020 10:35:02 -0700 (PDT)
From: Marcin Sloniewski <marcin.sloniewski@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Date: Mon,  6 Jul 2020 19:33:48 +0200
Message-Id: <20200706173353.20525-2-marcin.sloniewski@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200706173353.20525-1-marcin.sloniewski@gmail.com>
References: <20200706173353.20525-1-marcin.sloniewski@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 07 Jul 2020 09:23:47 +0000
Cc: devicetree@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 Lubomir Rintel <lkundrak@v3.sk>,
 Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, allen <allen.chen@ite.com.tw>,
 Sam Ravnborg <sam@ravnborg.org>, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 2/3] dt-bindings: arm: stm32: document Odyssey
	compatible
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
2.26.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
