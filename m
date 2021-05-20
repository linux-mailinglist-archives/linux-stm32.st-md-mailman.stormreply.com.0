Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2A238A9DD
	for <lists+linux-stm32@lfdr.de>; Thu, 20 May 2021 13:05:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5FD39C57B69;
	Thu, 20 May 2021 11:05:59 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40A8AC57B5F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 May 2021 11:05:57 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id v14so8875141pgi.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 May 2021 04:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=BtleE6GQxgpd0gmHVoGAwwV3tquRsqLNfG32aGKdxb0=;
 b=ZDCEovbxbRTWtG4ojAEurfkc498/c5SZntfFZRfpO78JPAKgmYjMaDKZIYc8LAyEJP
 8m37QGuCkPvisKR9a3ZHMKWsIWTd7HoIhuAD6h2oqxND9ne+/Qr/zYbNkpXKmtpwpsbQ
 oFGatzMVLopHIo2tTjfvTWnZKtIMoId6T0gJUhAbq7Ut5ink0e6+uoCO1FqfQiofZPe9
 bZjCm65B3oMV9esCD1BGBJsxZ0rPSCWp0m//XxoLXjJUBqReF2g2PXN48M6c9lE51c8Z
 2cuUbhwhHVE5oYb1VmAKFLq3k3jlXERCeXwi+qqrkli+tMHzZSBVyhPHC48iCCzzJovD
 Yhvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=BtleE6GQxgpd0gmHVoGAwwV3tquRsqLNfG32aGKdxb0=;
 b=rem4/NcVGfyQbRzQP9n1akd0Re3xGFg+e04VZZGauJNdr0DqRBcf0K5JbLPkpcok8h
 0EY6cjrWATUADzt+bjrkad4f6lMxl92Y9iG2oG10Hst4v9+QLckPFeyfOYKs3RSms3CC
 6L8CME2VxD7kNf9cJSyP8Bm0e0jvIlu4/l1pVKB2N7vkNhZ77UBvYX+vjBqYZWITT0OC
 C83k61W1BqM2vwGJDeFDhLcmBMBhlwPeL8k9wq/65sipL3jJVfADC7B/3FkttkuytfRL
 fuCwCXy9tcbWE44kpM2x9qcgHxcc63rdPY+WRdIJITX6vprSOVMoHKnGaeOgDl9FshN+
 69HQ==
X-Gm-Message-State: AOAM533KwmrdRE1t+PYAM4Kp0eESWeLFQKqqWFZpAY65k8dDmue6YSfT
 anh2Q52F60ldjgKBobv23AI=
X-Google-Smtp-Source: ABdhPJzJIsYTXW9yeo5ybOMBP3kEaz9TT/qg5sFYXaINUh193mwT1LnN5PWZQtKk3+Q8Oi0vXuZPSw==
X-Received: by 2002:a62:384c:0:b029:2dd:423b:6e49 with SMTP id
 f73-20020a62384c0000b02902dd423b6e49mr4323847pfa.9.1621508755870; 
 Thu, 20 May 2021 04:05:55 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id hk15sm5839121pjb.53.2021.05.20.04.05.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 May 2021 04:05:55 -0700 (PDT)
From: dillon.minfei@gmail.com
To: mchehab@kernel.org, mchehab+huawei@kernel.org, hverkuil-cisco@xs4all.nl,
 ezequiel@collabora.com, gnurou@gmail.com, pihsun@chromium.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org
Date: Thu, 20 May 2021 19:05:25 +0800
Message-Id: <1621508727-24486-6-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621508727-24486-1-git-send-email-dillon.minfei@gmail.com>
References: <1621508727-24486-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, hugues.fruchet@foss.st.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dillon Min <dillon.minfei@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH 5/7] ARM: dts: stm32: Enable DMA2D on
	STM32F469-DISCO board
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

From: Dillon Min <dillon.minfei@gmail.com>

Enable DMA2D on STM32F469-DISCO board.

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
 arch/arm/boot/dts/stm32f469-disco.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f469-disco.dts b/arch/arm/boot/dts/stm32f469-disco.dts
index 2e1b3bbbe4b5..9cafe456d0d5 100644
--- a/arch/arm/boot/dts/stm32f469-disco.dts
+++ b/arch/arm/boot/dts/stm32f469-disco.dts
@@ -134,6 +134,10 @@
 	clock-frequency = <8000000>;
 };
 
+&dma2d {
+	status = "okay";
+};
+
 &dsi {
 	#address-cells = <1>;
 	#size-cells = <0>;
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
