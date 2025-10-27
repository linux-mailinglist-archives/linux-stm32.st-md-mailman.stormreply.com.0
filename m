Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBDBC0F05A
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Oct 2025 16:45:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C875EC6047D;
	Mon, 27 Oct 2025 15:45:03 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18171C5A4D9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 15:45:02 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-47109187c32so25945765e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 08:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761579902; x=1762184702;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lb4VSxhZ53ib++NoC6OQcXArogDrZtQGJ7FBlNPhbfk=;
 b=CougX+LWD0oS6do58ZhY/07FnNLrayzwCEcZmo5puRO4zsxi2TqDdz58ebCi1ATZ+h
 5Hlzp6D4fcDuEhVuWY5l9mxILdGhhyicTZFpkt+kcvsnh8FA3Xp/wkZVe58ePMRx55Pg
 U1SurWJonchWegZJObYwAZp0+BeQqwCRSVHVUyVV02Vcj7uXdz8IsoaZO1T7jtUS/oJI
 sKwnSyzIoME2Er/U8SdlcHPgzVlT2bBEWJNxdyilj0cSX513cKiIU3qdxvJ+RwUur767
 FA1wzrmug5cjtZDbcolV8m/nqI5OhScfaAmJ8f8J8ZOu0/IDE2P+NxuhdDwQusLrzvYO
 VEbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761579902; x=1762184702;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lb4VSxhZ53ib++NoC6OQcXArogDrZtQGJ7FBlNPhbfk=;
 b=whY2p40aRqUESOBYK1UsQCauLeTOYFzBvB1V3tBh7mfcO8PHonzzeHxUj+SoNaCEOk
 3uL8JiZ93SMO3hZUqpNnXWyDCnGXrSutdgEY0U+qavJEw7r3Dfe+GhaKkp814UoMrTh2
 R28nIq59PIGCXEMW4Ud0NgLEmQg/Od+1hNEVuAAZVUc/u1Q9bAIAVLmTWkNHQLoMe2oR
 tP6UC/071CbILaYj86H9axKlq4jMwdSopPmRXUkqCuvldRHtUnckhFtPaDKpqGpkV8i8
 WCq0F7ba7RdB6qfiCOApRaV41gmTTBAvIp8cDMFov+yhkLCCl0Mpa2UudRKyRlv5yAop
 p7Lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRh7Q8kH2+fJPK3ZDmYfw0gD6PQs0NI5zhDHjObaIGTeaElL/pkeLFAY0EVZyzpivSBCO1wGo/pBJoyg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwTHXwZV+ltclHAojg3rPviuFtZXwmHEJiYJ6DcB5canmLiiDdF
 8a6uDASP1oH6LOcSIVNwq6i281yG15D6aebYXpFVAf1i2BvLdO4gUE5U9j+i45sUpBY=
X-Gm-Gg: ASbGncuZztPUoJFtPH/Mvg8VIvP2JoRbnH2v6OE3u6Ic+MmJIx0fCAbsIIt3R1eYG5P
 1QZcoOzHkPfIuAPQ9izpiYzMK89se/DvdWQP7FL6jzNDxNYzHJr2IuE4RVW965l256ohqeQkwqe
 uJePulFXlkxuptjZzE6116frkTvl2wIqi3h2LxpWBH8wmiv7KFllocPT19tCtW3appTXaImFBgD
 LT8GZAK5Lwuoeuy/cAp2Y5Y+AeJ+w6kOCxwttsKvZVMY5qzdF1tE1mdQgSfvVkCN+cf/Je2e4SW
 i5uwrX0dmCSMwFnnZYiTh1yS1WUxJeSZ0d4+565ZRQrih8Tc2+h+F5yqefwultIYC9mvg3ym1tY
 u/hilJfo0gTJ3rW1zNZ6302uA56mpixmFt9cc/+eVNzS271SpMxhKniTo1RpvhNtcYhALtHTHb6
 zvNx6rwQ==
X-Google-Smtp-Source: AGHT+IE4u761VTQhz8y8t9/OtyAFKbyH7V0oLh0quuYxb3Ci1sFKCWOHqVBDOe0fEldTYqcbNTrciA==
X-Received: by 2002:a05:600c:5251:b0:46e:4a13:e6c6 with SMTP id
 5b1f17b1804b1-47717e414d2mr927705e9.19.1761579902369; 
 Mon, 27 Oct 2025 08:45:02 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1c6:7dde:fe94:6881])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd477d0esm138708045e9.0.2025.10.27.08.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 08:45:01 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 27 Oct 2025 16:44:48 +0100
Message-Id: <20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHCT/2gC/22NQQ6CMBBFr0Jm7Zi20FJceQ/DoqkDTCIUWkM0h
 LtbcevyveS/v0GiyJTgUmwQaeXEYcpQngrwg5t6Qr5nBiWUFrWocPFhxOSs0npGGp1HWxmhSu2
 8lgrybo7U8eto3trMA6dniO/jYpVf+6s1UvyprRIFlsrVje8kGWOvD55cDOcQe2j3ff8A+SryR
 rMAAAA=
X-Change-ID: 20250704-qcom-sa8255p-emac-8460235ac512
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2270;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=C/+pGWh4ZCGZOy76owpq0eHfBoBaYrs3C2W6uIOqIOM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo/5N3VBuLTH0yAZ2M7A9DyhsM1dSsCaRksN/eN
 7ktQ+jrruaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaP+TdwAKCRARpy6gFHHX
 cmW/D/4qwTNffsadNq6O2GGPSLLD6/KbqYR6hYjz+j02Ym/SK7B4K4488T2mDJH7VKBfwLNw0F+
 F8UxgRW2JqCsR88CbbKcqaEHHIf0hjb+CQ/00REwEdis+58fXQ1yM65j68YRE8pnCvr9Z7/6yMr
 PqzVltEr/mMDst7I17x0N2O0yQeePnBlPVr5CD8xxVvUMPYnQ5VYC0UdaPHnzcdc2owSgdt3UzB
 EhgXHyWxAYgl5Pk6BDSB7R+q5EJ/4N4T1PU9Sb3H1jG7cVjxBVAfsYRxQHm3WRcKLuQH4pVWnGJ
 2hHKyz1YkGJr0JxVVFRDtnzcS/pXpEKdnv4/YhkwS2jZFKnZhs0xvhko2T8w2WWvppneETXCZT4
 /O2DyyXo/gEXR9ARvrXkQEk+CfUSMfw5RHiqWZ5/x1QoaKDM9MYma6Y0l8jmvcTFZWc0xT2vA8w
 sTxikCmtkPxWxEnOr4y1f5Ve+bTBge/QhuZV3b2xPJ2Jj6bP1t9dAOFSU8SzNuTaDJH8SB4j2gB
 v23ItHdt1cXOl+/OxnDhRNaqG2VShqvPvbiBoIcMT9dc5cNNf3v8gjZt2gkjlVcR6oFiT5oNtWm
 4fw+J26NqLyZ8ysRPJPREz1TWntL5wyPyYMwSMheLEPgktnGd5NZS6pasFvxQByYGOIUSGSTjY4
 R4U5VJ/Y4EWoQTQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 0/8] net: stmmac: qcom-ethqos: add support
 for SCMI power domains
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

Add support for the firmware-managed variant of the DesignWare MAC on
the sa8255p platform. This series contains new DT bindings and driver
changes required to support the MAC in the STMMAC driver.

It also reorganizes the ethqos code quite a bit to make the introduction
of power domains into the driver a bit easier on the eye.

The DTS changes will go in separately.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v3:
- Drop 'power' and 'perf' prefixes from power domain names
- Rebase on top of Russell's changes to dwmac
- Rebase on top of even more changes from Russell that are not yet
  in next (E1vB6ld-0000000BIPy-2Qi4@rmk-PC.armlinux.org.uk)
- Link to v2: https://lore.kernel.org/all/20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org/

Changes in v2:
- Fix the power-domains property in DT bindings
- Rework the DT bindings example
- Drop the DTS patch, it will go upstream separately
- Link to v1: https://lore.kernel.org/r/20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org

---
Bartosz Golaszewski (8):
      dt-bindings: net: qcom: document the ethqos device for SCMI-based systems
      net: stmmac: qcom-ethqos: use generic device properties
      net: stmmac: qcom-ethqos: improve typing in devres callback
      net: stmmac: qcom-ethqos: wrap emac driver data in additional structure
      net: stmmac: qcom-ethqos: split power management fields into a separate structure
      net: stmmac: qcom-ethqos: split power management context into a separate struct
      net: stmmac: qcom-ethqos: define a callback for setting the serdes speed
      net: stmmac: qcom-ethqos: add support for sa8255p

 .../devicetree/bindings/net/qcom,ethqos-scmi.yaml  | 101 ++++++
 .../devicetree/bindings/net/snps,dwmac.yaml        |   5 +-
 MAINTAINERS                                        |   1 +
 drivers/net/ethernet/stmicro/stmmac/Kconfig        |   2 +-
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 342 +++++++++++++++++----
 5 files changed, 388 insertions(+), 63 deletions(-)
---
base-commit: 5b54ba44a7db08b43d345380857bcf0fd95ab10d
change-id: 20250704-qcom-sa8255p-emac-8460235ac512

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
