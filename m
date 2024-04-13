Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F17728A3E6B
	for <lists+linux-stm32@lfdr.de>; Sat, 13 Apr 2024 22:22:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7500C6C83D;
	Sat, 13 Apr 2024 20:22:45 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63254C6C820
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 13 Apr 2024 20:22:45 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-5701de9e971so140542a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 13 Apr 2024 13:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713039765; x=1713644565;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CMG7QinvL5fvXvhlkGS6yquNkWTfPbeKbJj9JJN47FA=;
 b=iKPj+1MTC7djUsidnkheay29W09IasrilB+/E7seM62Ln8cYmDdjO4df10np0cN2Ck
 xLLYBXcJL6ncgND80tjh2SJ3JkHb7atfc2pIVTzg6JBt1i+50cAbz1TVFWQEgWT9wc3s
 wfs5OltnypaQGeVeOMg+ChqIMwM+Dq1RgflwTLZtK5T2/fufd73118zeBNvlHVSsHaZY
 hzr4ietAHgo9IIx+EdtomkRWyp4H2fIkeWIy4HnXkgyWfam52vOeTdFE2FzoqsPvRa/X
 czYQAYHbO6x6l2gvFTmc+v66hp+i4ZdvEmB4XDG6fZYNoXbljb+dFAMjBPgX6qtQIro3
 U+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713039765; x=1713644565;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CMG7QinvL5fvXvhlkGS6yquNkWTfPbeKbJj9JJN47FA=;
 b=c2xlsH9krX+8Rd1jJ0UcFqUDDF1SiPjDzLSfcV317Eqt1Zqt/GHQ9nSdJRlVJEEGbx
 fejitYOhTOEp2SIcCrksNnBSncVT3MNy8PjD15vfLmVcTHeqjH7D6v/xpqEs9ahqbjfU
 DFAEpDfUzOfWOAMVF+jNsiQM6PPnv6gbeQ+HC+e/byDP3fZSMem3rqAt/+p5Qne9TZ9O
 xfTua3JBrY2ChxQmRJStYl5mB8TH+z/OTfH/Iaxqk8tTWCXl+2M5YXuJcVmn/gcrVuEY
 JjC/qLotHysJNpMpNqHqNltAh+XZSATCmcvLjmlhUp2zF9oQetiQ5vZh+wr4zUEpdZjf
 9ztw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUK9N+mrw9W2hKIf6uYiWiAZQSI8u8ccmkLl6W/LEzo/CpBUfqbv16XbPEAzAcGQVWRECZxD21dIetf91oHmYozmpxT9fBASH160MBv3ENzbbgi04+M+ii7
X-Gm-Message-State: AOJu0YwynFLCs1pImjpzVIyk5V+UoG8THl6lPc3NSPIBe3Gc9nShi/ve
 rbWntf3USHZKCvqyrOnyNFpEfVlIXZBjyCvE7nQQUWdZdZXrIdso
X-Google-Smtp-Source: AGHT+IEsB+cHdlx9K9FNSEQ8EBqYbBYDYSfIouBtzUo5TVCXTptsRk0ac0wtO3XnSf5mJphM+OEMbw==
X-Received: by 2002:a50:9b55:0:b0:570:1dd9:f16b with SMTP id
 a21-20020a509b55000000b005701dd9f16bmr392424edj.26.1713039764648; 
 Sat, 13 Apr 2024 13:22:44 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-64.cable.dynamic.surfer.at.
 [84.115.213.64]) by smtp.gmail.com with ESMTPSA id
 f16-20020a056402161000b0056e2f1d9152sm2881222edv.93.2024.04.13.13.22.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Apr 2024 13:22:44 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Sat, 13 Apr 2024 22:22:15 +0200
Message-Id: <20240413-rtc_dtschema-v3-0-eff368bcc471@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHfpGmYC/13MywrCMBCF4VcpszYymaQXXPkeIhKTtA3YRpISl
 NJ3Ny0I1eU58H8zRBucjXAqZgg2uej8mIc4FKB7NXaWOZM3EJJEiRULk76ZKereDooJpIak4VY
 TQk6ewbbutXGXa969i5MP701PfH2/UPMLJc6QaSnrUlKrRUXnblDucdR+gBVKtIs5/sWUYyNIc
 a7uWMtyHy/L8gFDfrtN5QAAAA==
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713039763; l=3124;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=bnx5sa8KDICe1vW2NAmHoFaeywkUORylyqHPjnVp/BA=;
 b=PyA3c914YDhLOl3SoDtKOi+FMBNuMKW9+wWIfwifi+Tny4hwNMF+Ektaon7HNNZUuJbyZ5uuY
 3mlk07mgOcwCCpGxdG2f9xUrbgHTycqC6/02u1izGaMmelxyjfwrYbg
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 0/4] rtc: convert multiple bindings into
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

- google,goldfish-rtc: trivial-rtc, referenced in mips arch.
- lpc32xx-rtc: trivial-rtc, referenced in arm arch.
- maxim,ds1742: trivial-rtc, not referenced in arch, cheap conversion.
- orion-rtc: trival-rtc, referenced in arm arch.
- pxa-rtc: add missing properties and convert. Referenced in arm arch.
- rtc-aspeed: 3 devices to trivial-rtc, all referenced in arm arch.
- st,spear600-rtc: trivial-rtc, referenced in arm arch.
- stmp3xxx-rtc: add compatibles and convert, referenced in arm arch.
- via,vt8500-rtc: trivial-rtc, referenced in arm arch.

The only reference to the lpc32xx RTC makes use of a 'clocks' property
that does not describe a controllable signal (it is in fact a fixed
32768 Hz crystal, the input clock of the SoC). Remove this property to
better describe the device and avoid errors when checking the dts
against the RTC binding.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Changes in v3:
- Fix typo in commit description (rtc-aspeed).
- Move lpc32xx-rtc to trivial-rtc again.
- Remove 'clocks' property from the rtc node in lpc32xx.dtsi.
- Link to v2: https://lore.kernel.org/r/20240410-rtc_dtschema-v2-0-d32a11ab0745@gmail.com

Changes in v2:
- General: squash all moves to trivial-rtc into a single patch.
- MAINTAINERS: remove reference to google,goldfish-rtc.txt
- lpc32xx-rtc: create own binding to add the undocumented 'clocks'
  property.
- fsl,stmp3xxx-rtc.yaml: document missing compatibles.
- Link to v1: https://lore.kernel.org/r/20240408-rtc_dtschema-v1-0-c447542fc362@gmail.com

---
Javier Carrasco (4):
      arm: dts: nxp: lpc: lpc32xx: drop 'clocks' form rtc
      dt-bindings: rtc: convert trivial devices into dtschema
      dt-bindings: rtc: pxa-rtc: convert to dtschema
      dt-bindings: rtc: stmp3xxx-rtc: convert to dtschema

 .../devicetree/bindings/rtc/fsl,stmp3xxx-rtc.yaml  | 51 ++++++++++++++++++++++
 .../bindings/rtc/google,goldfish-rtc.txt           | 17 --------
 .../devicetree/bindings/rtc/lpc32xx-rtc.txt        | 15 -------
 .../devicetree/bindings/rtc/marvell,pxa-rtc.yaml   | 40 +++++++++++++++++
 .../devicetree/bindings/rtc/maxim,ds1742.txt       | 12 -----
 .../devicetree/bindings/rtc/orion-rtc.txt          | 18 --------
 Documentation/devicetree/bindings/rtc/pxa-rtc.txt  | 14 ------
 .../devicetree/bindings/rtc/rtc-aspeed.txt         | 22 ----------
 .../devicetree/bindings/rtc/spear-rtc.txt          | 15 -------
 .../devicetree/bindings/rtc/stmp3xxx-rtc.txt       | 21 ---------
 .../devicetree/bindings/rtc/trivial-rtc.yaml       | 18 ++++++++
 .../devicetree/bindings/rtc/via,vt8500-rtc.txt     | 15 -------
 MAINTAINERS                                        |  1 -
 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi             |  1 -
 14 files changed, 109 insertions(+), 151 deletions(-)
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
