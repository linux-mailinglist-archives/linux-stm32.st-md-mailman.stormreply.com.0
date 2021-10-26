Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E4743ACCB
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Oct 2021 09:11:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16641C5E2A4;
	Tue, 26 Oct 2021 07:11:55 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60794C5E2A2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Oct 2021 07:11:52 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id v16so4286800ple.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Oct 2021 00:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=v5Jn6J7/l0TaCmJa3oToQu6cLShq8Ci4O48ykDgquPE=;
 b=FnMiD/yEd8r5STTgSNxpiErKAzGkF/Kko+aHtyxKURrP9GTpaI/otiknwLSlWcg8JA
 LauRUtiGqflJco+vkSMWqZ+jIY2i543gFniL0JzBmJzAbf425b1bm0dvANz1aNk032YQ
 +NxzBzKjW4bw81gjqFnYZ49UTRhAcHPylrZ8MVPeWIOSQTjW0FO2QVDWQwcPAgrPnmhP
 61xdfdR+yD07+ofRM93/9fGpbOt13g2ubXNOVeoYCmuezdufEgE/gryZB+21nCg67V/v
 KU60CwlRPCXxxnNMKoUyQFnoey+kXZ1Ox4MUQXGN4ozObwgmJKv9++tjvZQAcpOaM50a
 FKAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=v5Jn6J7/l0TaCmJa3oToQu6cLShq8Ci4O48ykDgquPE=;
 b=Gr3p9vdRofhfBC3PYuTujDsQzKxdj+E7wIO9Lf0bWH+rTOnYGwQuMWtAIlEnEmWjL0
 b9zoYtOx7vwN6pLZbb0jpOyY3JjGT9oDKZ+VT/tg9PXwfp1eIExlBJ/eug/2fVi/qLYx
 L0npundCUX3DDDvKPtPw3OFUAkThOMQ7YixUTENcyh5/DOqagEbXupKNh1Clb254WUpU
 z539rSyAFulbr2SAY2XHdZHXZ0N/epm3PPhTDZo2A0/b7Rh7VUXi7ojJw/dyplw0uNjn
 3Od+ArRvDiQoiD7m8DCCMBdgXSlFAUUm6q0lGDzbz2+hPwQfFynOVkJoOA0u2NYh3tYg
 4LEQ==
X-Gm-Message-State: AOAM531DpH/G06PU1EUWNSJrgVSiadzDpE9CqMmBEfX10WTtiYsWTBKG
 Q5Ut9oLul7rAuEQJlZ8pdDk=
X-Google-Smtp-Source: ABdhPJySkA2o4FFhQYEyzwSUb7PH8O6xeB8p+lh9tMMoJ2WfjXksxtulja+sI2x6eUDSlRNcfIJnHw==
X-Received: by 2002:a17:902:a5c2:b0:140:14bb:8efd with SMTP id
 t2-20020a170902a5c200b0014014bb8efdmr20876966plq.31.1635232311156; 
 Tue, 26 Oct 2021 00:11:51 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id l11sm23243367pjg.22.2021.10.26.00.11.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 26 Oct 2021 00:11:50 -0700 (PDT)
From: Dillon Min <dillon.minfei@gmail.com>
To: mchehab@kernel.org, mchehab+huawei@kernel.org, hverkuil-cisco@xs4all.nl,
 ezequiel@collabora.com, gnurou@gmail.com, pihsun@chromium.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 gabriel.fernandez@st.com, gabriel.fernandez@foss.st.com
Date: Tue, 26 Oct 2021 15:11:16 +0800
Message-Id: <1635232282-3992-5-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635232282-3992-1-git-send-email-dillon.minfei@gmail.com>
References: <1635232282-3992-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, kbuild-all@lists.01.org, lkp@intel.com,
 hugues.fruchet@foss.st.com, llvm@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v7 04/10] ARM: dts: stm32: Enable DMA2D on
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

Enable DMA2D on STM32F469-DISCO board.

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
 arch/arm/boot/dts/stm32f469-disco.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f469-disco.dts b/arch/arm/boot/dts/stm32f469-disco.dts
index 30905ce672a0..ba26a3375b0d 100644
--- a/arch/arm/boot/dts/stm32f469-disco.dts
+++ b/arch/arm/boot/dts/stm32f469-disco.dts
@@ -132,6 +132,10 @@
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
