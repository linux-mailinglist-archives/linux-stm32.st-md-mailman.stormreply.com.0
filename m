Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCAC3429C0
	for <lists+linux-stm32@lfdr.de>; Sat, 20 Mar 2021 02:57:12 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B7EBC58D5C;
	Sat, 20 Mar 2021 01:57:12 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3AD6C58D59
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 20 Mar 2021 01:57:10 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id h3so7092669pfr.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 18:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=VCzEU/pil3MTu8S/aYMTsjT9oMpE9r8HPtiJlG91plE=;
 b=M9r+olV5V+aNndKJcLMTK4qzmhPcP5LIWBjeX6yfzj9MM1y21tUJ0Cg4gkK2kGZ0Ag
 q3El4P0nu1b+imZ2q9/ZBYecJ+DJJi2q54I2sQzL+WzZRNl96uNXkYcBdsmQ4MVcK5k3
 2K0ZojkQKxyY+24Pf/eGlSgIdybcS3ODeYK3eVwQbfDRnCdN8yxLhElH3k5kaVJ4GaN3
 pll3WIkIlOGgffWJ4+znpnwrNCjYCgPkEarQ5ReT65K2oLwNwP7rC/axT1oWG0A0H/ll
 Cgb7yIGe+93PLaOKZFsOmave85XIe9Vw4cYnfh+ez0Xr08VLdSq61BD4pAdLJHUEowE+
 Piwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=VCzEU/pil3MTu8S/aYMTsjT9oMpE9r8HPtiJlG91plE=;
 b=WPkhoOy6X1oBcjeOeDskiU0uzVp8vM/tjQrRYxCVorrAsterMsUb5bhcHBm55Bhlku
 9M3UAxQOrCUoe3VoSOD3JoEKcZtQ8J6z2hZODbeQfk1jDWwmA+a3yTpNOwXIowje8Ykm
 E603E6bfOD87D6w3inWkeAZGQXcTzxZWNlXjg+ZMLVWXrftlmZBBUJzbiY3duH8rxTeI
 GMzC6e4OuD6+JJ+uSmcVPrTC2mDXNIDxqC6q811AgkWEShYzAvrw3E8E/TJ61hSuB5Dl
 RSPt7zSGwtGI/z7vulrE47P1JUEehSbd7d+Un4SmZXlHoce/K2Ybg25VbjzQ8DLRv16h
 8l9Q==
X-Gm-Message-State: AOAM533kXm+T8afepSey73auUqvOn2ej74yc6vfaFlyMzzaFCIyVS/Xy
 BZx5IixQ7cz6Fe+O5/FOb4ezW6eulGEWT2gT
X-Google-Smtp-Source: ABdhPJwn7lnmyGG9SqN9cgEHbtjPsDYamvUajTPWCFzIIKGfKqS7onz+9EQToq009RBXlIf4xfwd3A==
X-Received: by 2002:a63:8348:: with SMTP id h69mr6928172pge.136.1616205429444; 
 Fri, 19 Mar 2021 18:57:09 -0700 (PDT)
Received: from localhost.localdomain ([204.44.111.4])
 by smtp.gmail.com with ESMTPSA id y7sm5755904pgp.23.2021.03.19.18.57.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Mar 2021 18:57:09 -0700 (PDT)
From: dillon.minfei@gmail.com
To: alexandre.torgue@foss.st.com, rong.a.chen@intel.com, robh+dt@kernel.org,
 a.fatoum@pengutronix.de, mcoquelin.stm32@gmail.com,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, vladimir.murzin@arm.com, afzal.mohd.ma@gmail.com,
 gregkh@linuxfoundation.org, erwan.leray@foss.st.com,
 linux-serial@vger.kernel.org, lkp@intel.com
Date: Sat, 20 Mar 2021 09:56:23 +0800
Message-Id: <1616205383-24114-8-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1616205383-24114-1-git-send-email-dillon.minfei@gmail.com>
References: <1616205383-24114-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Linux-stm32] [PATCH v4 9/9] dt-bindings: serial: stm32: Use
	'unevaluatedProperties' instead of 'additionalProperties'
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

To use additional properties 'bluetooth', need use unevaluatedProperties
to fix dtbs_check warnings.

'arch/arm/boot/dts/stm32h750i-art-pi.dt.yaml: serial@40004800: 'bluetooth'
does not match any of the regexes: 'pinctrl-[0-9]+'

Reported-by: kernel test robot <lkp@intel.com>
Fixes: af1c2d81695b ("dt-bindings: serial: Convert STM32 UART to json-schema")
Signed-off-by: dillon min <dillon.minfei@gmail.com>
---

v4:
- add Reported-by and Fixes tag
- use unevaluatedProperties: false to fix dtbs_check warrnings instead of
  add 'bluetooth' in st,stm32-uart.yaml

 Documentation/devicetree/bindings/serial/st,stm32-uart.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
index 8631678283f9..305941b1d5a0 100644
--- a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
@@ -80,7 +80,7 @@ required:
   - interrupts
   - clocks
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
1.9.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
