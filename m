Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67817736FF8
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Jun 2023 17:13:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2FC57C6B459;
	Tue, 20 Jun 2023 15:13:34 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C18FC04B10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Jun 2023 15:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=ay+qmBA/PXjKC6poUaYsFfPqOZlKKsgO2YKtMPT1Imo=; b=LU1S0AHmkj4DXtu/nlSRZ2tfAG
 9NSfjASxt/wpbr06/3EiII1keZ2ZTqJ+jxB6to0K2jifnRfveDJoIqlRE1uW0LsZJmf3jP/i9QUAY
 XSDvxxS/xHkX5XTdgu702ObzrZ+gXkYVBOWRgSKnHjk7AiPtz8rERbjZPaLVUgk5Kq5fI4Glrv5Lw
 ojh15NKv0jug3sJ0uQ1zXoxhTkDqFVGc73nZnjr12Qf/6PGv+An4x0o2uyTj8Z0fp6/uYgIzs6J57
 mbRTp9ynUxfpB+wikU1PTs7QMQzc7cHTK1YxyelgRvubNMPr+V7Tax2v04SAFbyx6aQdN3aRzV+Ai
 av76DPcQ==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <sean@geanix.com>)
 id 1qBd2u-0001Zg-47; Tue, 20 Jun 2023 17:13:28 +0200
Received: from [185.17.218.86] (helo=zen..)
 by sslproxy02.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <sean@geanix.com>)
 id 1qBd2t-0003u6-KA; Tue, 20 Jun 2023 17:13:27 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Tue, 20 Jun 2023 17:13:10 +0200
Message-Id: <20230620151312.1064629-5-sean@geanix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230620151312.1064629-1-sean@geanix.com>
References: <20230620151312.1064629-1-sean@geanix.com>
MIME-Version: 1.0
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.8/26945/Tue Jun 20 09:30:24 2023)
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dantuguf14105@gmail.com, Sean Nyekjaer <sean@geanix.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v1 5/7] ARM: dts: stm32: osd32: fix ldo2 not
	required to be always-on
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

According to the OSD32MP1 Power System overview[1] there is no hard
requirement for the ldo2 to be always-on.

[1]: https://octavosystems.com/app_notes/osd32mp1-power-system-overview/#connections

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
 arch/arm/boot/dts/stm32mp15xx-osd32.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp15xx-osd32.dtsi b/arch/arm/boot/dts/stm32mp15xx-osd32.dtsi
index eb43a1e3a0c9..902ca6c23533 100644
--- a/arch/arm/boot/dts/stm32mp15xx-osd32.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-osd32.dtsi
@@ -124,9 +124,7 @@ v3v3_hdmi: ldo2 {
 				regulator-name = "v3v3_hdmi";
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
-				regulator-always-on;
 				interrupts = <IT_CURLIM_LDO2 0>;
-
 			};
 
 			vtt_ddr: ldo3 {
-- 
2.40.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
