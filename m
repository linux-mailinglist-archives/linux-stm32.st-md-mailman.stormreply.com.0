Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 579EA89FC15
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Apr 2024 17:55:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0FE33C6C820;
	Wed, 10 Apr 2024 15:55:47 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 41CE9C6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Apr 2024 15:55:46 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a47385a4379so1454546966b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Apr 2024 08:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712764545; x=1713369345;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Jsjr/EUpS7jHu9EoCoBO4JHqmCRBqh6/KIR1YSfDMJk=;
 b=k27LXg66rTnB7w09vo5SqYJQXVxpEQGIuFyMQsYFxOY+kQqTD8Xklq+kpvGoWSH7YK
 CiD0Dl9Xs1mqZdYFihyYZAj/3J/ntQD7c5Uca1MZYr6m7c5S4xB8vV9h5ryaki5eY4Zw
 2qPQyvLi9mtKBBBZlStBDCW2y+418052jr1Gx67G17IpJMQLPuiVF1OvqXIsMmhxGAA9
 jbzDw1MCFHhFFRZMoASBhrHiFsUXhriyEtSLhJGUEhZsKVBgTD18Xu1liAj9f87zGESO
 xZWsFwkOPIdrtTh4VrtQ7T/W5vicRK/1DCpwxNLcHXyC56FixowG22YieDuo9RpHMh+G
 W+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712764545; x=1713369345;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Jsjr/EUpS7jHu9EoCoBO4JHqmCRBqh6/KIR1YSfDMJk=;
 b=ejgQQBJouWCz7/fAs2jqSdHFC4lYIZ/uozscOfULJAQvMLGVLG20EEnywmLqP91MyP
 241jl0+VMNT+Q4GQDuRbSbbiKdy7ARxzsAeM++cSRDJXHwJc8G/PzuuHE1LlJR/kMaVn
 Firh+6QxOACPwhRJ+MKZkg0AuPBpOIv5M4Ey4vdphK4JP+jsVYZChtF9zwc4HAN4RxLJ
 bn/3FFXU1Pg83BXghUkiCpa8Y7yR6Ka6/g5Uq0Vu0Sy2Z0qxp21J9urB73BCPAhDzS1u
 QpqkjcF9AtZXhSTUfWlB9XqOIt1IrHMYR4sz2sUAECQHUYdVbHg9E+nFHF29qELFmPkd
 ODZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvSJ67DfVTSOeus1NmBuOVaZVWwfkbMTfvmFI6TYGV/3EA7TQEhBgtj900syJeOgcE/7Z3uEQA+OP9UpwYrCZqmbAQaakAjF2/O7z6iGtiU//PhwS3uEYw
X-Gm-Message-State: AOJu0Yw5KC/DSzMKhOGpZK9lSO3wbJ0k2JE9Ywd9kW5e+KhrDOablxyx
 OLn5fajuL/wJ3G4cIv+owzXIjR417qPCFTr++zDrfiGf2ljr4wTq
X-Google-Smtp-Source: AGHT+IF1ADAUkQmkGJcp6oXbVsO2NNUVSgumq2+R9/e1RDxEbeDdhWqKmtLj8qqMmKKxMxSasjIpVQ==
X-Received: by 2002:a17:906:46db:b0:a51:d056:d08b with SMTP id
 k27-20020a17090646db00b00a51d056d08bmr90851ejs.0.1712764545559; 
 Wed, 10 Apr 2024 08:55:45 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at.
 [91.118.163.37]) by smtp.gmail.com with ESMTPSA id
 qw6-20020a1709066a0600b00a52172808c9sm279884ejc.56.2024.04.10.08.55.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 08:55:44 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 10 Apr 2024 17:55:32 +0200
Message-Id: <20240410-rtc_dtschema-v2-0-d32a11ab0745@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHS2FmYC/1XMQQrCMBCF4auUWRtJprEWV95DipTptB0wjSQlK
 CV3NxZcuPwfvG+DyEE4wqXaIHCSKH4pgYcKaO6XiZUMpQE1Wm11o8JK92GNNLPrVa2xRTsYJtR
 QLs/Ao7x27taVniWuPrx3PZnv+oPafygZpRVZez5ZHKlu8Dq5Xh5H8g66nPMHsJC+eqgAAAA=
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712764543; l=2589;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=aG6841BM+IzaM2wdf6XPCQIKX1BJoLnJgWWJZ09aXUc=;
 b=vE6WWKn/PfJQl6Z2mF/T4S+0ooamNPIyWAComjIMzpGZf3t4nblGf7WzRI3Gd5nnqgkkLJ54Z
 rg1MNNHQsJxBMn808RjLrAfEPSzorjoLsdzH843SWqOs2s8K41Q8LrA
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/4] rtc: convert multiple bindings into
	dtschema
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

This series converts the following bindings into dtschema, moving them
to trivial-rtc whenever possible:

- orion-rtc: trival-rtc, referenced in arm arch.
- google,goldfish-rtc: trivial-rtc, referenced in mips arch.
- lpc32xx-rtc: add missing property and convert, referenced in arm arch.
- maxim,ds1742: trivial-rtc, not referenced in arch, cheap conversion.
- rtc-aspeed: 3 devices to trivial-rtc, all referenced in arm arch.
- pxa-rtc: add missing properties and convert. Referenced in arm arch.
- st,spear600-rtc: trivial-rtc, referenced in arm arch.
- stmp3xxx-rtc: add compatibles and convert, referenced in arm arch.
- via,vt8500-rtc: trivial-rtc, referenced in arm arch.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Changes in v2:
- General: squash all moves to trivial-rtc into a single patch.
- MAINTAINERS: remove reference to google,goldfish-rtc.txt
- lpc32xx-rtc: create own binding to add the undocumented 'clocks'
  property.
- fsl,stmp3xxx-rtc.yaml: document missing compatibles.
- Link to v1: https://lore.kernel.org/r/20240408-rtc_dtschema-v1-0-c447542fc362@gmail.com

---
Javier Carrasco (4):
      dt-bindings: rtc: convert trivial devices into dtschema
      dt-bindings: rtc: lpc32xx-rtc: convert to dtschema
      dt-bindings: rtc: pxa-rtc: convert to dtschema
      dt-bindings: rtc: stmp3xxx-rtc: convert to dtschema

 .../devicetree/bindings/rtc/fsl,stmp3xxx-rtc.yaml  | 51 ++++++++++++++++++++++
 .../bindings/rtc/google,goldfish-rtc.txt           | 17 --------
 .../devicetree/bindings/rtc/lpc32xx-rtc.txt        | 15 -------
 .../devicetree/bindings/rtc/marvell,pxa-rtc.yaml   | 40 +++++++++++++++++
 .../devicetree/bindings/rtc/maxim,ds1742.txt       | 12 -----
 .../devicetree/bindings/rtc/nxp,lpc32xx-rtc.yaml   | 41 +++++++++++++++++
 .../devicetree/bindings/rtc/orion-rtc.txt          | 18 --------
 Documentation/devicetree/bindings/rtc/pxa-rtc.txt  | 14 ------
 .../devicetree/bindings/rtc/rtc-aspeed.txt         | 22 ----------
 .../devicetree/bindings/rtc/spear-rtc.txt          | 15 -------
 .../devicetree/bindings/rtc/stmp3xxx-rtc.txt       | 21 ---------
 .../devicetree/bindings/rtc/trivial-rtc.yaml       | 16 +++++++
 .../devicetree/bindings/rtc/via,vt8500-rtc.txt     | 15 -------
 MAINTAINERS                                        |  1 -
 14 files changed, 148 insertions(+), 150 deletions(-)
---
base-commit: fec50db7033ea478773b159e0e2efb135270e3b7
change-id: 20240406-rtc_dtschema-302824d1ec20

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
