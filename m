Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9423CF36C4
	for <lists+linux-stm32@lfdr.de>; Mon, 05 Jan 2026 13:08:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B235C57A51;
	Mon,  5 Jan 2026 12:08:44 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18AE0C290A0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Jan 2026 12:08:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AB36E43D21;
 Mon,  5 Jan 2026 12:08:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 301D5C116D0;
 Mon,  5 Jan 2026 12:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767614920;
 bh=lp4eIMOna4MNieJ1lmI1P3hAqicQqw8PUE7YM6WWrBo=;
 h=From:Subject:Date:To:Cc:From;
 b=ID9ZupHVCxPPBdwz3tsRPoyomM9SXndk90YXjvWQ2e+oCfKcMM1gg+96JYAyjyycT
 iP/D7jJTPsRaYvNo/2Noq8Nz6MwoqdMG75ya9lkc6/MVHivBxkWtQLCgCiF8voFZH8
 fTU/KhiimPEW0meAe6uh99I4EYHqEYS0KK67srWbkxeMsLZjPa95/ekdNuYuWnuA/c
 fesNK66CwkacL1+J+6rQ0rKWeCWd7zVcQOWQhZK+Bws07R9wGn6gKMyGp++u2xnIrQ
 e5FdJ92R9EINGl04nuSKa8SSb/YxWQD8NYzV+V88P0g57Wkc0dGllVKZlld6tYgKmD
 0hz5ln8HV1hxg==
From: Dinh Nguyen <dinguyen@kernel.org>
Date: Mon, 05 Jan 2026 06:08:19 -0600
Message-Id: <20260105-remove_ocp-v2-0-4fa2bda09521@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALOpW2kC/23MQQrCMBCF4auUWRtJxkQbV95Dith2bAe1KRMJS
 sndjV27/B+8b4FIwhThWC0glDhymErgpoJuvE4DKe5LA2p0BtEroWdIdAndrKw91Ptd7VvtEMp
 hFrrxe8XOTemR4yvIZ7WT+a1/mWSUVs5b9Ja0bXt7upNM9NgGGaDJOX8B8CfCQaUAAAA=
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mamta Shukla <mamta.shukla@leica-geosystems.com>, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1748; i=dinguyen@kernel.org;
 h=from:subject:message-id; bh=lp4eIMOna4MNieJ1lmI1P3hAqicQqw8PUE7YM6WWrBo=;
 b=owEBbQKS/ZANAwAKARmUBAuBoyj0AcsmYgBpW6nD3bGHKCXvLV9aGkSRL2Vu/FSzuQNiUrF+r
 Ws4jBe/UL+JAjMEAAEKAB0WIQSgeEx6LKTlWbBUzA0ZlAQLgaMo9AUCaVupwwAKCRAZlAQLgaMo
 9L9SD/9MSQpSzD9w1H3cRpOdRjVz4eGBvIglwZ7HIIsCt2OIrC6+7h//BuRnXiXkQYpiG2cQ0Rj
 9puf91hKCmdlfWHFjXsnuH2Arf0sKSduwqduHhy0+BY9EtODoRs0ERqElkjBQVG5CVATFgNf33k
 poUKbYV5J053dwRHkmWMXYd19HIauhBOVZWcSZiPZwQd5EUH6i3VUaDwogPTzg4XjxDI6/7Dwhr
 Vdx6q1/1IUEEiXbH5NguQEl8wFevG14B3/6xuqht6RtRrnUSIy7k7XPwnn/51IH5yuKB7kLeyYa
 NuSG0bBGBVLPk6ZS3hQHHKLUL3M5u6W9+rXVKIRfOuaj8WisdGfc1iOXb4NkmvDBm2bqZsuI3Iz
 2nJ0WEb5biIkSz7CoR0FnzJQ3PQPLoXjf6QUIoSLF70VzTdermpYe5XLPDCQrMQ9kXP+5x0HCb/
 mYLjsFOFmOrMD70OMnrJ7Ic9Yzdxdiiqnp99kShU5L2InFmmuNGAsKQhZ9K4PbaefkzdPgkZUbV
 6kYyJOTOm2c9am0ikt2DIBJyGRQ/Cj1RJ1sQ46cU23d6PQBY5Qc0FstJDBLcGPj9TYXmTvlvyVD
 HWWdxjmzQggvXh7MEDoRu9qmqskINhSXa7sp3je8PlJZn39dCarTjUmBTShSNJV9u+PljGM2jQy
 vVFkF00MXnRQm7Q==
X-Developer-Key: i=dinguyen@kernel.org; a=openpgp;
 fpr=A0784C7A2CA4E559B054CC0D1994040B81A328F4
Cc: devicetree@vger.kernel.org, bsp-development.geo@leica-geosystems.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dinh Nguyen <dinguyen@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/3] net: stmmac: socfpga: support both
 stmmaceth-ocp and ahb reset names
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

The dwmac-socfpga stmmac ethernet controller supports 2 standard reset
lines, named "stmmaceth" and "stmmaceth-ocp". At the time of upstreaming
support for the platform, the "stmmaceth-ocp" name was used for the 2nd
reset name. We later realized that the "stmmaceth-ocp" reset name is
the same as the "ahb" name that is used by the standard stmmac driver.
But since the "stmmaceth-ocp" name support has already been introduced
to the wild, it cannot just be removed from the driver, thus we can
modify the driver to support both "stmmaceth-ocp" and "ahb", with the
idea that "ahb" will be used going forward.

This series add the support to call reset assert/de-assert both "abh"
and "stmmaceth-ocp" to the dwmac-socfpga platform driver, then reverts
the patch that uses the DTS "stmmaceth-ocp" reset name.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
Changes in v2:
- Added a dt-binding patch to mark 'stmmaceth-ocp' as deprecated
- Link to v1: https://lore.kernel.org/r/20251229-remove_ocp-v1-0-594294e04bd4@kernel.org

---
Dinh Nguyen (3):
      net: stmmac: socfpga: add call to assert/deassert ahb reset line
      Revert "arm: dts: socfpga: use reset-name "stmmaceth-ocp" instead of "ahb""
      dt-bindings: net: altr,socfpga-stmmac: deprecate 'stmmaceth-ocp'

 .../devicetree/bindings/net/altr,socfpga-stmmac.yaml          | 11 +++++++++--
 arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi          |  6 +++---
 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c           |  4 ++++
 3 files changed, 16 insertions(+), 5 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251229-remove_ocp-44786389b052

Best regards,
-- 
Dinh Nguyen <dinguyen@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
