Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FA11CEE42
	for <lists+linux-stm32@lfdr.de>; Tue, 12 May 2020 09:36:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3BD9C36B25;
	Tue, 12 May 2020 07:36:58 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30E0BC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2020 07:36:57 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id k19so5030481pll.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2020 00:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=oJmUzMw42DTbrXzzUYd7Ks8dtTTCqqycjSbTZSaOap0=;
 b=cCKlHK9w4o+2S8+AIROccI9rcib+ct01tsHVfjDmeGmiPY0Wn0Dc73yHEqH3sN4XQk
 AAIp3z9L5wcSNtfz5GuHrOsNcWQ2KyOnD3Mi+3rQJ0sEoBWI2zysRtB+iQg9+1Az0oKU
 5mDgji33MT0GJE0sltyWnLxivbDrec0xxp5llL9doCR9UattDLmvRJZA3E9cQ5Nh7y4z
 0KrhW+XCAj7kNMMAE0Hv36lDa+4DAVCVTwdoCieHnyRhaoVzpSBcSfY/3/29ZqBdYYIY
 rtcUQe5HLpU0QMXT3xVnsISP5f39SHz3Q6vhH9mXoYgiTZOhIjiDwgnZ6DipQhF8ulxU
 1jpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=oJmUzMw42DTbrXzzUYd7Ks8dtTTCqqycjSbTZSaOap0=;
 b=nyMfnaeqwBJQ8oAsHsH2JlRSyd0GV3CvH75fmeWzJnSE42M/TZaYXO71qYsqADyYqK
 ivFFxj9eD18WVqYwBOCL9CNvnyr5+I9dRNJLc8+QvQ1/geo2MCcbvl3WLR3oR7Slo3lZ
 ejkKlzkG9FlAhr5SI+Fi8XM/Rr+ZicqpN+yCfbWFzQchFsOBbqTWjhcgTyj7IGJDWNHA
 Qgh2Zan3xZEyW+ZRtn241U+zrRzvGCg06ZNlF8DmfDABN8TfCvFAyaCJ4DyITMPt3F8Y
 cVW9Uv2ETRzTdTg0NsN2JVzYt/jyg1ux34ZvfuMaVoKolbspDsxEIVr38VOIUF2nsdWa
 wNEA==
X-Gm-Message-State: AGi0PubfWMiYO5AESh2vG9FmuSCMABSxutJ2tXhpiKOW7oraW0ragf5B
 EmvifOQs9LWS254zYMhjoWs=
X-Google-Smtp-Source: APiQypKmaZEGYk0fHOt/kEOG6LJdizurDE2nYIhhfFMWLuELWHUAe3JTjq8LUtwXSDcZzGgVK06Iag==
X-Received: by 2002:a17:90b:78e:: with SMTP id
 l14mr27370151pjz.144.1589269015605; 
 Tue, 12 May 2020 00:36:55 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id 5sm11732471pjf.19.2020.05.12.00.36.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 May 2020 00:36:55 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 broonie@kernel.org, p.zabel@pengutronix.de
Date: Tue, 12 May 2020 15:36:47 +0800
Message-Id: <1589269010-18472-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: devicetree@vger.kernel.org, dillonhua@gmail.com,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 dillon.minfei@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/3] Enable l3gd20 on stm32f429-disco board
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

This patchset is for enable l3gd20 on stm32f429-disco board
has following changes:

V2:
    1, insert blank line at stm32f420-disco.dts line 143
    2, add more description for l3gd20 in commit message

V1:
    1, enable spi5 controller on stm32f429-disco (dts)
    2, add spi5 pinmap for stm32f429-disco  (dts)
    3, add SPI_SIMPLEX_RX, SPI_3WIRE_RX support for stm32f4

dillon min (3):
  ARM: dts: stm32: Add pin map for spi5 on stm32f429-disco board
  ARM: dts: stm32: enable l3gd20 on stm32429-disco board
  spi: stm32: Add SPI_SIMPLEX_RX, SPI_3WIRE_RX support for stm32f4

 arch/arm/boot/dts/stm32f4-pinctrl.dtsi | 17 +++++++++++++++++
 arch/arm/boot/dts/stm32f429-disco.dts  | 25 +++++++++++++++++++++++++
 drivers/spi/spi-stm32.c                | 29 +++++++++++++++++++++++++----
 3 files changed, 67 insertions(+), 4 deletions(-)

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
