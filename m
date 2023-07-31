Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 259F07699C0
	for <lists+linux-stm32@lfdr.de>; Mon, 31 Jul 2023 16:41:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA2B2C6B46E;
	Mon, 31 Jul 2023 14:41:26 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 52A26C6B443
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Jul 2023 14:41:25 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-316feb137a7so4841871f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Jul 2023 07:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690814485; x=1691419285;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Oqt2DFEc4IMcc2ugBSc+fA3oh1ZenLGhqZy4tnNtGls=;
 b=LsZNGd1/ups2ximF1+eofMcwB4KdW73HLh1blYmTzKRU7BNqgCakk0onYpKk7LEwb7
 zqWP65z3ufmkWZgdkEKp8i01ZP43ewJu8aEBP3MgnrVHA2zd08FmNo89FkGqbB1pqPhl
 57+FKSLUP7OnjWilS9rDzim9LLWW2T7hoCVznHTy9eYHsX2pmxwoNq9g7ZuQbiBFbTBw
 beeUMtl59W/TfKtP+PwDRv+Knh2gqwK2APgjDycjXN4aaC9wo7uE+RDQ6GRP17O9tGl7
 are8MqkzmJ6JZmtUmPZbldWy2JZZD1H6c04+aBUG1Zc6Lwlj5ZGZ82pFXssGGHrM9kem
 kSGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690814485; x=1691419285;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Oqt2DFEc4IMcc2ugBSc+fA3oh1ZenLGhqZy4tnNtGls=;
 b=hJ+tSJavcIZVJm+TmP5XOToe1w8PLoJzWu+IuC5U/4MI+Gur8qbvgor+FJKDQC89O3
 1HOVK5UoceLnQo1XJ2+nFrwukfQ19ycEidRpF7mx9VjPaViV2fiykZm+w+KFmpijRUzE
 6S3hdJ0HgEa14oV93QF7RJ/MUckywiyLqtXGzRV2X3wWNmCFtZpnCU6TD7Z+ZOFto3FG
 Wc4uR16A35lEe49hFjm+DRhK9YSTOVmOfMPCFI1chp63YMwoZ+K+sfRg6AY/YZDKkJgS
 e32rcZEeXOwc2sIKlrX6OeyLjlq/icLGgaACCxeWFaONpCjfoGa9p+YpBrsstFHDTVW7
 DP+A==
X-Gm-Message-State: ABy/qLaj9Ji9GUgMVfH5X0rrxxbDQOtfgJC2To4WcSuoLN0PnYH+koUM
 0f6nqGPWtqGd7T681FompIZuDQ==
X-Google-Smtp-Source: APBJJlGYgAWdED1OMLeik9Hplb9eRIiHr1G3kcLMz3RzCktxRnJWE2r8PIDKupXpqeHCscu8gcYwXA==
X-Received: by 2002:adf:f990:0:b0:314:1a09:6e71 with SMTP id
 f16-20020adff990000000b003141a096e71mr17470wrr.53.1690814484575; 
 Mon, 31 Jul 2023 07:41:24 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 r18-20020adfce92000000b0031272fced4dsm13257372wrn.52.2023.07.31.07.41.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 07:41:24 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 31 Jul 2023 16:41:09 +0200
Message-Id: <20230731-topic-oxnas-upstream-remove-v3-0-a1bddb085629@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAXIx2QC/43OTQrCMBAF4KtI1o40CdaflfcQF5NmYgM1KZM0V
 KR3N3QjbsTlmwffm5dIxJ6SOG9egqn45GOoQW83ousx3Am8rVmoRulGawk5jr6DOAdMMI0pM+E
 DmB6xEGCr6GRPrSMiUQWDicAwhq6vRpiGoR5HJufndfIqAmUINGdxq03vU478XH8pcu3/mi0SG
 tgbuz86K62V7jL4gBx3ke8rXNQHa3XzG1MVc6ZFoy3h8dB9YcuyvAEJPvCHMwEAAA==
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2167;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=EGhiweLDmR0vbL0c7DXnBhobF+uKXvCF8L5qcGZ2JkY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkx8gSrdIKH4E3PYyJ7kgGPfv2zB1PqlPEI4wclQcj
 8CQJ6aqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZMfIEgAKCRB33NvayMhJ0YaXD/
 0apuCDXxe1YAYbDlWbvRhWL1ZiBafPZUn7bjMUNUaNlRgSDYKNNxpBz4Txhv6Dl2xnzzjCgOnSNZlv
 TI1iYTyvjYXxphVNv/KEbZjewvJsFHsqydu9ChjdONrSebX1geFyJl5lxcHgefaABCTAWDGm6Q+jmF
 OfFZ8+l0O+3QRCxxNleaZNcCHPMB+wNQBLkhbd1J9YcV7rs9Bup1xUQAXqYGqcDlLKi4serEwZp7Wj
 vagAAvSnQ9J1ZXMOSSWj4royyI+fkBumpUYtczIzONxsP7BNsQeJG7fnJ5GkennftqrT6hzIu+Vm/Y
 pPvdM+WgJROdGzwWxZxDOoI4MZZtyxq357qocRGyfG0j81Xp77zfX1XL94hCuT92hr1asLmPiyAi6+
 LJbYj6x5KAQ3H+7A4FcLJbzCdgSloAGUwx2YBZE7AJYbr6Hl39S09V0Wv0rDwYOskm0iJj2ELYkSZr
 XNIrZvICAh1LRvVS3owjBc0A4t4u8A4eZ+QtZgdS8i5Ex0MuWpvGees9KGCDUhooYMGFUJiy5U9w3J
 bSQIec8+986xNY8wvTykHWr08X6M1NCLxRThJNY5kW3LQhn1d3hd683397PtLG07A1mHsu87DDOznM
 7jB5tLRHfapCqps3EG7sjwW2YPraTZrsS05Rq58CHp/H1GOuCsRr3sMVfOXQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Cc: Andy Shevchenko <andy@kernel.org>, devicetree@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 netdev@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>,
 Conor Dooley <conor.dooley@microchip.com>, linux-oxnas@groups.io,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3 0/2] net: ethernet: dwmac: oxnas
	glue removal
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

With [1] removing MPCore SMP support, this makes the OX820 barely usable,
associated with a clear lack of maintainance, development and migration to
dt-schema it's clear that Linux support for OX810 and OX820 should be removed.

In addition, the OX810 hasn't been booted for years and isn't even present
in an ARM config file.

For the OX820, lack of USB and SATA support makes the platform not usable
in the current Linux support and relies on off-tree drivers hacked from the
vendor (defunct for years) sources.

The last users are in the OpenWRT distribution, and today's removal means
support will still be in stable 6.1 LTS kernel until end of 2026.

If someone wants to take over the development even with lack of SMP, I'll
be happy to hand off maintainance.

It has been a fun time adding support for this architecture, but it's time
to get over!

This patchset only removes net changes, and is derived from:
https://lore.kernel.org/r/20230630-topic-oxnas-upstream-remove-v2-0-fb6ab3dea87c@linaro.org

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v3:
- Removed applied changes
- Added Andy's tags
- Reduced for net
- Link to v2: https://lore.kernel.org/r/20230630-topic-oxnas-upstream-remove-v2-0-fb6ab3dea87c@linaro.org

Changes in v2:
- s/maintainance/maintenance/
- added acked/review tags
- dropped already applied patches
- drop RFC
- Link to v1: https://lore.kernel.org/r/20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org

---
Neil Armstrong (2):
      net: stmmac: dwmac-oxnas: remove obsolete dwmac glue driver
      dt-bindings: net: oxnas-dwmac: remove obsolete bindings

 .../devicetree/bindings/net/oxnas-dwmac.txt        |  41 ----
 drivers/net/ethernet/stmicro/stmmac/Kconfig        |  11 -
 drivers/net/ethernet/stmicro/stmmac/Makefile       |   1 -
 drivers/net/ethernet/stmicro/stmmac/dwmac-oxnas.c  | 244 ---------------------
 4 files changed, 297 deletions(-)
---
base-commit: ec89391563792edd11d138a853901bce76d11f44
change-id: 20230331-topic-oxnas-upstream-remove-a62e9d96feee

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
