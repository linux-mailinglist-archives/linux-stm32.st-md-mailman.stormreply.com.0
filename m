Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 629DC1CBE37
	for <lists+linux-stm32@lfdr.de>; Sat,  9 May 2020 08:58:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12A39C36B12;
	Sat,  9 May 2020 06:58:34 +0000 (UTC)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60372C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  9 May 2020 06:58:30 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id f8so1720614plt.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 May 2020 23:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=N1XFUN54hBaoHoMSJaUUq6Q1IPBGgMS/vAMXMj1l0PA=;
 b=V65Vusn384Pmmz/0XBFGNr9uPszlOINvkAcu4/LApGat2SGIwwG/jL0M2kqQcHSdda
 m4z/u+rvsRrQAduhbxUBtw4nfEyLLqIlSUXZPMplgw578oBsUs0IO0hrusxqSRJBhNHx
 CgmAHNOoiyoP83f9cnbG+icrlTT3egq2IvLV14G/pr3veaVGh9p941naMItqscEIrKFZ
 Dew+AVyGB+kHtlc9e5Fcq2AbzEJvXx2/S6NmpKAgfhn1051N1RNNWuql3OAbhcFsc6dN
 GYQEKnVST/zODUJhHA0FmMywXIkTy4lKjlNMhW04OkgFdXzFbEGO6bM3CMPUXSyGM3cv
 eSsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=N1XFUN54hBaoHoMSJaUUq6Q1IPBGgMS/vAMXMj1l0PA=;
 b=QDMdSktlhY6r0fcD7gh1UYSJHeBELBeFAhtuoF1EVaTloLuFx+7LD1lRkE5b9adByc
 EGIfQDYlC8lnB962FpqpaRnOgG5BSLZPbI+D8OrKFmofF72gwjJWl0FbcoLrz7IGWrZd
 MYumNwt6gC1WNe8G91KLDF9jnGCJclBNauUPTSexnNLtWhIJ95IPkHVadZlh0O3aTAh0
 KAD5Z7mNQcjcakxStydw9RYwb6fYNJviez9JfseXUhFLBeTAGkYat4OmhFxXH/rsmsRu
 +mxtKKkrREy/BpLzuq0FA6sCJ6XFQHV+A6ZvX+bMhJ4mMge4CI4GS/SMnv8j9o+qSUtP
 dtUQ==
X-Gm-Message-State: AGi0Pua91zD57Tgf433RhMALGH0zKd16cunBmYrSSzKZ3I+xXgVkEqm4
 6viHaFb+mywv8v1gWzFDPxQ=
X-Google-Smtp-Source: APiQypIGGgi4Y9M4smu76bcyFb/AGERt/4tIhOrijyH+H1PZ/GAjppEWMMv3hPG7Q+ZrsRCkwTJbfQ==
X-Received: by 2002:a17:90a:a78f:: with SMTP id
 f15mr9977822pjq.120.1589007508826; 
 Fri, 08 May 2020 23:58:28 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id w192sm3811572pff.126.2020.05.08.23.58.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 08 May 2020 23:58:28 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 broonie@kernel.org, p.zabel@pengutronix.de
Date: Sat,  9 May 2020 14:58:20 +0800
Message-Id: <1589007503-9523-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: devicetree@vger.kernel.org, dillonhua@gmail.com,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 dillon min <dillon.minfei@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/3] Enable l3gd20 on stm32f429-disco board
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

1, enable spi5 controller on stm32f429-disco (dts)
2, add spi5 pinmap for stm32f429-disco	(dts)
3, add SPI_SIMPLEX_RX, SPI_3WIRE_RX support for stm32f4


dillon min (3):
  ARM: dts: stm32: Add pin map for spi5 on stm32f429-disco board
  ARM: dts: stm32: enable l3gd20 on stm32429-disco board
  spi: stm32: Add SPI_SIMPLEX_RX, SPI_3WIRE_RX support for stm32f4

 arch/arm/boot/dts/stm32f4-pinctrl.dtsi | 17 +++++++++++++++++
 arch/arm/boot/dts/stm32f429-disco.dts  | 24 ++++++++++++++++++++++++
 drivers/spi/spi-stm32.c                | 29 +++++++++++++++++++++++++----
 3 files changed, 66 insertions(+), 4 deletions(-)

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
