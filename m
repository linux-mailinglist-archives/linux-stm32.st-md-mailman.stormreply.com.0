Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A32A89D4C7
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Apr 2024 10:47:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0FBB8C7128A;
	Tue,  9 Apr 2024 08:47:04 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EAE06C6C858
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Apr 2024 15:53:09 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-516d0c004b1so5183879e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Apr 2024 08:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712591589; x=1713196389;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xVLdz4RCZPpmOoRrLeAZgIbqKfFqmRWvMYiTDdq2jAw=;
 b=SiGLx/o84CznimZ/Q2WHMyUoi8HK8j9locNqHVjnH38/7abPNoCOhIlzfCWtWzv244
 GcJ9bz+TnNSK4rmZWJ/6Wf64s5lol06tW/jgiC8TKkFVuJHlKNdo0eIEiTiQEeCixe6B
 NrNT44dQh7u75RENM65qwy5Z27lFpi2uEXCtrQCIO1myPLGzvAsgte60DydsALnzHqdj
 juFuA+wdyBzFJPq342EOt205Y8NWcnvweXMjBJ93pUfXPOLtOyH/c5jb6W5nmGIV3M4D
 qBb8U4knsDFsWBveMkazWLAXCSxf3FYJ0zRkGEEUlPjPSVszLEv265vPfaQfZWimF0bN
 vNAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712591589; x=1713196389;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xVLdz4RCZPpmOoRrLeAZgIbqKfFqmRWvMYiTDdq2jAw=;
 b=T/XHfLB3Lf4Xy0kQTwLu6WTf//5J7e/oRrmduuYOFiMATch28NeAq6jth7w5VACHMp
 qVOWGweY7ZI1Vseg3DcF3lXlbvuITh8MAIB8EobaTmKQLhJSkA2tZIJZ7J+FeKQiE1le
 x1p6Qpt37snl61gekWabyWHZXJJC4Y5KvXJU/5mjyLyApLTOVMD3n4qOgFy6+PP1nqYw
 nphufY+P3iGI0P1R700QztXQlfuHtVr+C7w9lA3AivXr16SjQgY1W6BtNVhiGWW1Jy/E
 s9/Qd5GHVrc8jaUC1WXxPUAG3lsEctMl6bD87W6K/0s7LSoSOaMM26Z7vPuEsiKlPa+e
 +XeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEWbphasjrIFZzCWkIcN1zj717LgNhACO6OcW+XD2kCALFe3hTquBvDeEq3f8iNsOEkw2EvID1hV9y8d5kD3acM1OMEwNwS8M6xV8uXS6vyqIp4vfwIdp6
X-Gm-Message-State: AOJu0YzmrmeuHca5xOvkhc3mf2pqVtfILrLPGAgM20qJTRy/b0lo0FhT
 jqay9sXUPdXJJIUj+EsvIbwE/EjCCizSfJ18HFnotYmjdzCQq+oX
X-Google-Smtp-Source: AGHT+IGzkzf5ZrBVW/uel17iRj5iBd72o+sCS+boDhbrVpfv/k6Y+8z0gJzljcMw4rpZZlrNTvlNDw==
X-Received: by 2002:a05:6512:48d3:b0:516:d4c2:5410 with SMTP id
 er19-20020a05651248d300b00516d4c25410mr6728199lfb.64.1712591589101; 
 Mon, 08 Apr 2024 08:53:09 -0700 (PDT)
Received: from [127.0.1.1] ([213.208.157.67]) by smtp.gmail.com with ESMTPSA id
 l13-20020a170906794d00b00a46a2779475sm4547849ejo.101.2024.04.08.08.53.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Apr 2024 08:53:08 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Mon, 08 Apr 2024 17:53:00 +0200
Message-Id: <20240408-rtc_dtschema-v1-0-c447542fc362@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANwSFGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDEwMz3aKS5PiUkuLkjNTcRF1jAyMLI5MUw9RkIwMloJaCotS0zAqwcdG
 xtbUADZmsIV4AAAA=
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712591586; l=2339;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=paSRMDlNckWuA66r0WKViWnghhZr2E5Sml0Yhn2MVmA=;
 b=GAJVhgkJAZP0MyB/TYi4TIjAYjqRazVZe7IXvjdW4YgRzeNyvEn4Ew/bDpudVVhHq2CSqzfUY
 +sNcF1axU/XCPPo3HkltSviKDTQIXOLzo27aEU2RSX7PEaEuMfS/VOD
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-Mailman-Approved-At: Tue, 09 Apr 2024 08:47:02 +0000
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/9] rtc: convert multiple bindings into
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
- lpc32xx-rtc: trival-rtc, referenced in arm arch.
- maxim,ds1742: trivial-rtc, not referenced in arch, cheap conversion.
- rtc-aspeed: 3 devices to trivial-rtc, all referenced in arm arch.
- pxa-rtc: add missing properties and convert. Referenced in arm arch.
- st,spear600-rtc: trivial-rtc, referenced in arm arch.
- stmp3xxx-rtc: convert, referenced in arm arch.
- via,vt8500-rtc: trivial-rtc, referenced in arm arch.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Javier Carrasco (9):
      dt-bindings: rtc: orion-rtc: move to trivial-rtc
      dt-bindings: rtc: google,goldfish-rtc: move to trivial-rtc
      dt-bindings: rtc: lpc32xx-rtc: move to trivial-rtc
      dt-bindings: rtc: maxim,ds1742: move to trivial-rtc
      dt-bindings: rtc: rtc-aspeed: move to trivial-rtc
      dt-bindings: rtc: pxa-rtc: convert to dtschema
      dt-bindings: rtc: spear-rtc: move to trivial-rtc
      dt-bindings: rtc: stmp3xxx-rtc: convert to dtschema
      dt-bindings: rtc: via,vt8500-rtc: move to trivial-rtc

 .../devicetree/bindings/rtc/fsl,stmp3xxx-rtc.yaml  | 45 ++++++++++++++++++++++
 .../bindings/rtc/google,goldfish-rtc.txt           | 17 --------
 .../devicetree/bindings/rtc/lpc32xx-rtc.txt        | 15 --------
 .../devicetree/bindings/rtc/marvell,pxa-rtc.yaml   | 40 +++++++++++++++++++
 .../devicetree/bindings/rtc/maxim,ds1742.txt       | 12 ------
 .../devicetree/bindings/rtc/orion-rtc.txt          | 18 ---------
 Documentation/devicetree/bindings/rtc/pxa-rtc.txt  | 14 -------
 .../devicetree/bindings/rtc/rtc-aspeed.txt         | 22 -----------
 .../devicetree/bindings/rtc/spear-rtc.txt          | 15 --------
 .../devicetree/bindings/rtc/stmp3xxx-rtc.txt       | 21 ----------
 .../devicetree/bindings/rtc/trivial-rtc.yaml       | 18 +++++++++
 .../devicetree/bindings/rtc/via,vt8500-rtc.txt     | 15 --------
 12 files changed, 103 insertions(+), 149 deletions(-)
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
