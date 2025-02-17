Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 148E4A38221
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Feb 2025 12:45:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8FD6C7803C;
	Mon, 17 Feb 2025 11:45:22 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 433E5C7803C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Feb 2025 11:45:17 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-38f3ee8a119so632100f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Feb 2025 03:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1739792717; x=1740397517;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gslSeLU065wOuo/exeqAIaqsKgFJISNX/u1ft+G91Cc=;
 b=KOJoNFKidxhi5BRTvNgTL16CMSSwoRHC3Ty0GFmf/ENzHmGp9SnlD5+A/Wf6oHqBSG
 iK5x1vBEMTaeIginGDjEpzHMJq8uXwrt/WvLMmURhHH6OchSx7e61dOfr9oIJ4F4KmJt
 a9/g+aCARNQnoVLIdgbyklZcTBs830Be8Lagk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739792717; x=1740397517;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gslSeLU065wOuo/exeqAIaqsKgFJISNX/u1ft+G91Cc=;
 b=PImvOSE7xDdEQEakOdfbooj0bdjEOVci2Q1OjI/oQFQm3b57kOjS4+gN9BsQRPf/Yf
 pi3yr7g0nOaaVxPVDyF4ZZorkVdUSurgOwP9/2Hq5iCZVl52JmFnujserbSY87kY1BcU
 3D4sOXAOCxU5sEVYWZoyQCxztCXm5s81RcL61kb5lqNaO6Uq8s1pgCwoqsGoJsX4Umj8
 NjXbPmJbxrCI4OwX2LHU/8IhpG7aA3VB7+yqkc6mwTx5q4ldgRHtu/cksz7ftvkXcL5w
 e56uah7T/wUs5GmYGC5oyrRubhm3NKWALe6GIB931eqTKBS2ukHQ6yuGxru7xqyCTeu7
 m/3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJslrL1t3hZxCvwVJfZcaOffCwRdBmhEgdHJyJ62RLt+88tuJclG4DhSuqJo+/oMeYwetQKubocieVzg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxePCQtjEMTM8KIqyzh+83ukZR2Pb9ZQh67wDMIckeX2lLxEkaj
 EWwGo2hCsApzGSY1GOIACYytVJEqPTdNj8Ubx1DA/+JS+6LmjyF+ctATSo/fEeA=
X-Gm-Gg: ASbGnctNuX/dkiNs+dDu9Hbl4ZGrmP7Bdo5fs4/B3eI368kt2VM1otzJJRoZFGqaWwS
 MgGOSJFY6DrNKiSCURBZOnhRtyfm4hfX9ZO+xdmzVsLC5Khnq+cGTPCB5p/Sa1T5roJCkf/XelO
 3vFfwfRON1raYtTsZa1TSAEbX2+qsDnmu9OTA0kA3mTJ4NuHfsdLs/dXqmcj7lbm1cE9aiPiC49
 2VqxeEveXI6YjqlH95kCwkc0z73TKuD5YCVLkMoz3fouaKXdJ9OYoloHMwjBhee8hvYQyc78Bfj
 uh/Vi5f1+VgSCRTghW7+rc64h9NwW8GwGi/cVk4JCAxZ7iYtZgjZ8FjppqMfXC97M2+JbIt3prn
 5PVMdSKCCQS4=
X-Google-Smtp-Source: AGHT+IEWoZF68RXu+nKi7MNugaByBfNsuJdBAp6ZRW5eMiRrJibFJTDidK0cVOcEQlNep0we4lB5PQ==
X-Received: by 2002:a5d:47a3:0:b0:38f:37bd:1707 with SMTP id
 ffacd0b85a97d-38f37bd18f8mr7646742f8f.0.1739792716753; 
 Mon, 17 Feb 2025 03:45:16 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 ([2001:b07:6474:ebbf:78d7:ec72:38e9:87de])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ddbe0sm12181637f8f.39.2025.02.17.03.45.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 03:45:16 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 17 Feb 2025 12:45:09 +0100
Message-ID: <20250217114513.1098844-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250217114513.1098844-1-dario.binacchi@amarulasolutions.com>
References: <20250217114513.1098844-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/2] ARM: dts: stm32: add usr3 LED node to
	stm32f769-disco
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

As indicated by the board silkscreen, there are three user LEDs.
Add the missing one.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/boot/dts/st/stm32f769-disco.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32f769-disco.dts b/arch/arm/boot/dts/st/stm32f769-disco.dts
index d52e36aedcfb..535cfdc4681c 100644
--- a/arch/arm/boot/dts/st/stm32f769-disco.dts
+++ b/arch/arm/boot/dts/st/stm32f769-disco.dts
@@ -86,6 +86,9 @@ led-usr2 {
 		led-usr1 {
 			gpios = <&gpioj 13 GPIO_ACTIVE_HIGH>;
 		};
+		led-usr3 {
+			gpios = <&gpioa 12 GPIO_ACTIVE_HIGH>;
+		};
 	};
 
 	gpio-keys {
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
