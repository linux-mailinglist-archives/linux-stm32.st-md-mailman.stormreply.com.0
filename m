Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE0A96BF2F
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Sep 2024 15:56:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BCEA1C78018;
	Wed,  4 Sep 2024 13:56:01 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE299C6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Sep 2024 15:39:48 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-e03caab48a2so4235754276.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 03 Sep 2024 08:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725377988; x=1725982788;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=VEJ5rznjvXIaF+6JHqSzSxCb5P7cZnaSU8vVzhNfp8E=;
 b=XAKTHU+ZpOPX16qJP6vZlEbD7QdQH3xo5/JIQrQmKCNOgfBcvwp/Nr2CmS6W0d6JZI
 zZZ1bxk0ZDNd4As6QgmwQZxQlm2TVxXqUNxVqp3p0yDcw6Sx1iKUD0imYtsZSHnrXHzq
 l4ts9J17lZ7gyVQ91wFP7gbEnL8zo214YDV8ifQYCdRsXundoqW76Q0gV0ui0544EJq8
 vIJCEYZnbOZphmcEiyedmXUsrB7Xb8tXe9fizFK3xSQxGYMVL6+i7HzmZ8j7+gwFzZRG
 2HYaDo6MV0148bxQ1GXz5DmnpOyoneLiG09NUuWzuvr9dyNPmgrynSYsjtR/wOYtbdxb
 nQXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725377988; x=1725982788;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VEJ5rznjvXIaF+6JHqSzSxCb5P7cZnaSU8vVzhNfp8E=;
 b=UKbXHqeMy1p0mH4yEDOCTzsYHzxvUoyTbL31ComL4IisBdQv3RCvYaFBS7g4UUKn/x
 TUGH61DVmZzIDlpMXmyu9LsN2unNdY2MQHzOt8HRmCpMM5NgVm5uX0QAY/rPWCf9gSva
 L05X7LPmvPvnluuRT83X/7x3uQ5HuUekutgaHbVDIAOFLFL/nAbaGNLRbuWbyQ9kiqWR
 B5k5LsWEe9yi/7WGzHgASo1r1sSt+9HEMwyLt8CeIP5UgfMW/4w/J3lBdnvgPp8sqgzO
 fOLVapPBRGYqc03Dy1bB9uns3upTG5NOxnFAwEbCJUN9Fp7AV3guXcYR00nYeWS6Y3no
 oRLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBK3CXbTL60r4I8T5mlKebK5H5XIShL+BHMPRCevFbTPEzK4clX7Jc0GOyCx1Soi5udrrSKS7wz8DlAw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxRPL3FMi8nXbLozfHwcZPb2yWTZDTGXSBOGe7P/aNmBBnu6gUh
 h2SDMxpQ+swrMaFexvWaODb3/ENcU4Yzu7BJkm79qcgVNSi2ExyJm5gJw/R0CZeLAEyTIHyRKGW
 jVeJ2OvJwBss7jbuxkj1dafHyreE=
X-Google-Smtp-Source: AGHT+IFuqHUBPuUeuPjolqup3Quz86NPXV0fkt/P8s81MBM/21xkHInfCYg2Aantap/VUEtLoLncZ+4GylLXuVnp0xM=
X-Received: by 2002:a05:6902:f86:b0:e11:4572:4e with SMTP id
 3f1490d57ef6-e1a7a037426mr11860106276.8.1725377987854; Tue, 03 Sep 2024
 08:39:47 -0700 (PDT)
MIME-Version: 1.0
From: Adam Ggod <adamarin18.1.971@gmail.com>
Date: Tue, 3 Sep 2024 10:39:35 -0500
Message-ID: <CAHxSvpXnuvb0C87ABBffZnwh53RPhPTGu+F43KWxhqJ_wQ=P3w@mail.gmail.com>
To: christian.bruel@foss.st.com
X-Mailman-Approved-At: Wed, 04 Sep 2024 13:56:00 +0000
Cc: kishon@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, robh@kernel.org, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, mcoquelin.stm32@gmail.com, linux-phy@lists.infradead.org,
 krzk+dt@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 0/5] Add STM32MP25 USB3/PCIE COMBOPHY
	driver
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
Content-Type: multipart/mixed; boundary="===============2775995149785169180=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============2775995149785169180==
Content-Type: multipart/alternative; boundary="00000000000011c8de062138dea6"

--00000000000011c8de062138dea6
Content-Type: text/plain; charset="UTF-8"

EmailWebStorage

--00000000000011c8de062138dea6
Content-Type: text/html; charset="UTF-8"

<div dir="auto">EmailWebStorage</div>

--00000000000011c8de062138dea6--

--===============2775995149785169180==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2775995149785169180==--
