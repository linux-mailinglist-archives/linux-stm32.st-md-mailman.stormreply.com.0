Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A263E44ECC1
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Nov 2021 19:44:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59089C5EC74;
	Fri, 12 Nov 2021 18:44:24 +0000 (UTC)
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59D76C57B6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Nov 2021 18:44:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.87,230,1631545200"; d="scan'208";a="100101562"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 13 Nov 2021 03:44:19 +0900
Received: from localhost.localdomain (unknown [10.226.92.48])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id B3D9940D5E9A;
 Sat, 13 Nov 2021 03:44:16 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Date: Fri, 12 Nov 2021 18:44:09 +0000
Message-Id: <20211112184413.4391-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Chris Brandt <chris.brandt@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 0/4] Add RZ/G2L OSTM support
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

This patch series aims to add Generic Timer Module (a.k.a OSTM) support
for RZ/G2L series.

OSTM modules needs to deassert the reset line before accessing
any registers.

v2->v3:
 * Added Geert's Rb tag
 * Make RENESAS_OSTM symbol visible.
 * Added reset_control_put() on error path.
 * enabled suppress_bind_attrs in ostm_device_driver structure
v1->v2:
 * Added of_reset_control_get_optional_exclusive API
 * Updated dt-bindings to use renesas,ostm
 * Added reset handling in ostm_init

Biju Das (4):
  reset: Add of_reset_control_get_optional_exclusive()
  dt-bindings: timer: renesas: ostm: Document Renesas RZ/G2L OSTM
  clocksource/drivers/renesas-ostm: Add RZ/G2L OSTM support
  clocksource/drivers/renesas,ostm: Make RENESAS_OSTM symbol visible

 .../bindings/timer/renesas,ostm.yaml          | 20 ++++++++--
 drivers/clocksource/Kconfig                   |  3 +-
 drivers/clocksource/renesas-ostm.c            | 39 ++++++++++++++++++-
 include/linux/reset.h                         | 20 ++++++++++
 4 files changed, 77 insertions(+), 5 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
