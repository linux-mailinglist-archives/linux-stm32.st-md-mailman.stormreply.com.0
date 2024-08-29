Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF74396404C
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Aug 2024 11:37:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6513BC6DD6E;
	Thu, 29 Aug 2024 09:37:05 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EBE2DC6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Aug 2024 09:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OpJRCqvJUgPhUkiazewk4fbcOXCM86KxZfljMMe7Uig=; b=cWz55Bm4M9U8thKk6gSuu/A07u
 w2RVOJ013+1Kl+2mN92amgwPyNv6DoHWbFMmIxsZBP6gZ4J1uvArpAd5fypGxjzlVNfTWiTna0BCC
 cFnGoL60SdlGm94Z5GnX561yMyUMBLbfsjazgIVAEGx7lKSqwOd9hNYmXilpmnXwhlPEifqkmOjqG
 cDB/5kyeq8xDoIoGzOijhl3Qh/M6oTn1YtFqLsVAtCdW1SF4ZdqJ9EVPYIiE1xDkUMBBocuqQHAbw
 Otlg+VZvaNgdisNklffp57T4hSRYt5ksZ+v6jxy85IHGmMDfMRpI/OduwFB1Dwt7AQArmEHL7PKGe
 4kQJjWWQ==;
Received: from i5e861916.versanet.de ([94.134.25.22] helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1sjbaI-0002nq-3Y; Thu, 29 Aug 2024 11:36:54 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Elaine Zhang <zhangqing@rock-chips.com>, devicetree@vger.kernel.org,
 linux-mips@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 patches@opensource.cirrus.com, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-stm32@st-md-mailman.stormreply.com,
 Serge Semin <fancer.lancer@gmail.com>, Rob Herring <robh@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 linux-kernel@vger.kernel.org,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Michael Turquette <mturquette@baylibre.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-rockchip@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>
Date: Thu, 29 Aug 2024 11:36:49 +0200
Message-ID: <172492351369.1695089.4051009745081865137.b4-ty@sntech.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240818173014.122073-1-krzysztof.kozlowski@linaro.org>
References: <20240818173014.122073-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [Linux-stm32] (subset) [PATCH 1/5] dt-bindings: clock: baikal,
	bt1-ccu-div: add top-level constraints
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

On Sun, 18 Aug 2024 19:30:10 +0200, Krzysztof Kozlowski wrote:
> Properties with variable number of items per each device are expected to
> have widest constraints in top-level "properties:" block and further
> customized (narrowed) in "if:then:".  Add missing top-level constraints
> for clocks and clock-names.
> 
> 

Applied, thanks!

[4/5] dt-bindings: clock: rockchip,rk3588-cru: drop unneeded assigned-clocks
      commit: 3529dc29fe65672ad9aeab9499fee901d0010901

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
